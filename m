From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/3] ARM: Tegra: dt: Split out separate Tegra SoC DT
Date: Mon,  2 May 2011 12:50:30 -0600
Message-ID: <1304362231-21909-2-git-send-email-swarren@nvidia.com>
References: <1304362231-21909-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1304362231-21909-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

tegra250.dts describes everything within the Tegra SoC, but leaves all
optional devices disabled.

tegra-harmony.dts is now the configuration of the SoC for the board,
i.e. it enables the optional devices that are required for the board,
and provides any required platform data for those devics.

The prevents every Tegra board having to repeat all the basic internal
SoC wiring.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: Rebased on latest devicetree/test; incorporated changes from there
    into the new tegra250.dts.

 arch/arm/boot/dts/tegra-harmony.dts |   86 ++-----------------------------
 arch/arm/boot/dts/tegra250.dts      |   99 +++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 82 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra250.dts

diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
index 7fe007b..154649e 100644
--- a/arch/arm/boot/dts/tegra-harmony.dts
+++ b/arch/arm/boot/dts/tegra-harmony.dts
@@ -1,12 +1,11 @@
 /dts-v1/;
 
 /memreserve/ 0x1c000000 0x04000000;
-/include/ "skeleton.dtsi"
+/include/ "tegra250.dts"
 
 / {
 	model = "NVIDIA Tegra2 Harmony evaluation board";
 	compatible = "nvidia,harmony", "nvidia,tegra250";
-	interrupt-parent = <&intc>;
 
 	chosen {
 		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootwait";
@@ -17,97 +16,20 @@
 		reg = < 0x00000000 0x40000000 >;
 	};
 
-	amba {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		intc: interrupt-controller@50041000 {
-			compatible = "nvidia,tegra250-gic", "arm,gic";
-			interrupt-controller;
-			#interrupt-cells = <1>;
-			reg = < 0x50041000 0x1000 >,
-			      < 0x50040100 0x0100 >;
-		};
-	};
-
-	gpio: gpio@6000d000 {
-		compatible = "nvidia,tegra250-gpio";
-		reg = < 0x6000d000 0x1000 >;
-		interrupts = < 64 65 66 67 87 119 121 >;
-		#gpio-cells = <2>;
-		gpio-controller;
-	};
-
-	serial@70006000 {
-		compatible = "nvidia,tegra250-uart";
-		reg = <0x70006000 0x40>;
-		reg-shift = <2>;
-		interrupts = < 68 >;
-		status = "disabled";
-	};
-
-	serial@70006040 {
-		compatible = "nvidia,tegra250-uart";
-		reg = <0x70006040 0x40>;
-		reg-shift = <2>;
-		interrupts = < 69 >;
-		status = "disabled";
-	};
-
-	serial@70006200 {
-		compatible = "nvidia,tegra250-uart";
-		reg = <0x70006200 0x100>;
-		reg-shift = <2>;
-		interrupts = < 78 >;
-		status = "disabled";
-	};
-
 	serial@70006300 {
-		compatible = "nvidia,tegra250-uart";
-		reg = <0x70006300 0x100>;
-		reg-shift = <2>;
-		interrupts = < 122 >;
-
+		status = "ok";
 		clock-frequency = < 216000000 >;
 	};
 
-	serial@70006400 {
-		compatible = "nvidia,tegra250-uart";
-		reg = <0x70006400 0x100>;
-		reg-shift = <2>;
-		interrupts = < 123 >;
-		status = "disabled";
-	};
-
-	sdhci@c8000000 {
-		compatible = "nvidia,tegra250-sdhci";
-		reg = <0xc8000000 0x200>;
-		interrupts = < 46 >;
-		status = "disabled";
-	};
-
 	sdhci@c8000200 {
-		compatible = "nvidia,tegra250-sdhci";
-		reg = <0xc8000200 0x200>;
-		interrupts = < 47 >;
+		status = "ok";
 		gpios = <&gpio 69 0>, /* cd, gpio PI5 */
 			<&gpio 57 0>, /* wp, gpio PH1 */
 			<&gpio 155 0>; /* power, gpio PT3 */
 	};
 
-	sdhci@c8000400 {
-		compatible = "nvidia,tegra250-sdhci";
-		reg = <0xc8000400 0x200>;
-		interrupts = < 51 >;
-		status = "disabled";
-	};
-
 	sdhci@c8000600 {
-		compatible = "nvidia,tegra250-sdhci";
-		reg = <0xc8000600 0x200>;
-		interrupts = < 63 >;
+		status = "ok";
 		gpios = <&gpio 58 0>, /* cd, gpio PH2 */
 			<&gpio 59 0>, /* wp, gpio PH3 */
 			<&gpio 70 0>; /* power, gpio PI6 */
diff --git a/arch/arm/boot/dts/tegra250.dts b/arch/arm/boot/dts/tegra250.dts
new file mode 100644
index 0000000..f1801b8
--- /dev/null
+++ b/arch/arm/boot/dts/tegra250.dts
@@ -0,0 +1,99 @@
+/include/ "skeleton.dtsi"
+
+/ {
+	model = "NVIDIA Tegra 250";
+	compatible = "nvidia,tegra250";
+	interrupt-parent = <&intc>;
+
+	amba {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		intc: interrupt-controller@50041000 {
+			compatible = "nvidia,tegra250-gic", "arm,gic";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			reg = < 0x50041000 0x1000 >,
+			      < 0x50040100 0x0100 >;
+		};
+	};
+
+	gpio: gpio@6000d000 {
+		compatible = "nvidia,tegra250-gpio";
+		reg = < 0x6000d000 0x1000 >;
+		interrupts = < 64 65 66 67 87 119 121 >;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	serial@70006000 {
+		compatible = "nvidia,tegra250-uart";
+		reg = <0x70006000 0x40>;
+		reg-shift = <2>;
+		interrupts = < 68 >;
+		status = "disabled";
+	};
+
+	serial@70006040 {
+		compatible = "nvidia,tegra250-uart";
+		reg = <0x70006040 0x40>;
+		reg-shift = <2>;
+		interrupts = < 69 >;
+		status = "disabled";
+	};
+
+	serial@70006200 {
+		compatible = "nvidia,tegra250-uart";
+		reg = <0x70006200 0x100>;
+		reg-shift = <2>;
+		interrupts = < 78 >;
+		status = "disabled";
+	};
+
+	serial@70006300 {
+		compatible = "nvidia,tegra250-uart";
+		reg = <0x70006300 0x100>;
+		reg-shift = <2>;
+		interrupts = < 122 >;
+		status = "disabled";
+	};
+
+	serial@70006400 {
+		compatible = "nvidia,tegra250-uart";
+		reg = <0x70006400 0x100>;
+		reg-shift = <2>;
+		interrupts = < 123 >;
+		status = "disabled";
+	};
+
+	sdhci@c8000000 {
+		compatible = "nvidia,tegra250-sdhci";
+		reg = <0xc8000000 0x200>;
+		interrupts = < 46 >;
+		status = "disabled";
+	};
+
+	sdhci@c8000200 {
+		compatible = "nvidia,tegra250-sdhci";
+		reg = <0xc8000200 0x200>;
+		interrupts = < 47 >;
+		status = "disabled";
+	};
+
+	sdhci@c8000400 {
+		compatible = "nvidia,tegra250-sdhci";
+		reg = <0xc8000400 0x200>;
+		interrupts = < 51 >;
+		status = "disabled";
+	};
+
+	sdhci@c8000600 {
+		compatible = "nvidia,tegra250-sdhci";
+		reg = <0xc8000600 0x200>;
+		interrupts = < 63 >;
+		status = "disabled";
+	};
+};
+
-- 
1.7.0.4
