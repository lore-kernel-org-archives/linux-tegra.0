From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] USB: musb: fix inefficient copy of unaligned buffers
Date: Tue,  7 Apr 2015 11:46:51 +0200
Message-ID: <1428400012-7563-2-git-send-email-johan@kernel.org>
References: <1428400012-7563-1-git-send-email-johan@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428400012-7563-1-git-send-email-johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Make sure only to copy any actual data rather than the whole buffer,
when releasing the temporary buffer used for unaligned transfer buffers.

Note that this also fixes a lockup on disconnect, where repeated failed
transfers would starve the hub workqueue from processing the disconnect,
which would have prevented the urbs from being resubmitted. In this case
there is no data to forward, but the full buffer length was being copied
nonetheless.

The disconnect lockup can easily be reproduced using four unaligned
4k-bulk-in urbs on Beaglebone Black.

Fixes: 8408fd1d83e3 ("usb: musb: implement (un)map_urb_for_dma hooks")
Cc: stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>	# v3.10
Signed-off-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/usb/musb/musb_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index c3d5fc9dfb5b..d8327ec19a1f 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -2523,7 +2523,7 @@ static void musb_free_temp_buffer(struct urb *urb)
 
 	if (dir == DMA_FROM_DEVICE) {
 		memcpy(temp->old_xfer_buffer, temp->data,
-		       urb->transfer_buffer_length);
+		       urb->actual_length);
 	}
 	urb->transfer_buffer = temp->old_xfer_buffer;
 	kfree(temp->kmalloc_ptr);
-- 
2.0.5
