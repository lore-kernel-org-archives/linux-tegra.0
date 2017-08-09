From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 1/8] usb: gadget: f_ecm/f_eem/f_rndis: Setup quirk_avoids_skb_reserve
Date: Wed,  9 Aug 2017 14:49:02 +0300
Message-ID: <4c7b3a3b23b44f4115de1745c65d719a3f70c4db.1502278634.git.digetx@gmail.com>
References: <cover.1502278634.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1502278634.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1502278634.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1502278634.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This quirk is required to make USB Ethernet gadget working with HW that
can't cope with unaligned DMA. For some reason only f_ncm handles that
quirk, let's handle it in the rest of the network models. All models have
been tested with a ChipIdea UDC driver on NVIDIA Tegra20 SoC that require
DMA to be aligned.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/gadget/function/f_ecm.c   | 7 +++++++
 drivers/usb/gadget/function/f_eem.c   | 5 +++++
 drivers/usb/gadget/function/f_rndis.c | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 4c488d15b6f6..1d198055fd74 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -584,6 +584,13 @@ static int ecm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 			 */
 			ecm->port.is_zlp_ok =
 				gadget_is_zlp_supported(cdev->gadget);
+
+			/* Setup DMA alignment workaround for UDC's that
+			 * need it.
+			 */
+			ecm->port.no_skb_reserve =
+				gadget_avoids_skb_reserve(cdev->gadget);
+
 			ecm->port.cdc_filter = DEFAULT_FILTER;
 			DBG(cdev, "activate ecm\n");
 			net = gether_connect(&ecm->port);
diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/function/f_eem.c
index 007ec6e4a5d4..74e2453d8ac5 100644
--- a/drivers/usb/gadget/function/f_eem.c
+++ b/drivers/usb/gadget/function/f_eem.c
@@ -215,6 +215,11 @@ static int eem_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 		 */
 		eem->port.is_zlp_ok = 1;
 		eem->port.cdc_filter = DEFAULT_FILTER;
+
+		/* setup DMA alignment workaround for UDC's that*need it */
+		eem->port.no_skb_reserve =
+				gadget_avoids_skb_reserve(cdev->gadget);
+
 		DBG(cdev, "activate eem\n");
 		net = gether_connect(&eem->port);
 		if (IS_ERR(net))
diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index 16562e461121..1b379c051a84 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -593,6 +593,10 @@ static int rndis_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 		 */
 		rndis->port.cdc_filter = 0;
 
+		/* Setup DMA alignment workaround for UDC's that need it */
+		rndis->port.no_skb_reserve =
+				gadget_avoids_skb_reserve(cdev->gadget);
+
 		DBG(cdev, "RNDIS RX/TX early activation ... \n");
 		net = gether_connect(&rndis->port);
 		if (IS_ERR(net))
-- 
2.13.3
