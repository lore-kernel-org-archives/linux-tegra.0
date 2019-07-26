From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/3] arm64: tegra: Add unit-address for CBB on Tegra194
Date: Fri, 26 Jul 2019 12:16:16 +0200
Message-ID: <20190726101618.26896-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The control back-bone (CBB) starts at physical address 0, so give it a
unit-address to comply with standard naming practices checked for by the
device tree compiler.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 20 +++++++++----------
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 62e07e1197cc..02f6a8f0d741 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -8,17 +8,17 @@
 	compatible = "nvidia,p2888", "nvidia,tegra194";
 
 	aliases {
-		sdhci0 = "/cbb/sdhci@3460000";
-		sdhci1 = "/cbb/sdhci@3400000";
+		sdhci0 = "/cbb@0/sdhci@3460000";
+		sdhci1 = "/cbb@0/sdhci@3400000";
 		serial0 = &tcu;
 		i2c0 = "/bpmp/i2c";
-		i2c1 = "/cbb/i2c@3160000";
-		i2c2 = "/cbb/i2c@c240000";
-		i2c3 = "/cbb/i2c@3180000";
-		i2c4 = "/cbb/i2c@3190000";
-		i2c5 = "/cbb/i2c@31c0000";
-		i2c6 = "/cbb/i2c@c250000";
-		i2c7 = "/cbb/i2c@31e0000";
+		i2c1 = "/cbb@0/i2c@3160000";
+		i2c2 = "/cbb@0/i2c@c240000";
+		i2c3 = "/cbb@0/i2c@3180000";
+		i2c4 = "/cbb@0/i2c@3190000";
+		i2c5 = "/cbb@0/i2c@31c0000";
+		i2c6 = "/cbb@0/i2c@c250000";
+		i2c7 = "/cbb@0/i2c@31e0000";
 	};
 
 	chosen {
@@ -26,7 +26,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	cbb {
+	cbb@0 {
 		ethernet@2490000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 23597d53c9c9..740aaf597115 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -10,7 +10,7 @@
 	model = "NVIDIA Jetson AGX Xavier Developer Kit";
 	compatible = "nvidia,p2972-0000", "nvidia,tegra194";
 
-	cbb {
+	cbb@0 {
 		aconnect {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index adebbbf36bd0..2597eb7f747b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -14,7 +14,7 @@
 	#size-cells = <2>;
 
 	/* control backbone */
-	cbb {
+	cbb@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.22.0
