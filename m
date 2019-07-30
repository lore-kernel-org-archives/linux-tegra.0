From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/2] soc/tegra: pmc: Query PCLK clock rate at probe
 time
Date: Tue, 30 Jul 2019 20:40:56 +0300
Message-ID: <0a24e723-ca4e-7b51-33a2-74eff141e1ce@gmail.com>
References: <20190723023511.24542-1-digetx@gmail.com>
 <20190725093644.GJ12715@pdeschrijver-desktop.Nvidia.com>
 <f7879942-0875-1f27-5870-3f8414c2148d@gmail.com>
 <7e76b679-1a65-fa14-2cc6-2b27ece8131c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7e76b679-1a65-fa14-2cc6-2b27ece8131c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

29.07.2019 16:07, Dmitry Osipenko пишет:
> 25.07.2019 14:15, Dmitry Osipenko пишет:
>> 25.07.2019 12:36, Peter De Schrijver пишет:
>>> On Tue, Jul 23, 2019 at 05:35:10AM +0300, Dmitry Osipenko wrote:
>>>> The PCLK clock is running off SCLK, which is a critical clock that is
>>>> very unlikely to randomly change its rate. It's also a bit clumsy (and
>>>> apparently incorrect) to query the clock's rate with interrupts being
>>>> disabled because clk_get_rate() takes a mutex and that's the case during
>>>> suspend/cpuidle entering.
>>>>
>>>
>>> SCLK and PCLK certainly can change rate at runtime, although the code to
>>> handle this hasn't reached upstream yet.
>>
>> Okay, maybe this patch is indeed not very worthwhile then. I'm leaving
>> it up to you, guys, to decide.
>>
> 
> I now recalled what was the initial reason for this patch because
> happened to bump into the problem once again.. it's really problematic
> to call clk_get_rate() with the disabled preemption because some clk
> notifier handler may block (EMC) and cause reschedule, hence the CCF
> 'prepare' mutex is kept locked during of CPUIDLE driver entering LP2
> state and thus causing system lockup, since scheduling with the disabled
> interrupts obviously won't work well.
> 
> So this patch actually is needed to be applied or some other solution
> have to be provided. Since PCLK rate currently isn't altering anywhere
> in the kernel, I'd suggest to imply apply this series. Please let me
> know if you have any objections. I may re-iterate this patch with an
> extended commit message, describing the resolved problem in a more
> details, if necessary.
> 

I'll send v3 with a changed commit's message, please take a look at it.
