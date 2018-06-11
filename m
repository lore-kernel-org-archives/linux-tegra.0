From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm: nouveau: Enable gp20b/gp10b firmware tag
 when relevant
Date: Mon, 11 Jun 2018 10:33:19 +0200
Message-ID: <20180611083319.GA31977@ulmo>
References: <20180610110131.10490-1-kwizart@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1548077380=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180610110131.10490-1-kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============1548077380==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 10, 2018 at 01:01:31PM +0200, Nicolas Chauvet wrote:
> This allows to have the related MODULE_FIRMWARE tag only
> on relevant arch (arm64).
> This will saves about 400k on initramfs when not relevant
>=20
> Signed-off-by: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c | 2 ++
>  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c | 2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> index 30491d132d59..df8b919dcf09 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> @@ -129,6 +129,7 @@ gm20b_secboot_new(struct nvkm_device *device, int ind=
ex,
>  	return 0;
>  }
> =20
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
>  MODULE_FIRMWARE("nvidia/gm20b/acr/bl.bin");
>  MODULE_FIRMWARE("nvidia/gm20b/acr/ucode_load.bin");
>  MODULE_FIRMWARE("nvidia/gm20b/gr/fecs_bl.bin");
> @@ -144,3 +145,4 @@ MODULE_FIRMWARE("nvidia/gm20b/gr/sw_method_init.bin");
>  MODULE_FIRMWARE("nvidia/gm20b/pmu/desc.bin");
>  MODULE_FIRMWARE("nvidia/gm20b/pmu/image.bin");
>  MODULE_FIRMWARE("nvidia/gm20b/pmu/sig.bin");
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> index 632e9545e292..28ca29d0eeee 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> @@ -74,6 +74,7 @@ gp10b_secboot_new(struct nvkm_device *device, int index,
>  	return 0;
>  }
> =20
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
>  MODULE_FIRMWARE("nvidia/gp10b/acr/bl.bin");
>  MODULE_FIRMWARE("nvidia/gp10b/acr/ucode_load.bin");
>  MODULE_FIRMWARE("nvidia/gp10b/gr/fecs_bl.bin");
> @@ -91,3 +92,4 @@ MODULE_FIRMWARE("nvidia/gp10b/gr/sw_method_init.bin");
>  MODULE_FIRMWARE("nvidia/gp10b/pmu/desc.bin");
>  MODULE_FIRMWARE("nvidia/gp10b/pmu/image.bin");
>  MODULE_FIRMWARE("nvidia/gp10b/pmu/sig.bin");
> +#endif

I suppose that makes sense, so:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On a side-note, I was checking for what we do for gk20a, but it seems
like we don't have MODULE_FIRMWARE() entries for Tegra124. How do we
make sure that firmware is automatically pulled into initramfs on the
Tegra124 devices?

Thierry

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlseM8wACgkQ3SOs138+
s6EoTA//esgH5KKfaYPKQV7BKfkmMIMKggUmHBKdQNZpT/e4MyzOBh/YJlGulX1T
TBZHCoT4et9H+yrkzwkjhrnwKnMHTunTH7FX1bh2L1x2klFa3sK8uqeXSeSXg+Aw
WUHV0eAaRq0SL8p1ccubAe4UBnGOM3XPllnskD9J3vH29691pQitV0Cb+p4IvO53
bQDMj5Jh+kI9scqxUSr8Hj90zN0gFvD+kG1oYWeUcYaGcH46E64upwpTG9QgqDuy
sVFBelIkjAenBRQyvjUmAM5KBAFyeMrsX+T+mwiXTva4GGve1Be9trX1q6BBoTTE
WDCGTnOLN2Y0tBuF1nqujhIFpXGB9nDxxfUKhoEovxUgoh5tQskSvf6DxOAay2x1
icM4hsK+dyfwrUkhQFhlD2/shLtndKoAyFUpke/WLFsFkhk15gLQKQuHyqLdeDbc
y4+Yr4BVEwd7HSwmIsq7zelmnJcgw8sT9F1wlEAnk0YTlWHADCTt3R79bhPvr3Xb
V8yNVZMLqVj+QVvNDpYMPaJ3kEUP0zzQf9ht0Ib9ZzecE99nHyZ+Xm66vfMSnS3Q
WnXGyYThQ9GmEkpP6Y+uQcq1yWRnQV3wp8QGxpiMdtR0Z6JqcuLAv2qSV0hKU+L6
1lPRbZvjU3HHsLP8FR/Y5AtZxD9iQx3hJPgJ24KqV10/Wn3SueY=
=7c+3
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--

--===============1548077380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1548077380==--
