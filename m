From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/tegra: Reuse IOVA mapping where possible
Date: Wed, 5 Feb 2020 20:11:35 +0300
Message-ID: <85912bac-6c67-5865-e78e-444720669005@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200204135926.1156340-3-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

04.02.2020 16:59, Thierry Reding пишет:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This partially reverts the DMA API support that was recently merged
> because it was causing performance regressions on older Tegra devices.
> Unfortunately, the cache maintenance performed by dma_map_sg() and
> dma_unmap_sg() causes performance to drop by a factor of 10.
> 
> The right solution for this would be to cache mappings for buffers per
> consumer device, but that's a bit involved. Instead, we simply revert to
> the old behaviour of sharing IOVA mappings when we know that devices can
> do so (i.e. they share the same IOMMU domain).
> 
> Reported-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/gem.c   | 10 +++++++-
>  drivers/gpu/drm/tegra/plane.c | 44 ++++++++++++++++++++---------------
>  drivers/gpu/host1x/job.c      | 32 ++++++++++++++++++++++---
>  3 files changed, 63 insertions(+), 23 deletions(-)

Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
