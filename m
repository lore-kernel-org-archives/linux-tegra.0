From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 07/14] clk: tegra: Implement Tegra210 EMC clock
Date: Tue, 14 Apr 2020 23:22:56 +0300
Message-ID: <9dd6ffe0-49bb-4847-e956-2f2e339c3a28@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-8-thierry.reding@gmail.com>
 <8dc000fb-8867-cf8f-8204-a9e1e79a4811@gmail.com>
 <20200414143424.GG3593749@ulmo>
 <92eb73ba-73e4-f9f1-bb22-9b515e32cee6@gmail.com>
 <20200414171010.GB15932@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200414171010.GB15932@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

14.04.2020 20:10, Thierry Reding пишет:
> On Tue, Apr 14, 2020 at 06:18:29PM +0300, Dmitry Osipenko wrote:
>> 14.04.2020 17:34, Thierry Reding пишет:
>>> On Thu, Apr 09, 2020 at 09:24:31PM +0300, Dmitry Osipenko wrote:
>>>> 09.04.2020 20:52, Thierry Reding пишет:
>>>> ...
>>>>> +static long tegra210_clk_emc_round_rate(struct clk_hw *hw, unsigned long rate,
>>>>> +					unsigned long *prate)
>>>>> +{
>>>>> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
>>>>> +	struct tegra210_clk_emc_provider *provider = emc->provider;
>>>>> +	unsigned int i;
>>>>> +
>>>>> +	if (!provider || !provider->configs || provider->num_configs == 0)
>>>>> +		return clk_hw_get_rate(hw);
>>>>
>>>> This still looks wrong to me. Nobody should be able to get EMC clock
>>>> until provider is registered.
>>>
>>> The EMC clock is mostly orthogonal to the provider. The provider really
>>> only allows you to actually change the frequency. The clock will still
>>> remain even if the provider goes away, it just will loose the ability to
>>> change rate.
>>
>> It's not only about changing the clock rate, but also about rounding the
>> rate and etc.
> 
> The code will currently just return the configured rate when no provider
> is available. It's going to always round to that one rate and it will
> refuse to set another one. The EMC clock is basically going to function
> as a fixed clock while no provider is attached.

Yes, I'm telling that this should be a wrong thing to do.

>> Besides, you won't be able to change the rate until provider is
>> registered, which might be a quite big problem by itself.
> 
> Until the provider is registered, there's just no way to change the
> rate. You always need to write MC and EMC registers in order to change
> the rate, so trying to change it when the MC/EMC drivers aren't
> available isn't going to work.

Again, clk_get() should return -EPROBE_DEFER until provider is registered.

>>>> This is troublesome, especially given that you're allowing the EMC
>>>> driver to be compiled as a loadable module. For example, this won't work
>>>> with the current ACTMON driver because it builds OPP table based on the
>>>> clk-rate rounding during the driver's probe, so it won't be able to do
>>>> it properly if provider is "temporarily" missing.
>>>>
>>>> ... I think that in a longer run we should stop manually building the
>>>> ACTMON's OPP table and instead define a proper OPP table (per-HW Speedo
>>>> ID, with voltages) in a device-tree. But this is just a vague plans for
>>>> the future for now.
>>>
>>> This code only applies to Tegra210 and we don't currently support ACTMON
>>> on Tegra210. I'm also not sure we'll ever do because using interconnects
>>> to describe paths to system memory and then using ICC requests for each
>>> driver to submit memory bandwidth requests seems like a better way of
>>> dealing with this problem than using ACTMON to monitor activity because
>>> that only allows you to react, whereas we really want to be able to
>>> allocate memory bandwidth upfront.
>>
>> You absolutely have to have the ACTMON support if you want to provide a
>> good user experience because interconnect won't take into account the
>> dynamic CPU memory traffic. Without ACTMON support CPU will turn into a
>> "turtle" if memory runs on a lowest freq, while CPU needs the highest.
> 
> Can we not guess a bandwidth based on the CPU frequency? Yes, that's
> perhaps going to be an overestimation if the CPU doesn't actually access
> memory, but that's better than nothing at all.

CPU load doesn't reflect the memory usage.

1. CPU could be 100% loaded while not making memory accesses at all
(100% cache hit).

2. CPU governor settings could be changed by user and CPU != memory.

ACTMON is specifically designated to memory scaling based on actual
memory usage statistics. T210 ACTMON is similar to T124, it should be
easy to support.

> Also, at this point I'm less worried about power consumption rather than
> making Tegra210 devices perform useful tasks. Yes, eventually we'll want
> to fine-tune power consumption, but it's going to take a bit of work to
> get there. In the meantime, giving people a way to set an EMC frequency
> other than that set on boot is going to make them very happy.
> 
>> Secondly, the interconnect could underestimate the memory BW requirement
>> because memory performance depends quite a lot on the memory-accessing
>> patterns and it's not possible to predict it properly. Otherwise you may
>> need to always overestimate the BW, which perhaps is not what anyone
>> would really want to have.
> 
> Overestimating might be a good starting point, though. At this point I'm
> mostly concerned about being able to change the memory frequency at all
> because many systems are mostly unusable at the boot EMC frequency.
> 
> Like I said, if ACTMON really does prove to be useful I'm all for adding
> support on Tegra210, but I don't think trying to do everything all at
> once is a very good plan. So I'm trying to get there in incremental
> steps.
> 
>> I'm not sure why you're resisting to do it all properly from the start,
>> it looks to me that it will take you just a few lines of code (like in a
>> case of the T20/30 EMC).
> 
> I'm not trying to resist anything. I'm just saying that all of the
> issues that you're bringing up aren't an immediate concern.
> 
> My main concerns right now are to: a) allow people to change the EMC
> frequency (and hopefully soon also allow the EMC frequency to be changed
> based on bandwidth demands by memory client drivers) and b) not bloat
> the kernel more than it has to (while my configuration isn't tweaked,
> it's pretty standard and the resulting image is roughly 20 MiB; adding
> the Tegra210 EMC driver adds another 64 KiB).
> 
> And if we really do want to add ACTMON support later on, you already
> suggested a better way of moving forward, so it sounds to me like that
> would be a nice incremental improvement, certainly much better than
> bloating the kernel even further by requiring this to be built-in and
> preventing it from being unloaded.

Up to you then :)
