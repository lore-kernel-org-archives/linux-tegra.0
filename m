From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] ARM: tegra: remove UART5/UARTE from tegra124.dtsi
Date: Thu,  1 May 2014 10:43:58 -0600
Message-ID: <1398962638-11928-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: stable@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@nvidia.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

(This is commit 862f0eea38409ff0d7f226c1245b787e3f0e2607 upstream)

Tegra124 only has 4 UARTs. Parts of the documentation hint at a fifth
UART, but this appears to be left-over from earlier SoC documentation.
Remove the non-existent DT node for UART5.

Cc: <stable@vger.kernel.org> # v3.13
Signed-off-by: Stephen Warren <swarren@nvidia.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This is a backport of the upstream commit specifically for 3.13.
The following commits in mainline follow on from this:
9ef1af9ea28c dt: tegra: remove non-existent clock IDs
9ba71705706a clk: tegra: remove non-existent clocks
... but are NOT needed in 3.13, since the files they edit were not yet
added in 3.13.
---
 arch/arm/boot/dts/tegra124.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index b7413004ee77..96ee0da24b22 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -87,14 +87,6 @@
 		status = "disabled";
 	};
 
-	serial@70006400 {
-		compatible = "nvidia,tegra124-uart", "nvidia,tegra20-uart";
-		reg = <0x70006400 0x40>;
-		reg-shift = <2>;
-		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
-		status = "disabled";
-	};
-
 	rtc@7000e000 {
 		compatible = "nvidia,tegra124-rtc", "nvidia,tegra20-rtc";
 		reg = <0x7000e000 0x100>;
-- 
1.8.1.5
