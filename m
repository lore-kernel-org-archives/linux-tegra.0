From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 28/37] ARM: tegra: colibri_t20: simplify model and compatible properties
Date: Sun,  2 Sep 2018 12:08:57 +0200
Message-ID: <20180902100906.25792-29-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Simplify model and compatible by dropping the 256/512 MB from the model
and -512 from the compatible properties to be more in-line with all our
other device trees.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Also reflect this change in the Iris device tree.
- Also reflect this change in the device tree bindings documentation.

 Documentation/devicetree/bindings/arm/tegra.txt | 2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts      | 4 ++--
 arch/arm/boot/dts/tegra20-colibri.dtsi          | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.txt b/Documentation/devicetree/bindings/arm/tegra.txt
index 1c90cb32da19..5e1b0b30ece2 100644
--- a/Documentation/devicetree/bindings/arm/tegra.txt
+++ b/Documentation/devicetree/bindings/arm/tegra.txt
@@ -53,7 +53,7 @@ board-specific compatible values:
   toradex,apalis-tk1-eval
   toradex,apalis-tk1-v1.2
   toradex,apalis-tk1-v1.2-eval
-  toradex,colibri_t20-512
+  toradex,colibri_t20
   toradex,colibri_t30
   toradex,colibri_t30-eval-v3
   toradex,iris
diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index 1583d5118302..cd47ac5b528f 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -5,8 +5,8 @@
 #include "tegra20-colibri.dtsi"
 
 / {
-	model = "Toradex Colibri T20 256/512 MB on Iris";
-	compatible = "toradex,iris", "toradex,colibri_t20-512", "nvidia,tegra20";
+	model = "Toradex Colibri T20 on Iris";
+	compatible = "toradex,iris", "toradex,colibri_t20", "nvidia,tegra20";
 
 	aliases {
 		rtc0 = "/i2c@7000c000/rtc@68";
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index ea785f65c89f..53e06f31dbea 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -8,8 +8,8 @@
  * Colibri T20 512MB IT V1.2A
  */
 / {
-	model = "Toradex Colibri T20 256/512 MB";
-	compatible = "toradex,colibri_t20-512", "nvidia,tegra20";
+	model = "Toradex Colibri T20";
+	compatible = "toradex,colibri_t20", "nvidia,tegra20";
 
 	memory@0 {
 		/*
-- 
2.14.4
