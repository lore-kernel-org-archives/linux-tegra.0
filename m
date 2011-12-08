From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC 0/3] pinctrl: add a driver for NVIDIA Tegra
Date: Thu,  8 Dec 2011 15:13:07 -0700
Message-ID: <1323382390-14892-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This isn't quite ready for merging yet; there are some issues that need
to be sorted out w.r.t. how to replace the existing Tegra pinmux driver
first. However, I figured it'd be good to get a review of the pinctrl
driver itself now that it should be complete.

The first patch is the driver. The other 2 patches are hacks that I use
to test it, just in case anyone is interested. Patch 2 would be fixed
before actually submitting, and patch 3 dropped.

Stephen Warren (3):
  pinctrl: add a driver for NVIDIA Tegra
  arm/tegra: Select PINMUX Kconfig variables
  New pinmux testing hacks

 arch/arm/boot/dts/tegra20.dtsi                   |    8 +
 arch/arm/mach-tegra/Kconfig                      |    3 +
 arch/arm/mach-tegra/include/mach/pinconf-tegra.h |   58 +
 arch/arm/mach-tegra/pinmux.c                     |    2 +
 drivers/pinctrl/Kconfig                          |   15 +
 drivers/pinctrl/Makefile                         |    3 +
 drivers/pinctrl/pinctrl-tegra.c                  |  604 ++++
 drivers/pinctrl/pinctrl-tegra.h                  |   83 +
 drivers/pinctrl/pinctrl-tegra20.c                | 2731 +++++++++++++++++
 drivers/pinctrl/pinctrl-tegra30.c                | 3387 ++++++++++++++++++++++
 10 files changed, 6894 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-tegra/include/mach/pinconf-tegra.h
 create mode 100644 drivers/pinctrl/pinctrl-tegra.c
 create mode 100644 drivers/pinctrl/pinctrl-tegra.h
 create mode 100644 drivers/pinctrl/pinctrl-tegra20.c
 create mode 100644 drivers/pinctrl/pinctrl-tegra30.c
