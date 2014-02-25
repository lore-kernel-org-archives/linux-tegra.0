From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Overhaul Venice2 regulators
Date: Tue, 25 Feb 2014 15:10:26 -0700
Message-ID: <530D14D2.3040008@wwwdotorg.org>
References: <1393345802-6121-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393345802-6121-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/25/2014 09:30 AM, Thierry Reding wrote:
> Some of the regulators and the relationships to other regulators are
> wrong. This commit attempts to rectify this by making them more similar
> to what the schematics contain. This starts by adding a +VDD_MUX supply
> that represents the 12V input and derives the main +3.3V_SYS and +5V_SYS
> supplies from that. The majority of the other regulators derive from one
> of those three.
> 
> While at it, rename the regulators to match the names in the schematics
> to make them easier to match up.

> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts

>  			regulators {
> -				vsup-sd2-supply = <&vdd_ac_bat_reg>;
> -				vsup-sd3-supply = <&vdd_ac_bat_reg>;
> -				vsup-sd4-supply = <&vdd_ac_bat_reg>;
> -				vsup-sd5-supply = <&vdd_ac_bat_reg>;
> +				vsup-sd2-supply = <&vdd_5v0_sys>;
> +				vsup-sd3-supply = <&vdd_5v0_sys>;
> +				vsup-sd4-supply = <&vdd_5v0_sys>;
> +				vsup-sd5-supply = <&vdd_5v0_sys>;
>  				vin-ldo0-supply = <&as3722_sd2>;
> -				vin-ldo1-6-supply = <&vdd_ac_bat_reg>;
> +				vin-ldo1-6-supply = <&vdd_3v3_run>;
>  				vin-ldo2-5-7-supply = <&as3722_sd5>;
> -				vin-ldo3-4-supply = <&vdd_ac_bat_reg>;
> -				vin-ldo9-10-supply = <&vdd_ac_bat_reg>;
> -				vin-ldo11-supply = <&vdd_ac_bat_reg>;
> +				vin-ldo3-4-supply = <&vdd_3v3_sys>;
> +				vin-ldo9-10-supply = <&vdd_5v0_sys>;
> +				vin-ldo11-supply = <&vdd_3v3_run>;

Looking at the schematic, the binding should require a vin-ldo3-lv and
vin-lod3_sw property too, although that's not really anything to do with
this change.

>  
>  				sd0 {
> -					regulator-name = "vdd-cpu";
> +					regulator-name = "+VDD_CPU";

I don't see a +VDD_CPU signal anywhere in the schematic
(602-7R371-0000-A00.Schematics.Rev.1.23). I do see +VDD_CPU_AP, but
that's driven by a pair of AS3728 ICs, not the AS3722. Perhaps the
AS3728 are considered logically part of the AS3722 since it seems like
control of the AS3728s is by wires from the AS3722?

>  
>  				as3722_sd2: sd2 {
> -					regulator-name = "vddio-ddr";
> +					regulator-name = "+1.35V_LP0";

can we rename this label to e.g. vdd_1v35_lp0, so that it's more obvious
that the bin-ldo0-supply property above references the correct node.

>  				sd3 {
> -					regulator-name = "vddio-ddr-2phase";
> +					regulator-name = "+1.35V_LP0";

Both sd2 and sd3 nodes have the same value for regulator-name. I'm not
sure that's correct, even if both the outputs are indeed wired together
on the board?


>  				as3722_sd5: sd5 {
> -					regulator-name = "vddio-sys";
> +					regulator-name = "+1.8V_VDDIO";

Rename the label vddio_1v8?

>  					regulator-min-microvolt = <1800000>;
>  					regulator-max-microvolt = <1800000>;
>  					regulator-boot-on;
> @@ -710,7 +710,7 @@
>  				};
>  
>  				sd6 {
> -					regulator-name = "vdd-gpu";
> +					regulator-name = "+VDD_GPU";

I think that's +VDD_GPU_AP on the schematics.

BTW, all the AS3728 chips (SD0, SD1, SD6) get +5V_SYS as input, as well
as one of +VDD_MUX_GPU, +VDD_MUX_CORE, +VDD_MUX_CPU. This doesn't seem
to be represented anywhere in the DT.

For the /regulators/regulators* nodes, I'll just quote the result of
applying this patch, rather than the diff itself, since there were so
many changes the diff is confusing.

> 		vdd_3v3_run: regulator@3 {
> 			compatible = "regulator-fixed";
> 			reg = <3>;
> 			regulator-name = "+3.3V_RUN";
> 			regulator-min-microvolt = <3300000>;
> 			regulator-max-microvolt = <3300000>;
> 			vin-supply = <&vdd_3v3_sys>;
> 		};

Isn't this controlled by signal PMU_REGEN3 (AS3722 GPIO1) ; that seems
to be routed into the "ON" pin on U20A7 SLG5NV1430V. Is this something
you're planning on fixing later, by creating a standalone PMU_REGEN3
regulator, and inserting into the hierarchy?

Incidentally, that IC also takes in +5V_SYS, but perhaps it isn't worth
worrying about that, since +5V_SYS is always-on?

On the same schematic page as U20A7, I also see supplies +3.3V_SD_CARD,
+1.8V_VDDIO_LP0_OFF, and +3.3V_LP0 which I think are missing from the DT.

> 		vdd_3v3_hdmi: regulator@4 {
> 			compatible = "regulator-fixed";
> 			reg = <4>;
> 			regulator-name = "+3.3V_AVDD_HDMI";

I don't see a signal of that name in the schematics.

> 		vdd_5v0_ts: regulator@6 {
> 			compatible = "regulator-fixed";
> 			reg = <6>;
> 			regulator-name = "+5V_VDD_TS_SW";
> 			regulator-min-microvolt = <5000000>;
> 			regulator-max-microvolt = <5000000>;
> 			enable-active-high;
> 			regulator-boot-on;
> 			gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_LOW>;

I think that should be ACTIVE_HIGH; The signal name is TS_SHDN_L, so
it's active-low as a shutdown signal, but active-high as an enable
signal, which is presumably how the regulator subsystem wants to treat
it (and which matches the enable-active-high property).
