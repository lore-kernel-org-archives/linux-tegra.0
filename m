From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 1/3] USB: musb: fix inefficient copy of unaligned buffers
Date: Thu, 23 Apr 2015 16:06:50 +0200
Message-ID: <1429798012-21916-2-git-send-email-johan@kernel.org>
References: <1429798012-21916-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429798012-21916-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-tegra@vger.kernel.org

Make sure only to copy any actual data rather than the whole buffer,
when releasing the temporary buffer used for unaligned non-isochronous
transfers.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/musb/musb_host.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index c3d5fc9dfb5b..e1fb5d885c18 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -2512,6 +2512,7 @@ static void musb_free_temp_buffer(struct urb *urb)
 {
 	enum dma_data_direction dir;
 	struct musb_temp_buffer *temp;
+	size_t length;
 
 	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
 		return;
@@ -2522,8 +2523,12 @@ static void musb_free_temp_buffer(struct urb *urb)
 			    data);
 
 	if (dir == DMA_FROM_DEVICE) {
-		memcpy(temp->old_xfer_buffer, temp->data,
-		       urb->transfer_buffer_length);
+		if (usb_pipeisoc(urb->pipe))
+			length = urb->transfer_buffer_length;
+		else
+			length = urb->actual_length;
+
+		memcpy(temp->old_xfer_buffer, temp->data, length);
 	}
 	urb->transfer_buffer = temp->old_xfer_buffer;
 	kfree(temp->kmalloc_ptr);
-- 
2.0.5
