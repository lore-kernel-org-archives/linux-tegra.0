From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 3/6] drm/nouveau: introduce
	nv_device_is_cpu_coherent()
Date: Tue, 8 Jul 2014 17:25:58 +0900
Message-ID: <1404807961-30530-4-git-send-email-acourbot@nvidia.com>
References: <1404807961-30530-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1404807961-30530-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add a function allowing us to know whether a device is CPU-coherent,
i.e. accesses performed by the CPU on GPU-mapped buffers will
be immediately visible on the GPU side and vice-versa.

For now, a device is considered to be coherent if it uses the PCI bus on
a non-ARM architecture.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/device/base.c  | 6 ++++++
 drivers/gpu/drm/nouveau/core/include/core/device.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/engine/device/base.c b/drivers/gpu/drm/nouveau/core/engine/device/base.c
index e4e9e64988fe..23c7061aac3c 100644
--- a/drivers/gpu/drm/nouveau/core/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/core/engine/device/base.c
@@ -520,6 +520,12 @@ nv_device_get_irq(struct nouveau_device *device, bool stall)
 	}
 }
 
+bool
+nv_device_is_cpu_coherent(struct nouveau_device *device)
+{
+	return (!IS_ENABLED(CONFIG_ARM) && nv_device_is_pci(device));
+}
+
 static struct nouveau_oclass
 nouveau_device_oclass = {
 	.handle = NV_ENGINE(DEVICE, 0x00),
diff --git a/drivers/gpu/drm/nouveau/core/include/core/device.h b/drivers/gpu/drm/nouveau/core/include/core/device.h
index a8a9a9cf16cb..1f9d5d87cf06 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/device.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/device.h
@@ -171,4 +171,7 @@ nv_device_unmap_page(struct nouveau_device *device, dma_addr_t addr);
 int
 nv_device_get_irq(struct nouveau_device *device, bool stall);
 
+bool
+nv_device_is_cpu_coherent(struct nouveau_device *device);
+
 #endif
-- 
2.0.0
