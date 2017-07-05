From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 1/9] usb: gadget: f_ecm/f_eem/f_rndis: Setup quirk_avoids_skb_reserve
Date: Wed,  5 Jul 2017 20:19:50 +0300
Message-ID: <a2f60b1ee32dba0adb7dfaaab7b1ee4d67699107.1499273075.git.digetx@gmail.com>
References: <cover.1499273075.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1499273075.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1499273075.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1499273075.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This quirk is required to make USB Ethernet gadget working with HW that
can't cope with unaligned DMA. For some reason only f_ncm handles that
quirk, let's handle it in the rest of the network models. All models have
been tested with a ChipIdea UDC driver on NVIDIA Tegra20 SoC that require
DMA to be aligned.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/gadget/function/f_ecm.c   | 2 ++
 drivers/usb/gadget/function/f_eem.c   | 2 ++
 drivers/usb/gadget/function/f_rndis.c | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 4c488d15b6f6..01150f7864c7 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -584,6 +584,8 @@ static int ecm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 			 */
 			ecm->port.is_zlp_ok =
 				gadget_is_zlp_supported(cdev->gadget);
+			ecm->port.no_skb_reserve =
+				gadget_avoids_skb_reserve(cdev->gadget);
 			ecm->port.cdc_filter = DEFAULT_FILTER;
 			DBG(cdev, "activate ecm\n");
 			net = gether_connect(&ecm->port);
diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/function/f_eem.c
index 007ec6e4a5d4..3b70b9ccfd2d 100644
--- a/drivers/usb/gadget/function/f_eem.c
+++ b/drivers/usb/gadget/function/f_eem.c
@@ -215,6 +215,8 @@ static int eem_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 		 */
 		eem->port.is_zlp_ok = 1;
 		eem->port.cdc_filter = DEFAULT_FILTER;
+		eem->port.no_skb_reserve =
+				gadget_avoids_skb_reserve(cdev->gadget);
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
2.13.2
