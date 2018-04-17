From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH] gpu: drm: tegra: Adding new typedef vm_fault_t
Date: Tue, 17 Apr 2018 19:17:55 +0530
Message-ID: <20180417134755.GA30291@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, willy@infradead.org
List-Id: linux-tegra@vger.kernel.org

Use new return type vm_fault_t for fault handler. For
now, this is just documenting that the function returns
a VM_FAULT value rather than an errno. Once all instances
are converted, vm_fault_t will become a distinct type.

Reference id -> 1c8f422059ae ("mm: change return type to
vm_fault_t")

Previously vm_insert_page() returns err which driver
mapped into VM_FAULT_* type. The new function 
vmf_insert_page() will replace this inefficiency by
returning VM_FAULT_* type.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/tegra/gem.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 49b9bf2..6121493 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -422,14 +422,13 @@ int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
 	return 0;
 }

-static int tegra_bo_fault(struct vm_fault *vmf)
+static vm_fault_t tegra_bo_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *gem = vma->vm_private_data;
 	struct tegra_bo *bo = to_tegra_bo(gem);
 	struct page *page;
 	pgoff_t offset;
-	int err;

 	if (!bo->pages)
 		return VM_FAULT_SIGBUS;
@@ -437,20 +436,7 @@ static int tegra_bo_fault(struct vm_fault *vmf)
 	offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
 	page = bo->pages[offset];

-	err = vm_insert_page(vma, vmf->address, page);
-	switch (err) {
-	case -EAGAIN:
-	case 0:
-	case -ERESTARTSYS:
-	case -EINTR:
-	case -EBUSY:
-		return VM_FAULT_NOPAGE;
-
-	case -ENOMEM:
-		return VM_FAULT_OOM;
-	}
-
-	return VM_FAULT_SIGBUS;
+	return vmf_insert_page(vma, vmf->address, page);
 }

 const struct vm_operations_struct tegra_bo_vm_ops = {
--
1.9.1
