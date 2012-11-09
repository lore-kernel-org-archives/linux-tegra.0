From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 0/2] Device tree updates for host1x support
Date: Fri,  9 Nov 2012 14:20:00 +0100
Message-ID: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This set of patches are in preparation for the Tegra DRM driver. They
add the necessary nodes to the DTSI files and setup the clocks necessary
for host1x and the display controllers to work properly. The AUXDATA
table is updated with the entries for the newly added nodes and the PLL
frequency tables are extended with some frequencies required to make a
few of the more common LVDS panel and HDMI display modes work.

By default, all output resources (RGB, HDMI, DSI and TVO) are disabled,
and individual boards need to enable those that they require.

Note that there has been talk to replace the frequency tables by an
algorithmic computation of the dividers in order to avoid endless
additions to these tables. No code has surfaced yet, but eventually this
should replace the static tables.

Thierry

Thierry Reding (2):
  ARM: tegra: Add Tegra20 host1x support
  ARM: tegra: Add Tegra30 host1x support

 arch/arm/boot/dts/tegra20.dtsi            | 87 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi            | 87 +++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-dt-tegra20.c    |  9 ++++
 arch/arm/mach-tegra/board-dt-tegra30.c    | 10 ++++
 arch/arm/mach-tegra/tegra20_clocks_data.c | 23 ++++----
 arch/arm/mach-tegra/tegra30_clocks_data.c | 11 ++--
 6 files changed, 214 insertions(+), 13 deletions(-)

-- 
1.8.0
