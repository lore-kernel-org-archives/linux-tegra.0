From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 07/14] clk: tegra: Implement Tegra210 EMC clock
Date: Tue, 14 Apr 2020 18:18:29 +0300
Message-ID: <92eb73ba-73e4-f9f1-bb22-9b515e32cee6@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-8-thierry.reding@gmail.com>
 <8dc000fb-8867-cf8f-8204-a9e1e79a4811@gmail.com>
 <20200414143424.GG3593749@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200414143424.GG3593749@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

14.04.2020 17:34, Thierry Reding пишет:
> On Thu, Apr 09, 2020 at 09:24:31PM +0300, Dmitry Osipenko wrote:
>> 09.04.2020 20:52, Thierry Reding пишет:
>> ...
>>> +static long tegra210_clk_emc_round_rate(struct clk_hw *hw, unsigned long rate,
>>> +					unsigned long *prate)
>>> +{
>>> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
>>> +	struct tegra210_clk_emc_provider *provider = emc->provider;
>>> +	unsigned int i;
>>> +
>>> +	if (!provider || !provider->configs || provider->num_configs == 0)
>>> +		return clk_hw_get_rate(hw);
>>
>> This still looks wrong to me. Nobody should be able to get EMC clock
>> until provider is registered.
> 
> The EMC clock is mostly orthogonal to the provider. The provider really
> only allows you to actually change the frequency. The clock will still
> remain even if the provider goes away, it just will loose the ability to
> change rate.

It's not only about changing the clock rate, but also about rounding the
rate and etc.

Besides, you won't be able to change the rate until provider is
registered, which might be a quite big problem by itself.

>> This is troublesome, especially given that you're allowing the EMC
>> driver to be compiled as a loadable module. For example, this won't work
>> with the current ACTMON driver because it builds OPP table based on the
>> clk-rate rounding during the driver's probe, so it won't be able to do
>> it properly if provider is "temporarily" missing.
>>
>> ... I think that in a longer run we should stop manually building the
>> ACTMON's OPP table and instead define a proper OPP table (per-HW Speedo
>> ID, with voltages) in a device-tree. But this is just a vague plans for
>> the future for now.
> 
> This code only applies to Tegra210 and we don't currently support ACTMON
> on Tegra210. I'm also not sure we'll ever do because using interconnects
> to describe paths to system memory and then using ICC requests for each
> driver to submit memory bandwidth requests seems like a better way of
> dealing with this problem than using ACTMON to monitor activity because
> that only allows you to react, whereas we really want to be able to
> allocate memory bandwidth upfront.

You absolutely have to have the ACTMON support if you want to provide a
good user experience because interconnect won't take into account the
dynamic CPU memory traffic. Without ACTMON support CPU will turn into a
"turtle" if memory runs on a lowest freq, while CPU needs the highest.

Secondly, the interconnect could underestimate the memory BW requirement
because memory performance depends quite a lot on the memory-accessing
patterns and it's not possible to predict it properly. Otherwise you may
need to always overestimate the BW, which perhaps is not what anyone
would really want to have.

I'm not sure why you're resisting to do it all properly from the start,
it looks to me that it will take you just a few lines of code (like in a
case of the T20/30 EMC).
