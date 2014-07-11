From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] pinctrl: Add NVIDIA Tegra XUSB pad controller support
Date: Fri, 11 Jul 2014 15:49:42 +0200
Message-ID: <20140711134940.GA13692@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626b38f:

  Linux 3.16-rc1 (2014-06-15 17:45:28 -1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-3.17/xusb-padctl

for you to fetch changes up to dc0a3938668706f3a63cde4ceb431e9189fb2a0a:

  pinctrl: Add NVIDIA Tegra XUSB pad controller support (2014-07-11 14:41:06 +0200)

I've based the Tegra tree's for-3.17/dt branch on this to handle the
dependency on the pinctrl-tegra-xusb.h header introduced in this series.
This for-3.17/xusb-padctl branch is stable, so if you need/want to pull
it into the pinctrl tree that'll be fine.

Thanks,
Thierry

----------------------------------------------------------------
Thierry Reding (2):
      of: Add NVIDIA Tegra XUSB pad controller binding
      pinctrl: Add NVIDIA Tegra XUSB pad controller support

 .../pinctrl/nvidia,tegra124-xusb-padctl.txt        | 127 +++
 drivers/pinctrl/Kconfig                            |   6 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-tegra-xusb.c               | 973 +++++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h   |   7 +
 5 files changed, 1114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
 create mode 100644 drivers/pinctrl/pinctrl-tegra-xusb.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTv+t0AAoJEN0jrNd/PrOhLOMP/1wTzhClzWWkgDCuvQBTZH/v
7XyXWoAPW8D9KUAS3mxS+r5wd43x8Nwp9hIMdm1fnzkZGNFNbgLtXiye8dmFk4zi
QaASHQ8FoC9sUVEtKFDuLU5VsRHfBCZOCPZvPFufhrxQAOhq+obXDmEA0bvHLDN9
73xfqj5+6She028xMb4nRYETnxqrdDocTHAbmZH/roH67fmhZ0SLxmbZx/6iIhI0
LvrYQD4/2Bk8m7TNQkJaWe1T75oF0SV6ZbcX35LShqLh1X74IsMB91Iq7A4hmu1+
+AAtbV5dP7bnPAntB2XZglxBd7AYeTY8Tq5f058dHq3Nq8BHmeF4eb+vi2bBnz0m
CbdXU1jLXZoPvNeE7vUcbixcqG1Q+k2G19I7zK8H7dIVTXsAx3k3BQyNpb11QIyV
9TPgGayMRbIEdAPcydMamR6+5Ms9Soven3871KPfCiCh3qSuamfQmVCyiyR/PCos
0hDqkaTNxvG5TU32rsxXQiih6drQ+3At2QhPfcAIjbvI/dMFXLrBUd22FxtxDfGu
2U1HmV0+lehopi/5kbictE1yNS37ovWXQGtP9ZFi6bV3KVqmEVlgQ8Yv9ds1ataE
P4PM1H1MaPyhiUADyVkMcoaVnJGAfZZq+B5WBTM+PSDNXN2KK12RrxuqenXw1Y64
LyjuoMwknMuDjolvqYMu
=aDRE
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
