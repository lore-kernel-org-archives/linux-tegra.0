From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v5 5/5] ARM: tegra: Add Avionic Design Tamonten Evaluation Carrier support
Date: Thu, 20 Sep 2012 17:06:09 +0200
Message-ID: <1348153569-19083-5-git-send-email-thierry.reding@avionic-design.de>
References: <1348153569-19083-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348153569-19083-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The Tamonten Evaluation Carrier is an evaluation board for the Tamonten
SOM. More information is available here:

	http://www.avionic-design.de/en/products/nvidia-tegra-tamonten-system-en/nvidia-tegra-tamonten-evboard-en.html

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Changes in v5:
- remove nvidia,{ext,int}-mic-en-gpios properties

Changes in v4:
- based on tegra20-tamonten.dtsi
- rename compatible of sound property to match device
---
 arch/arm/boot/dts/tegra20-tec.dts | 53 +++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/Makefile.boot |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra20-tec.dts

diff --git a/arch/arm/boot/dts/tegra20-tec.dts b/arch/arm/boot/dts/tegra20-tec.dts
new file mode 100644
index 0000000..9aff31b
--- /dev/null
+++ b/arch/arm/boot/dts/tegra20-tec.dts
@@ -0,0 +1,53 @@
+/dts-v1/;
+
+/include/ "tegra20-tamonten.dtsi"
+
+/ {
+	model = "Avionic Design Tamonten Evaluation Carrier";
+	compatible = "ad,tec", "ad,tamonten", "nvidia,tegra20";
+
+	i2c@7000c000 {
+		clock-frequency = <400000>;
+		status = "okay";
+
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
+	sound {
+		compatible = "ad,tegra-audio-wm8903-tec",
+			     "nvidia,tegra-audio-wm8903";
+		nvidia,model = "Avionic Design TEC";
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
+	};
+};
diff --git a/arch/arm/mach-tegra/Makefile.boot b/arch/arm/mach-tegra/Makefile.boot
index 020548a..54c16aa 100644
--- a/arch/arm/mach-tegra/Makefile.boot
+++ b/arch/arm/mach-tegra/Makefile.boot
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-medcom-wide.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-paz00.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-plutux.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-seaboard.dtb
+dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-tec.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-trimslice.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-ventana.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += tegra20-whistler.dtb
-- 
1.7.12
