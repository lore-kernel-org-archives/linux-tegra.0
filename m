From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [RFC 05/16] drm/nouveau/bar: support platform devices
Date: Sat,  1 Feb 2014 12:16:47 +0900
Message-ID: <1391224618-3794-6-git-send-email-acourbot@nvidia.com>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Terje Bergstrom <tbergstrom@nvidia.com>, Ken Adams <KAdams@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Eric Brower <ebrower@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Remove PCI-dependent code so the BAR core can also handle platform
devices.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nouveau/core/subdev/bar/base.c |  4 ++--
 drivers/gpu/drm/nouveau/core/subdev/bar/nv50.c |  4 ++--
 drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c | 15 +++++++--------
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/base.c b/drivers/gpu/drm/nouveau/core/subdev/bar/base.c
index 7098ddd..bdf5941 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bar/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bar/base.c
@@ -118,8 +118,8 @@ nouveau_bar_create_(struct nouveau_object *parent,
 	if (ret)
 		return ret;
 
-	bar->iomem = ioremap(pci_resource_start(device->pdev, 3),
-			     pci_resource_len(device->pdev, 3));
+	bar->iomem = ioremap(nv_device_resource_start(device, 3),
+			     nv_device_resource_len(device, 3));
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/bar/nv50.c
index 090d594..baa2b62 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bar/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bar/nv50.c
@@ -139,7 +139,7 @@ nv50_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	/* BAR3 */
 	start = 0x0100000000ULL;
-	limit = start + pci_resource_len(device->pdev, 3);
+	limit = start + nv_device_resource_len(device, 3);
 
 	ret = nouveau_vm_new(device, start, limit, start, &vm);
 	if (ret)
@@ -173,7 +173,7 @@ nv50_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	/* BAR1 */
 	start = 0x0000000000ULL;
-	limit = start + pci_resource_len(device->pdev, 1);
+	limit = start + nv_device_resource_len(device, 1);
 
 	ret = nouveau_vm_new(device, start, limit--, start, &vm);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
index bac5e75..3f30db6 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
@@ -84,7 +84,6 @@ nvc0_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	      struct nouveau_object **pobject)
 {
 	struct nouveau_device *device = nv_device(parent);
-	struct pci_dev *pdev = device->pdev;
 	struct nvc0_bar_priv *priv;
 	struct nouveau_gpuobj *mem;
 	struct nouveau_vm *vm;
@@ -107,14 +106,14 @@ nvc0_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	if (ret)
 		return ret;
 
-	ret = nouveau_vm_new(device, 0, pci_resource_len(pdev, 3), 0, &vm);
+	ret = nouveau_vm_new(device, 0, nv_device_resource_len(device, 3), 0, &vm);
 	if (ret)
 		return ret;
 
 	atomic_inc(&vm->engref[NVDEV_SUBDEV_BAR]);
 
 	ret = nouveau_gpuobj_new(nv_object(priv), NULL,
-				 (pci_resource_len(pdev, 3) >> 12) * 8,
+				 (nv_device_resource_len(device, 3) >> 12) * 8,
 				 0x1000, NVOBJ_FLAG_ZERO_ALLOC,
 				 &vm->pgt[0].obj[0]);
 	vm->pgt[0].refcount[0] = 1;
@@ -128,8 +127,8 @@ nvc0_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	nv_wo32(mem, 0x0200, lower_32_bits(priv->bar[0].pgd->addr));
 	nv_wo32(mem, 0x0204, upper_32_bits(priv->bar[0].pgd->addr));
-	nv_wo32(mem, 0x0208, lower_32_bits(pci_resource_len(pdev, 3) - 1));
-	nv_wo32(mem, 0x020c, upper_32_bits(pci_resource_len(pdev, 3) - 1));
+	nv_wo32(mem, 0x0208, lower_32_bits(nv_device_resource_len(device, 3) - 1));
+	nv_wo32(mem, 0x020c, upper_32_bits(nv_device_resource_len(device, 3) - 1));
 
 	/* BAR1 */
 	ret = nouveau_gpuobj_new(nv_object(priv), NULL, 0x1000, 0, 0,
@@ -143,7 +142,7 @@ nvc0_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	if (ret)
 		return ret;
 
-	ret = nouveau_vm_new(device, 0, pci_resource_len(pdev, 1), 0, &vm);
+	ret = nouveau_vm_new(device, 0, nv_device_resource_len(device, 1), 0, &vm);
 	if (ret)
 		return ret;
 
@@ -156,8 +155,8 @@ nvc0_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	nv_wo32(mem, 0x0200, lower_32_bits(priv->bar[1].pgd->addr));
 	nv_wo32(mem, 0x0204, upper_32_bits(priv->bar[1].pgd->addr));
-	nv_wo32(mem, 0x0208, lower_32_bits(pci_resource_len(pdev, 1) - 1));
-	nv_wo32(mem, 0x020c, upper_32_bits(pci_resource_len(pdev, 1) - 1));
+	nv_wo32(mem, 0x0208, lower_32_bits(nv_device_resource_len(device, 1) - 1));
+	nv_wo32(mem, 0x020c, upper_32_bits(nv_device_resource_len(device, 1) - 1));
 
 	priv->base.alloc = nouveau_bar_alloc;
 	priv->base.kmap = nvc0_bar_kmap;
-- 
1.8.5.3
