// MIT License
//
// Copyright(c) 2022 Matthieu Bucchianeri
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this softwareand associated documentation files(the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and /or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions :
//
// The above copyright noticeand this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#pragma once

#include "pch.h"

namespace openxr_api_layer::log {

    TRACELOGGING_DECLARE_PROVIDER(g_traceProvider);

#define IsTraceEnabled() TraceLoggingProviderEnabled(openxr_api_layer::log::g_traceProvider, 0, 0)

#define TraceLocalActivity(activity) TraceLoggingActivity<openxr_api_layer::log::g_traceProvider> activity;

#define TLArg(var, ...) TraceLoggingValue(var, ##__VA_ARGS__)
#define TLPArg(var, ...) TraceLoggingPointer(var, ##__VA_ARGS__)
#ifdef _M_IX86
#define TLXArg TLArg
#else
#define TLXArg TLPArg
#endif

    inline bool logVerbose = false;

    // General logging function.
    void Log(const char* fmt, ...);
    static inline void Log(const std::string_view& str)
    {
        Log(str.data());
    }

    // Debug logging function. Can make things very slow (only enabled on Debug builds).
    void DebugLog(const char* fmt, ...);
    static inline void DebugLog(const std::string_view& str)
    {
        Log(str.data());
    }

    // Error logging function. Goes silent after too many errors.
    void ErrorLog(const char* fmt, ...);
    static inline void ErrorLog(const std::string_view& str)
    {
        Log(str.data());
    }

} // namespace openxr_api_layer::log
