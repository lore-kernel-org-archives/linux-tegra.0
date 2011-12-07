From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 4/8] arm/dt: tegra: Add Tegra APB DMA device tree binding
Date: Wed,  7 Dec 2011 15:13:46 -0700
Message-ID: <1323296033-28730-8-git-send-email-swarren@nvidia.com>
References: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323296033-28730-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Document binding, and add the node to tegra20.dtsi.

The driver isn't actually instantiated from this node yet, but the I2S
binding will rely on being able to refer to the APB DMA node using a
phandle.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/dma/tegra20-apbdma.txt     |   29 ++++++++++++++++++++
 arch/arm/boot/dts/tegra20.dtsi                     |   21 ++++++++++++++
 2 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/tegra20-apbdma.txt

diff --git a/Documentation/devicetree/bindings/dma/tegra20-apbdma.txt b/Documentation/devicetree/bindings/dma/tegra20-apbdma.txt
new file mode 100644
index 0000000..ee80574
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/tegra20-apbdma.txt
@@ -0,0 +1,29 @@
+* NVIDIA Tegra APB DMA controller
+
+Required properties:
+- compatible: Should be "nvidia,<chip>-apbdma"
+- reg: Should contain DMA registers location and length
+- interrupts: Should contain DMA interrupt
+
+Examples:
+
+apbdma: dma@6000a000 {
+	compatible = "nvidia,tegra20-apbdma";
+	reg = <0x6000a000 0x1000>;
+	interrupts = < 0 136 0x04
+		       0 137 0x04
+		       0 138 0x04
+		       0 139 0x04
+		       0 140 0x04
+		       0 141 0x04
+		       0 142 0x04
+		       0 143 0x04
+		       0 144 0x04
+		       0 145 0x04
+		       0 146 0x04
+		       0 147 0x04
+		       0 148 0x04
+		       0 149 0x04
+		       0 150 0x04
+		       0 151 0x04 >;
+};
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index e25f4a6..189c31e 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -12,6 +12,27 @@
 		      < 0x50040100 0x0100 >;
 	};
 
+	apbdma: dma@6000a000 {
+		compatible = "nvidia,tegra20-apbdma";
+		reg = <0x6000a000 0x1000>;
+		interrupts = < 0 136 0x04
+			       0 137 0x04
+			       0 138 0x04
+			       0 139 0x04
+			       0 140 0x04
+			       0 141 0x04
+			       0 142 0x04
+			       0 143 0x04
+			       0 144 0x04
+			       0 145 0x04
+			       0 146 0x04
+			       0 147 0x04
+			       0 148 0x04
+			       0 149 0x04
+			       0 150 0x04
+			       0 151 0x04 >;
+	};
+
 	i2c@7000c000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
1.7.0.4
