From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH] USB: usbfs: check cpu address range before remap
Date: Wed, 4 Sep 2019 13:47:31 +0530
Message-ID: <1567585051-1354-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, stern@rowland.harvard.edu, dmitry.torokhov@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

In usbfs mmap, usb_alloc_coherent is used to allocate memory.
This Memory is then remapped to user space memory using remap_pfn_range.
remap_pfn_range needs phy address of memory, for which virt_to_phy API
is used. This API works only if memory is allocated using kmalloc. But
usb_alloc_coherent can allocate memory in vmalloc range and this causes
wrong remap of user memory.

Check if address returned by usb_alloc_coherent failed in vmalloc range
and if yes, use remap_vmalloc_range API, else use remap_pfn_range to remap
address to user space.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 drivers/usb/core/devio.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index a945ad7..20999de 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -250,7 +250,12 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
 	usbm->vma_use_count = 1;
 	INIT_LIST_HEAD(&usbm->memlist);
 
-	if (remap_pfn_range(vma, vma->vm_start,
+	if (is_vmalloc_addr(usbm->mem)) {
+		if (remap_vmalloc_range(vma, usbm->mem, 0) < 0) {
+			dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
+			return -EAGAIN;
+		}
+	} else if (remap_pfn_range(vma, vma->vm_start,
 			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
 			size, vma->vm_page_prot) < 0) {
 		dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
-- 
2.7.4
