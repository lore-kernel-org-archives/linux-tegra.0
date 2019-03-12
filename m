From: Philippe Schenker <dev@pschenker.ch>
Subject: [PATCH] ARM: dts: Add stmpe-adc DT node to Toradex T30 modules
Date: Tue, 12 Mar 2019 11:00:44 +0100
Message-ID: <20190312100044.2872-1-dev@pschenker.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Philippe Schenker <philippe.schenker@toradex.com>

Add the stmpe-adc DT node as found on Toradex T30 modules

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi | 22 ++++++++++++++--------
 arch/arm/boot/dts/tegra30-apalis.dtsi      | 22 ++++++++++++++--------
 arch/arm/boot/dts/tegra30-colibri.dtsi     | 22 ++++++++++++++--------
 3 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index 02f8126481a2..8b7a827d604d 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -994,11 +994,17 @@
 			id = <0>;
 			blocks = <0x5>;
 			irq-trigger = <0x1>;
+			/* 3.25 MHz ADC clock speed */
+			st,adc-freq = <1>;
+			/* 12-bit ADC */
+			st,mod-12b = <1>;
+			/* internal ADC reference */
+			st,ref-sel = <0>;
+			/* ADC converstion time: 80 clocks */
+			st,sample-time = <4>;
 
 			stmpe_touchscreen {
 				compatible = "st,stmpe-ts";
-				/* 3.25 MHz ADC clock speed */
-				st,adc-freq = <1>;
 				/* 8 sample average control */
 				st,ave-ctrl = <3>;
 				/* 7 length fractional part in z */
@@ -1008,17 +1014,17 @@
 				 * current limit value
 				 */
 				st,i-drive = <1>;
-				/* 12-bit ADC */
-				st,mod-12b = <1>;
-				/* internal ADC reference */
-				st,ref-sel = <0>;
-				/* ADC converstion time: 80 clocks */
-				st,sample-time = <4>;
 				/* 1 ms panel driver settling time */
 				st,settling = <3>;
 				/* 5 ms touch detect interrupt delay */
 				st,touch-det-delay = <5>;
 			};
+
+			stmpe_adc {
+				compatible = "st,stmpe-adc";
+				/* forbid to use ADC channels 3-0 (touch) */
+				st,norequest-mask = <0x0F>;
+			};
 		};
 
 		/*
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 7f112f192fe9..c18f6f61d764 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -976,11 +976,17 @@
 			id = <0>;
 			blocks = <0x5>;
 			irq-trigger = <0x1>;
+			/* 3.25 MHz ADC clock speed */
+			st,adc-freq = <1>;
+			/* 12-bit ADC */
+			st,mod-12b = <1>;
+			/* internal ADC reference */
+			st,ref-sel = <0>;
+			/* ADC converstion time: 80 clocks */
+			st,sample-time = <4>;
 
 			stmpe_touchscreen {
 				compatible = "st,stmpe-ts";
-				/* 3.25 MHz ADC clock speed */
-				st,adc-freq = <1>;
 				/* 8 sample average control */
 				st,ave-ctrl = <3>;
 				/* 7 length fractional part in z */
@@ -990,17 +996,17 @@
 				 * current limit value
 				 */
 				st,i-drive = <1>;
-				/* 12-bit ADC */
-				st,mod-12b = <1>;
-				/* internal ADC reference */
-				st,ref-sel = <0>;
-				/* ADC converstion time: 80 clocks */
-				st,sample-time = <4>;
 				/* 1 ms panel driver settling time */
 				st,settling = <3>;
 				/* 5 ms touch detect interrupt delay */
 				st,touch-det-delay = <5>;
 			};
+
+			stmpe_adc {
+				compatible = "st,stmpe-adc";
+				/* forbid to use ADC channels 3-0 (touch) */
+				st,norequest-mask = <0x0F>;
+			};
 		};
 
 		/*
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 35af03ca9e90..1f9198bb24ff 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -845,11 +845,18 @@
 			id = <0>;
 			blocks = <0x5>;
 			irq-trigger = <0x1>;
+			/* 3.25 MHz ADC clock speed */
+			st,adc-freq = <1>;
+			/* 12-bit ADC */
+			st,mod-12b = <1>;
+			/* internal ADC reference */
+			st,ref-sel = <0>;
+			/* ADC converstion time: 80 clocks */
+			st,sample-time = <4>;
+			/* forbid to use ADC channels 3-0 (touch) */
 
 			stmpe_touchscreen {
 				compatible = "st,stmpe-ts";
-				/* 3.25 MHz ADC clock speed */
-				st,adc-freq = <1>;
 				/* 8 sample average control */
 				st,ave-ctrl = <3>;
 				/* 7 length fractional part in z */
@@ -859,17 +866,16 @@
 				 * current limit value
 				 */
 				st,i-drive = <1>;
-				/* 12-bit ADC */
-				st,mod-12b = <1>;
-				/* internal ADC reference */
-				st,ref-sel = <0>;
-				/* ADC converstion time: 80 clocks */
-				st,sample-time = <4>;
 				/* 1 ms panel driver settling time */
 				st,settling = <3>;
 				/* 5 ms touch detect interrupt delay */
 				st,touch-det-delay = <5>;
 			};
+
+			stmpe_adc {
+				compatible = "st,stmpe-adc";
+				st,norequest-mask = <0x0F>;
+			};
 		};
 
 		/*
-- 
2.21.0
