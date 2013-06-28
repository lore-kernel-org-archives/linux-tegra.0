From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/3] Documentation: devicetree: phy-tegra-usb: Add vbus-supply property for host mode PHYs
Date: Fri, 28 Jun 2013 15:33:15 +0300
Message-ID: <1372422796-23524-3-git-send-email-mperttunen@nvidia.com>
References: <1372422796-23524-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372422796-23524-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add vbus-supply as an optional property for host mode phy-tegra-usb PHYs.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
index c4c9e9e..59c4854 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
@@ -48,5 +48,5 @@ Optional properties:
       peripheral means it is device controller
       otg means it can operate as either ("on the go")
 
-Required properties for dr_mode == otg:
+VBUS control (required for dr_mode == host, optional for dr_mode == otg):
   - vbus-supply: regulator for VBUS
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
