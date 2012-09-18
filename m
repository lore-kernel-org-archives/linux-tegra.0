From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v4 4/5] ARM: tegra: Add Avionic Design Medcom-Wide support
Date: Tue, 18 Sep 2012 16:39:03 +0200
Message-ID: <1347979144-24462-4-git-send-email-thierry.reding@avionic-design.de>
References: <1347979144-24462-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347979144-24462-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The Medcom is a 16:9 15" terminal that is used for patient infotainment
in hospitals.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Changes in v4:
- based on tegra20-tamonten.dtsi
- rename compatible of sound property to match device
- rename DTS file to match device name

 arch/arm/boot/dts/tegra20-medcom-wide.dts | 60 +++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/Makefile.boot         |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra20-medcom-wide.dts

diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
new file mode 100644
index 0000000..d2ff5ab
--- /dev/null
+++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
@@ -0,0 +1,60 @@
+/dts-v1/;
+
+/include/ "tegra20-tamonten.dtsi"
+
+/ {
+	model = "Avionic Design Medcom-Wide board";
+	compatible = "ad,medcom-wide", "ad,tamonten", "nvidia,tegra20";
+
+	i2c@7000c000 {
+		wm8903: wm8903@1a {
+			compatible = "wlf,wm8903";
+			reg = <0x1a>;
+			interrupt-parent = <&gpio>;
+			interrupts = <187 0x04>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			micdet-cfg = <0>;
+			micdet-delay = <100>;
+			gpio-cfg = <0xffffffff
+				    0xffffffff
+				    0
+				    0xffffffff
+				    0xffffffff>;
+		};
+	};
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 5000000>;
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
+
+	sound {
+		compatible = "ad,tegra-audio-wm8903-medcom-wide",
+			     "nvidia,tegra-audio-wm8903";
+		nvidia,model = "Avionic Design Medcom-Wide";
+
+		nvidia,audio-routing =
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
+};
diff --git a/arch/arm/mach-tegra/Makefile.boot b/arch/arm/mach-tegra/Makefile.boot
index 63f1d61..020548a 100644
--- a/arch/arm/mach-tegra/Makefile.boot
+++ b/arch/arm/mach-tegra/Makefile.boot
@@ -3,6 +3,7 @@ params_phys-$(CONFIG_ARCH_TEGRA_2x_SOC)	:= 0x00000100
 initrd_phys-$(CONFIG_ARCH_TEGRA_2x_SOC)	:= 0x00800000
 
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-harmony.dtb
+dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-medcom-wide.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-paz00.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-plutux.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-seaboard.dtb
-- 
1.7.12
