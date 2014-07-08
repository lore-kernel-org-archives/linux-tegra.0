From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nouveau/bar: add noncached ioremap
	property
Date: Tue, 8 Jul 2014 16:41:00 +0900
Message-ID: <CAAVeFuLjPAu0Rfbx29dAKjo2bn2k049cQsue+67UwZu8edBEfg@mail.gmail.com>
References: <1403864931-4663-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1403864931-4663-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Ping Ben, how do these two patches look like?

On Fri, Jun 27, 2014 at 7:28 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Some BARs (like GK20A's) do not support being ioremapped write-combined.
> Add a boolean property to the BAR structure and handle that case in the
> Nouveau BO implementation.
>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/include/subdev/bar.h |  3 +++
>  drivers/gpu/drm/nouveau/nouveau_bo.c              | 17 ++++++++++++-----
>  2 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/bar.h b/drivers/gpu/drm/nouveau/core/include/subdev/bar.h
> index 9faa98e67ad8..9002cbb6432b 100644
> --- a/drivers/gpu/drm/nouveau/core/include/subdev/bar.h
> +++ b/drivers/gpu/drm/nouveau/core/include/subdev/bar.h
> @@ -20,6 +20,9 @@ struct nouveau_bar {
>                     u32 flags, struct nouveau_vma *);
>         void (*unmap)(struct nouveau_bar *, struct nouveau_vma *);
>         void (*flush)(struct nouveau_bar *);
> +
> +       /* whether the BAR supports to be ioremapped WC or should be uncached */
> +       bool iomap_uncached;
>  };
>
>  static inline struct nouveau_bar *
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index b6dc85c614be..4db886f9f793 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -500,18 +500,25 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
>                 man->default_caching = TTM_PL_FLAG_CACHED;
>                 break;
>         case TTM_PL_VRAM:
> +               man->flags = TTM_MEMTYPE_FLAG_FIXED |
> +                            TTM_MEMTYPE_FLAG_MAPPABLE;
> +               man->available_caching = TTM_PL_FLAG_UNCACHED |
> +                                        TTM_PL_FLAG_WC;
> +               man->default_caching = TTM_PL_FLAG_WC;
> +
>                 if (nv_device(drm->device)->card_type >= NV_50) {
> +                       /* Some BARs do not support being ioremapped WC */
> +                       if (nouveau_bar(drm->device)->iomap_uncached) {
> +                               man->available_caching = TTM_PL_FLAG_UNCACHED;
> +                               man->default_caching = TTM_PL_FLAG_UNCACHED;
> +                       }
> +
>                         man->func = &nouveau_vram_manager;
>                         man->io_reserve_fastpath = false;
>                         man->use_io_reserve_lru = true;
>                 } else {
>                         man->func = &ttm_bo_manager_func;
>                 }
> -               man->flags = TTM_MEMTYPE_FLAG_FIXED |
> -                            TTM_MEMTYPE_FLAG_MAPPABLE;
> -               man->available_caching = TTM_PL_FLAG_UNCACHED |
> -                                        TTM_PL_FLAG_WC;
> -               man->default_caching = TTM_PL_FLAG_WC;
>                 break;
>         case TTM_PL_TT:
>                 if (nv_device(drm->device)->card_type >= NV_50)
> --
> 2.0.0
>
