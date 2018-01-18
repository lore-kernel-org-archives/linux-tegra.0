From: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 4/4] drm/vgem: flush page during page fault
Date: Thu, 18 Jan 2018 09:23:31 -0800
Message-ID: <CAAfnVBnn=ziKBu3-RfWd9_bLb1gFJ_b24d+uis=XfkEejwbHeA@mail.gmail.com>
References: <20180117003559.67837-1-gurchetansingh@chromium.org>
 <20180117003559.67837-4-gurchetansingh@chromium.org>
 <20180117083928.GH2759@phenom.ffwll.local>
 <CAAfnVBkxhEec1U8Ck4UyMXjwKvSFJs-bpip5K-7sbB51TNK0bA@mail.gmail.com>
 <CAKMK7uGV=JxX4BB2OTPAWRVR8ugytxnr8+5JVE1SRZELNnuwhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0787575910=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uGV=JxX4BB2OTPAWRVR8ugytxnr8+5JVE1SRZELNnuwhA@mail.gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <thierry.reding@gmail.com>, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

--===============0787575910==
Content-Type: multipart/alternative; boundary="94eb2c1c00be12a0ad056310393d"

--94eb2c1c00be12a0ad056310393d
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 11:38 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Jan 17, 2018 at 11:49 PM, Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> > On Wed, Jan 17, 2018 at 12:39 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Tue, Jan 16, 2018 at 04:35:59PM -0800, Gurchetan Singh wrote:
> >> > This is required to use buffers allocated by vgem on AMD and ARM
> >> > devices.
> >> > We're experiencing a case where eviction of the cache races with
> >> > userspace
> >> > writes. To fix this, flush the cache after retrieving a page.
> >> >
> >> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> >> > ---
> >> >  drivers/gpu/drm/vgem/vgem_drv.c | 1 +
> >> >  1 file changed, 1 insertion(+)
> >> >
> >> > diff --git a/drivers/gpu/drm/vgem/vgem_drv.c
> >> > b/drivers/gpu/drm/vgem/vgem_drv.c
> >> > index 35bfdfb746a7..fb263969f02d 100644
> >> > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> >> > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> >> > @@ -112,6 +112,7 @@ static int vgem_gem_fault(struct vm_fault *vmf)
> >> >                               break;
> >> >               }
> >> >
> >> > +             drm_flush_pages(obj->base.dev->dev, &page, 1);
> >>
> >> Uh ... what exactly are you doing?
> >>
> >> Asking because the entire "who's responsible for coherency" story is
> >> entirely undefined still when doing buffer sharing :-/ What is clear is
> >> that currently vgem entirely ignores this (there's not
> >> begin/end_cpu_access callback), mostly because the shared dma-buf
> support
> >> in drm_prime.c also entirely ignores this.
> >
> >
> >
> > This patch isn't trying to address the case of a dma-buf imported into
> vgem.
> > It's trying to address the case when a buffer is created by
> > vgem_gem_dumb_create, mapped by vgem_gem_dumb_map and then accessed by
> user
> > space.  Since the page retrieved by shmem_read_mapping_page during the
> page
> > fault may still be in the cache, we're experiencing incorrect data in
> > buffer.  Here's the test case we're running:
> >
> > https://chromium.googlesource.com/chromiumos/platform/drm-te
> sts/+/master/vgem_test.c
>
> 404s over here (Internal url?).


Hmm ... I was able to access that link without being logged in to any
accounts.

> It fails on line 210 on AMD and ARM devices (not Intel though).
>
> So you _do_ import it on the other device driver as a dma-buf (and
> export it from vgem)?


Those portions of the test work fine (if the platform has a drm_clflush
implementation).  vgem_prime_pin calls drm_clflush_pages for the exporting
case.  Typically, ARM drivers flush the cache after drm_gem_get_pages() and
only do WC mappings, so import works.  For Intel, there is some hardware
level coherency involved.  The problem is vgem doesn't flush the cache on
ARM/AMD when getting pages for the non-export/non-import case (when
faulting after a vgem_gem_dumb_map, not during dma-buf mmap) -- i.e, during
regular use of the buffer.

>
> >> And doing a one-time only
> >> flushing in your fault handler is definitely not going to fix this (at
> >> least not if you do anything else than one-shot uploads).
> >
> >
> > There used to be a be vgem_gem_get_pages function, but that's been
> removed.
> > I don't know where else to flush in this situation.
>
> dma_buf begin/end cpu access. Even exposed as an ioctl when you're
> using the dma-buf mmap stuff. Vgem doesn't have that, which means
> as-is the dumb mmap support of vgem can't really support this if you
> want to do explicit flushing.


> What would work is uncached/writecombine/coherent dma memory. But then
> we're in the middle of the entire
> "who's responsible.
> -Daniel
>
> >
> >>
> >> -Daniel
> >>
> >> >       }
> >> >       return ret;
> >> >  }
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

--94eb2c1c00be12a0ad056310393d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Jan 17, 2018 at 11:38 PM, Daniel Vetter <span dir=3D"ltr">&lt;<a href=
=3D"mailto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D=
"m_1169564045609165354m_-5783990154448635653gmail-m_6729379346910290801m_-7=
362893198454717418gmail-HOEnZb"><div class=3D"m_1169564045609165354m_-57839=
90154448635653gmail-m_6729379346910290801m_-7362893198454717418gmail-h5">On=
 Wed, Jan 17, 2018 at 11:49 PM, Gurchetan Singh<br>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Jan 17, 2018 at 12:39 AM, Daniel Vetter &lt;<a href=3D"mailto:=
daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jan 16, 2018 at 04:35:59PM -0800, Gurchetan Singh wrote:<b=
r>
&gt;&gt; &gt; This is required to use buffers allocated by vgem on AMD and =
ARM<br>
&gt;&gt; &gt; devices.<br>
&gt;&gt; &gt; We&#39;re experiencing a case where eviction of the cache rac=
es with<br>
&gt;&gt; &gt; userspace<br>
&gt;&gt; &gt; writes. To fix this, flush the cache after retrieving a page.=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurcheta=
nsingh@chromium.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<=
br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 drivers/gpu/drm/vgem/vgem_drv.<wbr>c | 1 +<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/drivers/gpu/drm/vgem/vgem_dr<wbr>v.c<br>
&gt;&gt; &gt; b/drivers/gpu/drm/vgem/vgem_dr<wbr>v.c<br>
&gt;&gt; &gt; index 35bfdfb746a7..fb263969f02d 100644<br>
&gt;&gt; &gt; --- a/drivers/gpu/drm/vgem/vgem_dr<wbr>v.c<br>
&gt;&gt; &gt; +++ b/drivers/gpu/drm/vgem/vgem_dr<wbr>v.c<br>
&gt;&gt; &gt; @@ -112,6 +112,7 @@ static int vgem_gem_fault(struct vm_fault=
 *vmf)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_flush_pa=
ges(obj-&gt;base.dev<wbr>-&gt;dev, &amp;page, 1);<br>
&gt;&gt;<br>
&gt;&gt; Uh ... what exactly are you doing?<br>
&gt;&gt;<br>
&gt;&gt; Asking because the entire &quot;who&#39;s responsible for coherenc=
y&quot; story is<br>
&gt;&gt; entirely undefined still when doing buffer sharing :-/ What is cle=
ar is<br>
&gt;&gt; that currently vgem entirely ignores this (there&#39;s not<br>
&gt;&gt; begin/end_cpu_access callback), mostly because the shared dma-buf =
support<br>
&gt;&gt; in drm_prime.c also entirely ignores this.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; This patch isn&#39;t trying to address the case of a dma-buf imported =
into vgem.<br>
&gt; It&#39;s trying to address the case when a buffer is created by<br>
&gt; vgem_gem_dumb_create, mapped by vgem_gem_dumb_map and then accessed by=
 user<br>
&gt; space.=C2=A0 Since the page retrieved by shmem_read_mapping_page durin=
g the page<br>
&gt; fault may still be in the cache, we&#39;re experiencing incorrect data=
 in<br>
&gt; buffer.=C2=A0 Here&#39;s the test case we&#39;re running:<br>
&gt;<br>
&gt; <a href=3D"https://chromium.googlesource.com/chromiumos/platform/drm-t=
ests/+/master/vgem_test.c" rel=3D"noreferrer" target=3D"_blank">https://chr=
omium.googlesource.<wbr>com/chromiumos/platform/drm-te<wbr>sts/+/master/vge=
m_test.c</a><br>
<br>
</div></div>404s over here (Internal url?).</blockquote><div><br></div><div=
>Hmm ... I was able to access that link without being logged in to any acco=
unts.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><span class=3D"m_1169564045609165354m_-5783990154448635653gmail-m_67293793=
46910290801m_-7362893198454717418gmail-">
&gt; It fails on line 210 on AMD and ARM devices (not Intel though).<br>
<br>
</span>So you _do_ import it on the other device driver as a dma-buf (and<b=
r>
export it from vgem)?</blockquote><div><br></div><div>Those portions of the=
 test work fine (if the platform has a drm_clflush implementation).=C2=A0 v=
gem_prime_pin calls=C2=A0drm_clflush_pages for the exporting case.=C2=A0 Ty=
pically, ARM drivers flush the cache after drm_gem_get_pages() and only do =
WC mappings, so import works.=C2=A0 For Intel, there is some hardware level=
 coherency involved.=C2=A0 The problem is vgem doesn&#39;t flush the cache =
on ARM/AMD when getting pages for the non-export/non-import case (when faul=
ting after a=C2=A0<span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">vgem_gem_dumb_map, not during d=
ma-buf mmap</span>) -- i.e, during regular use of the buffer.</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><span class=3D"m_1169564045609165=
354m_-5783990154448635653gmail-m_6729379346910290801m_-7362893198454717418g=
mail-"><br>
&gt;&gt; And doing a one-time only<br>
&gt;&gt; flushing in your fault handler is definitely not going to fix this=
 (at<br>
&gt;&gt; least not if you do anything else than one-shot uploads).<br>
&gt;<br>
&gt;<br>
&gt; There used to be a be vgem_gem_get_pages function, but that&#39;s been=
 removed.<br>
&gt; I don&#39;t know where else to flush in this situation.<br>
<br>
</span>dma_buf begin/end cpu access. Even exposed as an ioctl when you&#39;=
re<br>
using the dma-buf mmap stuff. Vgem doesn&#39;t have that, which means<br>
as-is the dumb mmap support of vgem can&#39;t really support this if you<br=
>
want to do explicit flushing.</blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
What would work is uncached/writecombine/coherent dma memory. But then<br>
we&#39;re in the middle of the entire<br>
&quot;who&#39;s responsible.<br>
-Daniel<br>
<span class=3D"m_1169564045609165354m_-5783990154448635653gmail-m_672937934=
6910290801m_-7362893198454717418gmail-"><br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; -Daniel<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;&gt; &gt;=C2=A0 }<br>
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
</span><a href=3D"tel:%2B41%20%280%29%2079%20365%2057%2048" value=3D"+41793=
655748" target=3D"_blank">+41 (0) 79 365 57 48</a>=C2=A0- <a href=3D"http:/=
/blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http://blog.ffwll.ch</=
a><br>
</blockquote></div><br></div></div>

--94eb2c1c00be12a0ad056310393d--

--===============0787575910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0787575910==--
