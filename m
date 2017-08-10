From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv3 1/4] dt-bindings: document the tegra CEC bindings
Date: Thu, 10 Aug 2017 10:31:22 +0200
Message-ID: <20170810083125.36649-2-hverkuil@xs4all.nl>
References: <20170810083125.36649-1-hverkuil@xs4all.nl>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170810083125.36649-1-hverkuil@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-tegra@vger.kernel.org

From: Hans Verkuil <hans.verkuil@cisco.com>

This documents the binding for the Tegra CEC module.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 .../devicetree/bindings/media/tegra-cec.txt        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt

diff --git a/Documentation/devicetree/bindings/media/tegra-cec.txt b/Documentation/devicetree/bindings/media/tegra-cec.txt
new file mode 100644
index 000000000000..c503f06f3b84
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/tegra-cec.txt
@@ -0,0 +1,27 @@
+* Tegra HDMI CEC hardware
+
+The HDMI CEC module is present in Tegra SoCs and its purpose is to
+handle communication between HDMI connected devices over the CEC bus.
+
+Required properties:
+  - compatible : value should be one of the following:
+	"nvidia,tegra114-cec"
+	"nvidia,tegra124-cec"
+	"nvidia,tegra210-cec"
+  - reg : Physical base address of the IP registers and length of memory
+	  mapped region.
+  - interrupts : HDMI CEC interrupt number to the CPU.
+  - clocks : from common clock binding: handle to HDMI CEC clock.
+  - clock-names : from common clock binding: must contain "cec",
+		  corresponding to the entry in the clocks property.
+  - hdmi-phandle : phandle to the HDMI controller, see also cec.txt.
+
+Example:
+
+cec@70015000 {
+	compatible = "nvidia,tegra124-cec";
+	reg = <0x0 0x70015000 0x0 0x00001000>;
+	interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&tegra_car TEGRA124_CLK_CEC>;
+	clock-names = "cec";
+};
-- 
2.13.2
