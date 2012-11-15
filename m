From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 0/3] ARM: tegra: defconfig updates for 3.8
Date: Thu, 15 Nov 2012 22:44:51 +0100
Message-ID: <1353015894-20003-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The following set of patches enables the Tegra DRM driver along with the
framebuffer console and the PWM backlight driver to light up panels that
are driven by the DRM driver. A third patch enables SquashFS, which is
used as the root filesystem on Tamonten-based boards.

Thierry

Thierry Reding (3):
  ARM: tegra: Update default configuration (backlight)
  ARM: tegra: Update default configuration (DRM)
  ARM: tegra: Update default configuration (squashfs)

 arch/arm/configs/tegra_defconfig | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
1.8.0
