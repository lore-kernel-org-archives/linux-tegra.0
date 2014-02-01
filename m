From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [RFC 09/16] drm/nouveau/fb: support platform devices
Date: Sat,  1 Feb 2014 12:16:51 +0900
Message-ID: <1391224618-3794-10-git-send-email-acourbot@nvidia.com>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: gnurou@gmail.com, Eric Brower <ebrower@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Terje Bergstrom <tbergstrom@nvidia.com>, Ken Adams <KAdams@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Use abstracted resource query functions to allow FB core to handle
both PCI and platform devices.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c
index 45470e1..0670ae3 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nvc0.c
@@ -70,8 +70,7 @@ nvc0_fb_dtor(struct nouveau_object *object)
 	struct nvc0_fb_priv *priv = (void *)object;
 
 	if (priv->r100c10_page) {
-		pci_unmap_page(device->pdev, priv->r100c10, PAGE_SIZE,
-			       PCI_DMA_BIDIRECTIONAL);
+		nv_device_unmap_page(device, priv->r100c10);
 		__free_page(priv->r100c10_page);
 	}
 
@@ -94,10 +93,8 @@ nvc0_fb_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	priv->r100c10_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
 	if (priv->r100c10_page) {
-		priv->r100c10 = pci_map_page(device->pdev, priv->r100c10_page,
-					     0, PAGE_SIZE,
-					     PCI_DMA_BIDIRECTIONAL);
-		if (pci_dma_mapping_error(device->pdev, priv->r100c10))
+		priv->r100c10 = nv_device_map_page(device, priv->r100c10_page);
+		if (!priv->r100c10)
 			return -EFAULT;
 	}
 
-- 
1.8.5.3
