From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/9] clocksource: tegra: Enable ARM arch_timer with TSC
Date: Thu, 20 Dec 2012 12:33:42 +0000
Message-ID: <50D305A6.2080904@arm.com>
References: <1355996654-6579-1-git-send-email-hdoyu@nvidia.com> <1355996654-6579-6-git-send-email-hdoyu@nvidia.com> <50D2EFFB.8030702@arm.com> <20121220.135758.1347753620353343245.hdoyu@nvidia.com> <50D2FF19.4060600@arm.com> <20121220122246.GA6819@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121220122246.GA6819-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "andrew-g2DYL2Zd6BY@public.gmane.org" <andrew-g2DYL2Zd6BY@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org" <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 20/12/12 12:22, Peter De Schrijver wrote:
>>>>> +
>>>>> +	/* CNTFRQ */
>>>>> +	asm("mcr p15, 0, %0, c14, c0, 0\n" : : "r" (freq));
>>>>> +	asm("mrc p15, 0, %0, c14, c0, 0\n" : "=r" (val));
>>>>> +	BUG_ON(val != freq);
>>>>
>>>> This is scary. CNTFRQ is only writable from secure mode, and will
>>>> explode in any other situation.
>>>>
>>>> Also, writing to CNTFRQ doesn't change the timer frequency! This is just
>>>> a way for secure mode to tell the rest of the world the frequency the
>>>> timer is ticking at. Unless you've wired the input clock to be able to
>>>> change the frequency?
>>>
>>> ATM, our upstream kernel is expected in secure mode. This situation
>>> may be changed later, though....
>>
>> I appreciate this. But I expect this kernel to be also used on the
>> non-secure side if someone tried to run KVM with it. And this would go
>> bang right away.
>>
> 
> But the guest wouldn't necessarily have this peripheral, or any other Tegra114
> peripheral for that matter?

The problem is not so much the guest but the host. The host has to be
booted in non-secure, so just saying "we do not support non-secure" is
not a very convincing argument.

Unless of course you've already decided that you don't want to support
KVM on this SoC...

	M.
-- 
Jazz is not dead. It just smells funny...
