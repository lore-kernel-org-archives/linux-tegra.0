From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/9] clocksource: tegra: Enable ARM arch_timer with TSC
Date: Thu, 20 Dec 2012 17:09:04 +0000
Message-ID: <50D34630.9020708@arm.com>
References: <50D305A6.2080904@arm.com><20121220125507.GB6819@tbergstrom-lnx.Nvidia.com><50D31365.9000009@arm.com> <20121220.164230.292625215885249791.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121220.164230.292625215885249791.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "andrew-g2DYL2Zd6BY@public.gmane.org" <andrew-g2DYL2Zd6BY@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org" <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 20/12/12 14:42, Hiroshi Doyu wrote:
> Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote @ Thu, 20 Dec 2012 14:32:21 +0100:
> 
>> On 20/12/12 12:55, Peter De Schrijver wrote:
>>> On Thu, Dec 20, 2012 at 01:33:42PM +0100, Marc Zyngier wrote:
>>>> On 20/12/12 12:22, Peter De Schrijver wrote:
>>>>>>>>> +
>>>>>>>>> +	/* CNTFRQ */
>>>>>>>>> +	asm("mcr p15, 0, %0, c14, c0, 0\n" : : "r" (freq));
>>>>>>>>> +	asm("mrc p15, 0, %0, c14, c0, 0\n" : "=r" (val));
>>>>>>>>> +	BUG_ON(val != freq);
>>>>>>>>
>>>>>>>> This is scary. CNTFRQ is only writable from secure mode, and will
>>>>>>>> explode in any other situation.
>>>>>>>>
>>>>>>>> Also, writing to CNTFRQ doesn't change the timer frequency! This is just
>>>>>>>> a way for secure mode to tell the rest of the world the frequency the
>>>>>>>> timer is ticking at. Unless you've wired the input clock to be able to
>>>>>>>> change the frequency?
>>>>>>>
>>>>>>> ATM, our upstream kernel is expected in secure mode. This situation
>>>>>>> may be changed later, though....
>>>>>>
>>>>>> I appreciate this. But I expect this kernel to be also used on the
>>>>>> non-secure side if someone tried to run KVM with it. And this would go
>>>>>> bang right away.
>>>>>>
>>>>>
>>>>> But the guest wouldn't necessarily have this peripheral, or any other Tegra114
>>>>> peripheral for that matter?
>>>>
>>>> The problem is not so much the guest but the host. The host has to be
>>>> booted in non-secure, so just saying "we do not support non-secure" is
>>>> not a very convincing argument.
>>>>
>>>> Unless of course you've already decided that you don't want to support
>>>> KVM on this SoC...
>>>>
>>>
>>> I guess that means we can't support KVM yet. Tegra does not have a secure
>>> monitor by default. It all depends on what that system integrator does.
>>
>> VExpress doesn't have a secure monitor either, and yet we run KVM on it
>> (by switching to non-secure before loading the kernel). Same for Exynos5.
>>
>> What I'm trying to say is that this code is rather pointless (this
>> should be done by the firmware/bootloader, not the kernel, or the
>> information should be provided in DT if CNTFRQ is not set).
> 
> "tegra114.dtsi" has the folloiwng "tsc" entry. So can we consider that
> if dts has this entry, CNTFRQ is not set, which implies it's in secure
> mode. kernel should set it up by itself? Otherwise, skip this setup
> and use it. For example:
> 
>  	tsc {
>  		compatible = "nvidia,tegra114-tsc";
>  		reg = <0x700f0000 0x20000>;
> +		setup-cntfrq;
>  	};
> 
> Is this what you explained in the above?
> At least, kernel can survive without bootloader/firmware support, ATM.

No. The DT should only describe the hardware, and not something that is
Linux specific.

Just use the "clock-frequency" attribute in the timer arch-timer node,
and get rid of this CNTFRQ setting. The driver already knows how to deal
with this situation if this attribute is set.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
