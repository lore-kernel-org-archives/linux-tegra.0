From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 0/3] ARM: tegra: Enable HDMI on Tamonten carriers
Date: Fri, 16 Nov 2012 16:56:49 +0100
Message-ID: <1353081412-19448-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The three patches in this series enable the HDMI output on Plutux and
TEC. The Medcom-Wide only has an LVDS output and the TEC has an LVDS
output as well, but since they depend on the videomode helpers and the
power-sequences patch series, they will only be enabled in subsequent
patches.

Thierry

Thierry Reding (3):
  ARM: tegra: tamonten: Add host1x support
  ARM: tegra: plutux: Enable HDMI output
  ARM: tegra: tec: Enable HDMI output

 arch/arm/boot/dts/tegra20-plutux.dts    |  6 ++++++
 arch/arm/boot/dts/tegra20-tamonten.dtsi | 16 +++++++++++++---
 arch/arm/boot/dts/tegra20-tec.dts       |  6 ++++++
 3 files changed, 25 insertions(+), 3 deletions(-)

-- 
1.8.0
