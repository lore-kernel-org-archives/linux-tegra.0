From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Correct the length of AHB register space
Date: Wed, 13 Nov 2013 13:14:35 +0800
Message-ID: <52830ABB.5060501@nvidia.com>
References: <1383802327-11908-1-git-send-email-markz@nvidia.com>
 <52827BF0.5070706@wwwdotorg.org> <5282D200.2090904@nvidia.com>
 <5282EED2.3080603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5282EED2.3080603-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/13/2013 11:15 AM, Stephen Warren wrote:
> On 11/12/2013 06:12 PM, Mark Zhang wrote:
>> On 11/13/2013 03:05 AM, Stephen Warren wrote:
>>> On 11/06/2013 10:32 PM, Mark Zhang wrote:
>>>> On Tegra114 it should be 0x12c.
>>>
>>>> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
>>>
>>>>  	ahb: ahb {
>>>>  		compatible = "nvidia,tegra114-ahb", "nvidia,tegra30-ahb";
>>>> -		reg = <0x6000c004 0x14c>;
>>>> +		reg = <0x6000c004 0x12c>;
>>>>  	};
>>>
>>> I don't think this is correct.
>>>
>>> 0x12c /is/ the address of the last defined register that exists.
>>> However, the system memory map table in the TRM indicates that 336 bytes
>>> of address space are allocated for this module, so the value should be
>>> 0x150 (minus 4 due to the base address offset of 4, so 0x14c) for all of
>>> Tegra30/114/124. That matches what's already in DT.
>>>
>>
>> Yeah, but the 0x12c - 0x14c is not defined in TRM, despite the address
>> space in memory map is 336 bytes. So if you add this section into
>> register map, that implies writing into this section is OK but this is
>> undefined behaviour.
> 
> I'm sure there are plenty of undefined register addresses in all the HW
> modules in Tegra.
> 

Okay, if so I'm OK with that.

Mark
