From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v4 4/6] drm/nouveau: synchronize BOs when
 required
Date: Fri, 11 Jul 2014 09:41:38 +0200
Message-ID: <20140711074138.GW17271@phenom.ffwll.local>
References: <1404807961-30530-1-git-send-email-acourbot@nvidia.com>
 <1404807961-30530-5-git-send-email-acourbot@nvidia.com>
 <20140710130449.GG17271@phenom.ffwll.local>
 <53BF4E9B.7090606@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53BF4E9B.7090606-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 11, 2014 at 11:40:27AM +0900, Alexandre Courbot wrote:
> On 07/10/2014 10:04 PM, Daniel Vetter wrote:
> >On Tue, Jul 08, 2014 at 05:25:59PM +0900, Alexandre Courbot wrote:
> >>On architectures for which access to GPU memory is non-coherent,
> >>caches need to be flushed and invalidated explicitly when BO control
> >>changes between CPU and GPU.
> >>
> >>This patch adds buffer synchronization functions which invokes the
> >>correct API (PCI or DMA) to ensure synchronization is effective.
> >>
> >>Based on the TTM DMA cache helper patches by Lucas Stach.
> >>
> >>Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> >>Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>---
> >>  drivers/gpu/drm/nouveau/nouveau_bo.c  | 56 +++++++++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/nouveau/nouveau_bo.h  |  2 ++
> >>  drivers/gpu/drm/nouveau/nouveau_gem.c | 12 ++++++++
> >>  3 files changed, 70 insertions(+)
> >>
> >>diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >>index 67e9e8e2e2ec..47e4e8886769 100644
> >>--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >>+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >>@@ -402,6 +402,60 @@ nouveau_bo_unmap(struct nouveau_bo *nvbo)
> >>  		ttm_bo_kunmap(&nvbo->kmap);
> >>  }
> >>
> >>+void
> >>+nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
> >>+{
> >>+	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
> >>+	struct nouveau_device *device = nouveau_dev(drm->dev);
> >>+	struct ttm_dma_tt *ttm_dma = (struct ttm_dma_tt *)nvbo->bo.ttm;
> >>+	int i;
> >>+
> >>+	if (!ttm_dma)
> >>+		return;
> >>+
> >>+	if (nv_device_is_cpu_coherent(device) || nvbo->force_coherent)
> >>+		return;
> >
> >Is the is_cpu_coherent check really required? On coherent platforms the
> >sync_for_foo should be a noop. It's the dma api's job to encapsulate this
> >knowledge so that drivers can be blissfully ignorant. The explicit
> >is_coherent check makes this a bit leaky. And same comment that underlying
> >the bus-specifics dma-mapping functions are identical.
> 
> I think you are right, the is_cpu_coherent check should not be needed here.
> I still think we should have separate paths for the PCI/DMA cases though,
> unless you can point me to a source that clearly states that the PCI API is
> deprecated and that DMA should be used instead.

Ah, on 2nd look I've found it again. Quoting
Documentation/DMA-API-HOWTO.txt:

"Note that the DMA API works with any bus independent of the underlying
microprocessor architecture. You should use the DMA API rather than the
bus-specific DMA API, i.e., use the dma_map_*() interfaces rather than the
pci_map_*() interfaces."

The advice is fairly strong here I think ;-) And imo the idea makes sense,
since it allows drivers like nouveau here to care much less about the
actual bus used to get data to/from the ip block. And if you look at intel
gfx it makes even more sense since the pci layer we have is really just a
thin fake shim whacked on top of the hw (on SoCs at least).

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
