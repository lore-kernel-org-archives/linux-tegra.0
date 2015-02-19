From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/6] make RAM device optional
Date: Thu, 19 Feb 2015 12:20:03 +1000
Message-ID: <CACAvsv4uj92K+eCMCq=3+EyrL3JFFH6Mtf9G6nCpb55HhkhFnA@mail.gmail.com>
References: <1424159284-19920-1-git-send-email-acourbot@nvidia.com>
 <1424159284-19920-2-git-send-email-acourbot@nvidia.com>
 <CACAvsv5mNb3bPzbkVoSCvXKtX195w3c8OX=543V5JHnM=hsN+w@mail.gmail.com>
 <CAAVeFuKxzz7cMeaC7wKno17aErLSbqBYGtQLN=pH1qsK5DgFkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1666868752=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuKxzz7cMeaC7wKno17aErLSbqBYGtQLN=pH1qsK5DgFkQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--===============1666868752==
Content-Type: multipart/alternative; boundary=001a1143254ee05ebc050f679278

--001a1143254ee05ebc050f679278
Content-Type: text/plain; charset=UTF-8

On 18 Feb 2015 17:08, "Alexandre Courbot" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Wed, Feb 18, 2015 at 8:01 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Tue, Feb 17, 2015 at 5:47 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
wrote:
> >> Having a RAM device does not make sense for chips like GK20A which have
> >> no dedicated video memory. The dummy RAM device that we used so far
> >> works as a temporary band-aid, but in the long-term it is desirable for
> >> the driver to be able to work without any kind of VRAM.
> >>
> >> This patch adds a few conditionals in places where a RAM device was
> >> assumed to be present and allows some more objects to be allocated from
> >> the TT domain, allowing Nouveau to handle GPUs for which
> >> pfb->ram == NULL.
> >>
> >> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>  drm/nouveau/nouveau_display.c         |  8 +++++++-
> >>  drm/nouveau/nouveau_ttm.c             |  3 +++
> >>  drm/nouveau/nv84_fence.c              | 14 +++++++++++---
> >>  drm/nouveau/nvkm/engine/device/base.c |  9 ++++++---
> >>  drm/nouveau/nvkm/subdev/clk/base.c    |  2 +-
> >>  drm/nouveau/nvkm/subdev/fb/base.c     | 26 ++++++++++++++++++--------
> >>  drm/nouveau/nvkm/subdev/ltc/gf100.c   | 10 +++++++++-
> >>  7 files changed, 55 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drm/nouveau/nouveau_display.c
b/drm/nouveau/nouveau_display.c
> >> index 860b0e2d4181..68ee0af22eea 100644
> >> --- a/drm/nouveau/nouveau_display.c
> >> +++ b/drm/nouveau/nouveau_display.c
> >> @@ -869,13 +869,19 @@ nouveau_display_dumb_create(struct drm_file
*file_priv, struct drm_device *dev,
> >>                             struct drm_mode_create_dumb *args)
> >>  {
> >>         struct nouveau_bo *bo;
> >> +       uint32_t domain;
> >>         int ret;
> >>
> >>         args->pitch = roundup(args->width * (args->bpp / 8), 256);
> >>         args->size = args->pitch * args->height;
> >>         args->size = roundup(args->size, PAGE_SIZE);
> >>
> >> -       ret = nouveau_gem_new(dev, args->size, 0,
NOUVEAU_GEM_DOMAIN_VRAM, 0, 0, &bo);
> >> +       if (nvxx_fb(&nouveau_drm(dev)->device)->ram)
> > For these checks in the drm, it's probably better to use
> > nouveau_drm(dev)->device.info.ram_size.
>
> I wonder - in other places (e.g. clock, ltc) we don't have access to
> nouveau_drm, so IIUC we need to rely on pfb->ram there.
Correct.

>Wouldn't it be
> more confusing to use two different ways to check the presence of VRAM
> when we could stick to a single one?
It's best to think of nvkm/ as a separate entity, and it will be at some
point (drm load on its own, inside a vm), and drm might not be able to
access it's internal structures.

That's not the case now, so the code is fine as-is for the moment. But it's
worth keeping in mind.

Thanks,
Ben.

--001a1143254ee05ebc050f679278
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On 18 Feb 2015 17:08, &quot;Alexandre Courbot&quot; &lt;<a h=
ref=3D"mailto:gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Feb 18, 2015 at 8:01 AM, Ben Skeggs &lt;<a href=3D"mailto:skeg=
gsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt; On Tue, Feb 17, 2015 at 5:47 PM, Alexandre Courbot &lt;<a href=3D=
"mailto:acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org">acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt; wrote:<br>
&gt; &gt;&gt; Having a RAM device does not make sense for chips like GK20A =
which have<br>
&gt; &gt;&gt; no dedicated video memory. The dummy RAM device that we used =
so far<br>
&gt; &gt;&gt; works as a temporary band-aid, but in the long-term it is des=
irable for<br>
&gt; &gt;&gt; the driver to be able to work without any kind of VRAM.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This patch adds a few conditionals in places where a RAM devi=
ce was<br>
&gt; &gt;&gt; assumed to be present and allows some more objects to be allo=
cated from<br>
&gt; &gt;&gt; the TT domain, allowing Nouveau to handle GPUs for which<br>
&gt; &gt;&gt; pfb-&gt;ram =3D=3D NULL.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Alexandre Courbot &lt;<a href=3D"mailto:acourb=
ot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org">acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 drm/nouveau/nouveau_display.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 8 +++++++-<br>
&gt; &gt;&gt;=C2=A0 drm/nouveau/nouveau_ttm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
&gt; &gt;&gt;=C2=A0 drm/nouveau/nv84_fence.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 14 +++++++++++---<br>
&gt; &gt;&gt;=C2=A0 drm/nouveau/nvkm/engine/device/base.c |=C2=A0 9 ++++++-=
--<br>
&gt; &gt;&gt;=C2=A0 drm/nouveau/nvkm/subdev/clk/base.c=C2=A0 =C2=A0 |=C2=A0=
 2 +-<br>
&gt; &gt;&gt;=C2=A0 drm/nouveau/nvkm/subdev/fb/base.c=C2=A0 =C2=A0 =C2=A0| =
26 ++++++++++++++++++--------<br>
&gt; &gt;&gt;=C2=A0 drm/nouveau/nvkm/subdev/ltc/gf100.c=C2=A0 =C2=A0| 10 ++=
+++++++-<br>
&gt; &gt;&gt;=C2=A0 7 files changed, 55 insertions(+), 17 deletions(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/drm/nouveau/nouveau_display.c b/drm/nouveau/nouv=
eau_display.c<br>
&gt; &gt;&gt; index 860b0e2d4181..68ee0af22eea 100644<br>
&gt; &gt;&gt; --- a/drm/nouveau/nouveau_display.c<br>
&gt; &gt;&gt; +++ b/drm/nouveau/nouveau_display.c<br>
&gt; &gt;&gt; @@ -869,13 +869,19 @@ nouveau_display_dumb_create(struct drm_=
file *file_priv, struct drm_device *dev,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_mode_create_dumb *args=
)<br>
&gt; &gt;&gt;=C2=A0 {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_bo *bo;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t domain;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args-&gt;pitch =3D roundup(a=
rgs-&gt;width * (args-&gt;bpp / 8), 256);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args-&gt;size =3D args-&gt;p=
itch * args-&gt;height;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args-&gt;size =3D roundup(ar=
gs-&gt;size, PAGE_SIZE);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D nouveau_gem_new(dev, args=
-&gt;size, 0, NOUVEAU_GEM_DOMAIN_VRAM, 0, 0, &amp;bo);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvxx_fb(&amp;nouveau_drm(dev)=
-&gt;device)-&gt;ram)<br>
&gt; &gt; For these checks in the drm, it&#39;s probably better to use<br>
&gt; &gt; nouveau_drm(dev)-&gt;device.info.ram_size.<br>
&gt;<br>
&gt; I wonder - in other places (e.g. clock, ltc) we don&#39;t have access =
to<br>
&gt; nouveau_drm, so IIUC we need to rely on pfb-&gt;ram there. <br>
Correct. </p>
<p dir=3D"ltr">&gt;Wouldn&#39;t it be<br>
&gt; more confusing to use two different ways to check the presence of VRAM=
<br>
&gt; when we could stick to a single one?<br>
It&#39;s best to think of nvkm/ as a separate entity, and it will be at som=
e point (drm load on its own, inside a vm), and drm might not be able to ac=
cess it&#39;s internal structures.</p>
<p dir=3D"ltr">That&#39;s not the case now, so the code is fine as-is for t=
he moment. But it&#39;s worth keeping in mind. </p>
<p dir=3D"ltr">Thanks, <br>
Ben. <br>
</p>

--001a1143254ee05ebc050f679278--

--===============1666868752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1666868752==--
