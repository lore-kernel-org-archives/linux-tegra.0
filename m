From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/11] arm: tegra: colibri_t30: fix hdmi, power i2c,
 wakeup and activate touch
Date: Tue, 15 Sep 2015 10:47:24 +0200
Message-ID: <20150915084723.GD25970@ulmo.nvidia.com>
References: <1440777586-19545-1-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OROCMA9jn6tkzFBc"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440777586-19545-1-git-send-email-marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--OROCMA9jn6tkzFBc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2015 at 05:59:35PM +0200, Marcel Ziswiler wrote:
> This series finally continues on my previous Easter efforts (BTW:
> thanks all for the feedback and all the patches thereof already having
> been applied) and additionally to activating the STMPE811 touch
> controller also fixes HDMI, power I2C and the wake-up key.
>=20
>=20
> Marcel Ziswiler (11):
>   arm: tegra: colibri_t30: update hardware revisions compatible comment
>   arm: tegra: colibri_t30: fix hdmi supply
>   arm: tegra: colibri_t30: improve comment about thermal alert pin
>   arm: tegra: colibri_t30: add pin muxing for on-module power i2c
>   arm: tegra: colibri_t30: fix comment about 3v3 fixed supply
>   arm: tegra: colibri_t30: add touch pen interrupt pin muxing
>   arm: tegra: colibri_t30: activate stmpe811 touch controller
>   arm: tegra: colibri_t30: replace emmc label by comment
>   arm: tegra: colibri_t30: fix vendor string of m41t0m6 rtc on eval
>     board
>   arm: tegra: colibri_t30: add comment concerning sd/mmc for eval board
>   arm: tegra: colibri_t30: fix power/wakeup key for eval board
>=20
>  arch/arm/boot/dts/tegra30-colibri-eval-v3.dts |   9 +-
>  arch/arm/boot/dts/tegra30-colibri.dtsi        | 124 ++++++++++++++++++++=
++----
>  2 files changed, 111 insertions(+), 22 deletions(-)

Applied all of these with fixups for the subject similar to the Apalis
series. I also applied the following on top to consistently align pin
names.

Thanks,
Thierry

--- >8 ---

=46rom e675c68545ffc4c404cc3f4aa2062b34994efdaf Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Tue, 15 Sep 2015 10:29:57 +0200
Subject: [PATCH] ARM: tegra: colibri: Properly align pin names

Align pin names on subsequent lines with the first the name of the first
pin in the first line.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30-colibri.dtsi | 72 +++++++++++++++++-------------=
----
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/teg=
ra30-colibri.dtsi
index 67ba9431e386..2d8c58fd9357 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -39,7 +39,7 @@
=20
 			/* Colibri Backlight PWM<A> */
 			sdmmc3_dat3_pb4 {
-				nvidia,pins =3D	"sdmmc3_dat3_pb4";
+				nvidia,pins =3D "sdmmc3_dat3_pb4";
 				nvidia,function =3D "pwm0";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -74,11 +74,11 @@
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
 			};
 			kb_row11_ps3 {
-				nvidia,pins =3D	"kb_row11_ps3",
-						"kb_row12_ps4",
-						"kb_row13_ps5",
-						"kb_row14_ps6",
-						"kb_row15_ps7";
+				nvidia,pins =3D "kb_row11_ps3",
+					      "kb_row12_ps4",
+					      "kb_row13_ps5",
+					      "kb_row14_ps6",
+					      "kb_row15_ps7";
 				nvidia,function =3D "sdmmc2";
 				nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -86,17 +86,17 @@
=20
 			/* Colibri SSP */
 			ulpi_clk_py0 {
-				nvidia,pins =3D   "ulpi_clk_py0",
-						"ulpi_dir_py1",
-						"ulpi_nxt_py2",
-						"ulpi_stp_py3";
+				nvidia,pins =3D "ulpi_clk_py0",
+					      "ulpi_dir_py1",
+					      "ulpi_nxt_py2",
+					      "ulpi_stp_py3";
 				nvidia,function =3D "spi1";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
 			};
 			sdmmc3_dat6_pd3 {
-				nvidia,pins =3D	"sdmmc3_dat6_pd3",
-						"sdmmc3_dat7_pd4";
+				nvidia,pins =3D "sdmmc3_dat6_pd3",
+					      "sdmmc3_dat7_pd4";
 				nvidia,function =3D "spdif";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
@@ -104,14 +104,14 @@
=20
 			/* Colibri UART_A */
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
@@ -119,10 +119,10 @@
=20
 			/* Colibri UART_B */
 			gmi_a16_pj7 {
-				nvidia,pins =3D   "gmi_a16_pj7",
-						"gmi_a17_pb0",
-						"gmi_a18_pb1",
-						"gmi_a19_pk7";
+				nvidia,pins =3D "gmi_a16_pj7",
+					      "gmi_a17_pb0",
+					      "gmi_a18_pb1",
+					      "gmi_a19_pk7";
 				nvidia,function =3D "uartd";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -130,8 +130,8 @@
=20
 			/* Colibri UART_C */
 			uart2_rxd {
-				nvidia,pins =3D   "uart2_rxd_pc3",
-						"uart2_txd_pc2";
+				nvidia,pins =3D "uart2_rxd_pc3",
+					      "uart2_txd_pc2";
 				nvidia,function =3D "uartb";
 				nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
@@ -139,21 +139,21 @@
=20
 			/* eMMC */
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
--=20
2.5.0


--OROCMA9jn6tkzFBc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV99sYAAoJEN0jrNd/PrOh1hIP/Apz+2MzqHBkMosTjLOPaVOn
Yn3YPIwoJe9JuAjW/PalJCHQhJt7V30mrlyz1Y+dex0puaXBRitSecXq+pFS77KD
DyuUx7m2beqXoTWGmaIlGrL8dTiad35vYtTw54eT82BcVa7WSJ6v4Z5dqkRdPM4m
lsY5ej2L7RC5U7IRhkb6unuH3gRbckSJj96K/27tTw0ucJ4MtN1sCFPhlHboEMXI
4PEwHzfJxXJuixfxwMd2AqDU67wwIyyAh7m7axJNqdlVRhiBYPQdMzpOqWreTf3t
CvWFnZfNgLCjUVPvwwP50cMJtOsiMrXjNK/D2I1dhAg+5xMF7A11HSyCnNkAlJSV
FAInCQrRgKJC5HjvPNPi5dRLXSvr6Yhj7+5v6MRA3euLLpvpVjYds2GF2I2LWUbi
qdCfylHiNvhgLEPCUGfV/UEJGv2u/EGD2X7RK4UBeyH3gnIbKUdatvTvbhl4XlTf
mFpaUdvwvz4zrKNwEV+aojRxYwScyjgKbscJ6NO43eTlpaJdkresy0520Y+FnR/8
2L5XMw6cSxWyfC4qvf1QSt+RUGXPXxNHr+YHbCJfcv/h3Cc6extzAmScI9MIUfo0
Ikj+qIAM9aLsWNLDWhGRDprB23dKHL9gGNCBkDbwPiinuBugK081bswsxcXsEsyH
lnNPFc9o8MvycfbY05JO
=hsoi
-----END PGP SIGNATURE-----

--OROCMA9jn6tkzFBc--
