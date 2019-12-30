From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 01/18] dt-bindings: phy: tegra-xusb: Add usb-role-switch
Date: Mon, 30 Dec 2019 16:39:38 +0530
Message-ID: <1577704195-2535-2-git-send-email-nkristam@nvidia.com>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add usb-role-switch property for Tegra210 and Tegra186 platforms. This
entry is used by XUSB pad controller driver to register for role changes
for OTG/Peripheral capable USB 2 ports.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V3:
 - Added Acked-by updates to commit message.
---
V2:
 - Moved usb-role-switch to seperate Required section as suggested by Thierry.
 - Added reference to usb/usb-conn-gpio.txt for connector subnode.
---
 .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
index 9fb682e..23bf354 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -174,6 +174,12 @@ Required properties:
   - "device": for USB device mode
   - "otg": for USB OTG mode
 
+Required properties for OTG/Peripheral capable USB2 ports:
+- usb-role-switch: Boolean property to indicate that the port support OTG or
+  peripheral mode. If present, the port supports switching between USB host
+  and peripheral roles. Connector should be added as subnode.
+  See usb/usb-conn-gpio.txt.
+
 Optional properties:
 - nvidia,internal: A boolean property whose presence determines that a port
   is internal. In the absence of this property the port is considered to be
-- 
2.7.4
