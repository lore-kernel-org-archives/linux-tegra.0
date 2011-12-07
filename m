From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 8/8] arm/dt: tegra: Enable audio on WM8903 boards, disable others
Date: Wed,  7 Dec 2011 15:13:53 -0700
Message-ID: <1323296033-28730-15-git-send-email-swarren@nvidia.com>
References: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323296033-28730-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add complete bindings to instantiate and configure the codec and
top-level audio complex on all currently supported boards using the
Tegra+WM8903 audio driver.

On those boards, disable the I2S2 controller since it isn't used.

On boards not using the WM8903 codec, disable all the audio devices;
they can be re-enabled once the relevant codec and ASoC machine drivers
have been ported to device-tree.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-harmony.dts   |   42 ++++++++++++++++++++++++-------
 arch/arm/boot/dts/tegra-paz00.dts     |   12 +++++++++
 arch/arm/boot/dts/tegra-seaboard.dts  |   41 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/tegra-trimslice.dts |   12 +++++++++
 arch/arm/boot/dts/tegra-ventana.dts   |   43 +++++++++++++++++++++++++++++++++
 5 files changed, 140 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
index 80afa1b..b098d40 100644
--- a/arch/arm/boot/dts/tegra-harmony.dts
+++ b/arch/arm/boot/dts/tegra-harmony.dts
@@ -13,16 +13,18 @@
 	i2c@7000c000 {
 		clock-frequency = <400000>;
 
-		codec: wm8903@1a {
+		wm8903: wm8903@1a {
 			compatible = "wlf,wm8903";
 			reg = <0x1a>;
-			interrupts = < 347 >;
+			interrupt-parent = <&gpio>;
+			interrupts = < 187 0x04 >;
 
 			gpio-controller;
 			#gpio-cells = <2>;
 
-			/* 0x8000 = Not configured */
-			gpio-cfg = < 0x8000 0x8000 0 0x8000 0x8000 >;
+			micdet-cfg = <0>;
+			micdet-delay = <100>;
+			gpio-cfg = < 0xffffffff 0xffffffff 0 0xffffffff 0xffffffff >;
 		};
 	};
 
@@ -38,13 +40,33 @@
 		clock-frequency = <400000>;
 	};
 
-	sound {
-		compatible = "nvidia,harmony-sound", "nvidia,tegra-wm8903";
+	i2s@70002a00 {
+		status = "disable";
+	};
 
-		spkr-en-gpios = <&codec 2 0>;
-		hp-det-gpios = <&gpio 178 0>;
-		int-mic-en-gpios = <&gpio 184 0>;
-		ext-mic-en-gpios = <&gpio 185 0>;
+	sound {
+		compatible = "nvidia,tegra-audio-wm8903-harmony",
+			     "nvidia,tegra-audio-wm8903",
+			     "generic,soc-audio-complex";
+		user-visible-name = "tegra-wm8903-harmony";
+
+		audio-routing =
+			"Headphone Jack", "HPOUTR",
+			"Headphone Jack", "HPOUTL",
+			"Int Spk", "ROP",
+			"Int Spk", "RON",
+			"Int Spk", "LOP",
+			"Int Spk", "LON",
+			"Mic Jack", "MICBIAS",
+			"IN1L", "Mic Jack";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&wm8903>;
+
+		nvidia,spkr-en-gpios = <&wm8903 2 0>;
+		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
+		nvidia,int-mic-en-gpios = <&gpio 184 0>; /*gpio PX0 */
+		nvidia,ext-mic-en-gpios = <&gpio 185 0>; /* gpio PX1 */
 	};
 
 	serial@70006000 {
diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index 1a1d702..4d1bcdc 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -37,6 +37,18 @@
 		clock-frequency = <400000>;
 	};
 
+	i2s@70002800 {
+		status = "disable";
+	};
+
+	i2s@70002a00 {
+		status = "disable";
+	};
+
+	das@70000c00 {
+		status = "disable";
+	};
+
 	serial@70006000 {
 		clock-frequency = <216000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
index f552bcc..d6ea0ea 100644
--- a/arch/arm/boot/dts/tegra-seaboard.dts
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -13,6 +13,20 @@
 
 	i2c@7000c000 {
 		clock-frequency = <400000>;
+
+		wm8903: wm8903@1a {
+			compatible = "wlf,wm8903";
+			reg = <0x1a>;
+			interrupt-parent = <&gpio>;
+			interrupts = < 187 0x04 >;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			micdet-cfg = <0>;
+			micdet-delay = <100>;
+			gpio-cfg = < 0xffffffff 0xffffffff 0 0xffffffff 0xffffffff >;
+		};
 	};
 
 	i2c@7000c400 {
@@ -27,6 +41,33 @@
 		clock-frequency = <400000>;
 	};
 
+	i2s@70002a00 {
+		status = "disable";
+	};
+
+	sound {
+		compatible = "nvidia,tegra-audio-wm8903-seaboard",
+			     "nvidia,tegra-audio-wm8903",
+			     "generic,soc-audio-complex";
+		user-visible-name = "tegra-wm8903-seaboard";
+
+		audio-routing =
+			"Headphone Jack", "HPOUTR",
+			"Headphone Jack", "HPOUTL",
+			"Int Spk", "ROP",
+			"Int Spk", "RON",
+			"Int Spk", "LOP",
+			"Int Spk", "LON",
+			"Mic Jack", "MICBIAS",
+			"IN1R", "Mic Jack";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&wm8903>;
+
+		nvidia,spkr-en-gpios = <&wm8903 2 0>;
+		nvidia,hp-det-gpios = <&gpio 185 0>; /* gpio PX1 */
+	};
+
 	serial@70006000 {
 		status = "disable";
 	};
diff --git a/arch/arm/boot/dts/tegra-trimslice.dts b/arch/arm/boot/dts/tegra-trimslice.dts
index 3b3ee7d..2524768 100644
--- a/arch/arm/boot/dts/tegra-trimslice.dts
+++ b/arch/arm/boot/dts/tegra-trimslice.dts
@@ -26,6 +26,18 @@
 		status = "disable";
 	};
 
+	i2s@70002800 {
+		status = "disable";
+	};
+
+	i2s@70002a00 {
+		status = "disable";
+	};
+
+	das@70000c00 {
+		status = "disable";
+	};
+
 	serial@70006000 {
 		clock-frequency = < 216000000 >;
 	};
diff --git a/arch/arm/boot/dts/tegra-ventana.dts b/arch/arm/boot/dts/tegra-ventana.dts
index c7d3b87..9e6c7eb 100644
--- a/arch/arm/boot/dts/tegra-ventana.dts
+++ b/arch/arm/boot/dts/tegra-ventana.dts
@@ -12,6 +12,20 @@
 
 	i2c@7000c000 {
 		clock-frequency = <400000>;
+
+		wm8903: wm8903@1a {
+			compatible = "wlf,wm8903";
+			reg = <0x1a>;
+			interrupt-parent = <&gpio>;
+			interrupts = < 187 0x04 >;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			micdet-cfg = <0>;
+			micdet-delay = <100>;
+			gpio-cfg = < 0xffffffff 0xffffffff 0 0xffffffff 0xffffffff >;
+		};
 	};
 
 	i2c@7000c400 {
@@ -26,6 +40,35 @@
 		clock-frequency = <400000>;
 	};
 
+	i2s@70002a00 {
+		status = "disable";
+	};
+
+	sound {
+		compatible = "nvidia,tegra-audio-wm8903-ventana",
+			     "nvidia,tegra-audio-wm8903",
+			     "generic,soc-audio-complex";
+		user-visible-name = "tegra-wm8903-ventana";
+
+		audio-routing =
+			"Headphone Jack", "HPOUTR",
+			"Headphone Jack", "HPOUTL",
+			"Int Spk", "ROP",
+			"Int Spk", "RON",
+			"Int Spk", "LOP",
+			"Int Spk", "LON",
+			"Mic Jack", "MICBIAS",
+			"IN1L", "Mic Jack";
+
+		nvidia,i2s-controller = <&tegra_i2s1>;
+		nvidia,audio-codec = <&wm8903>;
+
+		nvidia,spkr-en-gpios = <&wm8903 2 0>;
+		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
+		nvidia,int-mic-en-gpios = <&gpio 184 0>; /*gpio PX0 */
+		nvidia,ext-mic-en-gpios = <&gpio 185 0>; /* gpio PX1 */
+	};
+
 	serial@70006000 {
 		status = "disable";
 	};
-- 
1.7.0.4
