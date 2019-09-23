From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V10 4/8] dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding
Date: Mon, 23 Sep 2019 13:55:48 +0530
Message-ID: <1569227152-3030-5-git-send-email-nkristam@nvidia.com>
References: <1569227152-3030-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569227152-3030-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add device-tree binding documentation for the XUSB device mode controller
present on Tegra210 SoC. This controller supports the USB 3.0
specification.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Reviewed-by: JC Kuo <jckuo@nvidia.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 110 +++++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
new file mode 100644
index 0000000..ce15e26
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
@@ -0,0 +1,110 @@
+Device tree binding for NVIDIA Tegra XUSB device mode controller (XUDC)
+=======================================================================
+
+The Tegra XUDC controller supports both USB 2.0 HighSpeed/FullSpeed and
+USB 3.0 SuperSpeed protocols.
+
+Required properties:
+--------------------
+- compatible: For Tegra210, must contain "nvidia,tegra210-xudc".
+- reg: Must contain the base and length of all registers used.
+- interrupts: Must contain the XUSB device interrupt.
+- clocks: Must contain an entry for all clocks used.
+  See ../clock/clock-bindings.txt for details.
+- clock-names: Must include the following entries:
+   - dev: Clock to enable core XUSB dev clock.
+   - ss: Clock to enable XUSB super speed clock.
+   - ss_src: Clock to enable XUSB super speed dev clock.
+   - hs_src: Clock to enable XUSB high speed dev clock.
+   - fs_src: Clock to enable XUSB full speed dev clock.
+- power-domains: A list of PM domain specifiers that reference each power-domain
+  used by the XUSB device mode controller. This list must comprise of a specifier
+  for the XUSBA and XUSBB power-domains. See ../power/power_domain.txt and
+  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
+- power-domain-names: A list of names that represent each of the specifiers in
+  the 'power-domains' property. Must include 'ss' and 'dev'.
+- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
+  configure the USB pads used by the XUDC controller.
+- phys: Must contain an entry for each entry in phy-names.
+  See ../phy/phy-bindings.txt for details.
+- phy-names: Should include an entry for each PHY used by the controller.
+  Names must be "usb2", and "usb3" if support SuperSpeed device mode.
+  - "usb3" phy, SuperSpeed (SSTX+/SSTX-/SSRX+/SSRX-) data lines.
+  - "usb2" phy, USB 2.0 (D+/D-) data lines.
+
+For Tegra210:
+- reg-names: Must include the following entries:
+   - base: XUSB device controller registers.
+   - fpci: XUSB device PCI Config registers.
+   - ipfs: XUSB device registers.
+- avddio-usb-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
+- hvdd-usb-supply: USB controller power supply. Must supply 3.3 V.
+
+
+Optional properties:
+--------------------
+- usb-role-switch: boolean property to indicate use of USB Role Switch driver.
+
+Sub-nodes:
+----------
+- The port would be added as subnode if use "usb-role-switch" property.
+  see graph.txt.
+
+Example:
+--------
+	pmc: pmc@7000e400 {
+		compatible = "nvidia,tegra210-pmc";
+		reg = <0x0 0x7000e400 0x0 0x400>;
+		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
+		clock-names = "pclk", "clk32k_in";
+
+		powergates {
+			pd_xusbss: xusba {
+				clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
+				resets = <&tegra_car 156>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_xusbdev: xusbb {
+				clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>;
+				resets = <&tegra_car 95>;
+				#power-domain-cells = <0>;
+			};
+		};
+	};
+
+	usb@700d0000 {
+		compatible = "nvidia,tegra210-xudc";
+		reg = <0x0 0x700d0000 0x0 0x8000>,
+		      <0x0 0x700d8000 0x0 0x1000>,
+		      <0x0 0x700d9000 0x0 0x1000>;
+		reg-names = "base", "fpci", "ipfs";
+
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
+			 <&tegra_car TEGRA210_CLK_XUSB_SS>,
+			 <&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
+			 <&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
+			 <&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
+		clock-names = "dev", "ss", "ss_src", "hs_src", "fs_src";
+
+		power-domains = <&pd_xusbdev>, <&pd_xusbss>;
+		power-domain-names = "dev", "ss";
+
+		nvidia,xusb-padctl = <&padctl>;
+
+		phys = <&micro_b>;
+		phy-names = "usb2";
+
+		avddio-usb-supply = <&vdd_pex_1v05>;
+		hvdd-usb-supply = <&vdd_3v3_sys>;
+
+		usb-role-switch;
+		port {
+			usb_role_switch: endpoint {
+				remote-endpoint = <&bconn_ep>;
+			};
+		};
+
+	};
-- 
2.7.4
