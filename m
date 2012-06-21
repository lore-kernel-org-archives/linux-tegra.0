From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [GIT PULL] PWM subsystem
Date: Thu, 21 Jun 2012 10:36:51 +0200
Message-ID: <20120621083650.GA2529@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

The PWM subsystem patches have gone through a number of versions now and
all outstanding issues have been resolved. I believe that the subsystem
is ready for broader testing in linux-next. If all goes well I plan to
submit it to Linus during the 3.6 merge window.

I am not aware of any dependencies in linux-next. The two patches that
don't touch the PWM subsystem itself are OF related and have been acked
by Rob Herring who prefers that I take them through the PWM tree.

Please contact me if there are any issues with the tree.

The following changes since commit cfaf025112d3856637ff34a767ef785ef5cf2ca9:

  Linux 3.5-rc2 (2012-06-08 18:40:09 -0700)

are available in the git repository at:

  git://gitorious.org/linux-pwm/linux-pwm.git for-next

for you to fetch changes up to b5156ca503f9471449b941364bb2bc34fa355d5d:

  pwm: Take over maintainership of the PWM subsystem (2012-06-15 12:57:07 +0200)

----------------------------------------------------------------
Sascha Hauer (4):
      pwm: Add PWM framework support
      ARM i.MX: Move i.MX pwm driver to pwm framework
      ARM Samsung: Move s3c pwm driver to pwm framework
      ARM vt8500: Move vt8500 pwm driver to pwm framework

Shawn Guo (1):
      pwm: add pwm-mxs support

Simon Que (1):
      ARM: tegra: Fix PWM clock programming

Thierry Reding (13):
      pwm: Allow chips to support multiple PWMs
      pwm: Add debugfs interface
      pwm: Add table-based lookup for static mappings
      dt: Add empty of_property_match_string() function
      dt: Add empty of_parse_phandle_with_args() function
      pwm: Add device tree support
      ARM: tegra: Provide clock for only one PWM controller
      pwm: Add NVIDIA Tegra SoC support
      pwm: tegra: Add device tree support
      pwm: Move Blackfin PWM driver to PWM framework
      pwm: Move PXA PWM driver to PWM framework
      pwm-backlight: Add rudimentary device tree support
      pwm: Take over maintainership of the PWM subsystem

 Documentation/devicetree/bindings/pwm/mxs-pwm.txt  |   17 +
 .../devicetree/bindings/pwm/nvidia,tegra20-pwm.txt |   18 +
 Documentation/devicetree/bindings/pwm/pwm.txt      |   57 ++
 .../bindings/video/backlight/pwm-backlight         |   28 +
 Documentation/pwm.txt                              |   76 +++
 MAINTAINERS                                        |   12 +
 arch/arm/boot/dts/tegra20.dtsi                     |    6 +
 arch/arm/boot/dts/tegra30.dtsi                     |    6 +
 arch/arm/mach-tegra/board-dt-tegra20.c             |    1 +
 arch/arm/mach-tegra/board-dt-tegra30.c             |    3 +
 arch/arm/mach-tegra/tegra2_clocks.c                |   36 +-
 arch/arm/mach-tegra/tegra30_clocks.c               |    6 +-
 arch/arm/mach-vt8500/Makefile                      |    2 -
 arch/arm/plat-mxc/Kconfig                          |    6 -
 arch/arm/plat-mxc/Makefile                         |    1 -
 arch/arm/plat-pxa/Makefile                         |    1 -
 arch/arm/plat-samsung/Makefile                     |    4 -
 arch/blackfin/Kconfig                              |   10 -
 arch/blackfin/kernel/Makefile                      |    1 -
 arch/blackfin/kernel/pwm.c                         |  100 ---
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    1 +
 drivers/pwm/Kconfig                                |   76 +++
 drivers/pwm/Makefile                               |    8 +
 drivers/pwm/core.c                                 |  713 ++++++++++++++++++++
 drivers/pwm/pwm-bfin.c                             |  164 +++++
 arch/arm/plat-mxc/pwm.c => drivers/pwm/pwm-imx.c   |  183 ++---
 drivers/pwm/pwm-mxs.c                              |  207 ++++++
 arch/arm/plat-pxa/pwm.c => drivers/pwm/pwm-pxa.c   |  172 ++---
 .../pwm.c => drivers/pwm/pwm-samsung.c             |  230 +++----
 drivers/pwm/pwm-tegra.c                            |  265 ++++++++
 .../mach-vt8500/pwm.c => drivers/pwm/pwm-vt8500.c  |  169 ++---
 drivers/video/backlight/Kconfig                    |    2 +-
 drivers/video/backlight/pwm_bl.c                   |  149 +++-
 include/linux/of.h                                 |   16 +
 include/linux/pwm.h                                |  117 ++++
 include/linux/pwm_backlight.h                      |    1 +
 37 files changed, 2227 insertions(+), 639 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/mxs-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm.txt
 create mode 100644 Documentation/devicetree/bindings/video/backlight/pwm-backlight
 create mode 100644 Documentation/pwm.txt
 delete mode 100644 arch/blackfin/kernel/pwm.c
 create mode 100644 drivers/pwm/Kconfig
 create mode 100644 drivers/pwm/Makefile
 create mode 100644 drivers/pwm/core.c
 create mode 100644 drivers/pwm/pwm-bfin.c
 rename arch/arm/plat-mxc/pwm.c => drivers/pwm/pwm-imx.c (58%)
 create mode 100644 drivers/pwm/pwm-mxs.c
 rename arch/arm/plat-pxa/pwm.c => drivers/pwm/pwm-pxa.c (57%)
 rename arch/arm/plat-samsung/pwm.c => drivers/pwm/pwm-samsung.c (58%)
 create mode 100644 drivers/pwm/pwm-tegra.c
 rename arch/arm/mach-vt8500/pwm.c => drivers/pwm/pwm-vt8500.c (52%)

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP4t0iAAoJEN0jrNd/PrOh9wIQAKB8vLMD5aXKb6m7RvhBd7v5
KFfyDHO11ph9/99ykuXSkGdgI4IL5oPuZv6BL2FR1Ew99BfSzvx1p+QHbccQP/AE
ZrOd+e6PcFny2NfUvH5CFnCOYfER9bt0qUq1ydtECBB1bXjTnCJcx8mnqly+XNFE
FxZFOo/L7bck2x6lfPY/VayVWRgyqbPJs2tAADeQW2k9dCjsBw30rQNLpMfnOqPO
BLeyrPcGGb59MO3GOO5AoQOfrOp+aYxT/8oV/uW172oso/zTmjhSbRVwPvy6DVVs
pbaCvLAKG+yrP3ZvZP9EJpZTwI+qDUUFGBi7IIfCwyA4w0i7fegEcGXBHKI3YsML
S8uzeTKD1vGdZSaPPG4fxqWCKoEiGYE4T3bk4irm8mszkDRxkmZIsPb99me6H+/r
1l63afOitisntm2+yhIyXbEbSBV0fpOtCX4Jk0EqV3z4c86KSH/WFttJAMMl1WFE
pJ4PwlD1ttnbcKzpWtDzSwtESYC/qai2rTchLiJevuQQIDpn+hpqd4HpyvLRS0qa
nTv/1n3d2Fw5ar5ohH7BY24yj4pecmNtInQjC3LccpoeWPTla/oLSz9g5Oe5EDkt
QVLUlsd2CiExDufMESQwMwU5ry+LGSeXm4UORdHpczJ3qG5vZYqWTXgCAzw9w1MO
UOQYTqcttghbz9K+hG5F
=4Kkx
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
