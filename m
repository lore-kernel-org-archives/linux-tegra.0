From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] drm/nouveau/tegra: Skip manual
 unpowergating when not necessary
Date: Tue, 13 Jun 2017 08:52:14 +1000
Message-ID: <c8569914-3264-bd12-9418-8bdaa4aaa379@gmail.com>
References: <20170609122541.31118-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1240404074=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170609122541.31118-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1240404074==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6CI1ELI3AvGnbddDmJaJkXlp3eHPVmtnH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6CI1ELI3AvGnbddDmJaJkXlp3eHPVmtnH
Content-Type: multipart/mixed; boundary="FMb7dTdjFopgu53oBMkCwvB7dJsUkQJVs";
 protected-headers="v1"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org,
 nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org,
 thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Message-ID: <c8569914-3264-bd12-9418-8bdaa4aaa379-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] drm/nouveau/tegra: Skip manual unpowergating when not
 necessary
References: <20170609122541.31118-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <20170609122541.31118-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--FMb7dTdjFopgu53oBMkCwvB7dJsUkQJVs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/09/2017 10:25 PM, Mikko Perttunen wrote:
> On Tegra186, powergating is handled by the BPMP power domain provider
> and the "legacy" powergating API is not available. Therefore skip
> these calls if we are attached to a power domain.
Thanks Mikko,

Taken all 3 patches into my tree.

Ben.

>=20
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drive=
rs/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> index 6474bd2a6d07..3d42cdbbe9c0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> @@ -51,10 +51,12 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra=
 *tdev)
>  	reset_control_assert(tdev->rst);
>  	udelay(10);
> =20
> -	ret =3D tegra_powergate_remove_clamping(TEGRA_POWERGATE_3D);
> -	if (ret)
> -		goto err_clamp;
> -	udelay(10);
> +	if (!tdev->pdev->dev.pm_domain) {
> +		ret =3D tegra_powergate_remove_clamping(TEGRA_POWERGATE_3D);
> +		if (ret)
> +			goto err_clamp;
> +		udelay(10);
> +	}
> =20
>  	reset_control_deassert(tdev->rst);
>  	udelay(10);
>=20


--FMb7dTdjFopgu53oBMkCwvB7dJsUkQJVs--

--6CI1ELI3AvGnbddDmJaJkXlp3eHPVmtnH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAlk/Gx4ACgkQdgucYlCS
kft5OQ//eNJlSavlRLvMpdqAY+8lDzK5Yc2NPYs+FVQpqjjaOQ4wzWzEWDTIq1JX
cBLnrSPm2qCZ43xbVX6RpaZTRzmJcT1S90mTo8RAiSh8B8lkzokh7RCz/0Yr9tLT
c8gc4I/wU2H55OCzkSFrusGIRsxUwEcxiq+4QAGuIWxzGuFMFD2Pk5E1cyE75MRc
B/BOkx6UkJu7f7yFGCVYfO10C4PqbvyN4+E36tB0jxPapEP55dQYRVNsq6X3Joce
v9q5kj58BGBycYwD4E1oLBNo/TQenpHVb3+wOtcQCehr2If80RHh0y+fonuVD2SZ
0S7Qt12kKmvwK2UvTdb5L4X7wD0dDGZ6dC4WMRYIGCcmYmcsM+J4gG3BVANcwkpr
5tMjhVjv4PQnLYuZvOgsfgKgDag0Wt9digrPv/L9PWIGFfPD3rQ4nWoYpynUE5U7
1nkllMV2Mi4Y6QJXpuSa7+/08d2tgZOcODmJDi9nnHLhRxebQPB6x809LhZPkzz0
EKiZk4tMEsS4JuuRgzlZJwflE7NDEwHB3/dRjJSwZa3aMmKbq5hEIKhow6YugZSs
HDfGxRlRAKqfpUqCR+oxBuLpO7Cj8fWToqIGuRPFbwduw3ZrfjF/UZpLD5AygzOz
9RU6alelifEyHB/ylupSyw8Uirmwx/mXam2VMNGr64Fxr3ECeJE=
=6LBs
-----END PGP SIGNATURE-----

--6CI1ELI3AvGnbddDmJaJkXlp3eHPVmtnH--

--===============1240404074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1240404074==--
