From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: add EMC clock scaling API
Date: Tue, 18 Dec 2012 19:50:41 +0800
Message-ID: <50D05891.3070006@gmail.com>
References: <1355516086-11116-1-git-send-email-dev@lynxeye.de>   <1355516086-11116-2-git-send-email-dev@lynxeye.de>   <50CEFD28.7080601@gmail.com> <1355743334.1490.7.camel@tellur>  <50D024B7.400@gmail.com> <1355821912.1490.48.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355821912.1490.48.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/18/2012 05:11 PM, Lucas Stach wrote:
> Am Dienstag, den 18.12.2012, 16:09 +0800 schrieb Mark Zhang:
> [...]
>>>> Why don't you put this file into the directory which "tegra_emc.h"
>>>> resides? I think that'll be easy to find and understand.
>>>>
>>> Because my understanding is that mach-tegra is not the right place for
>>> include files that are used by normal drivers and not just the platform
>>> code.
>>>
>>
>> Tegra emc driver is not "normal" driver, it's highly tegra related.
>> "tegra_emc_performance.h" is also tegra related so I think it's not good
>> to put it into a generic directory, just like "include/memory" here.
>>
> In fact it is a normal device driver. There is nothing specific to the
> platform in there. Citing from [1]: "Device drivers for things, even if
> they are only found on the ARM architecture, or even only on your
> machine, do not go in these directories, but in the relevant parts of
> the main tree; usually linux/drivers/, but sometimes linux/fs
> or /linux/net if there are filesystems, partition types or network
> protocols specific to your device."
> 
> So honestly I don't even know why the EMC driver is located in
> mach-tegra. This may have been historically the right place, as EMC was
> intertwined with CPUfreq, which is in fact platform specific. But that
> point is moot now.
> 

Okay, learned. Thanks for the explanation.

> [...]
>>>>
>>>> Get confused here. Why we add all bandwidth up? We should loop all the
>>>> bandwidth requests in "constraints" array, find out the largest one,
>>>> compare with emc table then finally write the registers and set the emc
>>>> clock, isn't it?
>>>>
>>> No, bandwidth constraints add up. Imagine two display clients scanning
>>> out at the same time. Both on their own may be satisfied with 83MHz DRAM
>>> clock, but if they are running at the same time you have to account for
>>> that and maybe bump DRAM freq to 133MHz.
>>
>> Ah, yes, this is correct for dc. I skimmed the downstream kernel codes
>> and found that there are different logics for different clients. For DC,
>> their bandwidth request should be added up. For other clients, e.g: USB,
>> set to max bandwidth request is OK.
>>
>> So we may do more works on this part later, to write a more accurate
>> algorithms to get the final emc rate. For now, it's OK.
>>
> I don't see how there could be any difference at the EMC level. You
> always want the EMC to deliver enough bandwidth for all registered
> clients. You certainly don't want to risk display corruptions just
> because USB also demands it's share. This might be a bad example as the
> high priority of the DC transaction may kick out USB, but still.
> 
> There might be different ways on how clients compute their needed
> bandwidth, maybe USB only request bandwidth for one high speed port even
> if three ports are connected. But that's the clients decision, not the
> EMCs.

Make EMC to deliver enough bandwidth is right but if we don't do
something while just adding all requests up will make EMC always running
at the highest rate, because EMC has too many clients. That makes
DVFS/power saving doesn't make sense.

So EMC should do some arbitrary works and this also can't be done in EMC
client side because they don't know the requirements each other.

Maybe I didn't explain above very clearly, you may refer to
"tegra3_clk_shared_bus_update" of tegra30_clocks.c in downstream kernel.

> 
> Regards,
> Lucas
> 
> [1] http://www.linux-arm.org/pub/LinuxKernel/WebHome/aleph-porting.pdf
> 
