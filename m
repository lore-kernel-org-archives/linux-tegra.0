From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: add EMC clock scaling API
Date: Tue, 18 Dec 2012 16:09:27 +0800
Message-ID: <50D024B7.400@gmail.com>
References: <1355516086-11116-1-git-send-email-dev@lynxeye.de>  <1355516086-11116-2-git-send-email-dev@lynxeye.de>  <50CEFD28.7080601@gmail.com> <1355743334.1490.7.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355743334.1490.7.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/17/2012 07:22 PM, Lucas Stach wrote:
> Hi Mark,
> 
> Am Montag, den 17.12.2012, 19:08 +0800 schrieb Mark Zhang:
>> If my understanding is right, I think this is a temporary solution.
>> Because this kind of requirement should be addressed by DVFS subsystem.
>>
> Yes, this can go away, once proper DVFS is added. But maybe it can also
> be an example of how things could be done there.
[...]
> 
>>>  #include <linux/platform_device.h>
>>>  #include <linux/platform_data/tegra_emc.h>
>>> +#include <linux/types.h>
>>> +#include <memory/tegra_emc_performance.h>
>>
>> Why don't you put this file into the directory which "tegra_emc.h"
>> resides? I think that'll be easy to find and understand.
>>
> Because my understanding is that mach-tegra is not the right place for
> include files that are used by normal drivers and not just the platform
> code.
> 

Tegra emc driver is not "normal" driver, it's highly tegra related.
"tegra_emc_performance.h" is also tegra related so I think it's not good
to put it into a generic directory, just like "include/memory" here.

>>>  
>>>  #include "tegra2_emc.h"
>>>  #include "fuse.h"
>>> @@ -35,8 +38,16 @@ static bool emc_enable;
>>>  #endif
>>>  module_param(emc_enable, bool, 0644);
>>>  
>>> +struct emc_superclient_constraint {
>>> +	int bandwidth;
>>> +	enum tegra_emc_perf_level perf_level;
>>> +};
>>> +
>>> +static struct emc_superclient_constraint constraints[TEGRA_EMC_SC_NUM];
>>> +
>>>  static struct platform_device *emc_pdev;
>>>  static void __iomem *emc_regbase;
>>> +static struct clk *emc_clk;
>>
>> Instead of using global variables, it's better to save it into a driver
>> private structure. Although this way is easy to write. :)
>> I think when we start upstream works on DVFS, an emc driver private
>> structure is needed so we can do this right now.
>>
> I can certainly do this. It will increase the churn of the patch a bit,
> but I think your concern is valid and I'll address it in V2.
> 
>>>  
>>>  static inline void emc_writel(u32 val, unsigned long addr)
>>>  {
>>> @@ -176,6 +187,64 @@ int tegra_emc_set_rate(unsigned long rate)
>>>  	return 0;
>>>  }
>>>  
>>> +static void tegra_emc_scale_clock(void)
>>> +{
>>> +	u64 bandwidth_floor = 0;
>>> +	enum tegra_emc_perf_level highest_level = TEGRA_EMC_PL_LOW;
>>> +	unsigned long clock_rate;
>>> +	int i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(constraints); i++) {
>>> +		bandwidth_floor += constraints[i].bandwidth;
>>
>> Get confused here. Why we add all bandwidth up? We should loop all the
>> bandwidth requests in "constraints" array, find out the largest one,
>> compare with emc table then finally write the registers and set the emc
>> clock, isn't it?
>>
> No, bandwidth constraints add up. Imagine two display clients scanning
> out at the same time. Both on their own may be satisfied with 83MHz DRAM
> clock, but if they are running at the same time you have to account for
> that and maybe bump DRAM freq to 133MHz.

Ah, yes, this is correct for dc. I skimmed the downstream kernel codes
and found that there are different logics for different clients. For DC,
their bandwidth request should be added up. For other clients, e.g: USB,
set to max bandwidth request is OK.

So we may do more works on this part later, to write a more accurate
algorithms to get the final emc rate. For now, it's OK.

> 
> Regards,
> Lucas
> 
> 
