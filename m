From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 00/13] ARM: tegra: Enable DSI, panel and 3D support
Date: Tue, 15 Oct 2013 17:27:50 +0200
Message-ID: <1381850883-12722-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series enables DSI, HDMI and gr2d support on Dalmore as well as
panel support for Cardhu and Harmony. gr3d support is also enabled on
Tegra20 through Tegra114.

I think I've addressed all comments from the initial version. A more
notable addition was that of gr3d support and a WIP patch for Tegra114
powergate support. I wanted to get some feedback on how to continue
with the powergate patch (array vs. map, see patch for details) before
finalizing it.

Thierry

Mikko Perttunen (2):
  ARM: tegra: Add host1x, DC and HDMI to Tegra114 device tree
  ARM: tegra: Enable HDMI support on Dalmore

Thierry Reding (11):
  ARM: tegra: Mark Tegra30 display controller compatible with Tegra20
  ARM: tegra: Enable LVDS and HDMI on Cardhu
  ARM: tegra: Enable LVDS output on Harmony
  ARM: tegra: Add MIPI calibration DT entries for Tegra114
  ARM: tegra: Add Tegra114 DSI support
  ARM: tegra: Add Tegra114 gr2d support
  ARM: tegra: Enable DSI support on Dalmore
  ARM: tegra: Enable DRM panel support
  ARM: tegra: Add Tegra114 gr3d support
  ARM: tegra: Use symbolic names for gr3d clocks
  WIP: ARM: tegra: Add Tegra114 powergate support

 arch/arm/boot/dts/tegra114-dalmore.dts | 58 +++++++++++++++++-----
 arch/arm/boot/dts/tegra114.dtsi        | 89 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/tegra20-harmony.dts  | 36 +++++++++++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi  | 50 ++++++++++++++++++-
 arch/arm/boot/dts/tegra30.dtsi         |  5 +-
 arch/arm/configs/tegra_defconfig       |  2 +
 arch/arm/mach-tegra/powergate.c        | 41 ++++++++++++++++
 include/linux/tegra-powergate.h        |  9 +++-
 8 files changed, 271 insertions(+), 19 deletions(-)

-- 
1.8.4
