From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 2/9] drm/nouveau/bar/nvc0: support chips
	without BAR3
Date: Fri, 2 May 2014 18:32:35 +0900
Message-ID: <1399023162-13159-3-git-send-email-acourbot@nvidia.com>
References: <1399023162-13159-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1399023162-13159-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Adapt the NVC0 BAR driver to make it able to support chips that do not
expose a BAR3. When this happens, BAR1 is then used for USERD mapping
and the BAR alloc() functions is disabled, making GPU objects unable
to rely on BAR for data access and falling back to PRAMIN.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c | 114 +++++++++++++------------
 1 file changed, 59 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
index 3f30db62e656..ca8139b9ab27 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
@@ -30,14 +30,16 @@
 
 #include "priv.h"
 
+struct nvc0_bar_priv_vm {
+	struct nouveau_gpuobj *mem;
+	struct nouveau_gpuobj *pgd;
+	struct nouveau_vm *vm;
+};
+
 struct nvc0_bar_priv {
 	struct nouveau_bar base;
 	spinlock_t lock;
-	struct {
-		struct nouveau_gpuobj *mem;
-		struct nouveau_gpuobj *pgd;
-		struct nouveau_vm *vm;
-	} bar[2];
+	struct nvc0_bar_priv_vm bar[2];
 };
 
 static int
@@ -79,87 +81,87 @@ nvc0_bar_unmap(struct nouveau_bar *bar, struct nouveau_vma *vma)
 }
 
 static int
-nvc0_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
-	      struct nouveau_oclass *oclass, void *data, u32 size,
-	      struct nouveau_object **pobject)
+nvc0_bar_init_vm(struct nvc0_bar_priv *priv, struct nvc0_bar_priv_vm *bar_vm,
+		 int bar_nr)
 {
-	struct nouveau_device *device = nv_device(parent);
-	struct nvc0_bar_priv *priv;
-	struct nouveau_gpuobj *mem;
+	struct nouveau_device *device = nv_device(&priv->base);
 	struct nouveau_vm *vm;
+	resource_size_t bar_len;
 	int ret;
 
-	ret = nouveau_bar_create(parent, engine, oclass, &priv);
-	*pobject = nv_object(priv);
-	if (ret)
-		return ret;
-
-	/* BAR3 */
 	ret = nouveau_gpuobj_new(nv_object(priv), NULL, 0x1000, 0, 0,
-				&priv->bar[0].mem);
-	mem = priv->bar[0].mem;
+				&bar_vm->mem);
 	if (ret)
 		return ret;
 
 	ret = nouveau_gpuobj_new(nv_object(priv), NULL, 0x8000, 0, 0,
-				&priv->bar[0].pgd);
+				&bar_vm->pgd);
 	if (ret)
 		return ret;
 
-	ret = nouveau_vm_new(device, 0, nv_device_resource_len(device, 3), 0, &vm);
+	bar_len = nv_device_resource_len(device, bar_nr);
+
+	ret = nouveau_vm_new(device, 0, bar_len, 0, &vm);
 	if (ret)
 		return ret;
 
 	atomic_inc(&vm->engref[NVDEV_SUBDEV_BAR]);
 
-	ret = nouveau_gpuobj_new(nv_object(priv), NULL,
-				 (nv_device_resource_len(device, 3) >> 12) * 8,
-				 0x1000, NVOBJ_FLAG_ZERO_ALLOC,
-				 &vm->pgt[0].obj[0]);
-	vm->pgt[0].refcount[0] = 1;
-	if (ret)
-		return ret;
+	/*
+	 * Bootstrap page table lookup.
+	 */
+	if (bar_nr == 3) {
+		ret = nouveau_gpuobj_new(nv_object(priv), NULL,
+					 (bar_len >> 12) * 8, 0x1000,
+					 NVOBJ_FLAG_ZERO_ALLOC,
+					&vm->pgt[0].obj[0]);
+		vm->pgt[0].refcount[0] = 1;
+		if (ret)
+			return ret;
+	}
 
-	ret = nouveau_vm_ref(vm, &priv->bar[0].vm, priv->bar[0].pgd);
+	ret = nouveau_vm_ref(vm, &bar_vm->vm, bar_vm->pgd);
 	nouveau_vm_ref(NULL, &vm, NULL);
 	if (ret)
 		return ret;
 
-	nv_wo32(mem, 0x0200, lower_32_bits(priv->bar[0].pgd->addr));
-	nv_wo32(mem, 0x0204, upper_32_bits(priv->bar[0].pgd->addr));
-	nv_wo32(mem, 0x0208, lower_32_bits(nv_device_resource_len(device, 3) - 1));
-	nv_wo32(mem, 0x020c, upper_32_bits(nv_device_resource_len(device, 3) - 1));
+	nv_wo32(bar_vm->mem, 0x0200, lower_32_bits(bar_vm->pgd->addr));
+	nv_wo32(bar_vm->mem, 0x0204, upper_32_bits(bar_vm->pgd->addr));
+	nv_wo32(bar_vm->mem, 0x0208, lower_32_bits(bar_len - 1));
+	nv_wo32(bar_vm->mem, 0x020c, upper_32_bits(bar_len - 1));
 
-	/* BAR1 */
-	ret = nouveau_gpuobj_new(nv_object(priv), NULL, 0x1000, 0, 0,
-				&priv->bar[1].mem);
-	mem = priv->bar[1].mem;
-	if (ret)
-		return ret;
+	return 0;
+}
 
-	ret = nouveau_gpuobj_new(nv_object(priv), NULL, 0x8000, 0, 0,
-				&priv->bar[1].pgd);
-	if (ret)
-		return ret;
+static int
+nvc0_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
+	      struct nouveau_oclass *oclass, void *data, u32 size,
+	      struct nouveau_object **pobject)
+{
+	struct nouveau_device *device = nv_device(parent);
+	struct nvc0_bar_priv *priv;
+	bool has_bar3 = nv_device_resource_len(device, 3) != 0;
+	int ret;
 
-	ret = nouveau_vm_new(device, 0, nv_device_resource_len(device, 1), 0, &vm);
+	ret = nouveau_bar_create(parent, engine, oclass, &priv);
+	*pobject = nv_object(priv);
 	if (ret)
 		return ret;
 
-	atomic_inc(&vm->engref[NVDEV_SUBDEV_BAR]);
+	/* BAR3 */
+	if (has_bar3) {
+		ret = nvc0_bar_init_vm(priv, &priv->bar[0], 3);
+		if (ret)
+			return ret;
+		priv->base.alloc = nouveau_bar_alloc;
+		priv->base.kmap = nvc0_bar_kmap;
+	}
 
-	ret = nouveau_vm_ref(vm, &priv->bar[1].vm, priv->bar[1].pgd);
-	nouveau_vm_ref(NULL, &vm, NULL);
+	/* BAR1 */
+	ret = nvc0_bar_init_vm(priv, &priv->bar[1], 1);
 	if (ret)
 		return ret;
 
-	nv_wo32(mem, 0x0200, lower_32_bits(priv->bar[1].pgd->addr));
-	nv_wo32(mem, 0x0204, upper_32_bits(priv->bar[1].pgd->addr));
-	nv_wo32(mem, 0x0208, lower_32_bits(nv_device_resource_len(device, 1) - 1));
-	nv_wo32(mem, 0x020c, upper_32_bits(nv_device_resource_len(device, 1) - 1));
-
-	priv->base.alloc = nouveau_bar_alloc;
-	priv->base.kmap = nvc0_bar_kmap;
 	priv->base.umap = nvc0_bar_umap;
 	priv->base.unmap = nvc0_bar_unmap;
 	priv->base.flush = nv84_bar_flush;
@@ -201,7 +203,9 @@ nvc0_bar_init(struct nouveau_object *object)
 	nv_mask(priv, 0x100c80, 0x00000001, 0x00000000);
 
 	nv_wr32(priv, 0x001704, 0x80000000 | priv->bar[1].mem->addr >> 12);
-	nv_wr32(priv, 0x001714, 0xc0000000 | priv->bar[0].mem->addr >> 12);
+	if (priv->bar[0].mem)
+		nv_wr32(priv, 0x001714,
+			0xc0000000 | priv->bar[0].mem->addr >> 12);
 	return 0;
 }
 
-- 
1.9.2
