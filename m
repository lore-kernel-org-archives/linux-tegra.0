From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/3] staging: octeon-usb: fix unaligned isochronous transfers
Date: Thu, 23 Apr 2015 16:06:52 +0200
Message-ID: <1429798012-21916-4-git-send-email-johan@kernel.org>
References: <1429798012-21916-1-git-send-email-johan@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429798012-21916-1-git-send-email-johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Make sure to copy the whole transfer buffer when releasing the temporary
buffer used for unaligned isochronous transfers as the data is not
necessarily contiguous in that case.

Signed-off-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/staging/octeon-usb/octeon-hcd.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon-usb/octeon-hcd.c b/drivers/staging/octeon-usb/octeon-hcd.c
index 1daeb3125a1f..e03873c343b1 100644
--- a/drivers/staging/octeon-usb/octeon-hcd.c
+++ b/drivers/staging/octeon-usb/octeon-hcd.c
@@ -509,15 +509,21 @@ static int octeon_alloc_temp_buffer(struct urb *urb, gfp_t mem_flags)
 static void octeon_free_temp_buffer(struct urb *urb)
 {
 	struct octeon_temp_buffer *temp;
+	size_t length;
 
 	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
 		return;
 
 	temp = container_of(urb->transfer_buffer, struct octeon_temp_buffer,
 			    data);
-	if (usb_urb_dir_in(urb))
-		memcpy(temp->orig_buffer, urb->transfer_buffer,
-		       urb->actual_length);
+	if (usb_urb_dir_in(urb)) {
+		if (usb_pipeisoc(urb->pipe))
+			length = urb->transfer_buffer_length;
+		else
+			length = urb->actual_length;
+
+		memcpy(temp->orig_buffer, urb->transfer_buffer, length);
+	}
 	urb->transfer_buffer = temp->orig_buffer;
 	urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
 	kfree(temp->temp_buffer);
-- 
2.0.5
