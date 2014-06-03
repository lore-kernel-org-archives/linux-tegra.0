From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] drm/nouveau/vm: fix mapping of SG pages list
Date: Tue,  3 Jun 2014 22:56:28 +0900
Message-ID: <1401803788-21494-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <treding@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

SG pages lists (not to be confused with scatterlists) are a list of 4KB
memory pages used to define a nouveau_mem. Mapping them to a VM that
does not use 4KB apertures resulted in each subsequent 4KB physical page
being mapped into a larger VM aperture, thus creating an incorrect,
overlapping mapping.

This patch fixes this issue by detecting when such mappings occur and by
skipping the required number of pages in the list to ensure a correct
linear mapping.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Ben, how does this look? This issue has been highlighted by the GK20A
RAM driver which makes use of nouveau_mem::pages to provide system
memory. The mapping overlap resulted in rendering issues for buffers
that were bigger than 1 big VM page.

I believe this is the correct way to fix this, and this way of building
nouveau_mem instances is not much used in the driver anyway, but you
know better. :)

 drivers/gpu/drm/nouveau/core/subdev/vm/base.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
index 7dd680f..db35e8d 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/vm/base.c
@@ -152,13 +152,18 @@ nouveau_vm_map_sg(struct nouveau_vma *vma, u64 delta, u64 length,
 		end = (pte + num);
 		if (unlikely(end >= max))
 			end = max;
-		len = end - pte;
+
+		/*
+		 * Map pages >4KB one by one so we can fix the list pointer
+		 * as to not map intermediate pages to the next PTE
+		 */
+		len = bits ? 1 : end - pte;
 
 		vmm->map_sg(vma, pgt, mem, pte, len, list);
 
 		num  -= len;
 		pte  += len;
-		list += len;
+		list += len << bits;
 		if (unlikely(end >= max)) {
 			pde++;
 			pte = 0;
-- 
2.0.0
