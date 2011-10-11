From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/4] arm/tegra: Convert GPIO and pinmux to platform devs
Date: Tue, 11 Oct 2011 14:23:54 -0600
Message-ID: <1318364638-20191-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

v2: Convert GPIO driver to ioremap its registers instead of using static
mappings. The pinmux driver doesn't do this yet, but will soon. However,
the pinmux register resources/DT-properties are set up correctly for when
the driver is converted. Also, add back initialization of
tegra_gpio_chip.of_node.

Stephen Warren (4):
  arm/tegra: Prep boards for gpio/pinmux conversion to pdevs
  arm/dt: Tegra: Add pinmux node to tegra20.dtsi
  gpio/tegra: Convert to a platform device
  arm/tegra: Convert pinmux driver to a platform device

 .../devicetree/bindings/pinmux/pinmux_nvidia.txt   |    5 +
 arch/arm/boot/dts/tegra20.dtsi                     |    8 +
 arch/arm/mach-tegra/board-harmony-pinmux.c         |    8 +
 arch/arm/mach-tegra/board-paz00-pinmux.c           |    8 +
 arch/arm/mach-tegra/board-seaboard-pinmux.c        |    9 +-
 arch/arm/mach-tegra/board-trimslice-pinmux.c       |    7 +
 arch/arm/mach-tegra/devices.c                      |   84 ++++++++++++
 arch/arm/mach-tegra/devices.h                      |    2 +
 arch/arm/mach-tegra/pinmux.c                       |   26 ++++
 drivers/gpio/gpio-tegra.c                          |  142 +++++++++++++-------
 10 files changed, 250 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinmux/pinmux_nvidia.txt
