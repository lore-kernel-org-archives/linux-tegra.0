From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] phy: tegra-xusb: add pinctrl dependency
Date: Tue, 3 May 2016 18:07:08 +0200
Message-ID: <20160503160708.GA20266@ulmo.ba.sec>
References: <1462289101-797073-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462289101-797073-1-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2016 at 05:24:51PM +0200, Arnd Bergmann wrote:
> The newly added tegra xusb phy driver fails to link when CONFIG_PINCTRL
> is disabled, since that also leaves out the legacy probe function:
>=20
> ERROR: "tegra_xusb_padctl_legacy_probe" [drivers/phy/tegra/phy-tegra-xusb=
=2Eko] undefined!

Wouldn't that be more of a case for a select dependency? I'm thinking
something like the below (untested, yet).

Thierry
--- >8 ---
diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index a3b1de953fb7..59e0dba9259a 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -1,6 +1,7 @@
 config PHY_TEGRA_XUSB
 	tristate "NVIDIA Tegra XUSB pad controller driver"
 	depends on ARCH_TEGRA
+	select PINCTRL_TEGRA_XUSB
 	help
 	  Choose this option if you have an NVIDIA Tegra SoC.
=20
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index e4bc1151e04f..42a5c1dddfef 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -23,7 +23,7 @@ obj-$(CONFIG_PINCTRL_PISTACHIO)	+=3D pinctrl-pistachio.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+=3D pinctrl-rockchip.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+=3D pinctrl-single.o
 obj-$(CONFIG_PINCTRL_SIRF)	+=3D sirf/
-obj-$(CONFIG_PINCTRL_TEGRA)	+=3D tegra/
+obj-$(CONFIG_ARCH_TEGRA)	+=3D tegra/
 obj-$(CONFIG_PINCTRL_TZ1090)	+=3D pinctrl-tz1090.o
 obj-$(CONFIG_PINCTRL_TZ1090_PDC)	+=3D pinctrl-tz1090-pdc.o
 obj-$(CONFIG_PINCTRL_U300)	+=3D pinctrl-u300.o
diff --git a/drivers/pinctrl/tegra/Makefile b/drivers/pinctrl/tegra/Makefile
index a927379b6794..d9ea2be69cc4 100644
--- a/drivers/pinctrl/tegra/Makefile
+++ b/drivers/pinctrl/tegra/Makefile
@@ -1,4 +1,4 @@
-obj-y					+=3D pinctrl-tegra.o
+obj-$(CONFIG_PINCTRL_TEGRA)		+=3D pinctrl-tegra.o
 obj-$(CONFIG_PINCTRL_TEGRA20)		+=3D pinctrl-tegra20.o
 obj-$(CONFIG_PINCTRL_TEGRA30)		+=3D pinctrl-tegra30.o
 obj-$(CONFIG_PINCTRL_TEGRA114)		+=3D pinctrl-tegra114.o

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKMyqAAoJEN0jrNd/PrOh+YEP/is0gZ9g6tCpa/CK1Rj+ZLZ8
CWycS2fPl+QBkYb4tN9GpDTJYNJIp+hgPseLiMQasYzkK6x+uBeDQtYrUsvpxS8j
yIpusldAX+3ejYdujE5O76b99KerUe13cTHKb/wMXYVq6VWnuygCqdBqXx4JmQ/3
vQGJ0WreuEnRWgZ6t6OLAxI5Sc81j2D3vJcTyGkv3uaiOLz7g4bD1krUecxdD7EH
Q/8/1MBnt+cbVWmXm+5gdW+R6cVAjkyrHa2LSIPa+3Yt559XHEqc2+V0pSLQVXLR
XXzYzYteFztdUipGRPo71wsx7WlbmIbvZUtwECYlhR3CQF69WurovRN7IgF0JeFh
B2Sh7f6lXeVzROnYv19NrqCkfT4miLY4EoZ2zAXxxknQsTc7bjJREWRgetU/oCJq
5ajMxQI47C3rCDUxQyjTQ1b4FbVypRXY9+UVortWPE1C6u2Z3txBAWwnVET4fIRC
j466qDSFvBWiChpgvYqvkTbKOogFdP/IX9So7eizewU5PXKVTZpBTF3eYWuIk64V
HLm3k8GEAwboQA1VXcm3IYPjCPGa4EJtugOr7NESEsAvD3pSD3s8qn2Kr5NBSDn2
jJilinlz7Eo0HJR0ikP94oc2rmPwEUu7YJ1GAqRpYp2AMCWj7VxM2EbAceSiQsQU
iIk6c4P7VDOTjgRlrlDs
=GuwP
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
