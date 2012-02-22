From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v3 00/10] Add PWM framework and device tree support.
Date: Wed, 22 Feb 2012 16:17:11 +0100
Message-ID: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series adds very rudimentary device-tree support for PWM
devices. With all of these patches applied (plus one board-specific
patch that is not included), I'm able to control the backlight on the
device I'm working on using the sysfs interface provided by the pwm-bl
driver and the backlight class.

This series is based on Sascha Hauer's series of patches[0] to add a
generic PWM framework. The first patch in this series is taken from
Sascha's branch, while the second patch enables each PWM chip to provide
multiple PWM devices (the Blackfin and PXA drivers have been ported to
the framework for reference). When this series is ready I think it would
be best to merge patches 1 and 2. Currently a global namespace is still
provided to keep backwards-compatibility with the legacy PWM API. In
order to achieve this, the number of global PWM devices is limited to
1024. However, patch 2 introduces per-chip indexing of PWM devices in
the core, so it should be easy to add an API to request a PWM device on
a per-chip basis and get rid of the global namespace eventually. The
device tree support code does not use the global namespace.

Patch 3 adds some code to lookup a PWM chip given its device-tree
handle. This code will be used later on by the pwm-bl driver to find the
PWM device that it should be using. Device tree binding documentation is
also provided.

Patch 4 was taken from the Chromium tree and is required to provide
proper clocking of the Tegra2 PWFM controller. All Chromium-specific
tags have been removed from the commit message. Some cleanup of the
clock registration for Tegra is done in patch 5 because a subsequent
patch will instantiate one PWFM controller device instead of four.

Patch 6 adds a generic PWM framework driver for the Tegra2 PWFM
controller. The code is taken from the Chromium tree with some
adjustments to integrate it with the PWM framework. Device tree based
probing of the driver is implemented in patch 7.

Patches 8 and 9 are ports of the Blackfin PWM and the PXA PWM drivers to
the PWM framework. These are only compile-tested as I do not have any
hardware to test them on. They are meant as test-bed for the framework.
Sascha already has patches that port all in-tree drivers to the
framework and will rebase them on top of this series when it is ready.

Patch 10 implements DT-based probing in the pwm-backlight driver. Note
that this code only handles the "pwm" property (by looking up the PWM
device via the new PWM DT binding). Switching power to the backlight via
GPIOs is not supported yet. The DT binding also deviates from the
platform data in that it requires a list of brightness levels to be
specified instead of assuming a linearily spaced range from 0 to a given
maximum brightness.

The whole series is based on the linux-next tree from 20120222. I think I've
addressed all of the concerns raised in the first two versions.

Thierry

[0]: http://git.pengutronix.de/?p=imx/linux-2.6.git;a=shortlog;h=refs/heads/pwmlib

Sascha Hauer (1):
  PWM: add pwm framework support

Simon Que (1):
  arm/tegra: Fix PWM clock programming

Thierry Reding (8):
  pwm: Allow chips to support multiple PWMs.
  of: Add PWM support.
  arm/tegra: Provide clock for only one PWM controller
  pwm: Add NVIDIA Tegra SoC support
  arm/tegra: Add PWFM controller device tree probing
  pwm: Add Blackfin support
  pwm: Add PXA support
  pwm-backlight: Add rudimentary device tree support

 Documentation/devicetree/bindings/pwm/pwm.txt      |   48 +++
 .../bindings/video/backlight/pwm-backlight         |   19 +
 Documentation/pwm.txt                              |   56 +++
 MAINTAINERS                                        |    6 +
 arch/arm/boot/dts/tegra20.dtsi                     |    6 +
 arch/arm/boot/dts/tegra30.dtsi                     |    6 +
 arch/arm/mach-tegra/board-dt-tegra20.c             |    1 +
 arch/arm/mach-tegra/board-dt-tegra30.c             |    3 +
 arch/arm/mach-tegra/clock.h                        |    1 +
 arch/arm/mach-tegra/tegra2_clocks.c                |   33 ++-
 arch/arm/plat-pxa/Makefile                         |    1 -
 arch/arm/plat-pxa/pwm.c                            |  304 ----------------
 arch/blackfin/Kconfig                              |   10 -
 arch/blackfin/kernel/Makefile                      |    1 -
 arch/blackfin/kernel/pwm.c                         |  100 -----
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    1 +
 drivers/of/Kconfig                                 |    6 +
 drivers/of/Makefile                                |    1 +
 drivers/of/pwm.c                                   |  130 +++++++
 drivers/pwm/Kconfig                                |   40 ++
 drivers/pwm/Makefile                               |    4 +
 drivers/pwm/core.c                                 |  381 ++++++++++++++++++++
 drivers/pwm/pwm-bfin.c                             |  164 +++++++++
 drivers/pwm/pwm-pxa.c                              |  244 +++++++++++++
 drivers/pwm/pwm-tegra.c                            |  263 ++++++++++++++
 drivers/video/backlight/Kconfig                    |    2 +-
 drivers/video/backlight/pwm_bl.c                   |  113 ++++++-
 include/linux/of_pwm.h                             |   51 +++
 include/linux/pwm.h                                |   89 +++++
 include/linux/pwm_backlight.h                      |    1 +
 31 files changed, 1652 insertions(+), 435 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm.txt
 create mode 100644 Documentation/devicetree/bindings/video/backlight/pwm-backlight
 create mode 100644 Documentation/pwm.txt
 delete mode 100644 arch/arm/plat-pxa/pwm.c
 delete mode 100644 arch/blackfin/kernel/pwm.c
 create mode 100644 drivers/of/pwm.c
 create mode 100644 drivers/pwm/Kconfig
 create mode 100644 drivers/pwm/Makefile
 create mode 100644 drivers/pwm/core.c
 create mode 100644 drivers/pwm/pwm-bfin.c
 create mode 100644 drivers/pwm/pwm-pxa.c
 create mode 100644 drivers/pwm/pwm-tegra.c
 create mode 100644 include/linux/of_pwm.h

-- 
1.7.9.1
