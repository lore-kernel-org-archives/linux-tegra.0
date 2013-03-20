From: Felipe Balbi <balbi@ti.com>
Subject: Re: USB-related build errors on Tegra in next-20130319
Date: Wed, 20 Mar 2013 19:11:47 +0200
Message-ID: <20130320171147.GM1567@arwen.pp.htv.fi>
References: <51489251.5040504@wwwdotorg.org>
 <20130320122031.GI29659@arwen.pp.htv.fi>
 <5149E62F.9090705@wwwdotorg.org>
 <20130320164553.GL1567@arwen.pp.htv.fi>
 <5149E925.7030302@wwwdotorg.org>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BHMq0+oGliEfCAkH"
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5149E925.7030302@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: balbi@ti.com, Venu Byravarasu <vbyravarasu@nvidia.com>, USB list <linux-usb@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

--BHMq0+oGliEfCAkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 20, 2013 at 10:51:49AM -0600, Stephen Warren wrote:
> On 03/20/2013 10:45 AM, Felipe Balbi wrote:
> > Hi,
> >=20
> > On Wed, Mar 20, 2013 at 10:39:11AM -0600, Stephen Warren wrote:
> >> On 03/20/2013 06:20 AM, Felipe Balbi wrote:
> ...
> >> The patch you gave fixes the Kconfig warnings, but not the build
> >> failure.
> ...
> >> For now, I think the correct solution is to have USB_EHCI_TEGRA
> >> select USB_PHY. I validated that solves the build problem, and
> >> has the bonus of not needing any changes to tegra_defconfig.
> ...
> > Alright, do you want to send that patch ? My bad that I missed
> > that build error...
>=20
> Sure. Do you want to roll it into your patch and repost it, or me to
> send a separate patch?

updated patch below:

=46rom c2b3334a624e4231952ab050e29445b8c62f662d Mon Sep 17 00:00:00 2001
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
 drivers/usb/host/Kconfig    | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

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
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index ba1347c..1b58587 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -179,6 +179,7 @@ config USB_EHCI_TEGRA
        boolean "NVIDIA Tegra HCD support"
        depends on USB_EHCI_HCD && ARCH_TEGRA
        select USB_EHCI_ROOT_HUB_TT
+       select USB_PHY
        help
          This driver enables support for the internal USB Host Controllers
          found in NVIDIA Tegra SoCs. The controllers are EHCI compliant.
--=20
1.8.2

Another possibility would be to:

select USB_PHY if USB
select USB_ULPI
select USB_ULPI_VIEWPORT

Would you prefer that one instead ?

> I assume you'd apply both to the same branch that contains the patches
> that add the USB_PHY config option? If the arch/arm patch gets applied
> to the Tegra tree instead, it'll cause breakage there since USB_PHY
> won't exist yet, so USB will be disabled until merged with the USB
> tree in 3.10-rc1.

alright, but I need your Acked-by to the updated patch. I have now
compiled it with tegra_defconfig (is that the one which should be used?)
and it's compiling fine without any issues.

--=20
balbi

--BHMq0+oGliEfCAkH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRSe3TAAoJEIaOsuA1yqREM9wP/0f1fahq0Rox3V0g53QM7wV3
GvGKZVjd/AEdR5Q+yHcCKF6pKvwBeUr2HG3okx33cmq6amlgXRZt7pNuz8mhLxVz
FW72JUw2Yr3ASSQrAhYIjBiGvRgWPwj9jyIq8D6/1s2QXcwQteJCmycTzJrshrzR
EAY6A8L/CslhkrHIw1t9yu1CaeN+28wfNpA9aSAV3laJzfPDKfJLx1ttkt2C76Gi
GsO3Q86MU+qjC2AQEWjYEekMr0/yR3OZt2NzjfYz+NazF6WdRPd0lIbqfVFbaVoY
ySXJ8b+RbrsmiYlHIBSWDIrL2Uv0BkiJH7kgHhq/j2JHTEHoDF/UELHd758oBuc3
I+fD37+Gt0crRi0rER7rjP8jb9GCTo0Xsuc0nmQqyFUCpe2VSC61UpiNO6iLrtgz
JKMg3dnK56SCY3Skzxa01sBGYpf4mmrgFj78KOBWm2hFStP2Lkw64u7/mbSEZvtj
xfKimVLEy8Ziuf3lxZAx2FryqXR7ewmLnXVI6yory8AsaAD7wb0ZKAVSHzE3Lk7d
P6FkP812pORfKrcqXNja5USt2ZBQKsA1BocWanjZ5BYEyn7z9Je5il1MY9Q6M4eO
ETNQSYfenmI0+Wv2oHroddHUoFYiKMzuLDpZqdbrVbs/wGbc+iqtpppCROenkOtC
IziO7bYwkyD8Hy0846Ox
=N+71
-----END PGP SIGNATURE-----

--BHMq0+oGliEfCAkH--
