From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v4 2/6] drm/nouveau: map pages using DMA API
 on platform devices
Date: Thu, 10 Jul 2014 14:58:49 +0200
Message-ID: <20140710125849.GF17271@phenom.ffwll.local>
References: <1404807961-30530-1-git-send-email-acourbot@nvidia.com>
 <1404807961-30530-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1404807961-30530-3-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 08, 2014 at 05:25:57PM +0900, Alexandre Courbot wrote:
> page_to_phys() is not the correct way to obtain the DMA address of a
> buffer on a non-PCI system. Use the DMA API functions for this, which
> are portable and will allow us to use other DMA API functions for
> buffer synchronization.
> 
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/engine/device/base.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/base.c b/drivers/gpu/drm/nouveau/core/engine/device/base.c
> index 18c8c7245b73..e4e9e64988fe 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/device/base.c
> @@ -489,7 +489,10 @@ nv_device_map_page(struct nouveau_device *device, struct page *page)
>  		if (pci_dma_mapping_error(device->pdev, ret))
>  			ret = 0;
>  	} else {
> -		ret = page_to_phys(page);
> +		ret = dma_map_page(&device->platformdev->dev, page, 0,
> +				   PAGE_SIZE, DMA_BIDIRECTIONAL);
> +		if (dma_mapping_error(&device->platformdev->dev, ret))
> +			ret = 0;
>  	}
>  
>  	return ret;
> @@ -501,6 +504,9 @@ nv_device_unmap_page(struct nouveau_device *device, dma_addr_t addr)
>  	if (nv_device_is_pci(device))
>  		pci_unmap_page(device->pdev, addr, PAGE_SIZE,
>  			       PCI_DMA_BIDIRECTIONAL);

pci_map/unmap alias to dma_unmap/map when called on the underlying struct
device embedded in pci_device (like for platform drivers). Dunno whether
it's worth to track a pointer to the struct device directly and always
call dma_unmap/map.

Just drive-by comment since I'm interested in how you solve this - i915
has similar fun with buffer sharing and coherent and non-coherent
platforms. Although we don't have fun with pci and non-pci based
platforms.
-Daniel

> +	else
> +		dma_unmap_page(&device->platformdev->dev, addr,
> +			       PAGE_SIZE, DMA_BIDIRECTIONAL);
>  }
>  
>  int
> -- 
> 2.0.0
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
