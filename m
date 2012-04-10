From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v6 00/17] Add PWM framework and device tree support
Date: Tue, 10 Apr 2012 17:06:23 +0200
Message-ID: <1334070400-25013-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
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
the framework for reference). Currently a global namespace is still
provided to keep backwards-compatibility with the legacy PWM API. In
order to achieve this, the number of global PWM devices is limited to
1024. However, patch 2 introduces per-chip indexing of PWM devices in
the core and patch 4 adds an API to request a PWM device using a lookup
table registered by board setup code. They are supposed to eventually
replace pwm_request() and allow to get rid of the global namespace. The
device tree support code does not use the global namespace.

Patch 3 adds a debugfs interface.

Patch 5 adds some code to lookup a PWM chip given its device-tree
handle. This code will be used later on by the pwm-bl driver to find the
PWM device that it should be using. If the no corresponding PWM chip is
available yet, the code returns EPROBE_DEFER to have users automatically
probed again later when the PWM provider may have become available.
Device tree binding documentation is also provided.

Patch 6 was taken from the Chromium tree and is required to provide
proper clocking of the Tegra2 PWFM controller. All Chromium-specific
tags have been removed from the commit message. Some cleanup of the
clock registration for Tegra is done in patch 7 because a subsequent
patch will instantiate one PWFM controller device instead of four.

Patch 8 adds a generic PWM framework driver for the Tegra2 PWFM
controller. The code is taken from the Chromium tree with some
adjustments to integrate it with the PWM framework. Device tree based
probing of the driver is implemented in patch 9.

Patches 10 and 11 are ports of the Blackfin PWM and the PXA PWM drivers
to the PWM framework. These are only compile-tested as I do not have any
hardware to test them on.

Patches 12, 13 and 14 move the i.MX, Samsung and VT8500 drivers over to
the framework. These are originally by Sascha Hauer and were updated to
take advantage of the multiple PWM devices per chip feature. Patch 15
adds support for Freescale MXS by Shawn Guo.

Patch 16 implements DT-based probing in the pwm-backlight driver. Note
that this code only handles the "pwms" property (by looking up the PWM
device via the new PWM DT binding). Switching power to the backlight via
GPIOs is not supported yet. The DT binding also deviates from the
platform data in that it requires a list of brightness levels to be
specified instead of assuming a linearily spaced range from 0 to a given
maximum brightness.

Finally, patch 17 makes me the new maintainer of the PWM subsystem.

The whole series is based on the linux-next tree from 20120405. I think
I've addressed all of the concerns raised in the first five versions. I
have also pushed this version of the series to the PWM subsystem
repository[1].

Thierry

[0]: http://git.pengutronix.de/?p=imx/linux-2.6.git;a=shortlog;h=refs/heads/pwmlib
[1]: http://gitorious.org/linux-pwm/linux-pwm/trees/pwm-v6

Sascha Hauer (4):
  pwm: Add PWM framework support
  ARM i.MX: Move i.MX pwm driver to pwm framework
  ARM Samsung: Move s3c pwm driver to pwm framework
  ARM vt8500: Move vt8500 pwm driver to pwm framework

Shawn Guo (1):
  pwm: add pwm-mxs support

Simon Que (1):
  ARM: tegra: Fix PWM clock programming

Thierry Reding (11):
  pwm: Allow chips to support multiple PWMs
  pwm: Add debugfs interface
  pwm: Add table-based lookup for static mappings
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
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    1 +
 drivers/pwm/Kconfig                                |   76 +++
 drivers/pwm/Makefile                               |    8 +
 drivers/pwm/core.c                                 |  712 ++++++++++++++++++++
 .../kernel/pwm.c => drivers/pwm/pwm-bfin.c         |  138 +++-
 arch/arm/plat-mxc/pwm.c => drivers/pwm/pwm-imx.c   |  182 ++---
 drivers/pwm/pwm-mxs.c                              |  207 ++++++
 arch/arm/plat-pxa/pwm.c => drivers/pwm/pwm-pxa.c   |  172 ++---
 .../pwm.c => drivers/pwm/pwm-samsung.c             |  228 +++----
 drivers/pwm/pwm-tegra.c                            |  265 ++++++++
 .../mach-vt8500/pwm.c => drivers/pwm/pwm-vt8500.c  |  169 ++---
 drivers/video/backlight/Kconfig                    |    2 +-
 drivers/video/backlight/pwm_bl.c                   |  149 +++-
 include/linux/pwm.h                                |  117 ++++
 include/linux/pwm_backlight.h                      |    1 +
 35 files changed, 2145 insertions(+), 575 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/mxs-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm.txt
 create mode 100644 Documentation/devicetree/bindings/video/backlight/pwm-backlight
 create mode 100644 Documentation/pwm.txt
 create mode 100644 drivers/pwm/Kconfig
 create mode 100644 drivers/pwm/Makefile
 create mode 100644 drivers/pwm/core.c
 rename arch/blackfin/kernel/pwm.c => drivers/pwm/pwm-bfin.c (26%)
 rename arch/arm/plat-mxc/pwm.c => drivers/pwm/pwm-imx.c (58%)
 create mode 100644 drivers/pwm/pwm-mxs.c
 rename arch/arm/plat-pxa/pwm.c => drivers/pwm/pwm-pxa.c (57%)
 rename arch/arm/plat-samsung/pwm.c => drivers/pwm/pwm-samsung.c (58%)
 create mode 100644 drivers/pwm/pwm-tegra.c
 rename arch/arm/mach-vt8500/pwm.c => drivers/pwm/pwm-vt8500.c (52%)

-- 
1.7.9.6
