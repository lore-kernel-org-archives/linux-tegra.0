From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: Multi-platform, and secure-only ARM errata workarounds
Date: Wed, 27 Feb 2013 11:37:08 +0530
Message-ID: <512DA28C.1080909@ti.com>
References: <512BF81A.3080700@wwwdotorg.org> <201302261023.26939.arnd@arndb.de> <20130226113538.GS17833@n2100.arm.linux.org.uk> <512CF87A.4090404@wwwdotorg.org> <20130226181114.GU17833@n2100.arm.linux.org.uk> <512CFF30.9080300@wwwdotorg.org> <20130226184942.GV17833@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130226184942.GV17833-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 27 February 2013 12:19 AM, Russell King - ARM Linux wrote:
> On Tue, Feb 26, 2013 at 11:30:08AM -0700, Stephen Warren wrote:
>> On 02/26/2013 11:11 AM, Russell King - ARM Linux wrote:
>>> On Tue, Feb 26, 2013 at 11:01:30AM -0700, Stephen Warren wrote:
>>>> The conditional in that statement makes me wonder which of the following
>>>> operations will fault in non-secure mode:
>>>>
>>>> 1) Reading from the diagnostic register.
>>>
>>> Won't fault.
>>>
>>>> 2) Writing to the diagnostic register, of a value the same as what's
>>>> already there.
>>>
>>> Will fault.
>>>
>>>> 3) Writing to the diagnostic register, of a value different than what's
>>>> already there.
>>>
>>> Will fault.
>>>
>>>> Would the following not fault in both secure and non-secure mode:
>>>>
>>>> read diagnostic register
>>>> if desired bit already set:
>>>>      b 1f
>>>> set desired bit
>>>> write value back to diagnostic register
>>>> 1:
>>>
>>> That is exactly what we do
>>
>> Well, I asked because for the 3 WARs in question at least, that isn't
>> what the code does. For example, from proc-v7.s:
>>
>> #ifdef CONFIG_ARM_ERRATA_742230
>> 	cmp	r6, #0x22		@ only present up to r2p2
>> 	mrcle	p15, 0, r10, c15, c0, 1	@ read diagnostic register
>> 	orrle	r10, r10, #1 << 4	@ set bit #4
>> 	mcrle	p15, 0, r10, c15, c0, 1	@ write diagnostic register
>> #endif
>>
>> (unless that orrle affects the flags and hence skips the mcrle, but I
>> don't think so.)
>
> Hmm.  I've not really been taking much notice of how these work-arounds
> all work - maybe it's safe to write this diagnostic register from
> non-secure mode then?
>
> I have noticed this kind of fishy thing with OMAP4430 running in non-secure
> mode - some registers I thought would cause an exception don't.  No idea
> why not...
>
They do fault on OMAP. We discussed the issue in the past [1] [2].
The only way we could get around is to disable those WA flags in config.
I was told to move such requirements to boot-loaders then

Regards,
Santosh

[1] https://patchwork.kernel.org/patch/1743211/
[2] https://lkml.org/lkml/2012/12/10/321
