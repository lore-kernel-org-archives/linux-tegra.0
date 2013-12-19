From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/10] ARM: tegra: DSI and panel support
Date: Thu, 19 Dec 2013 16:59:24 +0100
Message-ID: <1387468774-14216-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series of patches add support for Tegra114 display, DSI, HDMI, gr2d
and gr3d. Both DSI and HDMI outputs are enabled on Dalmore.

The LVDS panels on Harmony and Cardhu are added to the corresponding DTS
files and support for panels is enabled in the Tegra defconfig.

Thierry

Mikko Perttunen (2):
  ARM: tegra: Add host1x, DC and HDMI to Tegra114 device tree
  ARM: tegra: Enable HDMI support on Dalmore

Thierry Reding (8):
  ARM: tegra: Enable LVDS on Harmony
  ARM: tegra: Enable LVDS on Cardhu
  ARM: tegra: Add MIPI calibration DT entries for Tegra114
  ARM: tegra: Add Tegra114 DSI support
  ARM: tegra: Add Tegra114 gr2d support
  ARM: tegra: Add Tegra114 gr3d support
  ARM: tegra: Enable DSI support on Dalmore
  ARM: tegra: Enable DRM panel support

 arch/arm/boot/dts/tegra114-dalmore.dts |  59 +++++++++++++----
 arch/arm/boot/dts/tegra114.dtsi        | 113 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/tegra20-harmony.dts  |  36 ++++++++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi  |  37 ++++++++++-
 arch/arm/configs/tegra_defconfig       |   2 +
 5 files changed, 232 insertions(+), 15 deletions(-)

-- 
1.8.4.2
