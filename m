From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: platform: Fix deferred probe
Date: Thu, 25 Feb 2016 08:33:49 +1000
Message-ID: <56CE2FCD.6050203@redhat.com>
References: <1456335283-22097-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EaA9WNpB748OfpeM0WgSS7W2H6O4fGFG3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456335283-22097-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EaA9WNpB748OfpeM0WgSS7W2H6O4fGFG3
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 02/25/2016 03:34 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The error cleanup paths aren't quite correct and will crash upon
> deferred probe.
>=20
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v4.3+
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

> ---
>  drivers/gpu/drm/nouveau/nouveau_platform.c         |  2 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 40 ++++++++++++++=
++------
>  2 files changed, 30 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/d=
rm/nouveau/nouveau_platform.c
> index 8a70cec59bcd..2dfe58af12e4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_platform.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
> @@ -24,7 +24,7 @@
>  static int nouveau_platform_probe(struct platform_device *pdev)
>  {
>  	const struct nvkm_device_tegra_func *func;
> -	struct nvkm_device *device;
> +	struct nvkm_device *device =3D NULL;
>  	struct drm_device *drm;
>  	int ret;
> =20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drive=
rs/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> index 7f8a42721eb2..e7e581d6a8ff 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> @@ -252,32 +252,40 @@ nvkm_device_tegra_new(const struct nvkm_device_te=
gra_func *func,
> =20
>  	if (!(tdev =3D kzalloc(sizeof(*tdev), GFP_KERNEL)))
>  		return -ENOMEM;
> -	*pdevice =3D &tdev->device;
> +
>  	tdev->func =3D func;
>  	tdev->pdev =3D pdev;
>  	tdev->irq =3D -1;
> =20
>  	tdev->vdd =3D devm_regulator_get(&pdev->dev, "vdd");
> -	if (IS_ERR(tdev->vdd))
> -		return PTR_ERR(tdev->vdd);
> +	if (IS_ERR(tdev->vdd)) {
> +		ret =3D PTR_ERR(tdev->vdd);
> +		goto free;
> +	}
> =20
>  	tdev->rst =3D devm_reset_control_get(&pdev->dev, "gpu");
> -	if (IS_ERR(tdev->rst))
> -		return PTR_ERR(tdev->rst);
> +	if (IS_ERR(tdev->rst)) {
> +		ret =3D PTR_ERR(tdev->rst);
> +		goto free;
> +	}
> =20
>  	tdev->clk =3D devm_clk_get(&pdev->dev, "gpu");
> -	if (IS_ERR(tdev->clk))
> -		return PTR_ERR(tdev->clk);
> +	if (IS_ERR(tdev->clk)) {
> +		ret =3D PTR_ERR(tdev->clk);
> +		goto free;
> +	}
> =20
>  	tdev->clk_pwr =3D devm_clk_get(&pdev->dev, "pwr");
> -	if (IS_ERR(tdev->clk_pwr))
> -		return PTR_ERR(tdev->clk_pwr);
> +	if (IS_ERR(tdev->clk_pwr)) {
> +		ret =3D PTR_ERR(tdev->clk_pwr);
> +		goto free;
> +	}
> =20
>  	nvkm_device_tegra_probe_iommu(tdev);
> =20
>  	ret =3D nvkm_device_tegra_power_up(tdev);
>  	if (ret)
> -		return ret;
> +		goto remove;
> =20
>  	tdev->gpu_speedo =3D tegra_sku_info.gpu_speedo_value;
>  	ret =3D nvkm_device_ctor(&nvkm_device_tegra_func, NULL, &pdev->dev,
> @@ -285,9 +293,19 @@ nvkm_device_tegra_new(const struct nvkm_device_teg=
ra_func *func,
>  			       cfg, dbg, detect, mmio, subdev_mask,
>  			       &tdev->device);
>  	if (ret)
> -		return ret;
> +		goto powerdown;
> +
> +	*pdevice =3D &tdev->device;
> =20
>  	return 0;
> +
> +powerdown:
> +	nvkm_device_tegra_power_down(tdev);
> +remove:
> +	nvkm_device_tegra_remove_iommu(tdev);
> +free:
> +	kfree(tdev);
> +	return ret;
>  }
>  #else
>  int
>=20


--EaA9WNpB748OfpeM0WgSS7W2H6O4fGFG3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWzi/NAAoJEHYLnGJQkpH7JlMP/jiCeqT4M9MnGl/YlbnWOM/5
R2CB4+ku1hxdfwolUITZc0lYbA75hLBP7mcFvzMMnaiCITmK+YpSCYpqqwElOBUp
b9xB+IYuB/yR1B+TLpbA0jElbBDzqeqezLh7eb4btSkBwBs0hwzzgIGh8EQMHpok
GQt0z9R4H1/Lbp65uIDRoVtopOAUdmCxMF1bEHLtZmAsC7dxY50pccep6PHqtbBW
bEizSj1Sq3efGOrVFKvIlcUs6B/KrnIVFiFJLMODCJ/adnoIJENk26s0Aq63y1Nh
WVTpQ03Zi2K6eT6GjTPNTahpQhqyyB+bCVGvAi6xwdeZNJzCLXoxT/MofizOY95B
ERdDbTooubS/3gdPp9SdX7x2zHD+NqLUr+XyYAIGBMQ3RHm1RaPjAI9/VDz5ejLs
51jPcacQZMKhxNGVXzmqhyg/ohDwvaUT8xalGK94ht+w+XGwUmTskqykoReEKXOG
SLlwZwO/nK75Emz3HpZ6t23wV9C+oVGB+IimOV04/FAxAi60h+m5+oIVkCUcqHvT
K8IKh0qrB3tfMNQitHLBVPncQOSVu9S3BiExccQrno3l3R0AtzbWGWqvCch9CT0l
n801tXceQymrNySQ1jVSzFLyybjeGecuQl9WxN3Mj22UNboOJ18dbQ31F67WvpKm
pkgdTG/52zlClD+CCQeT
=sMo2
-----END PGP SIGNATURE-----

--EaA9WNpB748OfpeM0WgSS7W2H6O4fGFG3--
