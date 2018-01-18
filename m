From: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 3/4] drm: add ARM flush implementations
Date: Thu, 18 Jan 2018 09:20:11 -0800
Message-ID: <CAAfnVB=W9XNid3NX7Jr5axPF4FG_QbQAR+_uwdAqWwO3-_N+7Q@mail.gmail.com>
References: <20180117003559.67837-1-gurchetansingh@chromium.org>
 <20180117003559.67837-3-gurchetansingh@chromium.org>
 <20180117083105.GG2759@phenom.ffwll.local>
 <CAAfnVBm4Mp8vC4aBmrP2rJeRSBN_AFN5gaZfijg9BCJEBupDzw@mail.gmail.com>
 <CAKMK7uHoAqYsgqOTT4O=NQFvj51M2tKp+c2Sm8t4t01QN9Jkfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1199688313=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uHoAqYsgqOTT4O=NQFvj51M2tKp+c2Sm8t4t01QN9Jkfg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

--===============1199688313==
Content-Type: multipart/alternative; boundary="94eb2c1c016a35aa0f0563102d93"

--94eb2c1c016a35aa0f0563102d93
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 11:42 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Jan 17, 2018 at 11:46 PM, Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >> dma api just isn't quite sufficient for implementing fast gpu drivers.
> >
> >
> > Can you elaborate?  IIRC the DMA API has strong synchronization
> guarantees
> > and that can be problematic for GPU drivers.  However, using the DMA API
> for
> > flushing doesn't necessarily mean the driver has to use the rest of the
> DMA
> > API.
> >
> >> but then it'd need to directly flush cpu caches and bypass the dma api.
> >
> >
> > On ARM, cache flushing seems to vary from chipset to chipset.  For
> example,
> > on ARM32 a typical call-stack for dma_sync_single_for_device looks like:
> >
> > arm_dma_sync_single_for_device
> > __dma_page_cpu_to_dev
> > outer_clean_range
> > outer_cache.clean_range
> >
> > There are multiple clean_range implementations out there (i.e,
> > aurora_clean_range, l2c210_clean_range, feroceon_l2_clean_range), so
> that's
> > why the DMA API was used in this case.  On ARM64, things are a little
> > simpler, but the DMA API seems to go directly to assembly
> (__dma_map_area)
> > after a little indirection.  Why do you think that's inefficient?
>
> I never said it's inefficient. My only gripe is with adding the
> pointless struct device * argument to flushing functions which really
> don't care (nor should care) about the device. Because what we really
> want to call is outer_clean_range here, and that doesn't need a struct
> device *. Imo that function (or something similar) needs to be
> exported and then used by drm_flush_* functions.
>

Okay, we can go with outer_clean_range on ARM and
__dma_map_area/__dma_flush_area
on ARM64.  One concern, on ARM64 at-least, the header
(arm64/include/asm/cacheflush.h) indicates we shouldn't call these
functions directly for whatever reason:

"Cache maintenance functions used by the DMA API. No to be used directly."

However, if no one objects, that's the route we'll go.

>
> Also note that arm has both flush and invalidate functions, but on x86
> those are the same implementation (and we don't have a separate
> drm_invalidate_* set of functions). That doesn't look like a too good
> idea.
>
> Of course that doesn't solve the problem of who's supposed to call it
> and when in the dma-buf sharing situation.
> -Daniel
>
> > On Wed, Jan 17, 2018 at 12:31 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Tue, Jan 16, 2018 at 04:35:58PM -0800, Gurchetan Singh wrote:
> >> > The DMA API can be used to flush scatter gather tables and physical
> >> > pages on ARM devices.
> >> >
> >> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> >> > ---
> >> >  drivers/gpu/drm/drm_cache.c                 | 17 +++++++++++++++++
> >> >  drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  7 ++-----
> >> >  drivers/gpu/drm/tegra/gem.c                 |  6 +-----
> >> >  3 files changed, 20 insertions(+), 10 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> >> > index 3d2bb9d71a60..98d6ebb40e96 100644
> >> > --- a/drivers/gpu/drm/drm_cache.c
> >> > +++ b/drivers/gpu/drm/drm_cache.c
> >> > @@ -105,6 +105,18 @@ drm_flush_pages(struct device *dev, struct page
> >> > *pages[],
> >> >                                  (unsigned long)page_virtual +
> >> > PAGE_SIZE);
> >> >               kunmap_atomic(page_virtual);
> >> >       }
> >> > +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> >> > +     unsigned long i;
> >> > +     dma_addr_t dma_handle;
> >> > +
> >> > +     if (!dev)
> >> > +             return;
> >> > +
> >> > +     for (i = 0; i < num_pages; i++) {
> >> > +             dma_handle = phys_to_dma(drm->dev,
> >> > page_to_phys(pages[i]));
> >> > +             dma_sync_single_for_device(dev, dma_handle, PAGE_SIZE,
> >> > +                                        DMA_TO_DEVICE);
> >>
> >> Erm no. These functions here are super-low-level functions used by
> drivers
> >> which know exactly what they're doing. Which is reimplementing half of
> the
> >> dma api behind the dma api's back because the dma api just isn't quite
> >> sufficient for implementing fast gpu drivers.
> >>
> >> If all you end up doing is calling the dma api again, then pls just call
> >> it directly.
> >>
> >> And just to make it clear: I'd be perfectly fine with adding arm support
> >> here, but then it'd need to directly flush cpu caches and bypass the dma
> >> api. Otherwise this is pointless.
> >> -Daniel
> >>
> >> > +     }
> >> >  #else
> >> >       pr_err("Architecture has no drm_cache.c support\n");
> >> >       WARN_ON_ONCE(1);
> >> > @@ -136,6 +148,11 @@ drm_flush_sg(struct device *dev, struct sg_table
> >> > *st)
> >> >
> >> >       if (wbinvd_on_all_cpus())
> >> >               pr_err("Timed out waiting for cache flush\n");
> >> > +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> >> > +     if (!dev)
> >> > +             return;
> >> > +
> >> > +     dma_sync_sg_for_device(dev, st->sgl, st->nents, DMA_TO_DEVICE);
> >> >  #else
> >> >       pr_err("Architecture has no drm_cache.c support\n");
> >> >       WARN_ON_ONCE(1);
> >> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> >> > b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> >> > index 8ac7eb25e46d..0157f90b5d10 100644
> >> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> >> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> >> > @@ -14,6 +14,7 @@
> >> >
> >> >  #include <drm/drm.h>
> >> >  #include <drm/drmP.h>
> >> > +#include <drm/drm_cache.h>
> >> >  #include <drm/drm_gem.h>
> >> >  #include <drm/drm_vma_manager.h>
> >> >  #include <linux/iommu.h>
> >> > @@ -99,15 +100,11 @@ static int rockchip_gem_get_pages(struct
> >> > rockchip_gem_object *rk_obj)
> >> >       /*
> >> >        * Fake up the SG table so that dma_sync_sg_for_device() can be
> >> > used
> >> >        * to flush the pages associated with it.
> >> > -      *
> >> > -      * TODO: Replace this by drm_flush_sg() once it can be
> implemented
> >> > -      * without relying on symbols that are not exported.
> >> >        */
> >> >       for_each_sg(rk_obj->sgt->sgl, s, rk_obj->sgt->nents, i)
> >> >               sg_dma_address(s) = sg_phys(s);
> >> >
> >> > -     dma_sync_sg_for_device(drm->dev, rk_obj->sgt->sgl,
> >> > rk_obj->sgt->nents,
> >> > -                            DMA_TO_DEVICE);
> >> > +     drm_flush_sg(drm->dev, rk_obj->sgt);
> >> >
> >> >       return 0;
> >> >
> >> > diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> >> > index ab1e53d434e8..9945fd2f6bd6 100644
> >> > --- a/drivers/gpu/drm/tegra/gem.c
> >> > +++ b/drivers/gpu/drm/tegra/gem.c
> >> > @@ -230,15 +230,11 @@ static int tegra_bo_get_pages(struct drm_device
> >> > *drm, struct tegra_bo *bo)
> >> >       /*
> >> >        * Fake up the SG table so that dma_sync_sg_for_device() can be
> >> > used
> >> >        * to flush the pages associated with it.
> >> > -      *
> >> > -      * TODO: Replace this by drm_clflash_sg() once it can be
> >> > implemented
> >> > -      * without relying on symbols that are not exported.
> >> >        */
> >> >       for_each_sg(bo->sgt->sgl, s, bo->sgt->nents, i)
> >> >               sg_dma_address(s) = sg_phys(s);
> >> >
> >> > -     dma_sync_sg_for_device(drm->dev, bo->sgt->sgl, bo->sgt->nents,
> >> > -                            DMA_TO_DEVICE);
> >> > +     drm_flush_sg(drm->dev, bo->sgt);
> >> >
> >> >       return 0;
> >> >
> >> > --
> >> > 2.13.5
> >> >
> >> > _______________________________________________
> >> > dri-devel mailing list
> >> > dri-devel@lists.freedesktop.org
> >> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
> >
> >
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>

--94eb2c1c016a35aa0f0563102d93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jan 17, 2018 at 11:42 PM, Daniel Vetter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"m_2460435030679688596gmail-">On Wed, Jan 17, 2018 at 11:46 PM, Gurcheta=
n Singh<br>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; dma api just isn&#39;t quite sufficient for implementing fast gpu =
drivers.<br>
&gt;<br>
&gt;<br>
&gt; Can you elaborate?=C2=A0 IIRC the DMA API has strong synchronization g=
uarantees<br>
&gt; and that can be problematic for GPU drivers.=C2=A0 However, using the =
DMA API for<br>
&gt; flushing doesn&#39;t necessarily mean the driver has to use the rest o=
f the DMA<br>
&gt; API.<br>
&gt;<br>
&gt;&gt; but then it&#39;d need to directly flush cpu caches and bypass the=
 dma api.<br>
&gt;<br>
&gt;<br>
&gt; On ARM, cache flushing seems to vary from chipset to chipset.=C2=A0 Fo=
r example,<br>
&gt; on ARM32 a typical call-stack for dma_sync_single_for_device looks lik=
e:<br>
&gt;<br>
&gt; arm_dma_sync_single_for_device<br>
&gt; __dma_page_cpu_to_dev<br>
&gt; outer_clean_range<br>
&gt; outer_cache.clean_range<br>
&gt;<br>
&gt; There are multiple clean_range implementations out there (i.e,<br>
&gt; aurora_clean_range, l2c210_clean_range, feroceon_l2_clean_range), so t=
hat&#39;s<br>
&gt; why the DMA API was used in this case.=C2=A0 On ARM64, things are a li=
ttle<br>
&gt; simpler, but the DMA API seems to go directly to assembly (__dma_map_a=
rea)<br>
&gt; after a little indirection.=C2=A0 Why do you think that&#39;s ineffici=
ent?<br>
<br>
</span>I never said it&#39;s inefficient. My only gripe is with adding the<=
br>
pointless struct device * argument to flushing functions which really<br>
don&#39;t care (nor should care) about the device. Because what we really<b=
r>
want to call is outer_clean_range here, and that doesn&#39;t need a struct<=
br>
device *. Imo that function (or something similar) needs to be<br>
exported and then used by drm_flush_* functions.<br></blockquote><div><br><=
/div><div>Okay, we can go with=C2=A0outer_clean_range on ARM and=C2=A0__dma=
_map_area/__dma_<wbr>flush_area on ARM64.=C2=A0 One concern, on ARM64 at-le=
ast, the header (arm64/include/asm/cacheflush.<wbr>h) indicates we shouldn&=
#39;t call these functions directly for whatever reason:</div><div><br></di=
v><div>&quot;Cache maintenance functions used by the DMA API. No to be used=
 directly.&quot;<br></div><div><br></div><div>However, if no one objects, t=
hat&#39;s the route we&#39;ll go.</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Also note that arm has both flush and invalidate functions, but on x86<br>
those are the same implementation (and we don&#39;t have a separate<br>
drm_invalidate_* set of functions). That doesn&#39;t look like a too good<b=
r>
idea.<br>
<br>
Of course that doesn&#39;t solve the problem of who&#39;s supposed to call =
it<br>
and when in the dma-buf sharing situation.<br>
<span class=3D"m_2460435030679688596gmail-HOEnZb"><font color=3D"#888888">-=
Daniel<br>
</font></span><div class=3D"m_2460435030679688596gmail-HOEnZb"><div class=
=3D"m_2460435030679688596gmail-h5"><br>
&gt; On Wed, Jan 17, 2018 at 12:31 AM, Daniel Vetter &lt;<a href=3D"mailto:=
daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jan 16, 2018 at 04:35:58PM -0800, Gurchetan Singh wrote:<b=
r>
&gt;&gt; &gt; The DMA API can be used to flush scatter gather tables and ph=
ysical<br>
&gt;&gt; &gt; pages on ARM devices.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurcheta=
nsingh@chromium.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<=
br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/drm_cache.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/rockchip/rockc<wbr>hip_drm_gem.c |=C2=
=A0 7 ++-----<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/tegra/gem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-----<br>
&gt;&gt; &gt;=C2=A0 3 files changed, 20 insertions(+), 10 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/dr=
m_cache.c<br>
&gt;&gt; &gt; index 3d2bb9d71a60..98d6ebb40e96 100644<br>
&gt;&gt; &gt; --- a/drivers/gpu/drm/drm_cache.c<br>
&gt;&gt; &gt; +++ b/drivers/gpu/drm/drm_cache.c<br>
&gt;&gt; &gt; @@ -105,6 +105,18 @@ drm_flush_pages(struct device *dev, stru=
ct page<br>
&gt;&gt; &gt; *pages[],<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned long)pag=
e_virtual +<br>
&gt;&gt; &gt; PAGE_SIZE);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kunmap_=
atomic(page_virtual);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0unsigned long i;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0dma_addr_t dma_handle;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!dev)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num_pages; i++) {<b=
r>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_handle =
=3D phys_to_dma(drm-&gt;dev,<br>
&gt;&gt; &gt; page_to_phys(pages[i]));<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_sync_sin=
gle_for_device(de<wbr>v, dma_handle, PAGE_SIZE,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 DMA_TO_DEVICE);<br>
&gt;&gt;<br>
&gt;&gt; Erm no. These functions here are super-low-level functions used by=
 drivers<br>
&gt;&gt; which know exactly what they&#39;re doing. Which is reimplementing=
 half of the<br>
&gt;&gt; dma api behind the dma api&#39;s back because the dma api just isn=
&#39;t quite<br>
&gt;&gt; sufficient for implementing fast gpu drivers.<br>
&gt;&gt;<br>
&gt;&gt; If all you end up doing is calling the dma api again, then pls jus=
t call<br>
&gt;&gt; it directly.<br>
&gt;&gt;<br>
&gt;&gt; And just to make it clear: I&#39;d be perfectly fine with adding a=
rm support<br>
&gt;&gt; here, but then it&#39;d need to directly flush cpu caches and bypa=
ss the dma<br>
&gt;&gt; api. Otherwise this is pointless.<br>
&gt;&gt; -Daniel<br>
&gt;&gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;=C2=A0 #else<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Architecture has no dr=
m_cache.c support\n&quot;);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON_ONCE(1);<br>
&gt;&gt; &gt; @@ -136,6 +148,11 @@ drm_flush_sg(struct device *dev, struct =
sg_table<br>
&gt;&gt; &gt; *st)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (wbinvd_on_all_cpus())<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(=
&quot;Timed out waiting for cache flush\n&quot;);<br>
&gt;&gt; &gt; +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!dev)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0dma_sync_sg_for_device(dev, st-&gt;sgl, =
st-&gt;nents, DMA_TO_DEVICE);<br>
&gt;&gt; &gt;=C2=A0 #else<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Architecture has no dr=
m_cache.c support\n&quot;);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON_ONCE(1);<br>
&gt;&gt; &gt; diff --git a/drivers/gpu/drm/rockchip/roc<wbr>kchip_drm_gem.c=
<br>
&gt;&gt; &gt; b/drivers/gpu/drm/rockchip/roc<wbr>kchip_drm_gem.c<br>
&gt;&gt; &gt; index 8ac7eb25e46d..0157f90b5d10 100644<br>
&gt;&gt; &gt; --- a/drivers/gpu/drm/rockchip/roc<wbr>kchip_drm_gem.c<br>
&gt;&gt; &gt; +++ b/drivers/gpu/drm/rockchip/roc<wbr>kchip_drm_gem.c<br>
&gt;&gt; &gt; @@ -14,6 +14,7 @@<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 #include &lt;drm/drm.h&gt;<br>
&gt;&gt; &gt;=C2=A0 #include &lt;drm/drmP.h&gt;<br>
&gt;&gt; &gt; +#include &lt;drm/drm_cache.h&gt;<br>
&gt;&gt; &gt;=C2=A0 #include &lt;drm/drm_gem.h&gt;<br>
&gt;&gt; &gt;=C2=A0 #include &lt;drm/drm_vma_manager.h&gt;<br>
&gt;&gt; &gt;=C2=A0 #include &lt;linux/iommu.h&gt;<br>
&gt;&gt; &gt; @@ -99,15 +100,11 @@ static int rockchip_gem_get_pages(struct=
<br>
&gt;&gt; &gt; rockchip_gem_object *rk_obj)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Fake up the SG table so that dma=
_sync_sg_for_device() can be<br>
&gt;&gt; &gt; used<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to flush the pages associated wi=
th it.<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 *<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 * TODO: Replace this by drm_flush_sg() =
once it can be implemented<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 * without relying on symbols that are n=
ot exported.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_sg(rk_obj-&gt;sgt-&gt;sgl,=
 s, rk_obj-&gt;sgt-&gt;nents, i)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sg_dma_=
address(s) =3D sg_phys(s);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0dma_sync_sg_for_device(drm-&gt;d<wbr>ev,=
 rk_obj-&gt;sgt-&gt;sgl,<br>
&gt;&gt; &gt; rk_obj-&gt;sgt-&gt;nents,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMA_TO_DEVICE);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0drm_flush_sg(drm-&gt;dev, rk_obj-&gt;sgt=
);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/te=
gra/gem.c<br>
&gt;&gt; &gt; index ab1e53d434e8..9945fd2f6bd6 100644<br>
&gt;&gt; &gt; --- a/drivers/gpu/drm/tegra/gem.c<br>
&gt;&gt; &gt; +++ b/drivers/gpu/drm/tegra/gem.c<br>
&gt;&gt; &gt; @@ -230,15 +230,11 @@ static int tegra_bo_get_pages(struct dr=
m_device<br>
&gt;&gt; &gt; *drm, struct tegra_bo *bo)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Fake up the SG table so that dma=
_sync_sg_for_device() can be<br>
&gt;&gt; &gt; used<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to flush the pages associated wi=
th it.<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 *<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 * TODO: Replace this by drm_clflash_sg(=
) once it can be<br>
&gt;&gt; &gt; implemented<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 * without relying on symbols that are n=
ot exported.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_sg(bo-&gt;sgt-&gt;sgl, s, =
bo-&gt;sgt-&gt;nents, i)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sg_dma_=
address(s) =3D sg_phys(s);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0dma_sync_sg_for_device(drm-&gt;d<wbr>ev,=
 bo-&gt;sgt-&gt;sgl, bo-&gt;sgt-&gt;nents,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMA_TO_DEVICE);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0drm_flush_sg(drm-&gt;dev, bo-&gt;sgt);<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.13.5<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ______________________________<wbr>_________________<br>
&gt;&gt; &gt; dri-devel mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"=
_blank">dri-devel@lists.freedesktop.or<wbr>g</a><br>
&gt;&gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri=
-devel" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/=
<wbr>mailman/listinfo/dri-devel</a><br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Daniel Vetter<br>
&gt;&gt; Software Engineer, Intel Corporation<br>
&gt;&gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_bla=
nk">http://blog.ffwll.ch</a><br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
--<br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
</div></div><div class=3D"m_2460435030679688596gmail-HOEnZb"><div class=3D"=
m_2460435030679688596gmail-h5"><a href=3D"tel:%2B41%20%280%29%2079%20365%20=
57%2048" value=3D"+41793655748" target=3D"_blank">+41 (0) 79 365 57 48</a>=
=C2=A0- <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blan=
k">http://blog.ffwll.ch</a><br>
</div></div></blockquote></div><br></div></div>

--94eb2c1c016a35aa0f0563102d93--

--===============1199688313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1199688313==--
