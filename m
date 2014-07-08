From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 0/6] drm: nouveau: memory coherency on ARM
Date: Tue, 8 Jul 2014 17:25:55 +0900
Message-ID: <1404807961-30530-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Another revision of this patchset critical for GK20A to operate.

Previous attempts were exclusively using either TTM's regular page allocator or 
the DMA API one. Both have their advantages and drawbacks: the page allocator is 
fast but requires explicit synchronization on non-coherent architectures, 
whereas the DMA allocator always returns coherent memory, but is also slower,
creates a permanent kernel mapping, and is more constrained as to which memory
it can use.

This version attempts to use the most-fit allocator according to the buffer 
use-case:
- buffers that are passed to user-space can explicitly be synced during their 
  validation and preparation for CPU access, as previously shown by Lucas 
  (http://lists.freedesktop.org/archives/nouveau/2013-August/014029.html ). For 
  these, we don't mind if the memory is not coherent and prefer to use the page 
  allocator.
- buffers that are used by the kernel, typically fences and GPFIFO buffers, are
  accessed rarely and thus should not trigger a costly flush or cache
  invalidation. For these, we want to guarantee coherent access and use the DMA
  API if necessary.

This series attempts to implement this behavior by allowing the
TTM_PL_FLAG_UNCACHED flag to be passed to nouveau_bo_new(). On coherent 
architectures this flag is a no-op ; on non-coherent architectures, it will 
force the creation of a coherent buffer using the DMA-API.

Several fixes and changes were necessary to enable this behavior:
- CPU addresses of DMA-allocated BOs must be made visible (patch 1) so the 
  coherent mapping can be used by drivers
- The DMA-sync functions are required for BOs populated using the page allocator 
  (patch 4). Pages need to be mapped to the device using the correct API if we
  are to call the sync functions (patch 2). Additionally, we need to understand 
  whether we are on a CPU-coherent architecture (patch 3).
- Coherent BOs need to be detected by Nouveau so their coherent kernel mapping
  can be used instead of creating a new one (patch 5).
- Finally, buffers that are used by the kernel should be requested to be
  coherent (page 6).

Changes since v3:
- Only use the DMA allocator for BOs that strictly require to be coherent
- Fixed the way pages are mapped to the GPU on platform devices
- Thoroughly checked with CONFIG_DMA_API_DEBUG that there were no API violations

Alexandre Courbot (6):
  drm/ttm: expose CPU address of DMA-allocated pages
  drm/nouveau: map pages using DMA API on platform devices
  drm/nouveau: introduce nv_device_is_cpu_coherent()
  drm/nouveau: synchronize BOs when required
  drm/nouveau: implement explicitly coherent BOs
  drm/nouveau: allocate GPFIFOs and fences coherently

 drivers/gpu/drm/nouveau/core/engine/device/base.c  |  14 ++-
 drivers/gpu/drm/nouveau/core/include/core/device.h |   3 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               | 132 +++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.h               |   3 +
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |  12 ++
 drivers/gpu/drm/nouveau/nv84_fence.c               |   4 +-
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c           |   2 +
 drivers/gpu/drm/ttm/ttm_tt.c                       |   6 +-
 include/drm/ttm/ttm_bo_driver.h                    |   2 +
 10 files changed, 167 insertions(+), 13 deletions(-)

-- 
2.0.0
