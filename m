From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 0/8] NVIDIA Tegra clocksource driver improvements
Date: Sat, 1 Jun 2019 16:00:24 +0300
Message-ID: <6909cb87-8583-4ec8-74b7-a6153aec0246@gmail.com>
References: <20190524153253.28564-1-digetx@gmail.com>
 <20190531082634.GA6070@pdeschrijver-desktop.Nvidia.com>
 <c686aae8-3be0-805e-265b-a7f16f2a6c02@gmail.com>
 <26aeb9f0-5eb1-005a-02c1-4d785fe70331@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <26aeb9f0-5eb1-005a-02c1-4d785fe70331@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>
List-Id: linux-tegra@vger.kernel.org

31.05.2019 23:31, Daniel Lezcano пишет:
> On 31/05/2019 14:33, Dmitry Osipenko wrote:
>> 31.05.2019 11:26, Peter De Schrijver пишет:
>>> On Fri, May 24, 2019 at 06:32:45PM +0300, Dmitry Osipenko wrote:
>>>> Hello,
>>>>
>>>> This series primarily unifies the driver code across all Tegra SoC
>>>> generations. In a result the clocksources are allocated per-CPU on
>>>> older Tegra's and have a higher rating than the arch-timer, the newer
>>>> Tegra210 is getting support for microsecond clocksource and the driver's
>>>> code is getting much cleaner. Note that arch-timer usage is discouraged on
>>>> all Tegra's due to the time jitter caused by the CPU frequency scaling.
>>>
>>> I think the limitations are more as follows:
>>>
>>> Chip	timer		suffers cpu dvfs jitter		can wakeup from cc7
>>> T20	us-timer	No				Yes
>>> T20	twd timer	Yes				No?
>>> T30	us-timer	No				Yes
>>> T30	twd timer	Yes				No?
>>> T114	us-timer	No				Yes
>>> T114	arch timer	No				Yes
>>> T124	us-timer	No				Yes
>>> T124	arch timer	No				Yes
>>> T210	us-timer	No				Yes
>>> T210	arch timer	No				No
>>> T210	clk_m timer	No				Yes
>>>
>>> right?
>>
>> Doesn't arch timer run off the CPU clock? If yes (that's what I
>> assumed), then it should be affected by the DVFS. Otherwise I'll lower
>> the clocksource's rating for T114/124/132.
>>
>> TWD can't wake CPU from the power-down state, so it's a solid "No" for
>> TWD in the "can wakeup from cc7" column.
> 
> Wouldn't make sense to rename the timer-tegra20.c to timer-tegra.c now ?

Wouldn't hurt, given the refreshment that driver is getting lately. I'll
include a patch for that in the next revision, thanks.
