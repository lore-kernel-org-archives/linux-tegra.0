From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 2/5] ARM: tegra: Add legacy interrupt controller nodes
Date: Thu, 28 Aug 2014 17:31:16 +0200
Message-ID: <1409239879-12376-2-git-send-email-thierry.reding@gmail.com>
References: <1409239879-12376-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409239879-12376-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add device tree nodes for the legacy interrupt controller so that the
driver can get the register ranges from device tree rather than hard-
coding them.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v3:
- bracket individual tuples in the "reg" property

Changes in v2:
- add chip-specific compatible string
- drop quinary controller on Tegra20

 arch/arm/boot/dts/tegra114.dtsi | 9 +++++++++
 arch/arm/boot/dts/tegra124.dtsi | 9 +++++++++
 arch/arm/boot/dts/tegra20.dtsi  | 8 ++++++++
 arch/arm/boot/dts/tegra30.dtsi  | 9 +++++++++
 4 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index a147fa2bfdd2..9bfab8bb765a 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -141,6 +141,15 @@
 			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	interrupt-controller@60004000 {
+		compatible = "nvidia,tegra114-ictlr", "nvidia,tegra30-ictlr";
+		reg = <0x60004000 0x40>, /* primary controller */
+		      <0x60004100 0x40>, /* secondary controller */
+		      <0x60004200 0x40>, /* tertiary controller */
+		      <0x60004300 0x40>, /* quaternary controller */
+		      <0x60004400 0x40>; /* quinary controller */
+	};
+
 	timer@60005000 {
 		compatible = "nvidia,tegra114-timer", "nvidia,tegra20-timer";
 		reg = <0x60005000 0x400>;
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 82dc48b530e6..8c7523225fd9 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -190,6 +190,15 @@
 		status = "disabled";
 	};
 
+	interrupt-controller@0,60004000 {
+		compatible = "nvidia,tegra124-ictlr", "nvidia,tegra30-ictlr";
+		reg = <0x0 0x60004000 0x0 0x40>, /* primary controller */
+		      <0x0 0x60004100 0x0 0x40>, /* secondary controller */
+		      <0x0 0x60004200 0x0 0x40>, /* tertiary controller */
+		      <0x0 0x60004300 0x0 0x40>, /* quaternary controller */
+		      <0x0 0x60004400 0x0 0x40>; /* quinary controller */
+	};
+
 	timer@0,60005000 {
 		compatible = "nvidia,tegra124-timer", "nvidia,tegra20-timer";
 		reg = <0x0 0x60005000 0x0 0x400>;
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index c6a2d078bdf4..fe2f57d19438 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -183,6 +183,14 @@
 		cache-level = <2>;
 	};
 
+	interrupt-controller@60004000 {
+		compatible = "nvidia,tegra20-ictlr";
+		reg = <0x60004000 0x40>, /* primary controller */
+		      <0x60004100 0x40>, /* secondary controller */
+		      <0x60004200 0x40>, /* tertiary controller */
+		      <0x60004300 0x40>; /* quaternary controller */
+	};
+
 	timer@60005000 {
 		compatible = "nvidia,tegra20-timer";
 		reg = <0x60005000 0x60>;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index f4693c9c070e..e5da2d252220 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -262,6 +262,15 @@
 		cache-level = <2>;
 	};
 
+	interrupt-controller@60004000 {
+		compatible = "nvidia,tegra30-ictlr";
+		reg = <0x60004000 0x40>, /* primary controller */
+		      <0x60004100 0x40>, /* secondary controller */
+		      <0x60004200 0x40>, /* tertiary controller */
+		      <0x60004300 0x40>, /* quaternary controller */
+		      <0x60004400 0x40>; /* quinary controller */
+	};
+
 	timer@60005000 {
 		compatible = "nvidia,tegra30-timer", "nvidia,tegra20-timer";
 		reg = <0x60005000 0x400>;
-- 
2.0.4
