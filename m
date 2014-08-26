From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/3] ARM: tegra: Add device tree nodes for flow controller
Date: Tue, 26 Aug 2014 08:14:03 +0200
Message-ID: <1409033644-24376-2-git-send-email-thierry.reding@gmail.com>
References: <1409033644-24376-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409033644-24376-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

These nodes are required so that the flow controller driver can obtain
the I/O memory region from device tree rather than hard-coding it.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 5 +++++
 arch/arm/boot/dts/tegra124.dtsi | 5 +++++
 arch/arm/boot/dts/tegra20.dtsi  | 5 +++++
 arch/arm/boot/dts/tegra30.dtsi  | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 08442d9abec7..430f85ac27f6 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -161,6 +161,11 @@
 		#reset-cells = <1>;
 	};
 
+	flow-controller@60007000 {
+		compatible = "nvidia,tegra114-flowctrl";
+		reg = <0x60007000 0x1000>;
+	};
+
 	apbdma: dma@6000a000 {
 		compatible = "nvidia,tegra114-apbdma";
 		reg = <0x6000a000 0x1400>;
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index a2e3e25fe736..5d1b32225dc2 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -210,6 +210,11 @@
 		#reset-cells = <1>;
 	};
 
+	flow-controller@0,60007000 {
+		compatible = "nvidia,tegra124-flowctrl";
+		reg = <0x0 0x60007000 0x0 0x1000>;
+	};
+
 	gpio: gpio@0,6000d000 {
 		compatible = "nvidia,tegra124-gpio", "nvidia,tegra30-gpio";
 		reg = <0x0 0x6000d000 0x0 0x1000>;
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index e44cb596c589..c6a2d078bdf4 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -201,6 +201,11 @@
 		#reset-cells = <1>;
 	};
 
+	flow-controller@60007000 {
+		compatible = "nvidia,tegra20-flowctrl";
+		reg = <0x60007000 0x1000>;
+	};
+
 	apbdma: dma@6000a000 {
 		compatible = "nvidia,tegra20-apbdma";
 		reg = <0x6000a000 0x1200>;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index c0136bf2c5da..f4693c9c070e 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -282,6 +282,11 @@
 		#reset-cells = <1>;
 	};
 
+	flow-controller@60007000 {
+		compatible = "nvidia,tegra30-flowctrl";
+		reg = <0x60007000 0x1000>;
+	};
+
 	apbdma: dma@6000a000 {
 		compatible = "nvidia,tegra30-apbdma", "nvidia,tegra20-apbdma";
 		reg = <0x6000a000 0x1400>;
-- 
2.0.4
