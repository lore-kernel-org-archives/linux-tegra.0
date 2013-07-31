From: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>
Subject: Re: [PATCH 2/2] ARM: dts: USB for Tegra114 Dalmore
Date: Wed, 31 Jul 2013 22:31:24 +0300
Message-ID: <51F9660C.6090604@iki.fi>
References: <1375292543-7896-1-git-send-email-ttynkkynen@nvidia.com> <1375292543-7896-3-git-send-email-ttynkkynen@nvidia.com> <51F9550F.3080503@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51F9550F.3080503@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Tuomas Tynkkynen <ttynkkynen@nvidia.com>, swarren@wwwdotorg.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hello,

On 31/07/13 21:18, Sergei Shtylyov wrote:
> Hello.
>
> On 07/31/2013 09:42 PM, Tuomas Tynkkynen wrote:
>
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>
>> Device tree entries for the three EHCI controllers on Tegra114.
>> Enables the the third controller (USB host) on Dalmore.
>
>     I would have done the board patch separately from the SoC one.
>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> [...]
>
>> diff --git a/arch/arm/boot/dts/tegra114.dtsi
>> b/arch/arm/boot/dts/tegra114.dtsi
>> index abf6c40..2905145 100644
>> --- a/arch/arm/boot/dts/tegra114.dtsi
>> +++ b/arch/arm/boot/dts/tegra114.dtsi
>> @@ -430,6 +430,68 @@
>>           status = "disable";
>>       };
>>
>> +    usb@7d000000 {
>> +        compatible = "nvidia,tegra30-ehci", "usb-ehci";
>> +        reg = <0x7d000000 0x4000>;
>> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>> +        phy_type = "utmi";
>> +        clocks = <&tegra_car TEGRA114_CLK_USBD>;
>> +        nvidia,phy = <&phy1>;
>> +        status = "disabled";
>> +    };
>> +
>> +    phy1: usb-phy@7d000000 {
>
>     At the same address as the previous node?

Yes. The first node is for the EHCI driver and the second for the PHY 
driver. There is some overlap in the exact registers used, so both 
drives map the whole USB controller block.

>
>> +        compatible = "nvidia,tegra30-usb-phy";
>> +        reg = <0x7d000000 0x4000 0x7d000000 0x4000>;
>
>     Hm, there must be some mistake: two similar register ranges.

The second range is used to configure the UTMI pad registers. All the 
UTMI pad registers are located in the first USB controller's range.

>> +    usb@7d008000 {
>> +        compatible = "nvidia,tegra30-ehci", "usb-ehci";
>> +        reg = <0x7d008000 0x4000>;
>> +        interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>> +        phy_type = "utmi";
>> +        clocks = <&tegra_car TEGRA114_CLK_USB3>;
>> +        nvidia,phy = <&phy3>;
>> +        status = "disabled";
>> +    };
>> +
>> +    phy3: usb-phy@7d008000 {
>
>     Again at the same address as previous node?
>
>> +        compatible = "nvidia,tegra30-usb-phy";
>> +        reg = <0x7d008000 0x4000 0x7d000000 0x4000>;
>
>     Second range conflicts with previous nodes.
>
> WBR, Sergei

All these entries mapping the same address are expected. See
arch/arm/boot/dts/tegra20.dtsi for an existing example of Tegra USB 
bindings.
