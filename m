From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/10] ARM: tegra: Enable a bunch of functionality on Venice2
Date: Thu, 19 Dec 2013 17:06:12 +0100
Message-ID: <1387469182-14398-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This series of patches adds a device tree node for the PMIC on Venice2 along
with various regulators that are used for SD/MMC, eDP and USB. Note that the
first patch in this series conflicts with one already sent in by Laxman, but
when comparing both I noticed some discrepancies, so I'm posting the version
that I have tested with so that we can hopefully unify both.

There is also support for host1x and eDP on Tegra124 along with a panel node
for the Venice2. Keyboard support is also enabled by this series.

Finally the series enables the USB ports on Venice2.

Thierry

Thierry Reding (10):
  ARM: tegra: Add AS3722 PMIC on Venice2
  ARM: tegra: Hook up SDMMC3 power-supply on Venice2
  ARM: tegra: Add Tegra124 host1x support
  ARM: tegra: Add Tegra124 eDP support
  ARM: tegra: Enable eDP for Venice2
  ARM: tegra: Add SPI controller nodes for Tegra124
  ARM: tegra: Enable Venice2 keyboard
  ARM: tegra: Enable power key on Venice2
  ARM: tegra: Add Tegra124 USB support
  ARM: tegra: Enable USB on Venice2

 arch/arm/boot/dts/tegra124-venice2.dts | 399 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/tegra124.dtsi        | 252 +++++++++++++++++++++
 2 files changed, 651 insertions(+)

-- 
1.8.4.2
