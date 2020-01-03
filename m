From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v5 3/5] dt-bindings: phy: tegra: Add Tegra194 support
Date: Fri, 3 Jan 2020 16:18:12 +0800
Message-ID: <20200103081814.9848-4-jckuo@nvidia.com>
References: <20200103081814.9848-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200103081814.9848-1-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, robh@kernel.org, jonathanh@nvidia.com, kishon@ti.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, JC Kuo <jckuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Extend the bindings to cover the set of features found in Tegra194.
Note that, technically, there are four more supplies connected to the
XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL)
, but the power sequencing requirements of Tegra194 require these to be
under the control of the PMIC.

Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it
is possible for some platforms have long signal trace that could not
provide sufficient electrical environment for Gen 2 speed. This patch
adds a "maximum-speed" property to usb3 ports which can be used to
specify the maximum supported speed for any particular USB 3.1 port.
For a port that is not capable of SuperSpeedPlus, "maximum-speed"
property should carry "super-speed".

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
Changes in v5:
- re-use "maximum-speed" instead of adding "nvidia,disable-gen2"
Changes in v4: none
Changes in v3: none
Changes in v2:
- fix a typo

 .../phy/nvidia,tegra124-xusb-padctl.txt        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
index 9fb682e47c29..7d0089006e67 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -37,6 +37,7 @@ Required properties:
   - Tegra132: "nvidia,tegra132-xusb-padctl", "nvidia,tegra124-xusb-padctl"
   - Tegra210: "nvidia,tegra210-xusb-padctl"
   - Tegra186: "nvidia,tegra186-xusb-padctl"
+  - Tegra194: "nvidia,tegra194-xusb-padctl"
 - reg: Physical base address and length of the controller's registers.
 - resets: Must contain an entry for each entry in reset-names.
 - reset-names: Must include the following entries:
@@ -62,6 +63,10 @@ For Tegra186:
 - vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
 - vddio-hsic-supply: HSIC PHY power supply. Must supply 1.2 V.
 
+For Tegra194:
+- avdd-usb-supply: USB I/Os, VBUS, ID, REXT, D+/D- power supply. Must supply
+  3.3 V.
+- vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
 
 Pad nodes:
 ==========
@@ -154,6 +159,11 @@ For Tegra210, the list of valid PHY nodes is given below:
 - sata: sata-0
   - functions: "usb3-ss", "sata"
 
+For Tegra194, the list of valid PHY nodes is given below:
+- usb2: usb2-0, usb2-1, usb2-2, usb2-3
+  - functions: "xusb"
+- usb3: usb3-0, usb3-1, usb3-2, usb3-3
+  - functions: "xusb"
 
 Port nodes:
 ===========
@@ -221,6 +231,11 @@ Optional properties:
   is internal. In the absence of this property the port is considered to be
   external.
 
+- maximum-speed: Only for Tegra194. A string property that specifies maximum
+  supported speed of a usb3 port. Valid values are:
+  - "super-speed-plus": default, the usb3 port supports USB 3.1 Gen 2 speed.
+  - "super-speed": the usb3 port supports USB 3.1 Gen 1 speed only.
+
 For Tegra124 and Tegra132, the XUSB pad controller exposes the following
 ports:
 - 3x USB2: usb2-0, usb2-1, usb2-2
@@ -233,6 +248,9 @@ For Tegra210, the XUSB pad controller exposes the following ports:
 - 2x HSIC: hsic-0, hsic-1
 - 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
 
+For Tegra194, the XUSB pad controller exposes the following ports:
+- 4x USB2: usb2-0, usb2-1, usb2-2, usb2-3
+- 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
 
 Examples:
 =========
-- 
2.17.1
