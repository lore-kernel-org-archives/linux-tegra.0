From: Nicolas Chauvet <kwizart@gmail.com>
Subject: Re: [PATCH] drm/nouveau: platform: Fix deferred probe
Date: Thu, 25 Feb 2016 09:44:32 +0100
Message-ID: <CABr+WTnKFChybRvJjO6fkLSvYM0hM7Xps9HdRhOZqsz_=wE_rw@mail.gmail.com>
References: <1456335283-22097-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0076579137=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1456335283-22097-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

--===============0076579137==
Content-Type: multipart/alternative; boundary=001a114230220b0a28052c94317d

--001a114230220b0a28052c94317d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le 24 f=C3=A9vr. 2016 18:34, "Thierry Reding" <thierry.reding@gmail.com> a
=C3=A9crit :
>
> From: Thierry Reding <treding@nvidia.com>
>
> The error cleanup paths aren't quite correct and will crash upon
> deferred probe.
>
> Cc: stable@vger.kernel.org # v4.3+
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_platform.c         |  2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 40
++++++++++++++++------
>  2 files changed, 30 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c
b/drivers/gpu/drm/nouveau/nouveau_platform.c
> index 8a70cec59bcd..2dfe58af12e4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_platform.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
> @@ -24,7 +24,7 @@
>  static int nouveau_platform_probe(struct platform_device *pdev)
>  {
>         const struct nvkm_device_tegra_func *func;
> -       struct nvkm_device *device;
> +       struct nvkm_device *device =3D NULL;
>         struct drm_device *drm;
>         int ret;
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> index 7f8a42721eb2..e7e581d6a8ff 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> @@ -252,32 +252,40 @@ nvkm_device_tegra_new(const struct
nvkm_device_tegra_func *func,
>
>         if (!(tdev =3D kzalloc(sizeof(*tdev), GFP_KERNEL)))
>                 return -ENOMEM;
> -       *pdevice =3D &tdev->device;
> +
>         tdev->func =3D func;
>         tdev->pdev =3D pdev;
>         tdev->irq =3D -1;
>
>         tdev->vdd =3D devm_regulator_get(&pdev->dev, "vdd");
> -       if (IS_ERR(tdev->vdd))
> -               return PTR_ERR(tdev->vdd);
> +       if (IS_ERR(tdev->vdd)) {
> +               ret =3D PTR_ERR(tdev->vdd);
> +               goto free;
> +       }
>
>         tdev->rst =3D devm_reset_control_get(&pdev->dev, "gpu");
> -       if (IS_ERR(tdev->rst))
> -               return PTR_ERR(tdev->rst);
> +       if (IS_ERR(tdev->rst)) {
> +               ret =3D PTR_ERR(tdev->rst);
> +               goto free;
> +       }
>
>         tdev->clk =3D devm_clk_get(&pdev->dev, "gpu");
> -       if (IS_ERR(tdev->clk))
> -               return PTR_ERR(tdev->clk);
> +       if (IS_ERR(tdev->clk)) {
> +               ret =3D PTR_ERR(tdev->clk);
> +               goto free;
> +       }
>
>         tdev->clk_pwr =3D devm_clk_get(&pdev->dev, "pwr");
> -       if (IS_ERR(tdev->clk_pwr))
> -               return PTR_ERR(tdev->clk_pwr);
> +       if (IS_ERR(tdev->clk_pwr)) {
> +               ret =3D PTR_ERR(tdev->clk_pwr);
> +               goto free;
> +       }
>
>         nvkm_device_tegra_probe_iommu(tdev);
>
>         ret =3D nvkm_device_tegra_power_up(tdev);
>         if (ret)
> -               return ret;
> +               goto remove;
>
>         tdev->gpu_speedo =3D tegra_sku_info.gpu_speedo_value;
>         ret =3D nvkm_device_ctor(&nvkm_device_tegra_func, NULL, &pdev->de=
v,
> @@ -285,9 +293,19 @@ nvkm_device_tegra_new(const struct
nvkm_device_tegra_func *func,
>                                cfg, dbg, detect, mmio, subdev_mask,
>                                &tdev->device);
>         if (ret)
> -               return ret;
> +               goto powerdown;
> +
> +       *pdevice =3D &tdev->device;
>
>         return 0;
> +
> +powerdown:
> +       nvkm_device_tegra_power_down(tdev);
> +remove:
> +       nvkm_device_tegra_remove_iommu(tdev);
> +free:
> +       kfree(tdev);
> +       return ret;
>  }
>  #else
>  int
> --
> 2.7.1
>

Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Test-HW jetson-tk1

Tested-by on top of Fedora 4.5-r5 kernel package

Thx

--001a114230220b0a28052c94317d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Le=C2=A024 f=C3=A9vr. 2016 18:34, &quot;Thierry Reding&quot;=
 &lt;<a href=3D"mailto:thierry.reding@gmail.com">thierry.reding@gmail.com</=
a>&gt; a =C3=A9crit=C2=A0:<br>
&gt;<br>
&gt; From: Thierry Reding &lt;<a href=3D"mailto:treding@nvidia.com">treding=
@nvidia.com</a>&gt;<br>
&gt;<br>
&gt; The error cleanup paths aren&#39;t quite correct and will crash upon<b=
r>
&gt; deferred probe.<br>
&gt;<br>
&gt; Cc: <a href=3D"mailto:stable@vger.kernel.org">stable@vger.kernel.org</=
a> # v4.3+<br>
&gt; Signed-off-by: Thierry Reding &lt;<a href=3D"mailto:treding@nvidia.com=
">treding@nvidia.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0drivers/gpu/drm/nouveau/nouveau_platform.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 40 ++++++++=
++++++++------<br>
&gt; =C2=A02 files changed, 30 insertions(+), 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/=
drm/nouveau/nouveau_platform.c<br>
&gt; index 8a70cec59bcd..2dfe58af12e4 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nouveau_platform.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nouveau_platform.c<br>
&gt; @@ -24,7 +24,7 @@<br>
&gt; =C2=A0static int nouveau_platform_probe(struct platform_device *pdev)<=
br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct nvkm_device_tegra_func *func;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_device *device;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_device *device =3D NULL;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_device *drm;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/driv=
ers/gpu/drm/nouveau/nvkm/engine/device/tegra.c<br>
&gt; index 7f8a42721eb2..e7e581d6a8ff 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c<br>
&gt; @@ -252,32 +252,40 @@ nvkm_device_tegra_new(const struct nvkm_device_t=
egra_func *func,<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(tdev =3D kzalloc(sizeof(*tdev), GFP_=
KERNEL)))<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*pdevice =3D &amp;tdev-&gt;device;<br>
&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 tdev-&gt;func =3D func;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 tdev-&gt;pdev =3D pdev;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 tdev-&gt;irq =3D -1;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 tdev-&gt;vdd =3D devm_regulator_get(&amp;p=
dev-&gt;dev, &quot;vdd&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tdev-&gt;vdd))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(tdev-&gt;vdd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tdev-&gt;vdd)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ER=
R(tdev-&gt;vdd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto free;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 tdev-&gt;rst =3D devm_reset_control_get(&a=
mp;pdev-&gt;dev, &quot;gpu&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tdev-&gt;rst))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(tdev-&gt;rst);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tdev-&gt;rst)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ER=
R(tdev-&gt;rst);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto free;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 tdev-&gt;clk =3D devm_clk_get(&amp;pdev-&g=
t;dev, &quot;gpu&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tdev-&gt;clk))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(tdev-&gt;clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tdev-&gt;clk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ER=
R(tdev-&gt;clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto free;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 tdev-&gt;clk_pwr =3D devm_clk_get(&amp;pde=
v-&gt;dev, &quot;pwr&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tdev-&gt;clk_pwr))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(tdev-&gt;clk_pwr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tdev-&gt;clk_pwr)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ER=
R(tdev-&gt;clk_pwr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto free;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 nvkm_device_tegra_probe_iommu(tdev);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nvkm_device_tegra_power_up(tdev);<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto remove;<b=
r>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 tdev-&gt;gpu_speedo =3D tegra_sku_info.gpu=
_speedo_value;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nvkm_device_ctor(&amp;nvkm_device_=
tegra_func, NULL, &amp;pdev-&gt;dev,<br>
&gt; @@ -285,9 +293,19 @@ nvkm_device_tegra_new(const struct nvkm_device_te=
gra_func *func,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg, dbg, detect, mmio, subdev_mas=
k,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tdev-&gt;device);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto powerdown=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*pdevice =3D &amp;tdev-&gt;device;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +<br>
&gt; +powerdown:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0nvkm_device_tegra_power_down(tdev);<br>
&gt; +remove:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0nvkm_device_tegra_remove_iommu(tdev);<br>
&gt; +free:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(tdev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; =C2=A0}<br>
&gt; =C2=A0#else<br>
&gt; =C2=A0int<br>
&gt; --<br>
&gt; 2.7.1<br>
&gt;</p>
<p dir=3D"ltr">Tested-by: Nicolas Chauvet &lt;<a href=3D"mailto:kwizart@gma=
il.com">kwizart@gmail.com</a>&gt;<br>
Test-HW jetson-tk1</p>
<p dir=3D"ltr">Tested-by on top of Fedora 4.5-r5 kernel package</p>
<p dir=3D"ltr">Thx<br>
</p>

--001a114230220b0a28052c94317d--

--===============0076579137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0076579137==--
