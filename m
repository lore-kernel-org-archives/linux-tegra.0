From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: Add stdout-path for various boards
Date: Tue, 9 Feb 2016 13:51:59 +0000
Message-ID: <1455025920-21875-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

For Tegra boards, the device-tree alias serial0 is used for the console
and so add the stdout-path information so that the console no longer
needs to be passed via the kernel boot parameters.

This has been tested on boards, tegra20-trimslice, tegra30-beaver,
tegra114-dalmore and tegra124-jetson-tk1.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

The only boards that I have not modified are tegra114-roth and
tegra114-tn7 because these boards have two entries for console
in the *.dts file. AFAICT we cannot suppport multiple consoles
via the stdout-path and if a console is specified by the kernel
boot parameters then this sets the kernel variable
"console_set_on_cmdline" and prevents the stdout-path console
being registered. If there is a better way to handle these boards
via device-tree let me know.

 arch/arm/boot/dts/tegra114-dalmore.dts        | 4 ++++
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     | 4 ++++
 arch/arm/boot/dts/tegra124-nyan.dtsi          | 4 ++++
 arch/arm/boot/dts/tegra124-venice2.dts        | 4 ++++
 arch/arm/boot/dts/tegra20-harmony.dts         | 4 ++++
 arch/arm/boot/dts/tegra20-iris-512.dts        | 4 ++++
 arch/arm/boot/dts/tegra20-medcom-wide.dts     | 4 ++++
 arch/arm/boot/dts/tegra20-paz00.dts           | 4 ++++
 arch/arm/boot/dts/tegra20-seaboard.dts        | 4 ++++
 arch/arm/boot/dts/tegra20-tamonten.dtsi       | 4 ++++
 arch/arm/boot/dts/tegra20-trimslice.dts       | 4 ++++
 arch/arm/boot/dts/tegra20-ventana.dts         | 4 ++++
 arch/arm/boot/dts/tegra20-whistler.dts        | 4 ++++
 arch/arm/boot/dts/tegra30-apalis-eval.dts     | 4 ++++
 arch/arm/boot/dts/tegra30-beaver.dts          | 4 ++++
 arch/arm/boot/dts/tegra30-cardhu.dtsi         | 4 ++++
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 4 ++++
 17 files changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 8b7aa0dcdc6e..b5748eeed473 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -18,6 +18,10 @@
 		serial0 = &uartd;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x80000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 4ee2e63e11d0..a7264a15080a 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -19,6 +19,10 @@
 		serial2 = &uartb;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index ec1aa64ded68..e2cd39e3c95e 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -8,6 +8,10 @@
 		serial0 = &uarta;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index cfbdf429b45d..604f4b7c2685 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -13,6 +13,10 @@
 		serial0 = &uarta;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index b926a07b9443..4b73c76f981a 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -13,6 +13,10 @@
 		serial0 = &uartd;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x00000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-iris-512.dts b/arch/arm/boot/dts/tegra20-iris-512.dts
index 1dd7d7bfdfcc..bb56dfe9e10c 100644
--- a/arch/arm/boot/dts/tegra20-iris-512.dts
+++ b/arch/arm/boot/dts/tegra20-iris-512.dts
@@ -11,6 +11,10 @@
 		serial1 = &uartd;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	host1x@50000000 {
 		hdmi@54280000 {
 			status = "okay";
diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
index 9b87526ab0b7..34c6588e92ef 100644
--- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
+++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
@@ -10,6 +10,10 @@
 		serial0 = &uartd;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	pwm@7000a000 {
 		status = "okay";
 	};
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index ed7e1009326c..81a10a9df814 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -14,6 +14,10 @@
 		serial1 = &uartc;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index aea8994b35f2..0aed748567aa 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -13,6 +13,10 @@
 		serial0 = &uartd;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x00000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index 13d4e6185275..025e9e8037da 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -10,6 +10,10 @@
 		serial0 = &uartd;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index d99af4ef9c64..69d25ca47e04 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -13,6 +13,10 @@
 		serial0 = &uarta;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x00000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 04c58e9ca490..c61533a9bf0b 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -13,6 +13,10 @@
 		serial0 = &uartd;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x00000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra20-whistler.dts b/arch/arm/boot/dts/tegra20-whistler.dts
index 340d81108df1..bd7658572239 100644
--- a/arch/arm/boot/dts/tegra20-whistler.dts
+++ b/arch/arm/boot/dts/tegra20-whistler.dts
@@ -13,6 +13,10 @@
 		serial0 = &uarta;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index f2879cfcca62..b914bcb381d7 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -17,6 +17,10 @@
 		serial3 = &uartd;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	pcie-controller@00003000 {
 		status = "okay";
 
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 3dede3934446..1eca3b28ac64 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -12,6 +12,10 @@
 		serial0 = &uarta;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x80000000 0x7ff00000>;
 	};
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index bb1ca158273c..de9d6ccace14 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -35,6 +35,10 @@
 		serial1 = &uartc;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		reg = <0x80000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 3ff019f47d00..93e1ffd95bfa 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -15,6 +15,10 @@
 		serial2 = &uartd;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	host1x@50000000 {
 		dc@54200000 {
 			rgb {
-- 
2.1.4
