From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 1/8] usb: gadget: f_ncm/u_ether: Move 'SKB reserve' quirk setup to u_ether
Date: Wed, 16 Aug 2017 13:32:38 +0300
Message-ID: <0057da7d2be650b9b5b2f3248e5c3ae4022b4796.1502879078.git.digetx@gmail.com>
References: <cover.1502879077.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1502879077.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1502879077.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1502879077.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

That quirk is required to make USB Ethernet gadget working on HW that
can't cope with unaligned DMA. For some reason only f_ncm sets up that
quirk, let's setup it directly in u_ether so other network models would
have that quirk applied as well. All network models have been tested with
ChipIdea UDC driver on NVIDIA Tegra20 SoC that require DMA to be aligned.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/gadget/function/f_ncm.c   | 2 --
 drivers/usb/gadget/function/u_ether.c | 2 +-
 drivers/usb/gadget/function/u_ether.h | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 24e34cfcb4bd..45b334ceaf2e 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -925,8 +925,6 @@ static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 			 */
 			ncm->port.is_zlp_ok =
 				gadget_is_zlp_supported(cdev->gadget);
-			ncm->port.no_skb_reserve =
-				gadget_avoids_skb_reserve(cdev->gadget);
 			ncm->port.cdc_filter = DEFAULT_FILTER;
 			DBG(cdev, "activate ncm\n");
 			net = gether_connect(&ncm->port);
diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index a8b40d07e927..bdbc3fdc7c4f 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -1073,7 +1073,7 @@ struct net_device *gether_connect(struct gether *link)
 
 	if (result == 0) {
 		dev->zlp = link->is_zlp_ok;
-		dev->no_skb_reserve = link->no_skb_reserve;
+		dev->no_skb_reserve = gadget_avoids_skb_reserve(dev->gadget);
 		DBG(dev, "qlen %d\n", qlen(dev->gadget, dev->qmult));
 
 		dev->header_len = link->header_len;
diff --git a/drivers/usb/gadget/function/u_ether.h b/drivers/usb/gadget/function/u_ether.h
index 81d94a7ae4b4..c77145bd6b5b 100644
--- a/drivers/usb/gadget/function/u_ether.h
+++ b/drivers/usb/gadget/function/u_ether.h
@@ -64,7 +64,6 @@ struct gether {
 	struct usb_ep			*out_ep;
 
 	bool				is_zlp_ok;
-	bool				no_skb_reserve;
 
 	u16				cdc_filter;
 
-- 
2.13.3
