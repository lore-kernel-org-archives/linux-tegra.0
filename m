From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/8] usb: chipidea: udc: Support SKB alignment quirk
Date: Thu, 27 Jul 2017 19:46:06 +0300
Message-ID: <7a7e32cafb3c77f4fb7a94de2c543f0dc4afd252.1501173271.git.digetx@gmail.com>
References: <cover.1501173271.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1501173271.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1501173271.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1501173271.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra20 UDC can't cope with unaligned DMA and require a USB gadget
quirk that avoids SKB buffer alignment to be set in order to make Ethernet
Gadget working. Later Tegra generations do not require that quirk. Let's
add a new platform data flag that allows to enable USB gadget quirk for
platforms that require it.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
---
 drivers/usb/chipidea/udc.c   | 3 +++
 include/linux/usb/chipidea.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 6502c13331e8..fe8a90543ea3 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1896,6 +1896,9 @@ static int udc_start(struct ci_hdrc *ci)
 	ci->gadget.name         = ci->platdata->name;
 	ci->gadget.otg_caps	= otg_caps;
 
+	if (ci->platdata->flags & CI_HDRC_REQUIRES_ALIGNED_DMA)
+		ci->gadget.quirk_avoids_skb_reserve = 1;
+
 	if (ci->is_otg && (otg_caps->hnp_support || otg_caps->srp_support ||
 						otg_caps->adp_support))
 		ci->gadget.is_otg = 1;
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index c5fdfcf99828..d725cff7268d 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -58,6 +58,7 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_OVERRIDE_TX_BURST	BIT(10)
 #define CI_HDRC_OVERRIDE_RX_BURST	BIT(11)
 #define CI_HDRC_OVERRIDE_PHY_CONTROL	BIT(12) /* Glue layer manages phy */
+#define CI_HDRC_REQUIRES_ALIGNED_DMA	BIT(13)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
-- 
2.13.3
