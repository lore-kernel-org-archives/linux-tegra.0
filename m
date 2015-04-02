From: Mikko Perttunen <mikko.perttunen@kapsi.fi>
Subject: Re: [PATCH v2] ARM: tegra: Correct which USB controller has the UTMI
 pad registers
Date: Thu, 02 Apr 2015 18:35:01 +0300
Message-ID: <551D61A5.2010102@kapsi.fi>
References: <551D57E0.7050102@kapsi.fi> <1427986842-21409-1-git-send-email-tomeu.vizoso@collabora.com> <551D5E21.4040305@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <551D5E21.4040305@kapsi.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-tegra@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/02/2015 06:20 PM, Mikko Perttunen wrote:
> Reviewed-by: Mikko Perttunen <mikko.perttunen@kapsi.fi>

Scratch that;

as Tuomas noted on IRC, the reset numbers here are still wrong.
phy1 should have 22 and phy2 58.

>
> On 04/02/2015 06:00 PM, Tomeu Vizoso wrote:
>> It should be the first controller, not the second.
>>
>> This broke USB after 6261b06 ("regulator: Defer lookup of supply to
>> regulator_get"), because it changed the order in which the controllers
>> were probed.
>>
>> The fix for this issue was suggested by Mikko Perttunen.
>>
>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> Cc: Mikko Perttunen <mikko.perttunen@kapsi.fi>
>> ---
>>
>> I think that the line numbers should be enough in this case, as I
>> expect this to be merged soon, but just in case I'm sending the same
>> patch with plenty of context.
>>
>> Regards,
>>
>> Tomeu
>>
>> ---
>>   arch/arm/boot/dts/tegra124.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/tegra124.dtsi
>> b/arch/arm/boot/dts/tegra124.dtsi
>> index cf01c81..cb786a9 100644
>> --- a/arch/arm/boot/dts/tegra124.dtsi
>> +++ b/arch/arm/boot/dts/tegra124.dtsi
>> @@ -821,77 +821,77 @@
>>           compatible = "nvidia,tegra124-usb-phy",
>> "nvidia,tegra30-usb-phy";
>>           reg = <0x0 0x7d000000 0x0 0x4000>,
>>                 <0x0 0x7d000000 0x0 0x4000>;
>>           phy_type = "utmi";
>>           clocks = <&tegra_car TEGRA124_CLK_USBD>,
>>                <&tegra_car TEGRA124_CLK_PLL_U>,
>>                <&tegra_car TEGRA124_CLK_USBD>;
>>           clock-names = "reg", "pll_u", "utmi-pads";
>>           resets = <&tegra_car 59>, <&tegra_car 22>;
>>           reset-names = "usb", "utmi-pads";
>>           nvidia,hssync-start-delay = <0>;
>>           nvidia,idle-wait-delay = <17>;
>>           nvidia,elastic-limit = <16>;
>>           nvidia,term-range-adj = <6>;
>>           nvidia,xcvr-setup = <9>;
>>           nvidia,xcvr-lsfslew = <0>;
>>           nvidia,xcvr-lsrslew = <3>;
>>           nvidia,hssquelch-level = <2>;
>>           nvidia,hsdiscon-level = <5>;
>>           nvidia,xcvr-hsslew = <12>;
>> +        nvidia,has-utmi-pad-registers;
>>           status = "disabled";
>>       };
>>
>>       usb@0,7d004000 {
>>           compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci",
>> "usb-ehci";
>>           reg = <0x0 0x7d004000 0x0 0x4000>;
>>           interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>>           phy_type = "utmi";
>>           clocks = <&tegra_car TEGRA124_CLK_USB2>;
>>           resets = <&tegra_car 58>;
>>           reset-names = "usb";
>>           nvidia,phy = <&phy2>;
>>           status = "disabled";
>>       };
>>
>>       phy2: usb-phy@0,7d004000 {
>>           compatible = "nvidia,tegra124-usb-phy",
>> "nvidia,tegra30-usb-phy";
>>           reg = <0x0 0x7d004000 0x0 0x4000>,
>>                 <0x0 0x7d000000 0x0 0x4000>;
>>           phy_type = "utmi";
>>           clocks = <&tegra_car TEGRA124_CLK_USB2>,
>>                <&tegra_car TEGRA124_CLK_PLL_U>,
>>                <&tegra_car TEGRA124_CLK_USBD>;
>>           clock-names = "reg", "pll_u", "utmi-pads";
>>           resets = <&tegra_car 22>, <&tegra_car 22>;
>>           reset-names = "usb", "utmi-pads";
>>           nvidia,hssync-start-delay = <0>;
>>           nvidia,idle-wait-delay = <17>;
>>           nvidia,elastic-limit = <16>;
>>           nvidia,term-range-adj = <6>;
>>           nvidia,xcvr-setup = <9>;
>>           nvidia,xcvr-lsfslew = <0>;
>>           nvidia,xcvr-lsrslew = <3>;
>>           nvidia,hssquelch-level = <2>;
>>           nvidia,hsdiscon-level = <5>;
>>           nvidia,xcvr-hsslew = <12>;
>> -        nvidia,has-utmi-pad-registers;
>>           status = "disabled";
>>       };
>>
>>       usb@0,7d008000 {
>>           compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci",
>> "usb-ehci";
>>           reg = <0x0 0x7d008000 0x0 0x4000>;
>>           interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>>           phy_type = "utmi";
>>           clocks = <&tegra_car TEGRA124_CLK_USB3>;
>>           resets = <&tegra_car 59>;
>>           reset-names = "usb";
>>           nvidia,phy = <&phy3>;
>>           status = "disabled";
>>       };
>>
>>       phy3: usb-phy@0,7d008000 {
>>           compatible = "nvidia,tegra124-usb-phy",
>> "nvidia,tegra30-usb-phy";
>>           reg = <0x0 0x7d008000 0x0 0x4000>,
>>                 <0x0 0x7d000000 0x0 0x4000>;
>>           phy_type = "utmi";
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
