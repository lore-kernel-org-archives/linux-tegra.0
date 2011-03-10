From: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 4/4] USB: ehci: tegra: Align DMA transfers to 32 bytes
Date: Wed,  9 Mar 2011 16:28:57 -0800
Message-ID: <1299716937-17704-5-git-send-email-benoit@android.com>
References: <1299716937-17704-1-git-send-email-benoit@android.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1299716937-17704-1-git-send-email-benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra2 USB controller doesn't properly deal with misaligned DMA
buffers, causing corruption.  This is especially prevalent with USB
network adapters, where skbuff alignment is often in the middle of a
4-byte dword.

To avoid this, allocate a temporary buffer for the DMA if the provided
buffer isn't sufficiently aligned.

Signed-off-by: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c |   90 +++++++++++++++++++++++++++++++++++++++++
 1 files changed, 90 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 6202102..a516af2 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -23,6 +23,8 @@
 #include <linux/usb/otg.h>
 #include <mach/usb_phy.h>
 
+#define TEGRA_USB_DMA_ALIGN 32
+
 struct tegra_ehci_hcd {
 	struct ehci_hcd *ehci;
 	struct tegra_usb_phy *phy;
@@ -383,6 +385,92 @@ static int tegra_ehci_bus_resume(struct usb_hcd *hcd)
 }
 #endif
 
+struct temp_buffer {
+	void *kmalloc_ptr;
+	void *old_xfer_buffer;
+	u8 data[0];
+};
+
+static void free_temp_buffer(struct urb *urb)
+{
+	enum dma_data_direction dir;
+	struct temp_buffer *temp;
+
+	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
+		return;
+
+	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+
+	temp = container_of(urb->transfer_buffer, struct temp_buffer,
+			    data);
+
+	if (dir == DMA_FROM_DEVICE)
+		memcpy(temp->old_xfer_buffer, temp->data,
+		       urb->transfer_buffer_length);
+	urb->transfer_buffer = temp->old_xfer_buffer;
+	kfree(temp->kmalloc_ptr);
+
+	urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
+}
+
+static int alloc_temp_buffer(struct urb *urb, gfp_t mem_flags)
+{
+	enum dma_data_direction dir;
+	struct temp_buffer *temp, *kmalloc_ptr;
+	size_t kmalloc_size;
+
+	if (urb->num_sgs || urb->sg ||
+	    urb->transfer_buffer_length == 0 ||
+	    !((uintptr_t)urb->transfer_buffer & (TEGRA_USB_DMA_ALIGN - 1)))
+		return 0;
+
+	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+
+	/* Allocate a buffer with enough padding for alignment */
+	kmalloc_size = urb->transfer_buffer_length +
+		sizeof(struct temp_buffer) + TEGRA_USB_DMA_ALIGN - 1;
+
+	kmalloc_ptr = kmalloc(kmalloc_size, mem_flags);
+	if (!kmalloc_ptr)
+		return -ENOMEM;
+
+	/* Position our struct temp_buffer such that data is aligned */
+	temp = PTR_ALIGN(kmalloc_ptr + 1, TEGRA_USB_DMA_ALIGN) - 1;
+
+	temp->kmalloc_ptr = kmalloc_ptr;
+	temp->old_xfer_buffer = urb->transfer_buffer;
+	if (dir == DMA_TO_DEVICE)
+		memcpy(temp->data, urb->transfer_buffer,
+		       urb->transfer_buffer_length);
+	urb->transfer_buffer = temp->data;
+
+	urb->transfer_flags |= URB_ALIGNED_TEMP_BUFFER;
+
+	return 0;
+}
+
+static int tegra_ehci_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
+				      gfp_t mem_flags)
+{
+	int ret;
+
+	ret = alloc_temp_buffer(urb, mem_flags);
+	if (ret)
+		return ret;
+
+	ret = usb_hcd_map_urb_for_dma(hcd, urb, mem_flags);
+	if (ret)
+		free_temp_buffer(urb);
+
+	return ret;
+}
+
+static void tegra_ehci_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
+{
+	usb_hcd_unmap_urb_for_dma(hcd, urb);
+	free_temp_buffer(urb);
+}
+
 static const struct hc_driver tegra_ehci_hc_driver = {
 	.description		= hcd_name,
 	.product_desc		= "Tegra EHCI Host Controller",
@@ -398,6 +486,8 @@ static const struct hc_driver tegra_ehci_hc_driver = {
 	.shutdown		= tegra_ehci_shutdown,
 	.urb_enqueue		= ehci_urb_enqueue,
 	.urb_dequeue		= ehci_urb_dequeue,
+	.map_urb_for_dma	= tegra_ehci_map_urb_for_dma,
+	.unmap_urb_for_dma	= tegra_ehci_unmap_urb_for_dma,
 	.endpoint_disable	= ehci_endpoint_disable,
 	.endpoint_reset		= ehci_endpoint_reset,
 	.get_frame_number	= ehci_get_frame,
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
