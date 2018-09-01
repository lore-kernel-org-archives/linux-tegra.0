From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 18/19] ARM: tegra: apalis-tk1: shorten temperature-sensor node
Date: Sat,  1 Sep 2018 15:05:03 +0200
Message-ID: <20180901130504.14318-19-marcel@ziswiler.com>
References: <20180901130504.14318-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901130504.14318-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Shorten temperature-sensor node to just temp-sensor as suggested
in the binding documentation.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch.

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 7fe61f1baadd..367eb8c86098 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1745,7 +1745,7 @@
 		 * TMP451 temperature sensor
 		 * Note: THERM_N directly connected to AS3722 PMIC THERM
 		 */
-		temperature-sensor@4c {
+		temp-sensor@4c {
 			compatible = "ti,tmp451";
 			reg = <0x4c>;
 			interrupt-parent = <&gpio>;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 62af3dc97ede..13c93cd507d8 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1775,7 +1775,7 @@
 		 * TMP451 temperature sensor
 		 * Note: THERM_N directly connected to AS3722 PMIC THERM
 		 */
-		temperature-sensor@4c {
+		temp-sensor@4c {
 			compatible = "ti,tmp451";
 			reg = <0x4c>;
 			interrupt-parent = <&gpio>;
-- 
2.14.4
