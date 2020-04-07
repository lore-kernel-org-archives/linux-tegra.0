From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/6] ARM: tegra: Add device-tree for Acer Iconia Tab
 A500
Date: Tue, 7 Apr 2020 19:23:35 +0300
Message-ID: <dcacb220-580f-d9fc-a82d-4c7941f5ed2c@gmail.com>
References: <20200406194110.21283-1-digetx@gmail.com>
 <20200406194110.21283-2-digetx@gmail.com> <20200407104109.GC1720957@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200407104109.GC1720957@ulmo>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Pedro_=c3=82ngelo?= <pangelo-yxaQD43p5Qo@public.gmane.org>, Matt Merhar <mattmerhar-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

07.04.2020 13:41, Thierry Reding пишет:
> On Mon, Apr 06, 2020 at 10:41:05PM +0300, Dmitry Osipenko wrote:
> [...]
>> diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> [...]
>> +	host1x@50000000 {
>> +		dc@54200000 {
>> +			rgb {
>> +				status = "okay";
>> +				nvidia,panel = <&panel>;
>> +
>> +				port@0 {
>> +					lvds_output: endpoint {
>> +						remote-endpoint = <&lvds_encoder_input>;
>> +						bus-width = <18>;
>> +					};
>> +				};
>> +			};
>> +		};
> 
> This seems a little strange to me, though, admittedly, I've never worked
> with these types of bridges before, so I may be misunderstanding this. I
> was under the impression that we could obtain the panel by traversing an
> OF graph, so that we didn't have to have that extra nvidia,panel
> property. As it is, you seem to describe two different paths, one that
> goes from the RGB output to the panel directly, and another that goes
> from the RGB output to the LVDS encoder and then to the panel.
> 
> It doesn't seem to me like a direct link from RGB output to panel does
> actually exist in this setup.

AFAIK, the direct link doesn't exist on any of Tegra boards, they all
have an LVDS bridge. The older device-trees just didn't model it properly.

The LVDS bridge and panel-lvds are relatively new things in DRM, which
allow to model hardware more correctly, like for example the bridge's
powerdown control is now modeled properly.

The nvidia,panel is a mandatory property for the Tegra's DRM output,
panel won't light up without it. I guess it should be possible to get
the panel's phandle from the graph, but this is not supported by the
Tegra's DRM driver + nvidia,panel is also useful to have for older
kernels that do not support panel-lvds. The panel falls back to a
simple-panel in the case of older kernel version, which results in a not
entirely appropriate panel timing (wrong framerate), but this is okay'ish.

> [...]
>> +	pwm: pwm@7000a000 {
>> +		status = "okay";
>> +		power-supply = <&vdd_3v3_sys>;
>> +	};
> 
> I don't see power-supply defined as a property for the PWM controller.
> Why do you need this?

Yes, looks like it's not needed. I'll remove it in v3, thanks.

> [...]
>> +	sdhci@c8000000 {
>> +		status = "okay";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		max-frequency = <25000000>;
>> +		keep-power-in-suspend;
>> +		bus-width = <4>;
>> +		non-removable;
>> +
>> +		mmc-pwrseq = <&brcm_wifi_pwrseq>;
>> +		vmmc-supply = <&vdd_3v3_sys>;
>> +		vqmmc-supply = <&vdd_3v3_sys>;
>> +
>> +		/* Azurewave AW-NH611 BCM4329 */
>> +		WiFi@1 {
> 
> I think these names are supposed to be lowercase.

The dtbs_check doesn't complain, should be fine :)

But I don't mind, although the camel-case should be a correct way of
spelling WiFi. I'll change it in v3.

>> +			reg = <1>;
>> +			compatible = "brcm,bcm4329-fmac";
>> +			interrupt-parent = <&gpio>;
>> +			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "host-wake";
>> +		};
>> +	};
> [...]
>> +	clocks {
>> +		compatible = "simple-bus";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		clk32k_in: clock@0 {
>> +			compatible = "fixed-clock";
>> +			reg = <0>;
>> +			#clock-cells = <0>;
>> +			clock-frequency = <32768>;
>> +			clock-output-names = "tps658621-out32k";
>> +		};
>> +
>> +		rtc_32k_wifi: clock@1 {
>> +			compatible = "fixed-clock";
>> +			reg = <1>;
>> +			#clock-cells = <0>;
>> +			clock-frequency = <32768>;
>> +			clock-output-names = "kk3270032";
>> +		};
>> +	};
> 
> Are these clocks going to the PMIC and RTC, or are they generated by the
> chips? If they are generated by the chips, which sounds like they might
> be, wouldn't it be better to represent them as children of the
> corresponding chips?

They are generated by the chips.

The PMIC has a built-in 32K oscillator.

The kk3270032 is a dedicated onboard 32K oscillator. This one is not
mandatory to model in the device-tree, but I wanted to model as much as
possible.

> There's probably no infrastructure to do this, so maybe that would be
> overkill.

Yes, PMIC doesn't model the clock. All Tegra boards model the PMIC's
clock this way, although those boards don't set the clock-output-names
property, which makes the DT model more obscure than it could be.

The kk3270032 is a standalone oscillator, so it's fine as-is already.

> But for clarity it might be worth documenting here where
> exactly these clocks come from.

I guess the output clock-output-names are already self-explanatory,
don't you think so? For more details you could always consult the
board's schematics.

> [...]
>> +	memory-controller@7000f400 {
>> +		nvidia,use-ram-code;
>> +
>> +		emc-tables@elpida-8gb {
> 
> I don't think unit-addresses are supposed to be freeform text like
> above. These should always reflect the value of the "reg" property,
> though in this case we don't have one...
> 
>> +			nvidia,ram-code = <0>;
> 
> In retrospect it might have been better to just reuse the reg property
> for this.
> 
> I think in this case it might be best to reflect the RAM code in the
> unit-address. At least that way we conceptually get things right since
> it's the RAM code that selects which of these tables is used, much like
> a register, I2C slave address, or SPI chip select would select which of
> the subdevices are targetted.

This could be done, although we already have a precedent in a form of
the paz00 board that got memory timings not so long time ago.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=834f1d6cf3647e804e7a80569e42ee7fbee50eb1

I'll change it in v3.

Thank you for the review.
