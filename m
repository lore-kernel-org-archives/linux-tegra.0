From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v10 7/9] dt-bindings: usb: xhci-tegra: Add Tegra210 XUSB controller support
Date: Fri,  4 Mar 2016 17:19:37 +0100
Message-ID: <1457108379-20794-7-git-send-email-thierry.reding@gmail.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Extend the Tegra XUSB controller device tree binding with Tegra210
support.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/usb/nvidia,tegra124-xusb.txt         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
index 79616f9268d8..d28295a3e55f 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
@@ -9,6 +9,7 @@ Required properties:
 - compatible: Must be:
   - Tegra124: "nvidia,tegra124-xusb"
   - Tegra132: "nvidia,tegra132-xusb", "nvidia,tegra124-xusb"
+  - Tegra210: "nvidia,tegra210-xusb"
 - reg: Must contain the base and length of the xHCI host registers, XUSB FPCI
   registers and XUSB IPFS registers.
 - reg-names: Must contain the following entries:
@@ -50,6 +51,15 @@ For Tegra124 and Tegra132:
 - hvdd-usb-ss-supply: High-voltage PCIe/USB3 power supply. Must supply 3.3 V.
 - hvdd-usb-ss-pll-e-supply: High-voltage PLLE power supply. Must supply 3.3 V.
 
+For Tegra210:
+- dvddio-pex-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
+- hvddio-pex-supply: High-voltage PCIe/USB3 power supply. Must supply 1.8 V.
+- avdd-usb-supply: USB controller power supply. Must supply 3.3 V.
+- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
+- avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
+- dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
+- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
+
 Optional properties:
 --------------------
 - phys: Must contain an entry for each entry in phy-names.
@@ -58,6 +68,8 @@ Optional properties:
   following PHYs are available:
   - Tegra124: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
   - Tegra132: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
+  - Tegra210: usb2-0, usb2-1, usb2-2, usb2-3, hsic-0, usb3-0, usb3-1, usb3-2,
+              usb3-3
 
 Example:
 --------
-- 
2.7.1
