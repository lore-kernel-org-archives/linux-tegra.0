From: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 4/4] drm/vgem: flush page during page fault
Date: Wed, 17 Jan 2018 14:49:00 -0800
Message-ID: <CAAfnVBkxhEec1U8Ck4UyMXjwKvSFJs-bpip5K-7sbB51TNK0bA@mail.gmail.com>
References: <20180117003559.67837-1-gurchetansingh@chromium.org>
 <20180117003559.67837-4-gurchetansingh@chromium.org>
 <20180117083928.GH2759@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1839797909=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180117083928.GH2759@phenom.ffwll.local>
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
Cc: linux-tegra@vger.kernel.org, daniel.vetter@intel.com, thierry.reding@gmail.com, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

--===============1839797909==
Content-Type: multipart/alternative; boundary="001a114ff582435306056300a7fe"

--001a114ff582435306056300a7fe
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 12:39 AM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Jan 16, 2018 at 04:35:59PM -0800, Gurchetan Singh wrote:
> > This is required to use buffers allocated by vgem on AMD and ARM devices.
> > We're experiencing a case where eviction of the cache races with
> userspace
> > writes. To fix this, flush the cache after retrieving a page.
> >
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > ---
> >  drivers/gpu/drm/vgem/vgem_drv.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/vgem/vgem_drv.c
> b/drivers/gpu/drm/vgem/vgem_drv.c
> > index 35bfdfb746a7..fb263969f02d 100644
> > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > @@ -112,6 +112,7 @@ static int vgem_gem_fault(struct vm_fault *vmf)
> >                               break;
> >               }
> >
> > +             drm_flush_pages(obj->base.dev->dev, &page, 1);
>
> Uh ... what exactly are you doing?
>
> Asking because the entire "who's responsible for coherency" story is
> entirely undefined still when doing buffer sharing :-/ What is clear is
> that currently vgem entirely ignores this (there's not
> begin/end_cpu_access callback), mostly because the shared dma-buf support
> in drm_prime.c also entirely ignores this.



This patch isn't trying to address the case of a dma-buf imported into
vgem.  It's trying to address the case when a buffer is created by
vgem_gem_dumb_create, mapped by vgem_gem_dumb_map and then accessed by user
space.  Since the page retrieved by shmem_read_mapping_page during the page
fault may still be in the cache, we're experiencing incorrect data in
buffer.  Here's the test case we're running:

https://chromium.googlesource.com/chromiumos/platform/drm-tests/+/master/vgem_test.c

It fails on line 210 on AMD and ARM devices (not Intel though).

And doing a one-time only
> flushing in your fault handler is definitely not going to fix this (at
> least not if you do anything else than one-shot uploads).
>

There used to be a be vgem_gem_get_pages function, but that's been
removed.  I don't know where else to flush in this situation.


> -Daniel
>
> >       }
> >       return ret;
> >  }
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

--001a114ff582435306056300a7fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote">On Wed, Jan 17, 2018 at 12:39 AM, Daniel Vetter <span dir=3D"ltr=
">&lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<span class=3D"gmail-">On Tue, Jan 16, 2018 at 04:35:59PM -0800, Gurchetan =
Singh wrote:<br>
&gt; This is required to use buffers allocated by vgem on AMD and ARM devic=
es.<br>
&gt; We&#39;re experiencing a case where eviction of the cache races with u=
serspace<br>
&gt; writes. To fix this, flush the cache after retrieving a page.<br>
&gt;<br>
&gt; Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@ch=
romium.org">gurchetansingh@chromium.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/vgem/vgem_drv.<wbr>c | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/vgem/vgem_<wbr>drv.c b/drivers/gpu/drm/vg=
em/vgem_<wbr>drv.c<br>
&gt; index 35bfdfb746a7..fb263969f02d 100644<br>
&gt; --- a/drivers/gpu/drm/vgem/vgem_<wbr>drv.c<br>
&gt; +++ b/drivers/gpu/drm/vgem/vgem_<wbr>drv.c<br>
&gt; @@ -112,6 +112,7 @@ static int vgem_gem_fault(struct vm_fault *vmf)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_flush_pages(obj-&=
gt;base.dev-<wbr>&gt;dev, &amp;page, 1);<br>
<br>
</span>Uh ... what exactly are you doing?<br>
<br>
Asking because the entire &quot;who&#39;s responsible for coherency&quot; s=
tory is<br>
entirely undefined still when doing buffer sharing :-/ What is clear is<br>
that currently vgem entirely ignores this (there&#39;s not<br>
begin/end_cpu_access callback), mostly because the shared dma-buf support<b=
r>
in drm_prime.c also entirely ignores this.</blockquote><div><br></div><div>=
<br></div><div><div>This patch isn&#39;t trying to address the case of a dm=
a-buf imported into vgem.=C2=A0 It&#39;s trying to address the case when a =
buffer is created by vgem_gem_dumb_create, mapped by vgem_gem_dumb_map and =
then accessed by user space.=C2=A0 Since the page retrieved by shmem_read_m=
apping_page during the page fault may still be in the cache, we&#39;re expe=
riencing incorrect data in buffer.=C2=A0 Here&#39;s the test case we&#39;re=
 running:</div><div><br></div><div><a href=3D"https://chromium.googlesource=
.com/chromiumos/platform/drm-tests/+/master/vgem_test.c">https://chromium.g=
ooglesource.com/chromiumos/platform/drm-tests/+/master/vgem_test.c</a></div=
><div><br></div><div>It fails on line 210 on AMD and ARM devices (not Intel=
 though).=C2=A0=C2=A0</div></div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"> And doing a one-time only<br>
flushing in your fault handler is definitely not going to fix this (at<br>
least not if you do anything else than one-shot uploads).<br>
</blockquote><div><br></div><div><div>There used to be a be vgem_gem_get_pa=
ges function, but that&#39;s been removed.=C2=A0 I don&#39;t know where els=
e to flush in this situation.</div></div><div>=C2=A0<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">-Daniel<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 }<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; 2.13.5<br>
&gt;<br>
&gt; ______________________________<wbr>_________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.fre=
edesktop.<wbr>org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mail=
man/listinfo/dri-devel</a><br>
<br>
--<br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</font></span></blockquote></div><br></div></div>

--001a114ff582435306056300a7fe--

--===============1839797909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1839797909==--
