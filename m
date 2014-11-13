From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: tegra: Device tree fixes for v3.18-rc5
Date: Thu, 13 Nov 2014 17:15:37 +0100
Message-ID: <20141113161530.GA3613@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f114040e3ea6e07372334ade75d1ee0775c355e1:

  Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-3.18-fixes-for-rc5

for you to fetch changes up to 221b9bf42b26a22e6904d20f35c53aec2e73a646:

  ARM: tegra: roth: Fix SD card VDD_IO regulator (2014-11-13 16:58:53 +0100)

Thierry

----------------------------------------------------------------
ARM: tegra: Device tree fixes for v3.18-rc5

This contains the serial port numbering fixes that are required for the
serial port numbering to stay the same with or without the serial core
making use of the aliases defined in DT.

eMMC is also fixed for TN7 and Roth boards which were using the wrong
regulators.

----------------------------------------------------------------
Alexandre Courbot (2):
      ARM: tegra: Remove eMMC vmmc property for roth/tn7
      ARM: tegra: roth: Fix SD card VDD_IO regulator

Lucas Stach (1):
      ARM: tegra: Add serial port labels to Tegra124 DT

Olof Johansson (1):
      ARM: dts: tegra: move serial aliases to per-board

 arch/arm/boot/dts/tegra114-dalmore.dts        | 1 +
 arch/arm/boot/dts/tegra114-roth.dts           | 9 +++++----
 arch/arm/boot/dts/tegra114-tn7.dts            | 5 ++++-
 arch/arm/boot/dts/tegra114.dtsi               | 7 -------
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     | 1 +
 arch/arm/boot/dts/tegra124-nyan-big.dts       | 1 +
 arch/arm/boot/dts/tegra124-venice2.dts        | 1 +
 arch/arm/boot/dts/tegra124.dtsi               | 8 ++++----
 arch/arm/boot/dts/tegra20-harmony.dts         | 1 +
 arch/arm/boot/dts/tegra20-iris-512.dts        | 5 +++++
 arch/arm/boot/dts/tegra20-medcom-wide.dts     | 4 ++++
 arch/arm/boot/dts/tegra20-paz00.dts           | 2 ++
 arch/arm/boot/dts/tegra20-seaboard.dts        | 1 +
 arch/arm/boot/dts/tegra20-tamonten.dtsi       | 1 +
 arch/arm/boot/dts/tegra20-trimslice.dts       | 1 +
 arch/arm/boot/dts/tegra20-ventana.dts         | 1 +
 arch/arm/boot/dts/tegra20-whistler.dts        | 1 +
 arch/arm/boot/dts/tegra20.dtsi                | 8 --------
 arch/arm/boot/dts/tegra30-apalis-eval.dts     | 4 ++++
 arch/arm/boot/dts/tegra30-beaver.dts          | 1 +
 arch/arm/boot/dts/tegra30-cardhu.dtsi         | 2 ++
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 3 +++
 arch/arm/boot/dts/tegra30.dtsi                | 8 --------
 23 files changed, 44 insertions(+), 32 deletions(-)

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUZNkiAAoJEN0jrNd/PrOhDyIQAJqFNzTdbMO9G6mfS4qxKOGb
Z4fi+AOYxFGe8umDVN0OpQf0k1yATOeHxEEVRRMqc533MinniRQ6Lzs2qX3ffW8x
G3zjkeooeQ4miCGHC8TkHBVhx7mohNJWe3rRsJmD2pbjZuY0IP9lJ1PgHr+QWtIa
N8ap+gsM8RQP00IsdKOfkLpjjTHAx+29AMnF77SAcfbN/bAwjUE8t8scCxiohssl
pCHdyVXkurp+zNxL/cbWVtCvQU3ERcBkeCXH/R6FSptlIKrf+coCcXOP6CzYYjiT
15lSLMv+FlCWJu4Ok5CLTF5IxarQbgHaVSTgXH1MIot8zSD9yM+3pajH+qpd40C4
PE/S4f5KfWH2AIhtJ1cVA91hlQqqA/A0kGC7XnJOsl8wgByc0B2NZAK19nbkgx1F
UdH2hAfGG/kroI1yUgRUGo84cfwZDM0FjHBy0f/t/cz9YTRxlYIlUv4UH1y5tqwI
54hVNnl0uY6rzcJeNjoSQw77vLJNkCpFx67SHG+TmHH6MhKcspVs27RoQ0ZMPbT8
ZOSFTKfVzOhaom/xl8nCaxuQn9NzOuFoGEVErdK0DJFhizWrAloy3Vfgq8Zw+Aij
u/ZgL5gDgQqLcAoO3qc1p4u/eig5gZ6L4ZBxHcZn3sXFQnfCPmuDhO9IJqw3JjHJ
TKieW56VObXypx+aQhs6
=IjJX
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
