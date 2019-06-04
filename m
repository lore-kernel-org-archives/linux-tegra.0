From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 00/10] NVIDIA Tegra clocksource driver improvements
Date: Tue, 4 Jun 2019 18:01:07 +0300
Message-ID: <93d3f559-d42a-9a3b-50b5-b91471261c34@gmail.com>
References: <20190603185948.30438-1-digetx@gmail.com>
 <20190604133355.GE29894@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604133355.GE29894@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.06.2019 16:33, Peter De Schrijver пишет:
> On Mon, Jun 03, 2019 at 09:59:38PM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This series primarily unifies the driver code across all Tegra SoC
>> generations. In a result the clocksources are allocated per-CPU on
>> older Tegra's and have a higher rating than the arch-timer where
>> appropriate, the newer Tegra210 is getting support for microsecond
>> clocksource and the driver's code is getting much cleaner.
>>
>> The series was extensively tested on Tegra20 and Tegra30.
>>
>> Changelog:
>>
>> v4: In the comment to v3 Peter De Schrijver pointed out that arch-timer
>>     isn't affected by DVFS changes and thus it is preferred over tegra-timer
>>     on [T114, T210). Added new patch to address that: "Lower clocksource
>>     rating for some Tegra's".
>>
>>     Daniel Lezcano suggested that it will be worthwhile to rename driver's
>>     source file as driver now covers more SoC generations than it initially
>>     did. Hence the new "Rename timer-tegra20.c to timer-tegra.c" patch.
>>
>> v3: Fixed compilation on ARM64. Turned out that it doesn't have the
>>     delay-timer, thanks to Nicolas Chauvet for the report.
>>
>>     Added new "Support COMPILE_TEST universally" patch for better
>>     compile-test coverage.
>>
>> v2: Rebased on recent linux-next. Now all of #ifdef's are removed from the
>>     code due to the recent patch that generalized persistent clocksource.
>>
>>     Couple other minor cosmetic changes.
> 
> Series Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
> 

Thanks!
