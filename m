From: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 3/4] drm: add ARM flush implementations
Date: Wed, 17 Jan 2018 14:46:10 -0800
Message-ID: <CAAfnVBm4Mp8vC4aBmrP2rJeRSBN_AFN5gaZfijg9BCJEBupDzw@mail.gmail.com>
References: <20180117003559.67837-1-gurchetansingh@chromium.org>
 <20180117003559.67837-3-gurchetansingh@chromium.org>
 <20180117083105.GG2759@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1430155578=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180117083105.GG2759@phenom.ffwll.local>
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
Cc: linux-tegra@vger.kernel.org, daniel.vetter@intel.com, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

--===============1430155578==
Content-Type: multipart/alternative; boundary="f403045f749424c5250563009dee"

--f403045f749424c5250563009dee
Content-Type: text/plain; charset="UTF-8"

>
> dma api just isn't quite sufficient for implementing fast gpu drivers.


Can you elaborate?  IIRC the DMA API has strong synchronization guarantees
and that can be problematic for GPU drivers.  However, using the DMA API
for flushing doesn't necessarily mean the driver has to use the rest of the
DMA API.

but then it'd need to directly flush cpu caches and bypass the dma api.


On ARM, cache flushing seems to vary from chipset to chipset.  For example,
on ARM32 a typical call-stack for dma_sync_single_for_device looks like:

arm_dma_sync_single_for_device
__dma_page_cpu_to_dev
outer_clean_range
outer_cache.clean_range

There are multiple clean_range implementations out there
(i.e, aurora_clean_range, l2c210_clean_range, feroceon_l2_clean_range), so
that's why the DMA API was used in this case.  On ARM64, things are a
little simpler, but the DMA API seems to go directly to assembly
(__dma_map_area) after a little indirection.  Why do you think that's
inefficient?

On Wed, Jan 17, 2018 at 12:31 AM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Jan 16, 2018 at 04:35:58PM -0800, Gurchetan Singh wrote:
> > The DMA API can be used to flush scatter gather tables and physical
> > pages on ARM devices.
> >
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_cache.c                 | 17 +++++++++++++++++
> >  drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  7 ++-----
> >  drivers/gpu/drm/tegra/gem.c                 |  6 +-----
> >  3 files changed, 20 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> > index 3d2bb9d71a60..98d6ebb40e96 100644
> > --- a/drivers/gpu/drm/drm_cache.c
> > +++ b/drivers/gpu/drm/drm_cache.c
> > @@ -105,6 +105,18 @@ drm_flush_pages(struct device *dev, struct page
> *pages[],
> >                                  (unsigned long)page_virtual +
> PAGE_SIZE);
> >               kunmap_atomic(page_virtual);
> >       }
> > +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> > +     unsigned long i;
> > +     dma_addr_t dma_handle;
> > +
> > +     if (!dev)
> > +             return;
> > +
> > +     for (i = 0; i < num_pages; i++) {
> > +             dma_handle = phys_to_dma(drm->dev, page_to_phys(pages[i]));
> > +             dma_sync_single_for_device(dev, dma_handle, PAGE_SIZE,
> > +                                        DMA_TO_DEVICE);
>
> Erm no. These functions here are super-low-level functions used by drivers
> which know exactly what they're doing. Which is reimplementing half of the
> dma api behind the dma api's back because the dma api just isn't quite
> sufficient for implementing fast gpu drivers.
>
> If all you end up doing is calling the dma api again, then pls just call
> it directly.
>
> And just to make it clear: I'd be perfectly fine with adding arm support
> here, but then it'd need to directly flush cpu caches and bypass the dma
> api. Otherwise this is pointless.
> -Daniel
>
> > +     }
> >  #else
> >       pr_err("Architecture has no drm_cache.c support\n");
> >       WARN_ON_ONCE(1);
> > @@ -136,6 +148,11 @@ drm_flush_sg(struct device *dev, struct sg_table
> *st)
> >
> >       if (wbinvd_on_all_cpus())
> >               pr_err("Timed out waiting for cache flush\n");
> > +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> > +     if (!dev)
> > +             return;
> > +
> > +     dma_sync_sg_for_device(dev, st->sgl, st->nents, DMA_TO_DEVICE);
> >  #else
> >       pr_err("Architecture has no drm_cache.c support\n");
> >       WARN_ON_ONCE(1);
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > index 8ac7eb25e46d..0157f90b5d10 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> > @@ -14,6 +14,7 @@
> >
> >  #include <drm/drm.h>
> >  #include <drm/drmP.h>
> > +#include <drm/drm_cache.h>
> >  #include <drm/drm_gem.h>
> >  #include <drm/drm_vma_manager.h>
> >  #include <linux/iommu.h>
> > @@ -99,15 +100,11 @@ static int rockchip_gem_get_pages(struct
> rockchip_gem_object *rk_obj)
> >       /*
> >        * Fake up the SG table so that dma_sync_sg_for_device() can be
> used
> >        * to flush the pages associated with it.
> > -      *
> > -      * TODO: Replace this by drm_flush_sg() once it can be implemented
> > -      * without relying on symbols that are not exported.
> >        */
> >       for_each_sg(rk_obj->sgt->sgl, s, rk_obj->sgt->nents, i)
> >               sg_dma_address(s) = sg_phys(s);
> >
> > -     dma_sync_sg_for_device(drm->dev, rk_obj->sgt->sgl,
> rk_obj->sgt->nents,
> > -                            DMA_TO_DEVICE);
> > +     drm_flush_sg(drm->dev, rk_obj->sgt);
> >
> >       return 0;
> >
> > diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> > index ab1e53d434e8..9945fd2f6bd6 100644
> > --- a/drivers/gpu/drm/tegra/gem.c
> > +++ b/drivers/gpu/drm/tegra/gem.c
> > @@ -230,15 +230,11 @@ static int tegra_bo_get_pages(struct drm_device
> *drm, struct tegra_bo *bo)
> >       /*
> >        * Fake up the SG table so that dma_sync_sg_for_device() can be
> used
> >        * to flush the pages associated with it.
> > -      *
> > -      * TODO: Replace this by drm_clflash_sg() once it can be
> implemented
> > -      * without relying on symbols that are not exported.
> >        */
> >       for_each_sg(bo->sgt->sgl, s, bo->sgt->nents, i)
> >               sg_dma_address(s) = sg_phys(s);
> >
> > -     dma_sync_sg_for_device(drm->dev, bo->sgt->sgl, bo->sgt->nents,
> > -                            DMA_TO_DEVICE);
> > +     drm_flush_sg(drm->dev, bo->sgt);
> >
> >       return 0;
> >
> > --
> > 2.13.5
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--f403045f749424c5250563009dee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">dma api just isn&#39;t quite=C2=A0</span><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">sufficient for implementing fast gpu drivers.</span></blockquot=
e><div><br></div><div>Can you elaborate?=C2=A0 IIRC the DMA API has strong =
synchronization guarantees and that can be problematic for GPU drivers.=C2=
=A0 However, using the DMA API for flushing doesn&#39;t necessarily mean th=
e driver has to use the rest of the DMA API.=C2=A0</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">bu=
t then it&#39;d need to directly flush cpu caches and bypass the dma=C2=A0<=
/span><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">api.</span></blockquote><div><br></div><di=
v>On ARM, cache flushing seems to vary from chipset to chipset.=C2=A0 For e=
xample, on ARM32 a typical call-stack for <span style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial;float:none;display:inline">dma_sy=
nc_single_for_device=C2=A0</span>loo<wbr>ks like:</div><div><br></div><div>=
arm_dma_sync_single_for_device<br></div><div><div>__dma_page_cpu_to_dev</di=
v><div>outer_clean_range</div><div>outer_cache.clean_range</div></div><div>=
<br></div><div>There are multiple clean_range implementations out there (i.=
e,=C2=A0aurora_clean_range,=C2=A0l2c2<wbr>10_clean_range,=C2=A0feroceon_l2_=
cl<wbr>ean_range), so that&#39;s why the DMA API was used in this case.=C2=
=A0 On ARM64, things are a little simpler, but the DMA API seems to go dire=
ctly to assembly (__dma_map_area) after a little indirection.=C2=A0 Why do =
you think that&#39;s inefficient?=C2=A0=C2=A0</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Wed, Jan 17, 2018 at 12:31 AM, D=
aniel Vetter <span dir=3D"ltr">&lt;<a href=3D"mailto:daniel@ffwll.ch" targe=
t=3D"_blank">daniel@ffwll.ch</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Tue, Jan 16, 2018 at 0=
4:35:58PM -0800, Gurchetan Singh wrote:<br>
&gt; The DMA API can be used to flush scatter gather tables and physical<br=
>
&gt; pages on ARM devices.<br>
&gt;<br>
&gt; Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@ch=
romium.org">gurchetansingh@chromium.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/drm_cache.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/rockchip/<wbr>rockchip_drm_gem.c |=C2=A0 7 ++---=
--<br>
&gt;=C2=A0 drivers/gpu/drm/tegra/gem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-----<br>
&gt;=C2=A0 3 files changed, 20 insertions(+), 10 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c=
<br>
&gt; index 3d2bb9d71a60..98d6ebb40e96 100644<br>
&gt; --- a/drivers/gpu/drm/drm_cache.c<br>
&gt; +++ b/drivers/gpu/drm/drm_cache.c<br>
&gt; @@ -105,6 +105,18 @@ drm_flush_pages(struct device *dev, struct page *=
pages[],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned long)page_virtua=
l + PAGE_SIZE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kunmap_atomic(pa=
ge_virtual);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_addr_t dma_handle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!dev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num_pages; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_handle =3D phys_t=
o_dma(drm-&gt;dev, page_to_phys(pages[i]));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_sync_single_for_d=
evice(<wbr>dev, dma_handle, PAGE_SIZE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMA_=
TO_DEVICE);<br>
<br>
</div></div>Erm no. These functions here are super-low-level functions used=
 by drivers<br>
which know exactly what they&#39;re doing. Which is reimplementing half of =
the<br>
dma api behind the dma api&#39;s back because the dma api just isn&#39;t qu=
ite<br>
sufficient for implementing fast gpu drivers.<br>
<br>
If all you end up doing is calling the dma api again, then pls just call<br=
>
it directly.<br>
<br>
And just to make it clear: I&#39;d be perfectly fine with adding arm suppor=
t<br>
here, but then it&#39;d need to directly flush cpu caches and bypass the dm=
a<br>
api. Otherwise this is pointless.<br>
-Daniel<br>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 #else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Architecture has no drm_cache.c=
 support\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON_ONCE(1);<br>
&gt; @@ -136,6 +148,11 @@ drm_flush_sg(struct device *dev, struct sg_table =
*st)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (wbinvd_on_all_cpus())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Tim=
ed out waiting for cache flush\n&quot;);<br>
&gt; +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!dev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_sync_sg_for_device(dev, st-&gt;sgl, st-&gt;ne=
nts, DMA_TO_DEVICE);<br>
&gt;=C2=A0 #else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Architecture has no drm_cache.c=
 support\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON_ONCE(1);<br>
&gt; diff --git a/drivers/gpu/drm/rockchip/<wbr>rockchip_drm_gem.c b/driver=
s/gpu/drm/rockchip/<wbr>rockchip_drm_gem.c<br>
&gt; index 8ac7eb25e46d..0157f90b5d10 100644<br>
&gt; --- a/drivers/gpu/drm/rockchip/<wbr>rockchip_drm_gem.c<br>
&gt; +++ b/drivers/gpu/drm/rockchip/<wbr>rockchip_drm_gem.c<br>
&gt; @@ -14,6 +14,7 @@<br>
&gt;<br>
&gt;=C2=A0 #include &lt;drm/drm.h&gt;<br>
&gt;=C2=A0 #include &lt;drm/drmP.h&gt;<br>
&gt; +#include &lt;drm/drm_cache.h&gt;<br>
&gt;=C2=A0 #include &lt;drm/drm_gem.h&gt;<br>
&gt;=C2=A0 #include &lt;drm/drm_vma_manager.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/iommu.h&gt;<br>
&gt; @@ -99,15 +100,11 @@ static int rockchip_gem_get_pages(struct rockchip=
_gem_object *rk_obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Fake up the SG table so that dma_sync_sg_=
for_device() can be used<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to flush the pages associated with it.<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * TODO: Replace this by drm_flush_sg() once it c=
an be implemented<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * without relying on symbols that are not export=
ed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_sg(rk_obj-&gt;sgt-&gt;sgl, s, rk_ob=
j-&gt;sgt-&gt;nents, i)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sg_dma_address(s=
) =3D sg_phys(s);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dma_sync_sg_for_device(drm-&gt;<wbr>dev, rk_obj-&=
gt;sgt-&gt;sgl, rk_obj-&gt;sgt-&gt;nents,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMA_TO_DEVICE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_flush_sg(drm-&gt;dev, rk_obj-&gt;sgt);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c=
<br>
&gt; index ab1e53d434e8..9945fd2f6bd6 100644<br>
&gt; --- a/drivers/gpu/drm/tegra/gem.c<br>
&gt; +++ b/drivers/gpu/drm/tegra/gem.c<br>
&gt; @@ -230,15 +230,11 @@ static int tegra_bo_get_pages(struct drm_device =
*drm, struct tegra_bo *bo)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Fake up the SG table so that dma_sync_sg_=
for_device() can be used<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to flush the pages associated with it.<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * TODO: Replace this by drm_clflash_sg() once it=
 can be implemented<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * without relying on symbols that are not export=
ed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_sg(bo-&gt;sgt-&gt;sgl, s, bo-&gt;sg=
t-&gt;nents, i)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sg_dma_address(s=
) =3D sg_phys(s);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dma_sync_sg_for_device(drm-&gt;<wbr>dev, bo-&gt;s=
gt-&gt;sgl, bo-&gt;sgt-&gt;nents,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMA_TO_DEVICE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_flush_sg(drm-&gt;dev, bo-&gt;sgt);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;<br>
&gt; --<br>
&gt; 2.13.5<br>
&gt;<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.fre=
edesktop.<wbr>org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mail=
man/listinfo/dri-devel</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</font></span></blockquote></div><br></div>

--f403045f749424c5250563009dee--

--===============1430155578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1430155578==--
