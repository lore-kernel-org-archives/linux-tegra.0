From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v10 6/9] dt-bindings: usb: Add NVIDIA Tegra XUSB controller binding
Date: Fri,  4 Mar 2016 17:19:36 +0100
Message-ID: <1457108379-20794-6-git-send-email-thierry.reding@gmail.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457108379-20794-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add device-tree binding documentation for the XUSB controller present
on Tegra124 and later SoCs. This controller supports USB 3.0 via an xHCI
compliant interface.

Based on work by Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>.

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v9:
- rename UTMI to USB2 to match hardware documentation
- remove MFD and mailbox components from bindings
- reference XUSB pad controller via phandle

 .../bindings/usb/nvidia,tegra124-xusb.txt          | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
new file mode 100644
index 000000000000..79616f9268d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
@@ -0,0 +1,108 @@
+NVIDIA Tegra xHCI controller
+============================
+
+The Tegra xHCI controller supports both USB2 and USB3 interfaces exposed by
+the Tegra XUSB pad controller.
+
+Required properties:
+--------------------
+- compatible: Must be:
+  - Tegra124: "nvidia,tegra124-xusb"
+  - Tegra132: "nvidia,tegra132-xusb", "nvidia,tegra124-xusb"
+- reg: Must contain the base and length of the xHCI host registers, XUSB FPCI
+  registers and XUSB IPFS registers.
+- reg-names: Must contain the following entries:
+  - "hcd"
+  - "fpci"
+  - "ipfs"
+- interrupts: Must contain the xHCI host interrupt and the mailbox interrupt.
+- clocks: Must contain an entry for each entry in clock-names.
+  See ../clock/clock-bindings.txt for details.
+- clock-names: Must include the following entries:
+   - xusb_host
+   - xusb_host_src
+   - xusb_falcon_src
+   - xusb_ss
+   - xusb_ss_src
+   - xusb_ss_div2
+   - xusb_hs_src
+   - xusb_fs_src
+   - pll_u_480m
+   - clk_m
+   - pll_e
+- resets: Must contain an entry for each entry in reset-names.
+  See ../reset/reset.txt for details.
+- reset-names: Must include the following entries:
+  - xusb_host
+  - xusb_ss
+  - xusb_src
+  Note that xusb_src is the shared reset for xusb_{ss,hs,fs,falcon,host}_src.
+- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
+  configure the USB pads used by the XHCI controller
+
+For Tegra124 and Tegra132:
+- avddio-pex-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
+- dvddio-pex-supply: PCIe/USB3 digital logic power supply. Must supply 1.05 V.
+- avdd-usb-supply: USB controller power supply. Must supply 3.3 V.
+- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
+- avdd-pll-erefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
+- avdd-usb-ss-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
+- hvdd-usb-ss-supply: High-voltage PCIe/USB3 power supply. Must supply 3.3 V.
+- hvdd-usb-ss-pll-e-supply: High-voltage PLLE power supply. Must supply 3.3 V.
+
+Optional properties:
+--------------------
+- phys: Must contain an entry for each entry in phy-names.
+  See ../phy/phy-bindings.txt for details.
+- phy-names: Should include an entry for each PHY used by the controller. The
+  following PHYs are available:
+  - Tegra124: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
+  - Tegra132: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
+
+Example:
+--------
+
+	usb@0,70090000 {
+		compatible = "nvidia,tegra124-xusb";
+		reg = <0x0 0x70090000 0x0 0x8000>,
+		      <0x0 0x70098000 0x0 0x1000>,
+		      <0x0 0x70099000 0x0 0x1000>;
+		reg-names = "hcd", "fpci", "ipfs";
+
+		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&tegra_car TEGRA124_CLK_XUSB_HOST>,
+			 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_SS>,
+			 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
+			 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
+			 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
+			 <&tegra_car TEGRA124_CLK_CLK_M>,
+			 <&tegra_car TEGRA124_CLK_PLL_E>;
+		clock-names = "xusb_host", "xusb_host_src", "xusb_falcon_src",
+			      "xusb_ss", "xusb_ss_div2", "xusb_ss_src",
+			      "xusb_hs_src", "xusb_fs_src", "pll_u_480m",
+			      "clk_m", "pll_e";
+		resets = <&tegra_car 89>, <&tegra_car 156>, <&tegra_car 143>;
+		reset-names = "xusb_host", "xusb_ss", "xusb_src";
+
+		nvidia,xusb-padctl = <&padctl>;
+
+		phys = <&{/padctl@0,7009f000/pads/usb2/usb2-1}>, /* mini-PCIe USB */
+		       <&{/padctl@0,7009f000/pads/usb2/usb2-2}>, /* USB A */
+		       <&{/padctl@0,7009f000/pads/pcie/pcie-0}>; /* USB A */
+		phy-names = "utmi-1", "utmi-2", "usb3-0";
+
+		avddio-pex-supply = <&vdd_1v05_run>;
+		dvddio-pex-supply = <&vdd_1v05_run>;
+		avdd-usb-supply = <&vdd_3v3_lp0>;
+		avdd-pll-utmip-supply = <&vddio_1v8>;
+		avdd-pll-erefe-supply = <&avdd_1v05_run>;
+		avdd-usb-ss-pll-supply = <&vdd_1v05_run>;
+		hvdd-usb-ss-supply = <&vdd_3v3_lp0>;
+		hvdd-usb-ss-pll-e-supply = <&vdd_3v3_lp0>;
+	};
-- 
2.7.1
