From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 0/8] NVIDIA Tegra clocksource driver improvements
Date: Mon, 3 Jun 2019 14:14:59 +0300
Message-ID: <fafaaba1-1d77-f8fa-1a62-d1dd70fd8d52@gmail.com>
References: <20190524153253.28564-1-digetx@gmail.com>
 <20190531082634.GA6070@pdeschrijver-desktop.Nvidia.com>
 <c686aae8-3be0-805e-265b-a7f16f2a6c02@gmail.com>
 <20190603071750.GA29894@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603071750.GA29894@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>
List-Id: linux-tegra@vger.kernel.org

03.06.2019 10:17, Peter De Schrijver пишет:
> On Fri, May 31, 2019 at 03:33:41PM +0300, Dmitry Osipenko wrote:
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
> 
> No. It doesn't. This is the big change between A9 and later CPUs. 

Thank you for the clarification, I'll add a patch to lower the rating
where appropriate.
