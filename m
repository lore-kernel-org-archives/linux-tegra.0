From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 2/4] ARM: tegra: Add legacy interrupt controller nodes
Date: Fri, 27 Jun 2014 18:58:47 +0200
Message-ID: <1403888329-24755-2-git-send-email-thierry.reding@gmail.com>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403888329-24755-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add device tree nodes for the legacy interrupt controller so that the
driver can get the register ranges from device tree rather than hard-
coding them.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 9 +++++++++
 arch/arm/boot/dts/tegra124.dtsi | 9 +++++++++
 arch/arm/boot/dts/tegra20.dtsi  | 9 +++++++++
 arch/arm/boot/dts/tegra30.dtsi  | 9 +++++++++
 4 files changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 84c864b75a25..09d537d7a982 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -141,6 +141,15 @@
 			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	interrupt-controller@60004000 {
+		compatible = "nvidia,tegra20-ictlr";
+		reg = <0x60004000 0x40   /* primary controller */
+		       0x60004100 0x40   /* secondary controller */
+		       0x60004200 0x40   /* tertiary controller */
+		       0x60004300 0x40   /* quaternary controller */
+		       0x60004400 0x40>; /* quinary controller */
+	};
+
 	timer@60005000 {
 		compatible = "nvidia,tegra114-timer", "nvidia,tegra20-timer";
 		reg = <0x60005000 0x400>;
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index bfffb4c102fb..6b426b4bb427 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -190,6 +190,15 @@
 		status = "disabled";
 	};
 
+	interrupt-controller@0,60004000 {
+		compatible = "nvidia,tegra20-ictlr";
+		reg = <0x0 0x60004000 0x0 0x40   /* primary controller */
+		       0x0 0x60004100 0x0 0x40   /* secondary controller */
+		       0x0 0x60004200 0x0 0x40   /* tertiary controller */
+		       0x0 0x60004300 0x0 0x40   /* quaternary controller */
+		       0x0 0x60004400 0x0 0x40>; /* quinary controller */
+	};
+
 	timer@0,60005000 {
 		compatible = "nvidia,tegra124-timer", "nvidia,tegra20-timer";
 		reg = <0x0 0x60005000 0x0 0x400>;
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index ba4c02129286..22462773cca5 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -183,6 +183,15 @@
 		cache-level = <2>;
 	};
 
+	interrupt-controller@60004000 {
+		compatible = "nvidia,tegra20-ictlr";
+		reg = <0x60004000 0x40   /* primary controller */
+		       0x60004100 0x40   /* secondary controller */
+		       0x60004200 0x40   /* tertiary controller */
+		       0x60004300 0x40   /* quaternary controller */
+		       0x60004400 0x40>; /* quinary controller */
+	};
+
 	timer@60005000 {
 		compatible = "nvidia,tegra20-timer";
 		reg = <0x60005000 0x60>;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index ad4202e01d60..d78826daa93a 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -262,6 +262,15 @@
 		cache-level = <2>;
 	};
 
+	interrupt-controller@60004000 {
+		compatible = "nvidia,tegra20-ictlr";
+		reg = <0x60004000 0x40   /* primary controller */
+		       0x60004100 0x40   /* secondary controller */
+		       0x60004200 0x40   /* tertiary controller */
+		       0x60004300 0x40   /* quaternary controller */
+		       0x60004400 0x40>; /* quinary controller */
+	};
+
 	timer@60005000 {
 		compatible = "nvidia,tegra30-timer", "nvidia,tegra20-timer";
 		reg = <0x60005000 0x400>;
-- 
2.0.0
