From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Doc: dt: i2c: tegra: add dt binding for i2c-tegra
Date: Mon, 18 Mar 2013 15:05:50 +0530
Message-ID: <1363599350-25187-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add documentation for device tree binding of NVIDIA's Tegra i2c
controller driver.

Describing all compatible values used for diffenent Tegra SoCs
in details in this documentation.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |   99 ++++++++++++++++++++
 1 files changed, 99 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
new file mode 100644
index 0000000..e390ce8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
@@ -0,0 +1,99 @@
+NVIDIA Tegra20/Tegra30/Tegra114 I2C controller driver.
+
+Required properties:
+- compatible : should be:
+	"nvidia,tegra114-i2c"
+	"nvidia,tegra30-i2c"
+	"nvidia,tegra20-i2c"
+	"nvidia,tegra20-i2c-dvc"
+
+ Details of compatible are as follows:
+  nvidia,tegra20-i2c-dvc: Tegra20 has specific i2c controller called as DVC I2C
+	controller. This only support master mode of I2C communication. Register
+	interface/offset and interrupts handling are different than generic I2C
+	controller. Driver of DVC I2C controller is only compatible with
+	"nvidia,tegra20-i2c-dvc".
+  nvidia,tegra20-i2c: Tegra20 has 4 generic I2C controller. This can support
+	master and slave mode of I2C communication. The i2c-tegra driver only
+	support master mode of I2C communication. Driver of I2C controller is
+	only compatible with "nvidia,tegra20-i2c".
+  nvidia,tegra30-i2c: Tegra30 has 5 generic I2C controller. This controller is
+	very much similar to Tegra20 I2C controller with additional feature:
+	Continue Transfer Support. This feature helps to implement M_NO_START
+	as per I2C core API transfer flags. Driver of I2C controller is
+	compatible with "nvidia,tegra30-i2c" to enable the continue transfer
+	support. This is also compatible with "nvidia,tegra20-i2c" without
+	continue transfer support.
+  nvidia,tegra114-i2c: Tegra114 has 5 generic I2C controller. This controller is
+	very much similar to Tegra30 I2C controller with some hardware
+	modification:
+	 - Tegra30/Tegra20 I2C controller has 2 clock source called div-clk and
+	   fast-clk. Tegra114 has only one clock source called as div-clk and
+	   hence clock mechanism is changed in I2C controller.
+	 - Tegra30/Tegra20 I2C controller has enabled per packet transfer by
+	   default and there is no way to disable it. Tegra114 has this
+	   interrupt disable by default and SW need to enable explicitly.
+	Due to above changes, Tegra114 I2C driver makes incompatible with
+	previous hardware driver. Hence, tegra114 I2C controller is compatible
+	with "nvidia,tegra114-i2c".
+
+
+- reg: Should contain I2C controller registers physical address and length.
+- interrupts: Should contain I2C controller interrupts.
+- address-cells: Address cells for I2C device address.
+- size-cells: Size of the I2C device address.
+- clocks: Clock Id as per
+		Documentation/devicetree/bindings/clock/tegra<chip-id>.txt
+	for I2C controller.
+- clock-names: Name of the clock:
+	Tegra20/Tegra30 I2C controller: "div-clk and "fast-clk".
+	Tegra114 I2C controller: "div-clk".
+
+
+Typical i2c node for Tegra20:
+	i2c@7000c000 {
+		compatible = "nvidia,tegra20-i2c";
+		reg = <0x7000c000 0x100>;
+		interrupts = <0 38 0x04>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&tegra_car 12>, <&tegra_car 124>;
+		clock-names = "div-clk", "fast-clk";
+		status = "disabled";
+	};
+
+Typical dvc-i2c node for Tegra20:
+	i2c@7000d000 {
+		compatible = "nvidia,tegra20-i2c-dvc";
+		reg = <0x7000d000 0x200>;
+		interrupts = <0 53 0x04>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&tegra_car 47>, <&tegra_car 124>;
+		clock-names = "div-clk", "fast-clk";
+		status = "disabled";
+	};
+
+Typical i2c node for Tegra30:
+	i2c@7000c000 {
+		compatible =  "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
+		reg = <0x7000c000 0x100>;
+		interrupts = <0 38 0x04>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&tegra_car 12>, <&tegra_car 182>;
+		clock-names = "div-clk", "fast-clk";
+		status = "disabled";
+	};
+
+Typical i2c node for Tegra114:
+	i2c@7000c000 {
+		compatible = "nvidia,tegra114-i2c";
+		reg = <0x7000c000 0x100>;
+		interrupts = <0 38 0x04>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+		clocks = <&tegra_car 12>;
+		clock-names = "div-clk";
+	};
-- 
1.7.1.1
