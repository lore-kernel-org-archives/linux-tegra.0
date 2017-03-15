From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] soc/tegra: Enable flowctrl support for Tegra132/210
Date: Wed, 15 Mar 2017 13:31:50 +0000
Message-ID: <1489584715-23138-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The flowctrl modules is supported by both Tegra132 and Tegra210 devices.
These devices already have the flowctrl node defined in their respective
*.dtsi device-tree files. The flowctrl driver is currently located in
the arch/arm/mach-tegra directory and so can only be used for 32-bit
Tegra devices. Move this driver into drivers/soc/tegra so that it can
be used for all Tegra devices that support flowctrl.

I have also added a couple clean-up patches.

Jon Hunter (5):
  ARM: tegra: WARN if flowctrl is not supported
  ARM: tegra: Remove unnecessary inclusion of flowctrl header
  soc/tegra: Move Tegra flowctrl driver
  dt-bindings: tegra: Update compatible strings for Tegra flowctrl
  soc/tegra: Add initial flowctrl support for Tegra210

 .../bindings/arm/tegra/nvidia,tegra20-flowctrl.txt |   8 +-
 arch/arm/mach-tegra/Kconfig                        |   1 +
 arch/arm/mach-tegra/Makefile                       |   1 -
 arch/arm/mach-tegra/cpuidle-tegra20.c              |   3 +-
 arch/arm/mach-tegra/flowctrl.c                     | 171 -------------------
 arch/arm/mach-tegra/flowctrl.h                     |  66 --------
 arch/arm/mach-tegra/platsmp.c                      |   2 +-
 arch/arm/mach-tegra/pm.c                           |   2 +-
 arch/arm/mach-tegra/reset-handler.S                |   2 +-
 arch/arm/mach-tegra/sleep-tegra20.S                |   3 +-
 arch/arm/mach-tegra/sleep-tegra30.S                |   2 +-
 arch/arm/mach-tegra/sleep.S                        |   2 -
 arch/arm/mach-tegra/tegra.c                        |   2 -
 drivers/soc/tegra/Kconfig                          |   5 +
 drivers/soc/tegra/Makefile                         |   1 +
 drivers/soc/tegra/flowctrl.c                       | 187 +++++++++++++++++++++
 include/soc/tegra/flowctrl.h                       |  62 +++++++
 17 files changed, 271 insertions(+), 249 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/flowctrl.c
 delete mode 100644 arch/arm/mach-tegra/flowctrl.h
 create mode 100644 drivers/soc/tegra/flowctrl.c
 create mode 100644 include/soc/tegra/flowctrl.h

-- 
2.7.4
