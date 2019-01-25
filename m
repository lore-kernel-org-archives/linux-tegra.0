From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/5] dt-bindings: phy: tegra: Add Tegra186 support
Date: Fri, 25 Jan 2019 12:25:21 +0100
Message-ID: <20190125112525.10697-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Extend the bindings to cover the set of features found in Tegra186. Note
that, technically, there are four more supplies connected to the XUSB
pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL), but
the power sequencing requirements of Tegra186 require these to be under
the control of the PMIC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
index 3742c152c467..daedb15f322e 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -36,11 +36,20 @@ Required properties:
   - Tegra124: "nvidia,tegra124-xusb-padctl"
   - Tegra132: "nvidia,tegra132-xusb-padctl", "nvidia,tegra124-xusb-padctl"
   - Tegra210: "nvidia,tegra210-xusb-padctl"
+  - Tegra186: "nvidia,tegra186-xusb-padctl"
 - reg: Physical base address and length of the controller's registers.
 - resets: Must contain an entry for each entry in reset-names.
 - reset-names: Must include the following entries:
   - "padctl"
 
+For Tegra186:
+- avdd-pll-erefeut-supply: UPHY brick and reference clock as well as UTMI PHY
+  power supply. Must supply 1.8 V.
+- avdd-usb-supply: USB I/Os, VBUS, ID, REXT, D+/D- power supply. Must supply
+  3.3 V.
+- vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
+- vddio-hsic-supply: HSIC PHY power supply. Must supply 1.2 V.
+
 
 Pad nodes:
 ==========
-- 
2.19.1
