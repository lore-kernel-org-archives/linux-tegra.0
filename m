From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] gpu: host1x: Add MIPI pad calibration DT bindings
Date: Mon,  2 Dec 2013 14:28:54 +0100
Message-ID: <1385990934-20809-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Introduce device tree bindings for the MIPI pad calibration controller
found on Tegra SoCs. The controller can be used to perform calibration
of pads used for DSI and CSI peripherals.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/misc/nvidia,tegra114-mipi.txt         | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt
new file mode 100644
index 000000000000..beb75ec7f6fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt
@@ -0,0 +1,37 @@
+NVIDIA Tegra MIPI pad calibration controller
+
+Required properties:
+- compatible: "nvidia,tegra<chip>-mipi"
+- reg: Physical base address and length of the controller's registers.
+- clocks: The clock consumed by the controller.
+- #nvidia,mipi-calibrate-cells: Should be 1. The cell is a bitmask of the pads
+  that need to be calibrated for a given device.
+
+User nodes need to contain an nvidia,mipi-calibrate property that has a
+phandle to refer to the calibration controller node and a bitmask of the pads
+that need to be calibrated.
+
+Example:
+
+	mipi: mipi@700e3000 {
+		compatible = "nvidia,tegra114-mipi";
+		reg = <0x700e3000 0x100>;
+		clocks = <&tegra_car TEGRA114_CLK_MIPI_CAL>;
+		#nvidia,mipi-calibrate-cells = <1>;
+	};
+
+	...
+
+	host1x@50000000 {
+		...
+
+		dsi@54300000 {
+			...
+
+			nvidia,mipi-calibrate = <&mipi 0x060>;
+
+			...
+		};
+
+		...
+	};
-- 
1.8.4.2
