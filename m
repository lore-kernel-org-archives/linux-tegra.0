From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: USB for Tegra114 Dalmore
Date: Wed, 31 Jul 2013 16:06:48 -0600
Message-ID: <51F98A78.9060309@wwwdotorg.org>
References: <1375292543-7896-1-git-send-email-ttynkkynen@nvidia.com> <1375292543-7896-3-git-send-email-ttynkkynen@nvidia.com> <51F9550F.3080503@cogentembedded.com> <51F9660C.6090604@iki.fi> <51F96B48.10209@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51F96B48.10209-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Tuomas Tynkkynen <tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/31/2013 01:53 PM, Sergei Shtylyov wrote:
> Hello.
> 
> On 07/31/2013 11:31 PM, Tuomas Tynkkynen wrote:
>>>> Device tree entries for the three EHCI controllers on Tegra114.
>>>> Enables the the third controller (USB host) on Dalmore.

>>>> diff --git a/arch/arm/boot/dts/tegra114.dtsi
>>>> b/arch/arm/boot/dts/tegra114.dtsi
>>>> index abf6c40..2905145 100644
>>>> --- a/arch/arm/boot/dts/tegra114.dtsi
>>>> +++ b/arch/arm/boot/dts/tegra114.dtsi
>>>> @@ -430,6 +430,68 @@
>>>>           status = "disable";
>>>>       };
>>>>
>>>> +    usb@7d000000 {
>>>> +        compatible = "nvidia,tegra30-ehci", "usb-ehci";
>>>> +        reg = <0x7d000000 0x4000>;
>>>> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>>>> +        phy_type = "utmi";
>>>> +        clocks = <&tegra_car TEGRA114_CLK_USBD>;
>>>> +        nvidia,phy = <&phy1>;
>>>> +        status = "disabled";
>>>> +    };
>>>> +
>>>> +    phy1: usb-phy@7d000000 {
> 
>>>     At the same address as the previous node?
> 
>> Yes. The first node is for the EHCI driver and the second for the PHY
>> driver.
>> There is some overlap in the exact registers used, so both drives map the
>> whole USB controller block.
> 
>    That's really horrible design.

Yup. Both USB PHY and EHCI controller registers really are interleaved
in one range.

>>>> +        compatible = "nvidia,tegra30-usb-phy";
>>>> +        reg = <0x7d000000 0x4000 0x7d000000 0x4000>;
> 
>>>     Hm, there must be some mistake: two similar register ranges.
> 
>> The second range is used to configure the UTMI pad registers. All the
>> UTMI pad
>> registers are located in the first USB controller's range.
> 
>    Which second range? This is one and the same range.

Some registers in the USB1 register range actually are "global" and
relevant to all USB controllers. So:

There are two 2-cell entries in that reg property. The first entry
defines the registers for this USB PHY, and hence is unique for each USB
PHY node. The second defines the registers for whichever USB PHY
contains various shared registers across multiple PHYs, so is expected
to be identical across all USB PHY DT nodes.

Yes, the HW design really is this screwy.

>    Don't they cause numerous resource conflicts while device nodes being
> instantiated as the platform devices?

No; the driver knows that the HW is screwy and there's lots of
register-range sharing going on, so it simply maps the registers, rather
than reserving the physical address range and mapping it.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
