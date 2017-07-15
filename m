From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCH 1/4] dt-bindings: document the tegra CEC bindings
Date: Sat, 15 Jul 2017 14:47:50 +0200
Message-ID: <20170715124753.43714-2-hverkuil@xs4all.nl>
References: <20170715124753.43714-1-hverkuil@xs4all.nl>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170715124753.43714-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

This documents the binding for the Tegra CEC module.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/media/tegra-cec.txt        | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt

diff --git a/Documentation/devicetree/bindings/media/tegra-cec.txt b/Documentation/devicetree/bindings/media/tegra-cec.txt
new file mode 100644
index 000000000000..ba0b6071acaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/tegra-cec.txt
@@ -0,0 +1,26 @@
+* Tegra HDMI CEC driver
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
+		  corresponding to ithe entry in the clocks property.
+  - hdmi-phandle : phandle to the HDMI controller, see also cec.txt.
+
+Example:
+
+tegra_cec {
+	compatible = "nvidia,tegra124-cec";
+	reg = <0x0 0x70015000 0x0 0x00001000>;
+	interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&tegra_car TEGRA124_CLK_CEC>;
+	clock-names = "cec";
-- 
2.11.0
