From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] dt-bindings: usb: Fix Tegra XUSB example
Date: Wed, 29 Jun 2016 12:07:32 +0100
Message-ID: <1467198453-23406-3-git-send-email-jonathanh@nvidia.com>
References: <1467198453-23406-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467198453-23406-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The example binding for the Tegra XUSB omits the 'lane' subnode in the
XUSB pad controller path which is required according to the binding
documentation for the Tegra XUSB pad controller [0]. In addition to this
the phy-names with the suffix 'utmi' are also not valid and should have
the suffix 'usb2'. Correct both the XUSB pad controller pad path and
phy-names for the XUSB example.

[0] Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
index d28295a3e55f..3eee9e505400 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
@@ -104,10 +104,10 @@ Example:
 
 		nvidia,xusb-padctl = <&padctl>;
 
-		phys = <&{/padctl@0,7009f000/pads/usb2/usb2-1}>, /* mini-PCIe USB */
-		       <&{/padctl@0,7009f000/pads/usb2/usb2-2}>, /* USB A */
-		       <&{/padctl@0,7009f000/pads/pcie/pcie-0}>; /* USB A */
-		phy-names = "utmi-1", "utmi-2", "usb3-0";
+		phys = <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCIe USB */
+		       <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
+		       <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */
+		phy-names = "usb2-1", "usb2-2", "usb3-0";
 
 		avddio-pex-supply = <&vdd_1v05_run>;
 		dvddio-pex-supply = <&vdd_1v05_run>;
-- 
2.1.4
