From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator tps65911
Date: Tue, 22 May 2012 10:40:50 -0600
Message-ID: <4FBBC192.7030900@wwwdotorg.org>
References: <1337691917-15040-1-git-send-email-ldewangan@nvidia.com> <1337691917-15040-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337691917-15040-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/22/2012 07:05 AM, Laxman Dewangan wrote:
> Add device info for the PMIC device tps65911 in tegra-cardhu
> dts file. This device supports the multiple regulator rails,
> gpio, interrupts.

FYI, patch 1 in this series looks fine. Some comments below though:

> diff --git a/arch/arm/boot/dts/tegra-cardhu.dts b/arch/arm/boot/dts/tegra-cardhu.dts

> +		tps65911: tps65911@2d {
> +			compatible = "ti,tps65911";
> +			reg = <0x2d>;
> +
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +
> +			regulators {

Please add the following properties here:

	#address-cells = <1>;
	#size-cells = <0>;

> +				vdd1_reg: vdd1 {

This node name should be "regulator", since nodes are generally named
after the class of object they represent. Since all the nodes will then
have the same name, you'll need to add a unit address ("@nnnn") to the
node name.

Nitpicky, but the labels might be more logical as reg_vdd1 rather than
vdd1_reg, but not a big deal.

So, please replace the line above with:

	reg_vdd1: regulator@0 {
		reg = <0>;

> +					regulator-name = "vdd1";
> +					regulator-min-microvolt = < 600000>;
> +					regulator-max-microvolt = <1500000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +				};
> +
> +				vdd2_reg: vdd2 {

And similarly, that would become:

	reg_vdd2: regulator@1 {
		reg = <1>;

etc.
