From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH 01/18] dt-bindings: phy: tegra-xusb: Add usb-role-switch
Date: Fri, 6 Dec 2019 16:20:04 +0530
Message-ID: <1575629421-7039-2-git-send-email-nkristam@nvidia.com>
References: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add usb-role-switch property for Tegra210 and Tegra186 platforms. This
entry is used by XUSB pad controller driver to register for role changes
for OTG/Peripheral capable USB 2 ports.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
index 9fb682e..0f19ed6 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -179,6 +179,10 @@ Optional properties:
   is internal. In the absence of this property the port is considered to be
   external.
 - vbus-supply: phandle to a regulator supplying the VBUS voltage.
+- usb-role-switch: boolean property to indicate use of USB Role Switch.
+  This property is MUST for OTG,Peripheral capable USB 2 ports. Connector
+  should be added as subnode, see connector.txt. vbus-gpio in connector is
+  Mandatory.
 
 ULPI ports:
 -----------
-- 
2.7.4
