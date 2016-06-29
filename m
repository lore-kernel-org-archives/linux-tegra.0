From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: phy: Fix description of Tegra210 PHY nodes
Date: Wed, 29 Jun 2016 12:07:31 +0100
Message-ID: <1467198453-23406-2-git-send-email-jonathanh@nvidia.com>
References: <1467198453-23406-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467198453-23406-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The dt-binding document for the Tegra XUSB pad controller states that
'utmi' is one of the valid choices for the Tegra210 PHY node names and
has child lanes named, 'utmi-0', 'utmi-1', 'utmi-2' and 'utmi-3'.
However, neither the XUSB pad controller PHY driver or the actual
Tegra210 binding for the XUSB pad controller use these names. Instead
both the driver and binding use the node name 'usb2' and for the child
lanes use the names 'usb2-0', 'usb2-1', 'usb2-2' and 'usb2-3'. Given
that the driver and binding are consistent with the naming, up date the
dt-binding documentation to match.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
index 0bf1ae243552..3742c152c467 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -124,7 +124,7 @@ For Tegra124 and Tegra132, the list of valid PHY nodes is given below:
   - functions: "usb3-ss", "sata"
 
 For Tegra210, the list of valid PHY nodes is given below:
-- utmi: utmi-0, utmi-1, utmi-2, utmi-3
+- usb2: usb2-0, usb2-1, usb2-2, usb2-3
   - functions: "snps", "xusb", "uart"
 - hsic: hsic-0, hsic-1
   - functions: "snps", "xusb"
-- 
2.1.4
