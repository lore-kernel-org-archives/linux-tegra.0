From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ARM: dt: Add binding for Tegra PMC
Date: Wed, 25 Jan 2012 14:43:27 -0700
Message-ID: <1327527809-10179-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra PMC (Power Management Controller) interfaces with an external
PMU (Power Management Unit), and controls wake-up from sleep modes.

This initial binding is the bare minimum required to control the PMC's
inversion of the PMU's interrupt signal.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      |   19 +++++++++++++++++++
 arch/arm/boot/dts/tegra-harmony.dts                |    4 ++++
 arch/arm/boot/dts/tegra20.dtsi                     |    5 +++++
 arch/arm/boot/dts/tegra30.dtsi                     |    5 +++++
 4 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
new file mode 100644
index 0000000..b5846e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
@@ -0,0 +1,19 @@
+NVIDIA Tegra Power Management Controller (PMC)
+
+Properties:
+- name : Should be pmc
+- compatible : Should contain "nvidia,tegra<chip>-pmc".
+- reg : Offset and length of the register set for the device
+- nvidia,invert-interrupt : If present, inverts the PMU interrupt signal.
+  The PMU is an external Power Management Unit, whose interrupt output
+  signal is fed into the PMC. This signal is optionally inverted, and then
+  fed into the ARM GIC. The PMC is not involved in the detection or
+  handling of this interrupt signal, merely its inversion.
+
+Example:
+
+pmc@7000f400 {
+	compatible = "nvidia,tegra20-pmc";
+	reg = <0x7000e400 0x400>;
+	nvidia,invert-interrupt;
+};
diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
index 9a52615..6e8447d 100644
--- a/arch/arm/boot/dts/tegra-harmony.dts
+++ b/arch/arm/boot/dts/tegra-harmony.dts
@@ -10,6 +10,10 @@
 		reg = < 0x00000000 0x40000000 >;
 	};
 
+	pmc@7000f400 {
+		nvidia,invert-interrupt;
+	};
+
 	i2c@7000c000 {
 		clock-frequency = <400000>;
 
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index f00aad1..ec1f010 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -4,6 +4,11 @@
 	compatible = "nvidia,tegra20";
 	interrupt-parent = <&intc>;
 
+	pmc@7000f400 {
+		compatible = "nvidia,tegra20-pmc";
+		reg = <0x7000e400 0x400>;
+	};
+
 	intc: interrupt-controller@50041000 {
 		compatible = "arm,cortex-a9-gic";
 		interrupt-controller;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 4f284ea..ac4b75c 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -4,6 +4,11 @@
 	compatible = "nvidia,tegra30";
 	interrupt-parent = <&intc>;
 
+	pmc@7000f400 {
+		compatible = "nvidia,tegra20-pmc", "nvidia,tegra30-pmc";
+		reg = <0x7000e400 0x400>;
+	};
+
 	intc: interrupt-controller@50041000 {
 		compatible = "arm,cortex-a9-gic";
 		interrupt-controller;
-- 
1.7.0.4
