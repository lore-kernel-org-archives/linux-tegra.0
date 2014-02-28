From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 4/7] ARM: dts: exynos5440: fix PCIe interrupt mapping
Date: Fri, 28 Feb 2014 18:28:40 +0100
Message-ID: <1393608523-17509-5-git-send-email-l.stach@pengutronix.de>
References: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
Sender: linux-sh-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, linux-sh@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Simon Horman <horms@verge.net.au>, Shawn Guo <shawn.guo@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Jingoo Han <jg1.han@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Tim Harvey <tharvey@gateworks.com>, Richard Zhu <r65037@freescale.com>, Arnd Bergmann <arnd@arndb.de>, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org

So it actually works.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm/boot/dts/exynos5440.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 02a0a1226cef..65d425d9ec27 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -274,7 +274,7 @@
 			  0x82000000 0 0x40011000 0x40011000 0 0x1ffef000>; /* non-prefetchable memory */
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0x0 0 &gic 53>;
+		interrupt-map = <0 0 0 0 &gic GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 		num-lanes = <4>;
 		status = "disabled";
 	};
@@ -295,7 +295,7 @@
 			  0x82000000 0 0x60011000 0x60011000 0 0x1ffef000>; /* non-prefetchable memory */
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0x0 0 &gic 56>;
+		interrupt-map = <0 0 0 0 &gic GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 		num-lanes = <4>;
 		status = "disabled";
 	};
-- 
1.8.5.3

