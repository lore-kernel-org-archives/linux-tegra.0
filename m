From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: set up /aliases entries for RTCs
Date: Tue, 17 Dec 2013 15:40:07 -0700
Message-ID: <1387320007-24263-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This ensures that the PMIC RTC provides the system time, rather than
the on-SoC RTC, which is not battery-backed.

tegra124-venice2.dts isn't touched yet since we haven't added any off-
SoC RTC device to its device tree.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114-dalmore.dts     | 5 +++++
 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 5 +++++
 arch/arm/boot/dts/tegra20-harmony.dts      | 5 +++++
 arch/arm/boot/dts/tegra20-paz00.dts        | 5 +++++
 arch/arm/boot/dts/tegra20-seaboard.dts     | 5 +++++
 arch/arm/boot/dts/tegra20-tamonten.dtsi    | 5 +++++
 arch/arm/boot/dts/tegra20-trimslice.dts    | 5 +++++
 arch/arm/boot/dts/tegra20-ventana.dts      | 5 +++++
 arch/arm/boot/dts/tegra20-whistler.dts     | 5 +++++
 arch/arm/boot/dts/tegra30-beaver.dts       | 5 +++++
 arch/arm/boot/dts/tegra30-cardhu.dtsi      | 5 +++++
 11 files changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 88be40cf8845..ca4485903b9d 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -7,6 +7,11 @@
 	model = "NVIDIA Tegra114 Dalmore evaluation board";
 	compatible = "nvidia,dalmore", "nvidia,tegra114";
 
+	aliases {
+		rtc0 = "/i2c@7000d000/tps65913@58";
+		rtc1 = "/rtc@7000e000";
+	};
+
 	memory {
 		reg = <0x80000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index 4bfd18bc01d6..8e0066ad9628 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -4,6 +4,11 @@
 	model = "Toradex Colibri T20 512MB";
 	compatible = "toradex,colibri_t20-512", "nvidia,tegra20";
 
+	aliases {
+		rtc0 = "/i2c@7000d000/tps6586x@34";
+		rtc1 = "/rtc@7000e000";
+	};
+
 	memory {
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index b02653da8bd7..6145f26a0ec5 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -7,6 +7,11 @@
 	model = "NVIDIA Tegra20 Harmony evaluation board";
 	compatible = "nvidia,harmony", "nvidia,tegra20";
 
+	aliases {
+		rtc0 = "/i2c@7000d000/tps6586x@34";
+		rtc1 = "/rtc@7000e000";
+	};
+
 	memory {
 		reg = <0x00000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 02923fb96fed..c7cd8e6802d7 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -7,6 +7,11 @@
 	model = "Toshiba AC100 / Dynabook AZ";
 	compatible = "compal,paz00", "nvidia,tegra20";
 
+	aliases {
+		rtc0 = "/i2c@7000d000/tps6586x@34";
+		rtc1 = "/rtc@7000e000";
+	};
+
 	memory {
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index 1204738dbf29..a11b6e7b4759 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -7,6 +7,11 @@
 	model = "NVIDIA Seaboard";
 	compatible = "nvidia,seaboard", "nvidia,tegra20";
 
+	aliases {
+		rtc0 = "/i2c@7000d000/tps6586x@34";
+		rtc1 = "/rtc@7000e000";
+	};
+
 	memory {
 		reg = <0x00000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index eb2f9aa211a2..a1b0d965757f 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -4,6 +4,11 @@
 	model = "Avionic Design Tamonten SOM";
 	compatible = "ad,tamonten", "nvidia,tegra20";
 
+	aliases {
+		rtc0 = "/i2c@7000d000/tps6586x@34";
+		rtc1 = "/rtc@7000e000";
+	};
+
 	memory {
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index ec36fafb0f90..216fa6d50c65 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -7,6 +7,11 @@
 	model = "Compulab TrimSlice board";
 	compatible = "compulab,trimslice", "nvidia,tegra20";
 
+	aliases {
+		rtc0 = "/i2c@7000c500/rtc@56";
+		rtc1 = "/rtc@7000e000";
+	};
+
 	memory {
 		reg = <0x00000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 0d83062b9be4..571d12e6ac2d 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -7,6 +7,11 @@
 	model = "NVIDIA Tegra20 Ventana evaluation board";
 	compatible = "nvidia,ventana", "nvidia,tegra20";
 
+	aliases {
+		rtc0 = "/i2c@7000d000/tps6586x@34";
+		rtc1 = "/rtc@7000e000";
+	};
+
 	memory {
 		reg = <0x00000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-whistler.dts b/arch/arm/boot/dts/tegra20-whistler.dts
index 813b04ef8717..1843725785c9 100644
--- a/arch/arm/boot/dts/tegra20-whistler.dts
+++ b/arch/arm/boot/dts/tegra20-whistler.dts
@@ -7,6 +7,11 @@
 	model = "NVIDIA Tegra20 Whistler evaluation board";
 	compatible = "nvidia,whistler", "nvidia,tegra20";
 
+	aliases {
+		rtc0 = "/i2c@7000d000/max8907@3c";
+		rtc1 = "/rtc@7000e000";
+	};
+
 	memory {
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 7e8562a8507d..d36c8212dcbf 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -6,6 +6,11 @@
 	model = "NVIDIA Tegra30 Beaver evaluation board";
 	compatible = "nvidia,beaver", "nvidia,tegra30";
 
+	aliases {
+		rtc0 = "/i2c@7000d000/tps65911@2d";
+		rtc1 = "/rtc@7000e000";
+	};
+
 	memory {
 		reg = <0x80000000 0x7ff00000>;
 	};
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index f3aab9eb6453..dfcc18adcfd7 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -27,6 +27,11 @@
 	model = "NVIDIA Tegra30 Cardhu evaluation board";
 	compatible = "nvidia,cardhu", "nvidia,tegra30";
 
+	aliases {
+		rtc0 = "/i2c@7000d000/tps6586x@34";
+		rtc1 = "/rtc@7000e000";
+	};
+
 	memory {
 		reg = <0x80000000 0x40000000>;
 	};
-- 
1.8.1.5
