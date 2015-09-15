From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/9] arm: tegra: apalis_t30: fix pin mux, hdmi, wakeup
 and enable hda
Date: Tue, 15 Sep 2015 10:33:47 +0200
Message-ID: <20150915083346.GC25970@ulmo.nvidia.com>
References: <1440765756-1382-1-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440765756-1382-1-git-send-email-marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2015 at 02:42:27PM +0200, Marcel Ziswiler wrote:
> This series finally continues on my previous Easter efforts (BTW:
> thanks all for the feedback and all the patches thereof already having
> been applied) and additionally to fixing the pin muxing and enabling
> HDA audio also fixes HDMI and the wake-up key.
>=20
>=20
> Marcel Ziswiler (9):
>   arm: tegra: apalis_t30: update hardware revisions compatibility
>     comment
>   arm: tegra: apalis_t30: fix hdmi supply
>   arm: tegra: apalis_t30: fix pin muxing
>   arm: tegra: apalis_t30: add comment concerning emmc
>   arm: tegra: apalis_t30: add digital audio pin muxing
>   arm: tegra: apalis_t30: enable hda for eval board
>   arm: tegra: apalis_t30: set otg dr_mode for eval board
>   arm: tegra: apalis_t30: fix backlight pwm comment for eval board
>   arm: tegra: apalis_t30: fix power/wakeup key for eval board
>=20
>  arch/arm/boot/dts/tegra30-apalis-eval.dts | 13 +++--
>  arch/arm/boot/dts/tegra30-apalis.dtsi     | 80 ++++++++++++++++++++++++-=
------
>  2 files changed, 73 insertions(+), 20 deletions(-)

Applied with minor tweaks to the subjects (to match the "ARM: tegra: "
prefix) and commit messages.

I've also applied the following on top to make pin names consistently
aligned.

Thierry

--- >8 ---

=46rom f330bb512f4f2bff9d7e73f2a39dc265099faefb Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Tue, 15 Sep 2015 10:29:57 +0200
Subject: [PATCH] ARM: tegra: apalis: Properly align pins in pinmux

Align pin names on subsequent lines with the first the name of the first
pin in the first line.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30-apalis.dtsi | 152 +++++++++++++++++-------------=
----
 1 file changed, 76 insertions(+), 76 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegr=
a30-apalis.dtsi
index 4a6ca389595c..bf361277fe10 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -58,14 +58,14 @@
=20
 			/* Apalis BKL1_PWM */
 			uart3_rts_n_pc0 {
-				nvidia,pins =3D	"uart3_rts_n_pc0";
+				nvidia,pins =3D "uart3_rts_n_pc0";
 				nvidia,function =3D "pwm0";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
 			};
 			/* BKL1_PWM_EN#, disable TPS65911 PMIC PWM backlight */
 			uart3_cts_n_pa1 {
-				nvidia,pins =3D	"uart3_cts_n_pa1";
+				nvidia,pins =3D "uart3_cts_n_pa1";
 				nvidia,function =3D "rsvd2";
 				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -73,10 +73,10 @@
=20
 			/* Apalis CAN1 on SPI6 */
 			spi2_cs0_n_px3 {
-				nvidia,pins =3D   "spi2_cs0_n_px3",
-						"spi2_miso_px1",
-						"spi2_mosi_px0",
-						"spi2_sck_px2";
+				nvidia,pins =3D "spi2_cs0_n_px3",
+					      "spi2_miso_px1",
+					      "spi2_mosi_px0",
+					      "spi2_sck_px2";
 				nvidia,function =3D "spi6";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -92,10 +92,10 @@
=20
 			/* Apalis CAN2 on SPI4 */
 			gmi_a16_pj7 {
-				nvidia,pins =3D   "gmi_a16_pj7",
-						"gmi_a17_pb0",
-						"gmi_a18_pb1",
-						"gmi_a19_pk7";
+				nvidia,pins =3D "gmi_a16_pj7",
+					      "gmi_a17_pb0",
+					      "gmi_a18_pb1",
+					      "gmi_a19_pk7";
 				nvidia,function =3D "spi4";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -111,7 +111,7 @@
=20
 			/* Apalis Digital Audio */
 			clk1_req_pee2 {
-				nvidia,pins =3D	"clk1_req_pee2";
+				nvidia,pins =3D "clk1_req_pee2";
 				nvidia,function =3D "hda";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -124,10 +124,10 @@
 				nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
 			};
 			dap1_fs_pn0 {
-				nvidia,pins =3D	"dap1_fs_pn0",
-						"dap1_din_pn1",
-						"dap1_dout_pn2",
-						"dap1_sclk_pn3";
+				nvidia,pins =3D "dap1_fs_pn0",
+					      "dap1_din_pn1",
+					      "dap1_dout_pn2",
+					      "dap1_sclk_pn3";
 				nvidia,function =3D "hda";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -147,21 +147,21 @@
=20
 			/* Apalis MMC1 */
 			sdmmc3_clk_pa6 {
-				nvidia,pins =3D	"sdmmc3_clk_pa6",
-						"sdmmc3_cmd_pa7";
+				nvidia,pins =3D "sdmmc3_clk_pa6",
+					      "sdmmc3_cmd_pa7";
 				nvidia,function =3D "sdmmc3";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
 			};
 			sdmmc3_dat0_pb7 {
-				nvidia,pins =3D	"sdmmc3_dat0_pb7",
-						"sdmmc3_dat1_pb6",
-						"sdmmc3_dat2_pb5",
-						"sdmmc3_dat3_pb4",
-						"sdmmc3_dat4_pd1",
-						"sdmmc3_dat5_pd0",
-						"sdmmc3_dat6_pd3",
-						"sdmmc3_dat7_pd4";
+				nvidia,pins =3D "sdmmc3_dat0_pb7",
+					      "sdmmc3_dat1_pb6",
+					      "sdmmc3_dat2_pb5",
+					      "sdmmc3_dat3_pb4",
+					      "sdmmc3_dat4_pd1",
+					      "sdmmc3_dat5_pd0",
+					      "sdmmc3_dat6_pd3",
+					      "sdmmc3_dat7_pd4";
 				nvidia,function =3D "sdmmc3";
 				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -177,7 +177,7 @@
=20
 			/* Apalis PWM1 */
 			pu6 {
-				nvidia,pins =3D	"pu6";
+				nvidia,pins =3D "pu6";
 				nvidia,function =3D "pwm3";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -185,7 +185,7 @@
=20
 			/* Apalis PWM2 */
 			pu5 {
-				nvidia,pins =3D	"pu5";
+				nvidia,pins =3D "pu5";
 				nvidia,function =3D "pwm2";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -193,7 +193,7 @@
=20
 			/* Apalis PWM3 */
 			pu4 {
-				nvidia,pins =3D	"pu4";
+				nvidia,pins =3D "pu4";
 				nvidia,function =3D "pwm1";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -201,7 +201,7 @@
=20
 			/* Apalis PWM4 */
 			pu3 {
-				nvidia,pins =3D	"pu3";
+				nvidia,pins =3D "pu3";
 				nvidia,function =3D "pwm0";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -223,11 +223,11 @@
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
 			};
 			sdmmc1_cmd_pz1 {
-				nvidia,pins =3D	"sdmmc1_cmd_pz1",
-						"sdmmc1_dat0_py7",
-						"sdmmc1_dat1_py6",
-						"sdmmc1_dat2_py5",
-						"sdmmc1_dat3_py4";
+				nvidia,pins =3D "sdmmc1_cmd_pz1",
+					      "sdmmc1_dat0_py7",
+					      "sdmmc1_dat1_py6",
+					      "sdmmc1_dat2_py5",
+					      "sdmmc1_dat3_py4";
 				nvidia,function =3D "sdmmc1";
 				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -243,10 +243,10 @@
=20
 			/* Apalis SPI1 */
 			spi1_sck_px5 {
-				nvidia,pins =3D   "spi1_sck_px5",
-						"spi1_mosi_px4",
-						"spi1_miso_px7",
-						"spi1_cs0_n_px6";
+				nvidia,pins =3D "spi1_sck_px5",
+					      "spi1_mosi_px4",
+					      "spi1_miso_px7",
+					      "spi1_cs0_n_px6";
 				nvidia,function =3D "spi1";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -254,10 +254,10 @@
=20
 			/* Apalis SPI2 */
 			lcd_sck_pz4 {
-				nvidia,pins =3D   "lcd_sck_pz4",
-						"lcd_sdout_pn5",
-						"lcd_sdin_pz2",
-						"lcd_cs0_n_pn4";
+				nvidia,pins =3D "lcd_sck_pz4",
+					      "lcd_sdout_pn5",
+					      "lcd_sdin_pz2",
+					      "lcd_cs0_n_pn4";
 				nvidia,function =3D "spi5";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -265,14 +265,14 @@
=20
 			/* Apalis UART1 */
 			ulpi_data0 {
-				nvidia,pins =3D   "ulpi_data0_po1",
-						"ulpi_data1_po2",
-						"ulpi_data2_po3",
-						"ulpi_data3_po4",
-						"ulpi_data4_po5",
-						"ulpi_data5_po6",
-						"ulpi_data6_po7",
-						"ulpi_data7_po0";
+				nvidia,pins =3D "ulpi_data0_po1",
+					      "ulpi_data1_po2",
+					      "ulpi_data2_po3",
+					      "ulpi_data3_po4",
+					      "ulpi_data4_po5",
+					      "ulpi_data5_po6",
+					      "ulpi_data6_po7",
+					      "ulpi_data7_po0";
 				nvidia,function =3D "uarta";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -280,10 +280,10 @@
=20
 			/* Apalis UART2 */
 			ulpi_clk_py0 {
-				nvidia,pins =3D   "ulpi_clk_py0",
-						"ulpi_dir_py1",
-						"ulpi_nxt_py2",
-						"ulpi_stp_py3";
+				nvidia,pins =3D "ulpi_clk_py0",
+					      "ulpi_dir_py1",
+					      "ulpi_nxt_py2",
+					      "ulpi_stp_py3";
 				nvidia,function =3D "uartd";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -291,8 +291,8 @@
=20
 			/* Apalis UART3 */
 			uart2_rxd_pc3 {
-				nvidia,pins =3D   "uart2_rxd_pc3",
-						"uart2_txd_pc2";
+				nvidia,pins =3D "uart2_rxd_pc3",
+					      "uart2_txd_pc2";
 				nvidia,function =3D "uartb";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -300,8 +300,8 @@
=20
 			/* Apalis UART4 */
 			uart3_rxd_pw7 {
-				nvidia,pins =3D   "uart3_rxd_pw7",
-						"uart3_txd_pw6";
+				nvidia,pins =3D "uart3_rxd_pw7",
+					      "uart3_txd_pw6";
 				nvidia,function =3D "uartc";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -337,21 +337,21 @@
=20
 			/* eMMC (On-module) */
 			sdmmc4_clk_pcc4 {
-				nvidia,pins =3D	"sdmmc4_clk_pcc4",
-						"sdmmc4_rst_n_pcc3";
+				nvidia,pins =3D "sdmmc4_clk_pcc4",
+					      "sdmmc4_rst_n_pcc3";
 				nvidia,function =3D "sdmmc4";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
 			};
 			sdmmc4_dat0_paa0 {
-				nvidia,pins =3D	"sdmmc4_dat0_paa0",
-						"sdmmc4_dat1_paa1",
-						"sdmmc4_dat2_paa2",
-						"sdmmc4_dat3_paa3",
-						"sdmmc4_dat4_paa4",
-						"sdmmc4_dat5_paa5",
-						"sdmmc4_dat6_paa6",
-						"sdmmc4_dat7_paa7";
+				nvidia,pins =3D "sdmmc4_dat0_paa0",
+					      "sdmmc4_dat1_paa1",
+					      "sdmmc4_dat2_paa2",
+					      "sdmmc4_dat3_paa3",
+					      "sdmmc4_dat4_paa4",
+					      "sdmmc4_dat5_paa5",
+					      "sdmmc4_dat6_paa6",
+					      "sdmmc4_dat7_paa7";
 				nvidia,function =3D "sdmmc4";
 				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -359,10 +359,10 @@
=20
 			/* LVDS Transceiver Configuration */
 			pbb0 {
-				nvidia,pins =3D	"pbb0",
-						"pbb7",
-						"pcc1",
-						"pcc2";
+				nvidia,pins =3D "pbb0",
+					      "pbb7",
+					      "pcc1",
+					      "pcc2";
 				nvidia,function =3D "rsvd2";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -370,10 +370,10 @@
 				nvidia,lock =3D <TEGRA_PIN_DISABLE>;
 			};
 			pbb3 {
-				nvidia,pins =3D	"pbb3",
-						"pbb4",
-						"pbb5",
-						"pbb6";
+				nvidia,pins =3D "pbb3",
+					      "pbb4",
+					      "pbb5",
+					      "pbb6";
 				nvidia,function =3D "displayb";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
--=20
2.5.0


--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV99fnAAoJEN0jrNd/PrOh5B8P/0QLDmSCW47fie08GDtkbeI1
w4vSb8JniuDAgNbqWsjMPuzr73tMfm5cUS34PUrwod50dTIcq9NA+mZX43gpVaQA
wjq3Vytul9t4tlB/xYPt2T88QR2gnZ9vdB5NXZoze/HWvZ7tCuaw1DhGAWAx/lKT
OhIUfrwAJjLhh3Porr+Jr671VvVxS9HiG2DmScywIkaHjlVGdX8ExzkhEbvJAv5F
r3mY5gu5AmzWLijRliHbgn/bMvDEaY4qvZvjSDQkGB6OfZv4VbDYJs2Wggt8NFQT
BmnAoDQZwPYgo3SXjWlUp/wsYqbvijBMvk3uTB3DeBENEnKs4C6aTyr/nY3UM1HV
L1UdiExxIAcYWhkrk9LZIOQJ2igFEnJLtqvchidNlmtWwZ4BrgMOjIYQLDJ4FJIN
dSrmZaqrqCAPKOzgyajHDha+/5JaymB6kIYeJKKcx2uc671tMH3IbWMisGZ7dgh+
e9FcgRqwlsuk/X6rtB0FrOheiNMMouXfxxZgYwuGgacDMynAjdabyKJI4qYkyYRp
qHWA2keO+eWRj+6P8VSiWy+/brRQojgEiw7/ZJZBf4v3mstZWVwJixjId9QOY3K9
+nL529jDJQ891++i2rhNfbvWIAJoiaepfZBRYJJqRraUYQaIalRMNeX5HEWHTMfj
RwczB0oD6B3Q0NJh3DRZ
=dfEz
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
