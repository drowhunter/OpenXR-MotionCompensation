// Copyright(c) 2022 Sebastian Veith

#pragma once

#include <log.h>
#include "input.h"



namespace utility
{
    constexpr float floatPi{static_cast<float>(M_PI)};
    constexpr float angleToRadian{floatPi / 180.0f};

    class AutoActivator
    {
      private:
        std::shared_ptr<Input::InputHandler> m_Input;
        bool m_Activate{false};
        bool m_Countdown{false};
        int m_SecondsLeft{0};
        XrTime m_ActivationTime{0};
      public:
        explicit AutoActivator(std::shared_ptr<Input::InputHandler> input);
        void ActivateIfNecessary(XrTime time);
    };

    class DeltaMultiplier
    {
      public:
        DeltaMultiplier();
        void SetApply(bool apply);
        void SetStageToLocal(const XrPosef& pose);
        void SetFwdToStage(const XrPosef& pose);
        void Apply(XrPosef& delta, const XrPosef& pose);

      private:
        void ApplyOnTracker(const XrPosef& delta);
        void ApplyOnHmd(XrPosef& delta, const XrPosef& pose) const;
        inline static XrVector3f ToEulerAngles(XrQuaternionf q);

        bool m_ApplyTrackerTranslation{false}, m_ApplyTrackerRotation{false}, m_ApplyHmdTranslation{false},
            m_ApplyHmdRotation{false};
        float m_FactorTrackerPitch{1.f}, m_FactorTrackerRoll{1.f}, m_FactorTrackerYaw{1.f}, m_FactorTrackerSway{1.f},
            m_FactorTrackerHeave{1.f}, m_FactorTrackerSurge{1.f}, m_FactorHmdPitch{1.f}, m_FactorHmdRoll{1.f},
            m_FactorHmdYaw{1.f}, m_FactorHmdSway{1.f}, m_FactorHmdHeave{1.f}, m_FactorHmdSurge{1.f};
        XrPosef m_StageToLocal{xr::math::Pose::Identity()}, m_LocalToStage{xr::math::Pose::Identity()},
            m_FwdToStage{xr::math::Pose::Identity()}, m_StageToFwd{xr::math::Pose::Identity()};
        std::optional<XrPosef> m_DeltaFwd;
        std::optional<XrVector3f> m_Angles;
    };

    template <typename Sample>
    class Cache
    {
      public:
        explicit Cache(Sample fallback) : m_Fallback(fallback){};

        void SetTolerance(const XrTime tolerance)
        {
            m_Tolerance = tolerance;
        }

        void AddSample(XrTime time, Sample sample)
        {
            std::unique_lock lock(m_Mutex);

            m_Cache.insert({time, sample});
        }

        Sample GetSample(XrTime time) const
        {
            std::unique_lock lock(m_Mutex);

            TraceLoggingWrite(openxr_api_layer::log::g_traceProvider, "GetSample", TLArg(time, "Time"));

            openxr_api_layer::log::DebugLog("GetSample(%s): %u", m_SampleType.c_str(), time);

            auto it = m_Cache.lower_bound(time);
            const bool itIsEnd = m_Cache.end() == it;
            if (!itIsEnd)
            {
                if (it->first == time)
                {
                    // exact entry found
                    TraceLoggingWrite(openxr_api_layer::log::g_traceProvider,
                                      "GetSample_Found",
                                      TLArg(m_SampleType.c_str(), "Type"),
                                      TLArg("Exact", "Match"),
                                      TLArg(it->first, "Time"));

                    openxr_api_layer::log::DebugLog("GetSample(%s): exact match found", m_SampleType.c_str());

                    return it->second;
                }
                else if (it->first <= time + m_Tolerance)
                {
                    // succeeding entry is within tolerance
                    TraceLoggingWrite(openxr_api_layer::log::g_traceProvider,
                                      "GetSample_Found",
                                      TLArg(m_SampleType.c_str(), "Type"),
                                      TLArg("Later", "Match"),
                                      TLArg(it->first, "Time"));
                    openxr_api_layer::log::DebugLog("GetSample(%s): later match found %u",
                                                   m_SampleType.c_str(),
                                                   it->first);

                    return it->second;
                }
            }
            const bool itIsBegin = m_Cache.begin() == it;
            if (!itIsBegin)
            {
                auto lowerIt = it;
                --lowerIt;
                if (lowerIt->first >= time - m_Tolerance)
                {
                    // preceding entry is within tolerance
                    TraceLoggingWrite(openxr_api_layer::log::g_traceProvider,
                                      "GetSample_Found",
                                      TLArg(m_SampleType.c_str(), "Type"),
                                      TLArg("Earlier", "Match"),
                                      TLArg(lowerIt->first, "Time"));
                    openxr_api_layer::log::DebugLog("GetSample(%s): earlier match found: %u",
                                                   m_SampleType.c_str(),
                                                   lowerIt->first);

                    return lowerIt->second;
                }
            }
            openxr_api_layer::log::ErrorLog("GetSample(%s) unable to find sample %u+-%.3fms",
                                           m_SampleType.c_str(),
                                           time,
                                           m_Tolerance / 1000000.0);
            if (!itIsEnd)
            {
                if (!itIsBegin)
                {
                    auto lowerIt = it;
                    --lowerIt;
                    // both entries are valid -> select better match
                    auto returnIt = (time - lowerIt->first < it->first - time ? lowerIt : it);
                    TraceLoggingWrite(openxr_api_layer::log::g_traceProvider,
                                      "GetSample_Failed",
                                      TLArg(m_SampleType.c_str(), "Type"),
                                      TLArg("Estimated Both", "Match"),
                                      TLArg(it->first, "Time"));
                    openxr_api_layer::log::ErrorLog("Using best match: t = %u ", returnIt->first);

                    return returnIt->second;
                }
                // higher entry is first in cache -> use it

                TraceLoggingWrite(openxr_api_layer::log::g_traceProvider,
                                  "GetSample_Found",
                                  TLArg(m_SampleType.c_str(), "Type"),
                                  TLArg("Estimated Earlier", "Match"),
                                  TLArg(it->first, "Time"));
                openxr_api_layer::log::ErrorLog("Using best match: t = %u ", it->first);
                return it->second;
            }
            if (!itIsBegin)
            {
                auto lowerIt = it;
                --lowerIt;
                // lower entry is last in cache-> use it
                openxr_api_layer::log::ErrorLog("Using best match: t = %u ", lowerIt->first);
                TraceLoggingWrite(openxr_api_layer::log::g_traceProvider,
                                  "GetSample_Failed",
                                  TLArg(m_SampleType.c_str(), "Type"),
                                  TLArg("Estimated Earlier", "Type"),
                                  TLArg(lowerIt->first, "Time"));
                return lowerIt->second;
            }
            // cache is empty -> return fallback
            openxr_api_layer::log::ErrorLog("Using fallback!!!", time);
            TraceLoggingWrite(openxr_api_layer::log::g_traceProvider, "GetSample_Failed", TLArg("Fallback", "Type"));
            return m_Fallback;
        }

        // remove outdated entries
        void CleanUp(const XrTime time)
        {
            std::unique_lock lock(m_Mutex);

            auto it = m_Cache.lower_bound(time - m_Tolerance);
            if (m_Cache.begin() != it)
            {
                --it;
                if (m_Cache.end() != it && m_Cache.begin() != it)
                {
                    m_Cache.erase(m_Cache.begin(), it);
                }
            }
        }

      private:
        std::map<XrTime, Sample> m_Cache{};
        mutable std::mutex m_Mutex;
        Sample m_Fallback;
        XrTime m_Tolerance{2000000};
        std::string m_SampleType{typeid(Sample).name()};
    };

    class Mmf
    {
      public:
        Mmf();
        ~Mmf();
        void SetName(const std::string& name);
        bool Open(XrTime time);
        bool Read(void* buffer, size_t size, XrTime time);
        void Close();


      private: 
        XrTime m_Check{1000000000}; // reopen mmf once a second by default
        XrTime m_LastRefresh{0};
        std::string m_Name;
        HANDLE m_FileHandle{nullptr};
        void* m_View{nullptr};
        bool m_ConnectionLost{false};
        std::mutex m_MmfLock;
    };

    struct ITimer
    {
        virtual ~ITimer() = default;

        virtual void start() = 0;
        virtual void stop() = 0;

        virtual uint64_t query() const = 0;
    };

    std::shared_ptr<ITimer> createTimer();

    static inline bool startsWith(const std::string& str, const std::string& substr)
    {
        return str.find(substr) == 0;
    }

    static inline bool endsWith(const std::string& str, const std::string& substr)
    {
        const auto pos = str.find(substr);
        return pos != std::string::npos && pos == str.size() - substr.size();
    }

    // Both ray and quadCenter poses must be located using the same base space.
    bool hitTest(const XrPosef& ray, const XrPosef& quadCenter, const XrExtent2Df& quadSize, XrPosef& hitPose);

    // Get UV coordinates for a point on quad.
    XrVector2f getUVCoordinates(const XrVector3f& point, const XrPosef& quadCenter, const XrExtent2Df& quadSize);
    static inline POINT getUVCoordinates(const XrVector3f& point,
                                         const XrPosef& quadCenter,
                                         const XrExtent2Df& quadSize,
                                         const XrExtent2Di& quadPixelSize)
    {
        const XrVector2f uv = getUVCoordinates(point, quadCenter, quadSize);
        return {static_cast<LONG>(uv.x * quadPixelSize.width), static_cast<LONG>(uv.y * quadPixelSize.height)};
    }

    std::string LastErrorMsg();

} // namespace utility