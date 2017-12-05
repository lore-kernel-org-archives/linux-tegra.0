From: Ben Skeggs <bskeggs@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/bar/gf100: fix hang when calling ->fini()
 before ->init()
Date: Wed, 6 Dec 2017 04:32:40 +1000
Message-ID: <CABDvA=krahNw3q+qpEPbbv8Y9fvX4jXc_B54qafwtgFyWpqKWg@mail.gmail.com>
References: <be610a7596ad8fee7da092161888c532c2eb2908.1512411775.git.guillaume.tucker@collabora.com>
 <6db622ac-319d-c640-91ab-9248e528b69b@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1610944616=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <6db622ac-319d-c640-91ab-9248e528b69b@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, Guillaume Tucker <guillaume.tucker@collabora.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

--===============1610944616==
Content-Type: multipart/alternative; boundary="001a1134fbbc60865c055f9c0f4a"

--001a1134fbbc60865c055f9c0f4a
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 6, 2017 at 12:30 AM, Jon Hunter <jonathanh@nvidia.com> wrote:

>
> On 04/12/17 18:37, Guillaume Tucker wrote:
> > If the firmware fails to load then ->fini() will be called before the
> > device has been initialised, causing the kernel to hang while trying
> > to write to a register.  Add a test in ->fini() to avoid this issue.
> >
> > This fixes a kernel hang on tegra124.
> >
> > Fixes: b17de35a2ebbe ("drm/nouveau/bar: implement bar1 teardown")
> > Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> > CC: Ben Skeggs <bskeggs@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
> > index a3ba7f50198b..95e2aba64aad 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
> > @@ -43,9 +43,12 @@ gf100_bar_bar1_wait(struct nvkm_bar *base)
> >  }
> >
> >  void
> > -gf100_bar_bar1_fini(struct nvkm_bar *bar)
> > +gf100_bar_bar1_fini(struct nvkm_bar *base)
> >  {
> > -     nvkm_mask(bar->subdev.device, 0x001704, 0x80000000, 0x00000000);
> > +     struct nvkm_device *device = base->subdev.device;
> > +
> > +     if (base->subdev.oneinit)
> > +             nvkm_mask(device, 0x001704, 0x80000000, 0x00000000);
> >  }
> >
> >  void
>
> I have tested this and it works for me. Thanks for fixing this! Would be
> good to get Ben's ACK, but you can have my ...
>
I'd love to get a good explanation as to why it hangs without this change,
as, on the surface, it's not immediately obvious as to why it's hanging.

Thanks,
Ben.


>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
>
> Cheers
> Jon
>
> --
> nvpublic
>

--001a1134fbbc60865c055f9c0f4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Dec 6, 2017 at 12:30 AM, Jon Hunter <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jonathanh@nvidia.com" target=3D"_blank">jonathanh@nvidia.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div c=
lass=3D"h5"><br>
On 04/12/17 18:37, Guillaume Tucker wrote:<br>
&gt; If the firmware fails to load then -&gt;fini() will be called before t=
he<br>
&gt; device has been initialised, causing the kernel to hang while trying<b=
r>
&gt; to write to a register.=C2=A0 Add a test in -&gt;fini() to avoid this =
issue.<br>
&gt;<br>
&gt; This fixes a kernel hang on tegra124.<br>
&gt;<br>
&gt; Fixes: b17de35a2ebbe (&quot;drm/nouveau/bar: implement bar1 teardown&q=
uot;)<br>
&gt; Signed-off-by: Guillaume Tucker &lt;<a href=3D"mailto:guillaume.tucker=
@collabora.com">guillaume.tucker@collabora.<wbr>com</a>&gt;<br>
&gt; CC: Ben Skeggs &lt;<a href=3D"mailto:bskeggs@redhat.com">bskeggs@redha=
t.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/bar/gf100.c | 7 +++++--=
<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/<wbr>nvkm/subdev/bar/gf100.c b/dr=
ivers/gpu/drm/nouveau/<wbr>nvkm/subdev/bar/gf100.c<br>
&gt; index a3ba7f50198b..95e2aba64aad 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/<wbr>nvkm/subdev/bar/gf100.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/<wbr>nvkm/subdev/bar/gf100.c<br>
&gt; @@ -43,9 +43,12 @@ gf100_bar_bar1_wait(struct nvkm_bar *base)<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 void<br>
&gt; -gf100_bar_bar1_fini(struct nvkm_bar *bar)<br>
&gt; +gf100_bar_bar1_fini(struct nvkm_bar *base)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0nvkm_mask(bar-&gt;subdev.device, 0x001704, 0x8000=
0000, 0x00000000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct nvkm_device *device =3D base-&gt;subdev.de=
vice;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (base-&gt;subdev.oneinit)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvkm_mask(device, 0x0=
01704, 0x80000000, 0x00000000);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 void<br>
<br>
</div></div>I have tested this and it works for me. Thanks for fixing this!=
 Would be<br>
good to get Ben&#39;s ACK, but you can have my ...<br></blockquote><div>I&#=
39;d love to get a good explanation as to why it hangs without this change,=
 as, on the surface, it&#39;s not immediately obvious as to why it&#39;s ha=
nging.</div><div><br></div><div>Thanks,</div><div>Ben.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
Tested-by: Jon Hunter &lt;<a href=3D"mailto:jonathanh@nvidia.com">jonathanh=
@nvidia.com</a>&gt;<br>
<br>
Cheers<br>
<span class=3D"HOEnZb"><font color=3D"#888888">Jon<br>
<br>
--<br>
nvpublic<br>
</font></span></blockquote></div><br></div></div>

--001a1134fbbc60865c055f9c0f4a--

--===============1610944616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1610944616==--
