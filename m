From: Felipe Balbi <balbi@ti.com>
Subject: Re: USB-related build errors on Tegra in next-20130319
Date: Wed, 20 Mar 2013 14:20:31 +0200
Message-ID: <20130320122031.GI29659@arwen.pp.htv.fi>
References: <51489251.5040504@wwwdotorg.org>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P6YfpwaDcfcOCJkJ"
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51489251.5040504@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

--P6YfpwaDcfcOCJkJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 19, 2013 at 10:29:05AM -0600, Stephen Warren wrote:
> I see the following Kconfig warnings in next-20130319:
>=20
> > warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI whic=
h has unmet direct dependencies (USB_SUPPORT && USB_PHY && ARM)
> > warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI_VIEW=
PORT which has unmet direct dependencies (USB_SUPPORT && USB_PHY && USB_ULP=
I)
> > include/config/auto.conf:624:warning: override: ARCH_MULTIPLATFORM chan=
ges choice state
> > warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI whic=
h has unmet direct dependencies (USB_SUPPORT && USB_PHY && ARM)
> > warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI_VIEW=
PORT which has unmet direct dependencies (USB_SUPPORT && USB_PHY && USB_ULP=
I)
>=20
> Which I believe are the cause of the following build errors:
>=20
> > drivers/built-in.o: In function `controller_resume':
> > drivers/usb/host/ehci-tegra.c:556: undefined reference to `tegra_usb_ph=
y_preresume'
> > drivers/usb/host/ehci-tegra.c:479: undefined reference to `tegra_ehci_p=
hy_restore_start'
> > drivers/usb/host/ehci-tegra.c:551: undefined reference to `tegra_ehci_p=
hy_restore_end'
> > drivers/usb/host/ehci-tegra.c:546: undefined reference to `tegra_ehci_p=
hy_restore_end'
> > drivers/built-in.o: In function `tegra_ehci_probe':
> > drivers/usb/host/ehci-tegra.c:734: undefined reference to `tegra_usb_ph=
y_open'
> > drivers/built-in.o: In function `tegra_ehci_hub_control':
> > drivers/usb/host/ehci-tegra.c:162: undefined reference to `tegra_usb_ph=
y_postresume'
> > drivers/usb/host/ehci-tegra.c:215: undefined reference to `tegra_usb_ph=
y_preresume'
> > make: *** [vmlinux] Error 1
>=20
> I pointed out at least the Kconfig problems when you posted the PHY
> error handling cleanup series, so I'm not sure why those patches were
> applied.

Because tegra EHCI shouldn't be selecting the PHY and you didn't even
have a proper PHY driver. Try patch below:

=46rom cc705d4038f6adc24dc0d2ad9a1b28a798fafb95 Mon Sep 17 00:00:00 2001
=46rom: Felipe Balbi <balbi@ti.com>
Date: Wed, 20 Mar 2013 14:18:28 +0200
Subject: [PATCH] arm: tegra: fix Kconfig select clauses

USB_ULPI and USB_ULPI_VIEWPORT shouldn't really
be selected directly by anyone, but since Tegra
still needs some time before turning ulpi viewport
into a proper PHY driver, we need to keep the
selects in place.

This patch just fixes the conditional select
so that it will continue to build after merging
the latest PHY layer changes.

Signed-off-by: Felipe Balbi <balbi@ti.com>
---
 arch/arm/mach-tegra/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index d1c4893..dbc653e 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -18,8 +18,8 @@ config ARCH_TEGRA_2x_SOC
 	select PL310_ERRATA_727915 if CACHE_L2X0
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select USB_ARCH_HAS_EHCI if USB_SUPPORT
-	select USB_ULPI if USB
-	select USB_ULPI_VIEWPORT if USB_SUPPORT
+	select USB_ULPI if USB_PHY
+	select USB_ULPI_VIEWPORT if USB_PHY
 	help
 	  Support for NVIDIA Tegra AP20 and T20 processors, based on the
 	  ARM CortexA9MP CPU and the ARM PL310 L2 cache controller
@@ -37,8 +37,8 @@ config ARCH_TEGRA_3x_SOC
 	select PINCTRL_TEGRA30
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select USB_ARCH_HAS_EHCI if USB_SUPPORT
-	select USB_ULPI if USB
-	select USB_ULPI_VIEWPORT if USB_SUPPORT
+	select USB_ULPI if USB_PHY
+	select USB_ULPI_VIEWPORT if USB_PHY
 	help
 	  Support for NVIDIA Tegra T30 processor family, based on the
 	  ARM CortexA9MP CPU and the ARM PL310 L2 cache controller
--=20
1.8.2

--=20
balbi

--P6YfpwaDcfcOCJkJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRSamPAAoJEIaOsuA1yqRE0QMP/3Lx7VDU7wU+9QuogP8gx94r
hot8P9s9kNzyUKEty6ptrgrPp86UndOiQRBVAJihOChX3u/7Wd/Po4EXv4VvjI9m
oNqPF2yGAtfFw9YzjFX+7Bxlc2/io1UAmpQsi9QIQOgoC3EoBytKhytsbgqHTB9R
IBGRPFBLOGaaa1Wobs+UzvyMrvgv/Sc5vleE7RJeDbvCTOicMAWVZiyuk3aeUlr7
G+vD8s0htu91nx86AZQkde7qjEViIEC/blRE8gzs2sj98a276RNvStPb/J4Jk2In
OcfeSKOSAxc6spYwI7F2quTpskyAQu/D/6jWaiEWAeuX10AhaENYz3xip3Scm33N
fLtJhSxeCUtIfiFuxktcK4DSHcZOJhVYzzckpANfreD1f53fAn7tFH0uuxVjQI49
rAM3e19Ufq/ySQYBEWgzFLbdidx2gbYb24j6PaiiYjJcoRl76UB1S71653/ZZ4S0
koglSZXeGkmzScMshafipR55xKuDMtG/EixgR90f0RK9BMEd4v/5yc7lSipAzEzB
+WKDdw0ePrrBWuiBcOBmcKuakeiwore2ZYYRve9wF2eh7VfGg6pllyjVmgF2qa10
SvJiQnQ7sKzP/bu1609a6x5V8ls1MFuvpFkNEcg7LljBne9sd31AIYVed48tIqlS
jqWruE9fe5Y6C+lPiM2r
=ncF7
-----END PGP SIGNATURE-----

--P6YfpwaDcfcOCJkJ--
