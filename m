From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/4] Documentation: devicetree: phy-tegra-usb: Add vbus-supply property for host mode PHYs
Date: Wed, 26 Jun 2013 12:59:40 +0300
Message-ID: <1372240781-1017-4-git-send-email-mperttunen@nvidia.com>
References: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372240781-1017-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
index c4c9e9e..92348c9 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
@@ -48,5 +48,8 @@ Optional properties:
       peripheral means it is device controller
       otg means it can operate as either ("on the go")
 
+Optional properties for dr_mode == host:
+  - vbus-supply: regulator for VBUS
+
 Required properties for dr_mode == otg:
   - vbus-supply: regulator for VBUS
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
