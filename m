From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/4] drm/nouveau: hook up cache sync functions
Date: Mon, 19 May 2014 11:44:56 +0200
Message-ID: <1400492696.8467.21.camel@weser.hi.pengutronix.de>
References: <1400483458-9648-1-git-send-email-acourbot@nvidia.com>
 <1400483458-9648-4-git-send-email-acourbot@nvidia.com>
 <20140519084620.GB7138@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140519084620.GB7138@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 19.05.2014, 10:46 +0200 schrieb Thierry Reding:
> On Mon, May 19, 2014 at 04:10:57PM +0900, Alexandre Courbot wrote:
> > From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> > 
> > Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> > [acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org: make conditional and platform-friendly]
> > Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Perhaps having a propery commit message here would be good.
> 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> [...]
> > +#ifdef NOUVEAU_NEED_CACHE_SYNC
> > +void
> > +nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
> > +{
> > +	struct nouveau_device *device;
> > +	struct ttm_tt *ttm = nvbo->bo.ttm;
> > +
> > +	device = nouveau_dev(nouveau_bdev(ttm->bdev)->dev);
> > +
> > +	if (nvbo->bo.ttm && nvbo->bo.ttm->caching_state == tt_cached)
> > +		ttm_dma_tt_cache_sync_for_cpu((struct ttm_dma_tt *)nvbo->bo.ttm,
> > +					      nv_device_base(device));
> 
> Can we be certain at this point that the struct ttm_tt is in fact a
> struct ttm_dma_tt?

Yes, for all cases except AGP, where things are mapped WC anyways (so
caching_state is always != cached) nouveau_bo_driver uses
nouveau_ttm_tt_create() as its ttm_tt_create callback. This in turn
calls nouveau_sgdma_create_ttm() which uses ttm_dma_tt_init()
unconditionally.

Regards,
Lucas
-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |
