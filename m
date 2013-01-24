From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v4 3/6] ARM: dt: tegra114: Add new SoC base, Tegra114 SoC
Date: Thu, 24 Jan 2013 13:10:23 +0200
Message-ID: <1359025829-22306-4-git-send-email-hdoyu@nvidia.com>
References: <1359025829-22306-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359025829-22306-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Initial support for Tegra 114 SoC. This is expected to be included in
the board DTS files, Tegra 114 SoC based evaluation board family.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi |  114 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra114.dtsi

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
new file mode 100644
index 0000000..c567916
--- /dev/null
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -0,0 +1,114 @@
+/include/ "skeleton.dtsi"
+
+/ {
+	compatible = "nvidia,tegra114";
+	interrupt-parent = <&gic>;
+
+	gic: interrupt-controller {
+		compatible = "arm,cortex-a15-gic";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x50041000 0x1000>,
+		      <0x50042000 0x1000>,
+		      <0x50044000 0x2000>,
+		      <0x50046000 0x2000>;
+		interrupts = <1 9 0xf04>;
+	};
+
+	timer@60005000 {
+		compatible = "nvidia,tegra114-timer", "nvidia,tegra20-timer";
+		reg = <0x60005000 0x400>;
+		interrupts = <0 0 0x04
+			      0 1 0x04
+			      0 41 0x04
+			      0 42 0x04
+			      0 121 0x04
+			      0 122 0x04>;
+	};
+
+	tegra_car: clock {
+		compatible = "nvidia,tegra114-car, nvidia,tegra30-car";
+		reg = <0x60006000 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	serial@70006000 {
+		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
+		reg = <0x70006000 0x40>;
+		reg-shift = <2>;
+		interrupts = <0 36 0x04>;
+		status = "disabled";
+	};
+
+	serial@70006040 {
+		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
+		reg = <0x70006040 0x40>;
+		reg-shift = <2>;
+		interrupts = <0 37 0x04>;
+		status = "disabled";
+	};
+
+	serial@70006200 {
+		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
+		reg = <0x70006200 0x100>;
+		reg-shift = <2>;
+		interrupts = <0 46 0x04>;
+		status = "disabled";
+	};
+
+	serial@70006300 {
+		compatible = "nvidia,tegra114-uart", "nvidia,tegra20-uart";
+		reg = <0x70006300 0x100>;
+		reg-shift = <2>;
+		interrupts = <0 90 0x04>;
+		status = "disabled";
+	};
+
+	rtc {
+		compatible = "nvidia,tegra114-rtc", "nvidia,tegra20-rtc";
+		reg = <0x7000e000 0x100>;
+		interrupts = <0 2 0x04>;
+	};
+
+	pmc {
+		compatible = "nvidia,tegra114-pmc", "nvidia,tegra30-pmc";
+		reg = <0x7000e400 0x400>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <0>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <1>;
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <2>;
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <3>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <1 13 0xf08>,
+			     <1 14 0xf08>,
+			     <1 11 0xf08>,
+			     <1 10 0xf08>;
+	};
+};
-- 
1.7.9.5
