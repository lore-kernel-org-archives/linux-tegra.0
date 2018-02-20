From: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] watchdog: add SPDX identifiers for watchdog subsystem
Date: Tue, 20 Feb 2018 10:59:26 +0100
Message-ID: <20180220095811.GA24311@gmail.com>
References: <20180220093119.23720-1-marcus.folkesson@gmail.com>
 <d734dd84-ad3b-141b-779d-13d340217a18@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2729457404322283013=="
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <d734dd84-ad3b-141b-779d-13d340217a18-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, adi-buildroot-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Joel Stanley <joel@jms.i>
List-Id: linux-tegra@vger.kernel.org


--===============2729457404322283013==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Content-Disposition: inline


--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2018 at 10:47:03AM +0100, Neil Armstrong wrote:
> Hi Marcus,
>=20
> On 20/02/2018 10:31, Marcus Folkesson wrote:
> > - Add SPDX identifier
> > - Remove boiler plate license text
> > - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
> >   license
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >=20
> > Notes:
> >     v1: Please have an extra look at meson_gxbb_wdt.c
> >=20
> >  drivers/watchdog/acquirewdt.c          |  6 +---
> >  drivers/watchdog/advantechwdt.c        |  6 +---
> >  drivers/watchdog/alim1535_wdt.c        |  6 +---
> >  drivers/watchdog/alim7101_wdt.c        |  1 +
> >  drivers/watchdog/ar7_wdt.c             | 14 +--------
> >  drivers/watchdog/asm9260_wdt.c         |  2 +-
> >  drivers/watchdog/aspeed_wdt.c          |  5 +---
> >  drivers/watchdog/at91rm9200_wdt.c      |  5 +---
> >  drivers/watchdog/at91sam9_wdt.c        |  5 +---
> >  drivers/watchdog/at91sam9_wdt.h        |  5 +---
> >  drivers/watchdog/ath79_wdt.c           |  4 +--
> >  drivers/watchdog/atlas7_wdt.c          |  2 +-
> >  drivers/watchdog/bcm2835_wdt.c         |  5 +---
> >  drivers/watchdog/bcm47xx_wdt.c         |  5 +---
> >  drivers/watchdog/bcm63xx_wdt.c         |  5 +---
> >  drivers/watchdog/bcm7038_wdt.c         | 12 ++------
> >  drivers/watchdog/bcm_kona_wdt.c        |  9 +-----
> >  drivers/watchdog/bfin_wdt.c            |  2 +-
> >  drivers/watchdog/booke_wdt.c           |  5 +---
> >  drivers/watchdog/cadence_wdt.c         |  5 +---
> >  drivers/watchdog/coh901327_wdt.c       |  7 ++---
> >  drivers/watchdog/cpu5wdt.c             | 15 +---------
> >  drivers/watchdog/cpwd.c                |  1 +
> >  drivers/watchdog/da9052_wdt.c          |  6 +---
> >  drivers/watchdog/da9055_wdt.c          |  6 +---
> >  drivers/watchdog/da9062_wdt.c          | 10 +------
> >  drivers/watchdog/da9063_wdt.c          |  5 +---
> >  drivers/watchdog/davinci_wdt.c         |  7 ++---
> >  drivers/watchdog/diag288_wdt.c         |  1 +
> >  drivers/watchdog/digicolor_wdt.c       |  5 +---
> >  drivers/watchdog/dw_wdt.c              |  6 +---
> >  drivers/watchdog/ebc-c384_wdt.c        |  9 +-----
> >  drivers/watchdog/ep93xx_wdt.c          |  7 ++---
> >  drivers/watchdog/eurotechwdt.c         |  6 +---
> >  drivers/watchdog/f71808e_wdt.c         | 16 +---------
> >  drivers/watchdog/ftwdt010_wdt.c        |  6 ++--
> >  drivers/watchdog/gef_wdt.c             |  6 +---
> >  drivers/watchdog/geodewdt.c            |  5 +---
> >  drivers/watchdog/gpio_wdt.c            |  5 +---
> >  drivers/watchdog/hpwdt.c               |  7 ++---
> >  drivers/watchdog/i6300esb.c            |  6 +---
> >  drivers/watchdog/iTCO_vendor_support.c |  9 +-----
> >  drivers/watchdog/iTCO_wdt.c            | 10 +------
> >  drivers/watchdog/ib700wdt.c            |  6 +---
> >  drivers/watchdog/ibmasr.c              |  3 +-
> >  drivers/watchdog/ie6xx_wdt.c           | 18 ++---------
> >  drivers/watchdog/imgpdc_wdt.c          |  5 +---
> >  drivers/watchdog/imx2_wdt.c            |  5 +---
> >  drivers/watchdog/indydog.c             |  6 +---
> >  drivers/watchdog/intel-mid_wdt.c       |  6 ++--
> >  drivers/watchdog/intel_scu_watchdog.c  | 18 ++---------
> >  drivers/watchdog/intel_scu_watchdog.h  | 16 +---------
> >  drivers/watchdog/iop_wdt.c             | 16 ++--------
> >  drivers/watchdog/it8712f_wdt.c         | 10 +------
> >  drivers/watchdog/it87_wdt.c            | 10 +------
> >  drivers/watchdog/ixp4xx_wdt.c          |  6 ++--
> >  drivers/watchdog/jz4740_wdt.c          | 10 +------
> >  drivers/watchdog/kempld_wdt.c          | 12 ++------
> >  drivers/watchdog/ks8695_wdt.c          |  6 ++--
> >  drivers/watchdog/lantiq_wdt.c          |  7 ++---
> >  drivers/watchdog/loongson1_wdt.c       |  5 +---
> >  drivers/watchdog/lpc18xx_wdt.c         |  5 +---
> >  drivers/watchdog/m54xx_wdt.c           |  6 ++--
> >  drivers/watchdog/machzwd.c             | 11 +------
> >  drivers/watchdog/max63xx_wdt.c         |  5 +---
> >  drivers/watchdog/max77620_wdt.c        |  5 +---
> >  drivers/watchdog/mei_wdt.c             | 12 ++------
> >  drivers/watchdog/mena21_wdt.c          |  4 +--
> >  drivers/watchdog/menf21bmc_wdt.c       |  8 ++---
> >  drivers/watchdog/meson_gxbb_wdt.c      | 55 +-------------------------=
--------
> >  drivers/watchdog/meson_wdt.c           |  6 +---
> >  drivers/watchdog/mixcomwd.c            |  6 +---
> >  drivers/watchdog/moxart_wdt.c          |  7 ++---
> >  drivers/watchdog/mpc8xxx_wdt.c         |  6 +---
> >  drivers/watchdog/mt7621_wdt.c          |  5 +---
> >  drivers/watchdog/mtk_wdt.c             | 11 +------
> >  drivers/watchdog/mtx-1_wdt.c           | 11 +------
> >  drivers/watchdog/mv64x60_wdt.c         |  6 ++--
> >  drivers/watchdog/ni903x_wdt.c          | 11 +------
> >  drivers/watchdog/nic7018_wdt.c         | 11 +------
> >  drivers/watchdog/nuc900_wdt.c          |  7 ++---
> >  drivers/watchdog/nv_tco.c              |  6 +---
> >  drivers/watchdog/nv_tco.h              | 10 +------
> >  drivers/watchdog/octeon-wdt-main.c     | 11 +------
> >  drivers/watchdog/octeon-wdt-nmi.S      |  5 +---
> >  drivers/watchdog/of_xilinx_wdt.c       |  8 ++---
> >  drivers/watchdog/omap_wdt.c            |  1 +
> >  drivers/watchdog/omap_wdt.h            | 21 +------------
> >  drivers/watchdog/orion_wdt.c           |  5 +---
> >  drivers/watchdog/pc87413_wdt.c         | 10 +------
> >  drivers/watchdog/pcwd.c                |  1 +
> >  drivers/watchdog/pcwd_pci.c            | 10 +------
> >  drivers/watchdog/pcwd_usb.c            | 10 +------
> >  drivers/watchdog/pic32-dmt.c           |  5 +---
> >  drivers/watchdog/pic32-wdt.c           |  6 +---
> >  drivers/watchdog/pika_wdt.c            |  1 +
> >  drivers/watchdog/pnx4008_wdt.c         |  7 ++---
> >  drivers/watchdog/pnx833x_wdt.c         |  6 +---
> >  drivers/watchdog/pretimeout_noop.c     |  7 +----
> >  drivers/watchdog/pretimeout_panic.c    |  7 +----
> >  drivers/watchdog/qcom-wdt.c            | 14 ++-------
> >  drivers/watchdog/renesas_wdt.c         |  4 +--
> >  drivers/watchdog/retu_wdt.c            | 10 +------
> >  drivers/watchdog/riowd.c               |  1 +
> >  drivers/watchdog/rn5t618_wdt.c         |  8 +----
> >  drivers/watchdog/rt2880_wdt.c          |  5 +---
> >  drivers/watchdog/rtd119x_wdt.c         |  2 +-
> >  drivers/watchdog/rza_wdt.c             |  5 +---
> >  drivers/watchdog/s3c2410_wdt.c         | 11 +------
> >  drivers/watchdog/sa1100_wdt.c          | 11 +------
> >  drivers/watchdog/sama5d4_wdt.c         |  3 +-
> >  drivers/watchdog/sb_wdog.c             |  5 +---
> >  drivers/watchdog/sbc60xxwdt.c          | 10 +------
> >  drivers/watchdog/sbc7240_wdt.c         | 12 ++------
> >  drivers/watchdog/sbc8360.c             | 10 +------
> >  drivers/watchdog/sbc_epx_c3.c          |  6 +---
> >  drivers/watchdog/sbc_fitpc2_wdt.c      |  7 ++---
> >  drivers/watchdog/sbsa_gwdt.c           | 10 +------
> >  drivers/watchdog/sc1200wdt.c           | 10 +------
> >  drivers/watchdog/sc520_wdt.c           | 10 +------
> >  drivers/watchdog/sch311x_wdt.c         | 10 +------
> >  drivers/watchdog/scx200_wdt.c          | 10 ++-----
> >  drivers/watchdog/shwdt.c               |  6 +---
> >  drivers/watchdog/sirfsoc_wdt.c         |  5 ++--
> >  drivers/watchdog/smsc37b787_wdt.c      | 10 +------
> >  drivers/watchdog/softdog.c             | 10 +------
> >  drivers/watchdog/sp5100_tco.c          |  6 +---
> >  drivers/watchdog/sp805_wdt.c           |  5 +---
> >  drivers/watchdog/sprd_wdt.c            | 10 +------
> >  drivers/watchdog/st_lpc_wdt.c          |  6 +---
> >  drivers/watchdog/stmp3xxx_rtc_wdt.c    |  5 +---
> >  drivers/watchdog/sun4v_wdt.c           |  6 +---
> >  drivers/watchdog/sunxi_wdt.c           |  6 +---
> >  drivers/watchdog/tangox_wdt.c          |  6 +---
> >  drivers/watchdog/tegra_wdt.c           | 10 +------
> >  drivers/watchdog/ts4800_wdt.c          |  5 +---
> >  drivers/watchdog/ts72xx_wdt.c          |  7 ++---
> >  drivers/watchdog/twl4030_wdt.c         | 15 +---------
> >  drivers/watchdog/txx9wdt.c             |  9 ++----
> >  drivers/watchdog/uniphier_wdt.c        | 10 +------
> >  drivers/watchdog/ux500_wdt.c           |  5 ++--
> >  drivers/watchdog/via_wdt.c             |  4 +--
> >  drivers/watchdog/w83627hf_wdt.c        | 10 +------
> >  drivers/watchdog/w83877f_wdt.c         | 10 +------
> >  drivers/watchdog/w83977f_wdt.c         |  9 +-----
> >  drivers/watchdog/wafer5823wdt.c        | 11 +------
> >  drivers/watchdog/watchdog_core.c       | 10 +------
> >  drivers/watchdog/watchdog_core.h       | 10 +------
> >  drivers/watchdog/watchdog_dev.c        | 10 +------
> >  drivers/watchdog/watchdog_pretimeout.c |  6 +---
> >  drivers/watchdog/wd501p.h              |  1 +
> >  drivers/watchdog/wdat_wdt.c            |  5 +---
> >  drivers/watchdog/wdrtas.c              | 15 +---------
> >  drivers/watchdog/wdt.c                 | 11 +------
> >  drivers/watchdog/wdt285.c              |  7 +----
> >  drivers/watchdog/wdt977.c              |  8 +----
> >  drivers/watchdog/wdt_pci.c             | 11 +------
> >  drivers/watchdog/wm831x_wdt.c          |  5 +---
> >  drivers/watchdog/wm8350_wdt.c          |  5 +---
> >  drivers/watchdog/xen_wdt.c             |  6 +---
> >  drivers/watchdog/ziirave_wdt.c         | 11 +------
> >  drivers/watchdog/zx2967_wdt.c          |  3 +-
> >  162 files changed, 195 insertions(+), 1059 deletions(-)
> >=20
>=20
> [..]
>=20
> > diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson=
_gxbb_wdt.c
> > index 69a5a57f1446..500463c3e040 100644
> > --- a/drivers/watchdog/meson_gxbb_wdt.c
> > +++ b/drivers/watchdog/meson_gxbb_wdt.c
> > @@ -1,57 +1,4 @@
> > -/*
> > - * This file is provided under a dual BSD/GPLv2 license.  When using or
> > - * redistributing this file, you may do so under either license.
> > - *
> > - * GPL LICENSE SUMMARY
> > - *
> > - * Copyright (c) 2016 BayLibre, SAS.
> > - * Author: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>=20
> Please keep the copyright !

Sorry Neil!

I will fix that for v2.

I saw that the copyright text has magically disappered for
coh901327_wdt.c as well.

What do you think about the BSD license? Is BSD-2-Clause right?

>=20
> > - *
> > - * This program is free software; you can redistribute it and/or modify
> > - * it under the terms of version 2 of the GNU General Public License as
> > - * published by the Free Software Foundation.
> > - *
> > - * This program is distributed in the hope that it will be useful, but
> > - * WITHOUT ANY WARRANTY; without even the implied warranty of
> > - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > - * General Public License for more details.
> > - *
> > - * You should have received a copy of the GNU General Public License
> > - * along with this program; if not, see <http://www.gnu.org/licenses/>.
> > - * The full GNU General Public License is included in this distribution
> > - * in the file called COPYING.
> > - *
> > - * BSD LICENSE
> > - *
> > - * Copyright (c) 2016 BayLibre, SAS.
> > - * Author: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > - *
> > - * Redistribution and use in source and binary forms, with or without
> > - * modification, are permitted provided that the following conditions
> > - * are met:
> > - *
> > - *   * Redistributions of source code must retain the above copyright
> > - *     notice, this list of conditions and the following disclaimer.
> > - *   * Redistributions in binary form must reproduce the above copyrig=
ht
> > - *     notice, this list of conditions and the following disclaimer in
> > - *     the documentation and/or other materials provided with the
> > - *     distribution.
> > - *   * Neither the name of Intel Corporation nor the names of its
> > - *     contributors may be used to endorse or promote products derived
> > - *     from this software without specific prior written permission.
> > - *
> > - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> > - * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> > - * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS F=
OR
> > - * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> > - * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTA=
L,
> > - * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> > - * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF US=
E,
> > - * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON A=
NY
> > - * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> > - * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE U=
SE
> > - * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > - */
> > +// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> >  #include <linux/clk.h>
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> [..]
>=20
> Thanks,
> Neil

Best regards
Marcus Folkesson

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAlqL8XkACgkQiIBOb1ld
UjIQhw//bWaGBX/4lpSsbHHQaERbrVadxtGSk2NsvxXfXvsEqySH3+QabBHSqVan
oShyuLqYOMZ/AEHVc9tN4kHL19VQuzuvW0tHUdpQE1bcv2ZERgHwAvKOBhJIlBj7
qCzNgZYIMi0aVcMLM1qcP3HPROwrSJwGbBs4zZjNrlpWkn+Cc7bp5b6y6h6RIgg5
j/v2ljxYXYYo9BEyRBNfMBQXuxE7lCfpc5AOtn4/BxHW+PPBLRQGG7LYWDucfo2t
NtNLP6mF4FVY1O+kwgQtGBjIhsz9evYkRFLwaf+t1/ojFpLR80M+SRfmTHNUW8p2
9O41/l0LP1GMoQhek6P7NLhT3rJvRooNrO8cGHftPgS0i5fBmrnCbIN91xA8x4i9
hgn7AOqaccnx1pOcBJemZKnZlCIqCUItV18o6PAF7KDE6QZxz3VzUxXzOu2e+JN0
KAzTn1L+Wwca8zrFJK1/Tym5K59SpJPJDf3I+XCfx4jGiccCf/eD5hZgZsRgnHsC
0ydkLv3Mbkn4SYIf1ygPLEyYpBV3Hgvh15gHXZDVg7C+gNAID9v1Zag3RJ0Dy3kU
ee/IFSCE9gckLMZY9crWQCn6/gx//tsQki2AWxLg8BX0Oa3h+taJNviVGNCxZu4W
QbgiN0RU1c3bZqVb7TAZ8lKi/PvwA1Aip5/VDqP/UcHWGNx4WBA=
=Ooxf
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--


--===============2729457404322283013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2729457404322283013==--
