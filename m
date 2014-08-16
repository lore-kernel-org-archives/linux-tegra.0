From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: add Acer Chromebook 13 device tree
Date: Sat, 16 Aug 2014 17:20:47 +0200
Message-ID: <53EF76CF.9050808@suse.de>
References: <1407957267-3258-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="PO56MgxkRrVM0g5ubWSox4V37hMXc8MiE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407957267-3258-1-git-send-email-dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PO56MgxkRrVM0g5ubWSox4V37hMXc8MiE
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Am 13.08.2014 21:14, schrieb Dylan Reid:
> The Acer Chromebook 13, codenamed Big, contains an NVIDIA tegra124
> processor and is similar to the Venice2 reference platform.
>=20
> The keyboard, USB 2, audio, HDMI, sdcard, and emmc have been tested
> and work on the 1266x768 models.  The HD models haven't yet been

1366?

> tested.
>=20
> WiFi does not work yet, it needs at least some PMIC changes to enable
> the 32k clock.
>=20
> The elan trackpad is not yet functional but hopefully will be soon as
> there are patches under review.
>=20
> There is also an issue on reboot because the TPM isn't reset.  It will
> cause the stock firmware to enter recovery mode.  This can be worked
> around by an EC-reset, press the refresh and power keys at the same
> time.
>=20
> Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile              |    1 +
>  arch/arm/boot/dts/tegra124-nyan-big.dts | 1136 +++++++++++++++++++++++=
++++++++
>  2 files changed, 1137 insertions(+)
>  create mode 100644 arch/arm/boot/dts/tegra124-nyan-big.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index acb6b42..bebb4e7 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -439,6 +439,7 @@ dtb-$(CONFIG_ARCH_TEGRA) +=3D tegra20-harmony.dtb \=

>  	tegra114-dalmore.dtb \
>  	tegra114-roth.dtb \
>  	tegra114-tn7.dtb \
> +	tegra124-nyan-big.dtb \
>  	tegra124-jetson-tk1.dtb \

"nyan" goes here alphabetically (still ordered as "big").

>  	tegra124-venice2.dtb
>  dtb-$(CONFIG_ARCH_U300) +=3D ste-u300.dtb
> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dt=
s/tegra124-nyan-big.dts
> new file mode 100644
> index 0000000..79f1852
> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
> @@ -0,0 +1,1136 @@
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include "tegra124.dtsi"
> +
> +/ {
> +	model =3D "Acer Chromebook 13";
> +	compatible =3D "google,nyan-big", "nvidia,tegra124";

In light of v1 and the above commit message referring to this as Google
Big, shouldn't this be "google,big", "nvidia,tegra124" and optionally
"google,nyan" as secondary string, independent of the new file name?

The Exynos5250 based Chromebooks use "google,snow" and "google,spring"
respectively, and I don't think there's any mention of Daisy at all in
upstream, unlike some ChromeOS sources.

Also, should we start documenting these google,* compatible strings to
please checkpatch.pl?

> +
> +	aliases {
> +		rtc0 =3D "/i2c@0,7000d000/pmic@40";
> +		rtc1 =3D "/rtc@0,7000e000";
> +	};
> +
> +	memory {
> +		reg =3D <0x0 0x80000000 0x0 0x80000000>;
> +	};
> +
> +	host1x@0,50000000 {
> +		hdmi@0,54280000 {
> +			status =3D "okay";
> +
> +			vdd-supply =3D <&vdd_3v3_hdmi>;
> +			pll-supply =3D <&vdd_hdmi_pll>;
> +			hdmi-supply =3D <&vdd_5v0_hdmi>;
> +
> +			nvidia,ddc-i2c-bus =3D <&hdmi_ddc>;
> +			nvidia,hpd-gpio =3D
> +				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		sor@0,54540000 {
> +			status =3D "okay";
> +
> +			nvidia,dpaux =3D <&dpaux>;
> +			nvidia,panel =3D <&panel>;
> +		};
> +
> +		dpaux: dpaux@0,545c0000 {
> +			vdd-supply =3D <&vdd_3v3_panel>;
> +			status =3D "okay";
> +		};
> +	};
> +
> +	pinmux: pinmux@0,70000868 {
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinmux_default>;
> +
> +		pinmux_default: common {
> +			dap_mclk1_pw4 {

Any need to have the nodes this way? Shouldn't this rather be
dap-mclk1-pw4 as node name by conventions, with a dap_mclk1_pw4 label
for referencing if needed? Same below, obviously.

> +				nvidia,pins =3D "dap_mclk1_pw4";
> +				nvidia,function =3D "extperiph1";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			dap2_din_pa4 {
> +				nvidia,pins =3D "dap2_din_pa4";
> +				nvidia,function =3D "i2s1";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			dap2_dout_pa5 {
> +				nvidia,pins =3D "dap2_dout_pa5",
> +					      "dap2_fs_pa2",
> +					      "dap2_sclk_pa3";
> +				nvidia,function =3D "i2s1";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			dvfs_pwm_px0 {
> +				nvidia,pins =3D "dvfs_pwm_px0",
> +					      "dvfs_clk_px2";
> +				nvidia,function =3D "cldvfs";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			ulpi_clk_py0 {
> +				nvidia,pins =3D "ulpi_clk_py0",
> +					      "ulpi_nxt_py2",
> +					      "ulpi_stp_py3";
> +				nvidia,function =3D "spi1";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			ulpi_dir_py1 {
> +				nvidia,pins =3D "ulpi_dir_py1";
> +				nvidia,function =3D "spi1";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			cam_i2c_scl_pbb1 {
> +				nvidia,pins =3D "cam_i2c_scl_pbb1",
> +					      "cam_i2c_sda_pbb2";
> +				nvidia,function =3D "i2c3";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,lock =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,open-drain =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			gen2_i2c_scl_pt5 {
> +				nvidia,pins =3D "gen2_i2c_scl_pt5",
> +					      "gen2_i2c_sda_pt6";
> +				nvidia,function =3D "i2c2";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,lock =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,open-drain =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			pg4 {
> +				nvidia,pins =3D "pg4",
> +					      "pg5",
> +					      "pg6",
> +					      "pi3";
> +				nvidia,function =3D "spi4";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			pg7 {
> +				nvidia,pins =3D "pg7";
> +				nvidia,function =3D "spi4";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			ph1 {
> +				nvidia,pins =3D "ph1";
> +				nvidia,function =3D "pwm1";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			pk0 {
> +				nvidia,pins =3D "pk0",
> +					      "kb_row15_ps7",
> +					      "clk_32k_out_pa0";
> +				nvidia,function =3D "soc";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			sdmmc1_clk_pz0 {
> +				nvidia,pins =3D "sdmmc1_clk_pz0";
> +				nvidia,function =3D "sdmmc1";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			sdmmc1_cmd_pz1 {
> +				nvidia,pins =3D "sdmmc1_cmd_pz1",
> +					      "sdmmc1_dat0_py7",
> +					      "sdmmc1_dat1_py6",
> +					      "sdmmc1_dat2_py5",
> +					      "sdmmc1_dat3_py4";
> +				nvidia,function =3D "sdmmc1";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			sdmmc3_clk_pa6 {
> +				nvidia,pins =3D "sdmmc3_clk_pa6";
> +				nvidia,function =3D "sdmmc3";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			sdmmc3_cmd_pa7 {
> +				nvidia,pins =3D "sdmmc3_cmd_pa7",
> +					      "sdmmc3_dat0_pb7",
> +					      "sdmmc3_dat1_pb6",
> +					      "sdmmc3_dat2_pb5",
> +					      "sdmmc3_dat3_pb4",
> +					      "kb_col4_pq4",
> +					      "sdmmc3_clk_lb_out_pee4",
> +					      "sdmmc3_clk_lb_in_pee5",
> +					      "sdmmc3_cd_n_pv2";
> +				nvidia,function =3D "sdmmc3";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			sdmmc4_clk_pcc4 {
> +				nvidia,pins =3D "sdmmc4_clk_pcc4";
> +				nvidia,function =3D "sdmmc4";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			sdmmc4_cmd_pt7 {
> +				nvidia,pins =3D "sdmmc4_cmd_pt7",
> +					      "sdmmc4_dat0_paa0",
> +					      "sdmmc4_dat1_paa1",
> +					      "sdmmc4_dat2_paa2",
> +					      "sdmmc4_dat3_paa3",
> +					      "sdmmc4_dat4_paa4",
> +					      "sdmmc4_dat5_paa5",
> +					      "sdmmc4_dat6_paa6",
> +					      "sdmmc4_dat7_paa7";
> +				nvidia,function =3D "sdmmc4";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			pwr_i2c_scl_pz6 {
> +				nvidia,pins =3D "pwr_i2c_scl_pz6",
> +					      "pwr_i2c_sda_pz7";
> +				nvidia,function =3D "i2cpwr";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,lock =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,open-drain =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			jtag_rtck {
> +				nvidia,pins =3D "jtag_rtck";
> +				nvidia,function =3D "rtck";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			clk_32k_in {
> +				nvidia,pins =3D "clk_32k_in";
> +				nvidia,function =3D "clk";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			core_pwr_req {
> +				nvidia,pins =3D "core_pwr_req";
> +				nvidia,function =3D "pwron";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			cpu_pwr_req {
> +				nvidia,pins =3D "cpu_pwr_req";
> +				nvidia,function =3D "cpu";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			pwr_int_n {
> +				nvidia,pins =3D "pwr_int_n";
> +				nvidia,function =3D "pmi";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			reset_out_n {
> +				nvidia,pins =3D "reset_out_n";
> +				nvidia,function =3D "reset_out_n";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			clk3_out_pee0 {
> +				nvidia,pins =3D "clk3_out_pee0";
> +				nvidia,function =3D "extperiph3";
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			gen1_i2c_sda_pc5 {
> +				nvidia,pins =3D "gen1_i2c_sda_pc5",
> +					      "gen1_i2c_scl_pc4";
> +				nvidia,function =3D "i2c1";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,lock =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,open-drain =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			hdmi_cec_pee3 {
> +				nvidia,pins =3D "hdmi_cec_pee3";
> +				nvidia,function =3D "cec";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,lock =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,open-drain =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			hdmi_int_pn7 {
> +				nvidia,pins =3D "hdmi_int_pn7";
> +				nvidia,function =3D "rsvd1";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_DOWN>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			ddc_scl_pv4 {
> +				nvidia,pins =3D "ddc_scl_pv4",
> +					      "ddc_sda_pv5";
> +				nvidia,function =3D "i2c4";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,lock =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,rcv-sel =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			kb_row10_ps2 {
> +				nvidia,pins =3D "kb_row10_ps2";
> +				nvidia,function =3D "uarta";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			kb_row9_ps1 {
> +				nvidia,pins =3D "kb_row9_ps1";
> +				nvidia,function =3D "uarta";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			usb_vbus_en0_pn4 {
> +				nvidia,pins =3D "usb_vbus_en0_pn4",
> +					      "usb_vbus_en1_pn5";
> +				nvidia,function =3D "usb";
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,lock =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,open-drain =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			drive_sdio1 {
> +				nvidia,pins =3D "drive_sdio1";
> +				nvidia,high-speed-mode =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,schmitt =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull-down-strength =3D <36>;
> +				nvidia,pull-up-strength =3D <20>;
> +				nvidia,slew-rate-rising =3D <TEGRA_PIN_SLEW_RATE_SLOW>;
> +				nvidia,slew-rate-falling =3D <TEGRA_PIN_SLEW_RATE_SLOW>;
> +			};
> +			drive_sdio3 {
> +				nvidia,pins =3D "drive_sdio3";
> +				nvidia,high-speed-mode =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,schmitt =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull-down-strength =3D <22>;
> +				nvidia,pull-up-strength =3D <36>;
> +				nvidia,slew-rate-rising =3D <TEGRA_PIN_SLEW_RATE_FASTEST>;
> +				nvidia,slew-rate-falling =3D <TEGRA_PIN_SLEW_RATE_FASTEST>;
> +			};
> +			drive_gma {
> +				nvidia,pins =3D "drive_gma";
> +				nvidia,high-speed-mode =3D <TEGRA_PIN_ENABLE>;
> +				nvidia,schmitt =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,pull-down-strength =3D <2>;
> +				nvidia,pull-up-strength =3D <1>;
> +				nvidia,slew-rate-rising =3D <TEGRA_PIN_SLEW_RATE_FASTEST>;
> +				nvidia,slew-rate-falling =3D <TEGRA_PIN_SLEW_RATE_FASTEST>;
> +				nvidia,drive-type =3D <1>;
> +			};
> +			codec_irq_l {
> +				nvidia,pins =3D "ph4";
> +				nvidia,function =3D "gmi";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			lcd_bl_en {
> +				nvidia,pins =3D "ph2";
> +				nvidia,function =3D "gmi";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_DOWN>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			touch_irq_l {
> +				nvidia,pins =3D "gpio_w3_aud_pw3";
> +				nvidia,function =3D "spi6";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			tpm_davint_l {
> +				nvidia,pins =3D "ph6";
> +				nvidia,function =3D "gmi";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			ts_irq_l {
> +				nvidia,pins =3D "pk2";
> +				nvidia,function =3D "gmi";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			ts_reset_l {
> +				nvidia,pins =3D "pk4";
> +				nvidia,function =3D "gmi";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			ts_shdn_l {
> +				nvidia,pins =3D "pk1";
> +				nvidia,function =3D "gmi";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			ph7 {
> +				nvidia,pins =3D "ph7";
> +				nvidia,function =3D "gmi";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			kb_col0_ap {
> +				nvidia,pins =3D "kb_col0_pq0";
> +				nvidia,function =3D "rsvd4";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			lid_open {
> +				nvidia,pins =3D "kb_row4_pr4";
> +				nvidia,function =3D "rsvd3";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			en_vdd_sd {
> +				nvidia,pins =3D "kb_row0_pr0";
> +				nvidia,function =3D "rsvd4";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			ac_ok {
> +				nvidia,pins =3D "pj0";
> +				nvidia,function =3D "gmi";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			sensor_irq_l {
> +				nvidia,pins =3D "pi6";
> +				nvidia,function =3D "gmi";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			wifi_en {
> +				nvidia,pins =3D "gpio_x7_aud_px7";
> +				nvidia,function =3D "rsvd4";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			en_vdd_bl {
> +				nvidia,pins =3D "dap3_dout_pp2";
> +				nvidia,function =3D "i2s2";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_DOWN>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			en_vdd_hdmi {
> +				nvidia,pins =3D "spdif_in_pk6";
> +				nvidia,function =3D "spdif";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_DOWN>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			soc_warm_reset_l {
> +				nvidia,pins =3D "pi5";
> +				nvidia,function =3D "gmi";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +			};
> +			hp_det_l {
> +				nvidia,pins =3D "pi7";
> +				nvidia,function =3D "rsvd1";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +			mic_det_l {
> +				nvidia,pins =3D "kb_row7_pr7";
> +				nvidia,function =3D "rsvd2";
> +				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +				nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +			};
> +		};
> +	};
> +
> +	serial@0,70006000 {
> +		/* Debug connector on the bottom of the board near SD card. */
> +		status =3D "okay";
> +	};
> +
> +	pwm: pwm@0,7000a000 {

Add the label to the .dtsi where the node is first declared? Then you
can override it the safer &pwm { ... }; way. Same for all other nodes
being extended/overridden here - that's what your colleagues requested
for Spring. It'll help with the 80 char limit further below by reducing
indentation.

> +		status =3D "okay";
> +	};
> +
> +	i2c@0,7000c000 {
> +		status =3D "okay";
> +		clock-frequency =3D <100000>;
> +
> +		acodec: audio-codec@10 {
> +			compatible =3D "maxim,max98090";
> +			reg =3D <0x10>;
> +			interrupt-parent =3D <&gpio>;
> +			interrupts =3D <TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		temperature-sensor@4c {
> +			compatible =3D "ti,tmp451";
> +			reg =3D <0x4c>;
> +			interrupt-parent =3D <&gpio>;
> +			interrupts =3D <TEGRA_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
> +
> +			#thermal-sensor-cells =3D <1>;
> +		};
> +	};
> +
> +	i2c@0,7000c400 {
> +		status =3D "okay";
> +		clock-frequency =3D <100000>;
> +	};
> +
> +	i2c@0,7000c500 {
> +		status =3D "okay";
> +		clock-frequency =3D <400000>;
> +
> +		tpm@20 {
> +			compatible =3D "infineon,slb9645tt";
> +			reg =3D <0x20>;
> +		};
> +	};
> +
> +	hdmi_ddc: i2c@0,7000c700 {
> +		status =3D "okay";
> +		clock-frequency =3D <100000>;
> +	};
> +
> +	i2c@0,7000d000 {
> +		status =3D "okay";
> +		clock-frequency =3D <400000>;
> +
> +		pmic: pmic@40 {
> +			compatible =3D "ams,as3722";
> +			reg =3D <0x40>;
> +			interrupts =3D <0 86 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			ams,system-power-controller;
> +
> +			#interrupt-cells =3D <2>;
> +			interrupt-controller;
> +
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&as3722_default>;
> +
> +			as3722_default: pinmux {
> +				gpio0 {
> +					pins =3D "gpio0";
> +					function =3D "gpio";
> +					bias-pull-down;
> +				};
> +
> +				gpio1 {
> +					pins =3D "gpio1";
> +					function =3D "gpio";
> +					bias-pull-up;
> +				};
> +
> +				gpio2_4_7 {
> +					pins =3D "gpio2", "gpio4", "gpio7";
> +					function =3D "gpio";
> +					bias-pull-up;
> +				};
> +
> +				gpio3_6 {
> +					pins =3D "gpio3", "gpio6";
> +					bias-high-impedance;
> +				};
> +
> +				gpio5 {
> +					pins =3D "gpio5";
> +					function =3D "clk32k-out";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			regulators {
> +				vsup-sd2-supply =3D <&vdd_5v0_sys>;
> +				vsup-sd3-supply =3D <&vdd_5v0_sys>;
> +				vsup-sd4-supply =3D <&vdd_5v0_sys>;
> +				vsup-sd5-supply =3D <&vdd_5v0_sys>;
> +				vin-ldo0-supply =3D <&vdd_1v35_lp0>;
> +				vin-ldo1-6-suasked mepply =3D <&vdd_3v3_run>;
> +				vin-ldo2-5-7-supply =3D <&vddio_1v8>;
> +				vin-ldo3-4-supply =3D <&vdd_3v3_sys>;
> +				vin-ldo9-10-supply =3D <&vdd_5v0_sys>;
> +				vin-ldo11-supply =3D <&vdd_3v3_run>;
> +
> +				sd0 {
> +					regulator-name =3D "+VDD_CPU_AP";
> +					regulator-min-microvolt =3D <700000>;
> +					regulator-max-microvolt =3D <1350000>;
> +					regulator-min-microamp =3D <3500000>;
> +					regulator-max-microamp =3D <3500000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +					ams,ext-control =3D <2>;
> +				};
> +
> +				sd1 {
> +					regulator-name =3D "+VDD_CORE";
> +					regulator-min-microvolt =3D <700000>;
> +					regulator-max-microvolt =3D <1350000>;
> +					regulator-min-microamp =3D <2500000>;
> +					regulator-max-microamp =3D <4000000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +					ams,ext-control =3D <1>;
> +				};
> +
> +				vdd_1v35_lp0: sd2 {
> +					regulator-name =3D "+1.35V_LP0(sd2)";
> +					regulator-min-microvolt =3D <1350000>;
> +					regulator-max-microvolt =3D <1350000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +				};
> +
> +				sd3 {
> +					regulator-name =3D "+1.35V_LP0(sd3)";
> +					regulator-min-microvolt =3D <1350000>;
> +					regulator-max-microvolt =3D <1350000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +				};
> +
> +				vdd_1v05_run: sd4 {
> +					regulator-name =3D "+1.05V_RUN";
> +					regulator-min-microvolt =3D <1050000>;
> +					regulator-max-microvolt =3D <1050000>;
> +				};
> +
> +				vddio_1v8: sd5 {
> +					regulator-name =3D "+1.8V_VDDIO";
> +					regulator-min-microvolt =3D <1800000>;
> +					regulator-max-microvolt =3D <1800000>;
> +					regulator-boot-on;
> +					regulator-always-on;
> +				};
> +
> +				sd6 {
> +					regulator-name =3D "+VDD_GPU_AP";
> +					regulator-min-microvolt =3D <650000>;
> +					regulator-max-microvolt =3D <1200000>;
> +					regulator-min-microamp =3D <3500000>;
> +					regulator-max-microamp =3D <3500000>;
> +					regulator-boot-on;
> +					regulator-always-on;
> +				};
> +
> +				ldo0 {
> +					regulator-name =3D "+1.05V_RUN_AVDD";
> +					regulator-min-microvolt =3D <1050000>;
> +					regulator-max-microvolt =3D <1050000>;
> +					regulator-boot-on;
> +					regulator-always-on;
> +					ams,ext-control =3D <1>;
> +				};
> +
> +				ldo1 {
> +					regulator-name =3D "+1.8V_RUN_CAM";
> +					regulator-min-microvolt =3D <1800000>;
> +					regulator-max-microvolt =3D <1800000>;
> +				};
> +
> +				ldo2 {
> +					regulator-name =3D "+1.2V_GEN_AVDD";
> +					regulator-min-microvolt =3D <1200000>;
> +					regulator-max-microvolt =3D <1200000>;
> +					regulator-boot-on;
> +					regulator-always-on;
> +				};
> +
> +				ldo3 {
> +					regulator-name =3D "+1.00V_LP0_VDD_RTC";
> +					regulator-min-microvolt =3D <1000000>;
> +					regulator-max-microvolt =3D <1000000>;
> +					regulator-boot-on;
> +					regulator-always-on;
> +					ams,enable-tracking;
> +				};
> +
> +				vdd_run_cam: ldo4 {
> +					regulator-name =3D "+3.3V_RUN_CAM";
> +					regulator-min-microvolt =3D <2800000>;
> +					regulator-max-microvolt =3D <2800000>;
> +				};
> +
> +				ldo5 {
> +					regulator-name =3D "+1.2V_RUN_CAM_FRONT";
> +					regulator-min-microvolt =3D <1200000>;
> +					regulator-max-microvolt =3D <1200000>;
> +				};
> +
> +				vddio_sdmmc3: ldo6 {
> +					regulator-name =3D "+VDDIO_SDMMC3";
> +					regulator-min-microvolt =3D <1800000>;
> +					regulator-max-microvolt =3D <3300000>;
> +				};
> +
> +				ldo7 {
> +					regulator-name =3D "+1.05V_RUN_CAM_REAR";
> +					regulator-min-microvolt =3D <1050000>;
> +					regulator-max-microvolt =3D <1050000>;
> +				};
> +
> +				ldo9 {
> +					regulator-name =3D "+2.8V_RUN_TOUCH";
> +					regulator-min-microvolt =3D <2800000>;
> +					regulator-max-microvolt =3D <2800000>;
> +				};
> +
> +				ldo10 {
> +					regulator-name =3D "+2.8V_RUN_CAM_AF";
> +					regulator-min-microvolt =3D <2800000>;
> +					regulator-max-microvolt =3D <2800000>;
> +				};
> +
> +				ldo11 {
> +					regulator-name =3D "+1.8V_RUN_VPP_FUSE";
> +					regulator-min-microvolt =3D <1800000>;
> +					regulator-max-microvolt =3D <1800000>;
> +				};
> +			};
> +		};
> +	};
> +
> +	spi@0,7000d400 {
> +		status =3D "okay";
> +
> +		cros_ec: cros-ec@0 {
> +			compatible =3D "google,cros-ec-spi";
> +			spi-max-frequency =3D <3000000>;
> +			interrupt-parent =3D <&gpio>;
> +			interrupts =3D <TEGRA_GPIO(C, 7) IRQ_TYPE_LEVEL_LOW>;
> +			reg =3D <0>;
> +
> +			google,cros-ec-spi-msg-delay =3D <2000>;
> +
> +			i2c-tunnel {
> +				compatible =3D "google,cros-ec-i2c-tunnel";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				google,remote-bus =3D <0>;
> +
> +				charger: bq24735@9 {
> +					compatible =3D "ti,bq24735";
> +					reg =3D <0x9>;
> +					interrupt-parent =3D <&gpio>;
> +					interrupts =3D <TEGRA_GPIO(J, 0)
> +							GPIO_ACTIVE_HIGH>;
> +					ti,ac-detect-gpios =3D <&gpio
> +							TEGRA_GPIO(J, 0)
> +							GPIO_ACTIVE_HIGH>;
> +				};
> +
> +				battery: sbs-battery@b {
> +					compatible =3D "sbs,sbs-battery";
> +					reg =3D <0xb>;
> +					sbs,i2c-retry-count =3D <2>;
> +					sbs,poll-retry-count =3D <10>;
> +					power-supplies =3D <&charger>;
> +				};
> +			};
> +		};
> +	};
> +
> +	spi@0,7000da00 {
> +		status =3D "okay";
> +		spi-max-frequency =3D <25000000>;
> +
> +		flash@0 {
> +			compatible =3D "winbond,w25q32dw";
> +			reg =3D <0>;
> +		};
> +	};
> +
> +	pmc@0,7000e400 {
> +		nvidia,invert-interrupt;
> +		nvidia,suspend-mode =3D <0>;
> +		nvidia,cpu-pwr-good-time =3D <500>;
> +		nvidia,cpu-pwr-off-time =3D <300>;
> +		nvidia,core-pwr-good-time =3D <641 3845>;
> +		nvidia,core-pwr-off-time =3D <61036>;
> +		nvidia,core-power-req-active-high;
> +		nvidia,sys-clock-req-active-high;
> +	};
> +
> +	hda@0,70030000 {
> +		status =3D "okay";
> +	};
> +
> +	sdhci@0,700b0000 { /* WiFi/BT on this bus */
> +		status =3D "okay";
> +		power-gpios =3D <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_HIGH>;
> +		bus-width =3D <4>;
> +		no-1-8-v;
> +		non-removable;
> +	};
> +
> +	sdhci@0,700b0400 { /* SD Card on this bus */
> +		status =3D "okay";
> +		cd-gpios =3D <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
> +		power-gpios =3D <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
> +		wp-gpios =3D <&gpio TEGRA_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
> +		bus-width =3D <4>;
> +		no-1-8-v;
> +		vqmmc-supply =3D <&vddio_sdmmc3>;
> +	};
> +
> +	sdhci@0,700b0600 { /* eMMC on this bus */
> +		status =3D "okay";
> +		bus-width =3D <8>;
> +		no-1-8-v;
> +		non-removable;
> +	};
> +
> +	ahub@0,70300000 {
> +		i2s@0,70301100 {
> +			status =3D "okay";
> +		};
> +	};
> +
> +	usb@0,7d000000 { /* Rear external USB port. */
> +		status =3D "okay";
> +	};
> +
> +	usb-phy@0,7d000000 {
> +		status =3D "okay";
> +		vbus-supply =3D <&vdd_usb1_vbus>;
> +	};
> +
> +	usb@0,7d004000 { /* Internal webcam. */
> +		status =3D "okay";
> +	};
> +
> +	usb-phy@0,7d004000 {
> +		status =3D "okay";
> +		vbus-supply =3D <&vdd_run_cam>;
> +	};
> +
> +	usb@0,7d008000 { /* Left external USB port. */
> +		status =3D "okay";
> +	};
> +
> +	usb-phy@0,7d008000 {
> +		status =3D "okay";
> +		vbus-supply =3D <&vdd_usb3_vbus>;
> +	};
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +
> +		enable-gpios =3D <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> +		power-supply =3D <&vdd_led>;
> +		pwms =3D <&pwm 1 1000000>;
> +
> +		default-brightness-level =3D <224>;
> +		brightness-levels =3D
> +			<  0   1   2   3   4   5   6   7
> +			   8   9  10  11  12  13  14  15
> +			  16  17  18  19  20  21  22  23
> +			  24  25  26  27  28  29  30  31
> +			  32  33  34  35  36  37  38  39
> +			  40  41  42  43  44  45  46  47
> +			  48  49  50  51  52  53  54  55
> +			  56  57  58  59  60  61  62  63
> +			  64  65  66  67  68  69  70  71
> +			  72  73  74  75  76  77  78  79
> +			  80  81  82  83  84  85  86  87
> +			  88  89  90  91  92  93  94  95
> +			  96  97  98  99 100 101 102 103
> +			 104 105 106 107 108 109 110 111
> +			 112 113 114 115 116 117 118 119
> +			 120 121 122 123 124 125 126 127
> +			 128 129 130 131 132 133 134 135
> +			 136 137 138 139 140 141 142 143
> +			 144 145 146 147 148 149 150 151
> +			 152 153 154 155 156 157 158 159
> +			 160 161 162 163 164 165 166 167
> +			 168 169 170 171 172 173 174 175
> +			 176 177 178 179 180 181 182 183
> +			 184 185 186 187 188 189 190 191
> +			 192 193 194 195 196 197 198 199
> +			 200 201 202 203 204 205 206 207
> +			 208 209 210 211 212 213 214 215
> +			 216 217 218 219 220 221 222 223
> +			 224 225 226 227 228 229 230 231
> +			 232 233 234 235 236 237 238 239
> +			 240 241 242 243 244 245 246 247
> +			 248 249 250 251 252 253 254 255
> +			 256>;
> +	};
> +
> +	clocks {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		clk32k_in: clock@0 {
> +			compatible =3D "fixed-clock";
> +			reg =3D <0>;
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <32768>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		lid {
> +			label =3D "Lid";
> +			gpios =3D <&gpio TEGRA_GPIO(R, 4) GPIO_ACTIVE_LOW>;
> +			linux,input-type =3D <5>;
> +			linux,code =3D <KEY_RESERVED>;
> +			debounce-interval =3D <1>;
> +			gpio-key,wakeup;
> +		};
> +
> +		power {
> +			label =3D "Power";
> +			gpios =3D <&gpio TEGRA_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_POWER>;
> +			debounce-interval =3D <30>;
> +			gpio-key,wakeup;
> +		};
> +	};
> +
> +	panel: panel {
> +		compatible =3D "auo,b133xtn01";
> +
> +		backlight =3D <&backlight>;
> +		ddc-i2c-bus =3D <&dpaux>;
> +	};
> +
> +	regulators {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		vdd_mux: regulator@0 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <0>;
> +			regulator-name =3D "+VDD_MUX";
> +			regulator-min-microvolt =3D <12000000>;
> +			regulator-max-microvolt =3D <12000000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		vdd_5v0_sys: regulator@1 {overriding where needed

Stray text after '{'?

Regards,
Andreas

> +			compatible =3D "regulator-fixed";
> +			reg =3D <1>;
> +			regulator-name =3D "+5V_SYS";
> +			regulator-min-microvolt =3D <5000000>;
> +			regulator-max-microvolt =3D <5000000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			vin-supply =3D <&vdd_mux>;
> +		};
> +
> +		vdd_3v3_sys: regulator@2 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <2>;
> +			regulator-name =3D "+3.3V_SYS";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			vin-supply =3D <&vdd_mux>;
> +		};
> +
> +		vdd_3v3_run: regulator@3 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <3>;
> +			regulator-name =3D "+3.3V_RUN";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			gpio =3D <&pmic 1 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			vin-supply =3D <&vdd_3v3_sys>;
> +		};
> +
> +		vdd_3v3_hdmi: regulator@4 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <4>;
> +			regulator-name =3D "+3.3V_AVDD_HDMI_AP_GATED";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			vin-supply =3D <&vdd_3v3_run>;
> +		};
> +
> +		vdd_led: regulator@5 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <5>;
> +			regulator-name =3D "+VDD_LED";
> +			gpio =3D <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			vin-supply =3D <&vdd_mux>;
> +		};
> +
> +		vdd_5v0_ts: regulator@6 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <6>;
> +			regulator-name =3D "+5V_VDD_TS_SW";
> +			regulator-min-microvolt =3D <5000000>;
> +			regulator-max-microvolt =3D <5000000>;
> +			regulator-boot-on;
> +			gpio =3D <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			vin-supply =3D <&vdd_5v0_sys>;
> +		};
> +
> +		vdd_usb1_vbus: regulator@7 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <7>;
> +			regulator-name =3D "+5V_USB_HS";
> +			regulator-min-microvolt =3D <5000000>;
> +			regulator-max-microvolt =3D <5000000>;
> +			gpio =3D <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			gpio-open-drain;
> +			vin-supply =3D <&vdd_5v0_sys>;
> +		};
> +
> +		vdd_usb3_vbus: regulator@8 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <8>;
> +			regulator-name =3D "+5V_USB_SS";
> +			regulator-min-microvolt =3D <5000000>;
> +			regulator-max-microvolt =3D <5000000>;
> +			gpio =3D <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			gpio-open-drain;
> +			vin-supply =3D <&vdd_5v0_sys>;
> +		};
> +
> +		vdd_3v3_panel: regulator@9 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <9>;
> +			regulator-name =3D "+3.3V_PANEL";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			gpio =3D <&pmic 4 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			vin-supply =3D <&vdd_3v3_run>;
> +		};
> +
> +		vdd_3v3_lp0: regulator@10 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <10>;
> +			regulator-name =3D "+3.3V_LP0";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			/*
> +			 * TODO: find a way to wire this up with the USB EHCI
> +			 * controllers so that it can be enabled on demand.
> +			 */
> +			regulator-always-on;
> +			gpio =3D <&pmic 2 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			vin-supply =3D <&vdd_3v3_sys>;
> +		};
> +
> +		vdd_hdmi_pll: regulator@11 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <11>;
> +			regulator-name =3D "+1.05V_RUN_AVDD_HDMI_PLL";
> +			regulator-min-microvolt =3D <1050000>;
> +			regulator-max-microvolt =3D <1050000>;
> +			gpio =3D <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
> +			vin-supply =3D <&vdd_1v05_run>;
> +		};
> +
> +		vdd_5v0_hdmi: regulator@12 {
> +			compatible =3D "regulator-fixed";
> +			reg =3D <12>;
> +			regulator-name =3D "+5V_HDMI_CON";
> +			regulator-min-microvolt =3D <5000000>;
> +			regulator-max-microvolt =3D <5000000>;
> +			gpio =3D <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			vin-supply =3D <&vdd_5v0_sys>;
> +		};
> +	};
> +
> +	sound {
> +		compatible =3D "nvidia,tegra-audio-max98090-nyan-big",
> +			     "nvidia,tegra-audio-max98090";
> +		nvidia,model =3D "Acer Chromebook 13";
> +
> +		nvidia,audio-routing =3D
> +			"Headphones", "HPR",
> +			"Headphones", "HPL",
> +			"Speakers", "SPKR",
> +			"Speakers", "SPKL",
> +			"Mic Jack", "MICBIAS",
> +			"DMICL", "Int Mic",
> +			"DMICR", "Int Mic",
> +			"IN34", "Mic Jack";
> +
> +		nvidia,i2s-controller =3D <&tegra_i2s1>;
> +		nvidia,audio-codec =3D <&acodec>;
> +
> +		clocks =3D <&tegra_car TEGRA124_CLK_PLL_A>,
> +			 <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
> +			 <&tegra_car TEGRA124_CLK_EXTERN1>;
> +		clock-names =3D "pll_a", "pll_a_out0", "mclk";
> +
> +		nvidia,hp-det-gpios =3D <&gpio TEGRA_GPIO(I, 7) GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +#include "cros-ec-keyboard.dtsi"
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg


--PO56MgxkRrVM0g5ubWSox4V37hMXc8MiE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJT73bTAAoJEPou0S0+fgE/QS4QAJlQY+QpTb/StkzoiE+Efl06
RxcbMuMc05hk82zgT6YdJ1BvE5BjoiG3/U2yMTue549AHefb3qG15xGjbENcQtxU
rwDUF9fkft5dKCYl/EsBmXtAnhsOdj3chRrphS9yW4Z9pSehZVqZCbpgKe7PpQfM
bv1M/3P7EFDdmis62EECH7TPOmpYjaWfTekBlceQXYn+tMWocDl98NJpUAftzt6I
04Va1WWz5HRC5JP3pH5CnGVt3dhUVfkCz9XiroFBab9VgG3a5T0hlMYFIEtK2Vsp
xkqcSUjS7ZDyHBVqFOfA8kKW32x2xEew9QDoT5bgIb/++y3WA3l80xN4rxxx2uYQ
3t/+YUt+eTHcD7+q+gFg5bhyx5b9fB7s3/REvPjNVqMbFFFPvoL3xR+ncsV4KVyb
YDo7UNILCtnuSdn06e6C28lbsYQoogfxxRUSE3kM81lI3nbZO7e7t4So8sKig5XF
53kNjYSKy8YBEY6B/4FFAFreQ70ck0ltNLkAXcqvEwkHfXloLN2jxf2gWg+6HjRS
vz8hOSan8LfA1/n7h9ybjWa245QzwQ/tFFzocIhMVCpjMK/ELHsD2phssXRTF6xe
BMIS1SiojqKk4l1nxa2TqFf2VGgBapYSZScsZ/opPY5Uny2cl2JBgptGY7GtvmzE
+jlLCV4VEqBJ1sbEZlm7
=5hpD
-----END PGP SIGNATURE-----

--PO56MgxkRrVM0g5ubWSox4V37hMXc8MiE--
