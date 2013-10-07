From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/9] ARM: tegra: Enable DSI and panel support
Date: Mon,  7 Oct 2013 13:48:39 +0200
Message-ID: <1381146528-18069-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series enables DSI, HDMI and gr2d support on Dalmore as well as
panel support for Cardhu and Harmony.

The DRM_PANEL and DRM_PANEL_SIMPLE Kconfig symbols enabled in patch 9
are introduced by the following patch series:

	[PATCH v2 00/27] drm/tegra: Repatriation and DSI support

Perhaps a good solution would be to postpone applying patch 9 until
after 3.13-rc1, so that the symbols are there when the above series
has gone in during the merge window.

Thierry

Mikko Perttunen (2):
  ARM: tegra: Add host1x, DC and HDMI to Tegra114 device tree
  ARM: tegra: Enable HDMI support on Dalmore

Thierry Reding (7):
  ARM: tegra: Enable LVDS and HDMI on Cardhu
  ARM: tegra: Enable LVDS output on Harmony
  ARM: tegra: Add MIPI calibration DT entries for Tegra114
  ARM: tegra: Add Tegra114 DSI support
  ARM: tegra: Add Tegra114 gr2d support
  ARM: tegra: Enable DSI support on Dalmore
  ARM: tegra: Enable DRM panel support

 arch/arm/boot/dts/tegra114-dalmore.dts         | 74 +++++++++++++++++------
 arch/arm/boot/dts/tegra114.dtsi                | 84 ++++++++++++++++++++++++++
 arch/arm/boot/dts/tegra20-harmony.dts          | 40 +++++++++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi          | 52 +++++++++++++++-
 arch/arm/configs/tegra_defconfig               |  2 +
 include/dt-bindings/gpu/host1x/tegra114-mipi.h | 11 ++++
 6 files changed, 240 insertions(+), 23 deletions(-)
 create mode 100644 include/dt-bindings/gpu/host1x/tegra114-mipi.h

-- 
1.8.4
