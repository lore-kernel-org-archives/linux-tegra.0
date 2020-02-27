From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 4/8] memory: tegra: Add Tegra210 EMC clock driver
Date: Thu, 27 Feb 2020 18:18:05 +0300
Message-ID: <922e3faf-dd51-e159-4dc4-d427af58dc8f@gmail.com>
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-5-josephl@nvidia.com>
 <403181d4-100b-679e-b1d8-c052c6d1f3ac@gmail.com>
 <2f9722b4-df92-546b-9659-3b02768bbe41@nvidia.com>
 <20200226165746.GA818759@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200226165746.GA818759@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

26.02.2020 19:57, Thierry Reding пишет:
> On Thu, May 30, 2019 at 10:45:01AM +0800, Joseph Lo wrote:
>> On 5/29/19 9:26 PM, Dmitry Osipenko wrote:
>>> 29.05.2019 11:21, Joseph Lo пишет:
>>>> This is the initial patch for Tegra210 EMC clock driver, which doesn't
>>>> include the support code and detail sequence for clock scaling yet.
>>>>
>>>> The driver is designed to support LPDDR4 SDRAM. Because of the LPDDR4
>>>> devices need to do initial time training before it can be used, the
>>>> firmware will help to do that at early boot stage. Then, the trained
>>>> table of the rates we support will pass to the kernel via DT. So the
>>>> driver can get the trained table for clock scaling support.
>>>>
>>>> For the higher rate support (above 800MHz), the periodic training is
>>>> needed for the timing compensation. So basically, two methodologies for
>>>> clock scaling are supported, one is following the clock changing
>>>> sequence to update the EMC table to EMC registers and another is if the
>>>> rate needs periodic training, then we will start a timer to do that
>>>> periodically until it scales to the lower rate.
>>>>
>>>> Based on the work of Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
>>>>
>>>> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>> v4:
>>>> - remove the statistic data in debugfs
>>>> - add tegra210_clk_register_emc API to make it compatible with the case
>>>>    if the kernel still uses the older DTB which doesn't have EMC node.
>>>>    And the MC and EMC clock can still be registered successfully.
>>>> v3:
>>>> - address almost all the comments from the previous version
>>>> - remove the DT parser of EMC table
>>>> - The EMC table is passing as a binary blob now.
>>>> ---
>>>>   drivers/memory/tegra/Kconfig        |  10 +
>>>>   drivers/memory/tegra/Makefile       |   1 +
>>>>   drivers/memory/tegra/tegra210-emc.c | 671 ++++++++++++++++++++++++++++
>>>>   drivers/memory/tegra/tegra210-emc.h | 156 +++++++
>>>>   include/soc/tegra/emc.h             |   2 +
>>>>   5 files changed, 840 insertions(+)
>>>>   create mode 100644 drivers/memory/tegra/tegra210-emc.c
>>>>   create mode 100644 drivers/memory/tegra/tegra210-emc.h
>>>>
>>>> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
>>>> index 4680124ddcab..9d051bcdbee3 100644
>>>> --- a/drivers/memory/tegra/Kconfig
>>>> +++ b/drivers/memory/tegra/Kconfig
>>>> @@ -26,3 +26,13 @@ config TEGRA124_EMC
>>>>   	  Tegra124 chips. The EMC controls the external DRAM on the board.
>>>>   	  This driver is required to change memory timings / clock rate for
>>>>   	  external memory.
>>>> +
>>>> +config TEGRA210_EMC
>>>> +	bool "NVIDIA Tegra210 External Memory Controller driver"
>>>> +	default y
>>>
>>> This is not enough since you're leaving possibility to disable
>>> compilation of the driver, but the compilation will fail because of the
>>> unresolved symbol (tegra210_clk_register_emc).
>>>
>>>> +	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
>>>> +	help
>>>> +	  This driver is for the External Memory Controller (EMC) found on
>>>> +	  Tegra210 chips. The EMC controls the external DRAM on the board.
>>>> +	  This driver is required to change memory timings / clock rate for
>>>> +	  external memory.
>>>
>>> Either TEGRA210_EMC Kconfig option shall be always force-selected for
>>> T210 or you should move all the clk-related code into drivers/clk/tegra/.
>>>
>>> Could you please give a rationale for having EMC clock code within the
>>> EMC driver?
>>
>> I didn't have a specific reason for that initially, just wanted the clock
>> code and EMC driver together for easier maintenance.
>>
>> But considering the fix in v4, that makes it backward compatible with the
>> case if the kernel uses the older DT without EMC node, I think it's better
>> to move the clock code into the clk folder now.
> 
> I looked into this a bit and I don't think this is actually worth it.
> The problem is that, as opposed to Tegra124 and earlier, the sequence
> for changing the EMC frequency is much more entangled. The bulk of the
> programming will be on the EMC side, with the code occasionally calling
> into CAR code to set the parent clock and some other flags.
> 
> So there's going to be some interdependencies regardless of where the
> clock code actually lives. I can try to split this apart, but I don't
> have very high hopes that the end result will be any cleaner than the
> version here.

I'm vaguely recalling that there was another reason than just to "make
things cleaner"..

https://patchwork.kernel.org/patch/10938389/#22641053

Secondly, if you're going to use the CCF API for the clock changes, then
I'm not sure that having couple custom clock-API functions sounds too bad.

Lastly, in regards to the cleanup.. at minimum you should strip out all
the unused parts from this code, make a generic cleanup to make it all
look better, address previous comments.
