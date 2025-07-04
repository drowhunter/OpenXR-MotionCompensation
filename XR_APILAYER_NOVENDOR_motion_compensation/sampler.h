// Copyright(c) 2024 Sebastian Veith

#pragma once

#include "tracker.h"
#include "filter.h"
#include "output.h"

namespace tracker
{
    class TrackerBase;
}
namespace sampler
{
    class Sampler
    {
      public:
        Sampler(tracker::TrackerBase* tracker,
                const std::vector<utility::DofValue>& relevant,
                const std::shared_ptr<output::RecorderBase>& recorder);
        ~Sampler();

        void SetStrength(float strength) const;
        void StartSampling();
        void StopSampling();
        bool ReadData(utility::Dof& dof, XrTime now);
        void SetFrameTime(XrTime frameTime);

      private:
        void DoSampling();

        std::atomic_bool m_IsSampling{false};
        std::thread* m_Thread{nullptr};
        tracker::TrackerBase* m_Tracker{nullptr};
        std::shared_ptr<filter::StabilizerBase> m_Stabilizer{};
        std::chrono::microseconds m_Interval{std::chrono::milliseconds(1)};
        bool m_SampleRecording{false};
        std::shared_ptr<output::RecorderBase> m_Recorder{};
        XrTime m_XrFrameTime{};
        LARGE_INTEGER m_FrameStart{};
        LARGE_INTEGER m_CounterFrequency{};
    };
} // namespace sampler
