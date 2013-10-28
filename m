From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] drm/tegra: fix return value check
Date: Mon, 28 Oct 2013 09:53:59 +0100
Message-ID: <20131028085358.GC10718@ulmo.nvidia.com>
References: <CAPgLHd_JqYS5DC4tmzgGVEYmJpeM96FAEDvmM3cUUep+1jj7mA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPgLHd_JqYS5DC4tmzgGVEYmJpeM96FAEDvmM3cUUep+1jj7mA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2013 at 11:34:07AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
>=20
> In case of error, the function clk_get_parent() and devm_ioremap_resource=
()
> returns ERR_PTR() and never returns NULL. The NULL test in the return val=
ue
> check should be replaced with IS_ERR().
>=20
> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I've applied this, but with the first hunk removed, since looking at the
implementation of clk_get_parent() it can actually return NULL. In fact
it seems like it will never return ERR_PTR().

I've also updated the commit message to reflect that.

Thierry

>=20
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 1cfbace..7bc2eeb 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -914,7 +914,7 @@ static int tegra_dsi_setup_clocks(struct tegra_dsi *d=
si)
>  	int err;
> =20
>  	parent =3D clk_get_parent(dsi->clk);
> -	if (!parent)
> +	if (IS_ERR(parent))
>  		return -EINVAL;
> =20
>  	err =3D clk_set_parent(parent, dsi->clk_parent);
> @@ -969,8 +969,8 @@ static int tegra_dsi_probe(struct platform_device *pd=
ev)
> =20
>  	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	dsi->regs =3D devm_ioremap_resource(&pdev->dev, regs);
> -	if (!dsi->regs)
> -		return -EADDRNOTAVAIL;
> +	if (IS_ERR(dsi->regs))
> +		return PTR_ERR(dsi->regs);
> =20
>  	INIT_LIST_HEAD(&dsi->client.list);
>  	dsi->client.ops =3D &dsi_client_ops;
>=20

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSbiYmAAoJEN0jrNd/PrOhN3AP/1xgCpYuvmB3JUgBneea8Te1
rvIvPhsxzInz8oqk0tpLKZE4uLBQOKlhsXGtvzDwKyjMQq/0UQjmX/NeaIHf8gfN
Gpvxi1BQxPw1Y1yvYB+X2sMKew3duGXlq1TGY/0XV2wNT23XlPqGSqqCearGxBwC
yt2HJrn4Tmb9Md8YyUXbIwhoFKhr76Oz1ZN37e7Rcyqxy3TO7t5Ee/CvR1BLSPQo
tUp7p//VsQOaXGVHHJyoudHkoDAf31asjonlPYPuygE7AWXzkJSpNyCycM0iGxeT
vYNb8Yk51/itEJ8qkrKBuGgK9QjUcwNaIIrAFN2yHlYD3W6LKfB/FzpPZfE3/DWb
MsdXHvmx3g4ZwCWHVsubdYnY1IAOVGh3U8Auw51VXPZgWN+onyocrxGBjZYQ6z1p
8QvGtI42lBqTd79+eaFnqgnwBKye+9ujKV+4GsV9beA+zkPKdJY56wunZAazO2JU
OVuD/puZXtpIrUupSPGJ1sK7WnKxyezpT+c03NM1NaLLthFYFDYxZSaAK9Cv8foP
+gaf0kiRkCrjzSY87ay928nu6KOgATo4CdGRkpN9ma8S7nCU/cPtaTSsZJljFaTj
vhKLCkcFuTP3eYa7y5GYUTHSHHLsfTL0fF4HE2hMRQhurIpKmQ0Iyja2Nop4rRe/
xIWV/WJUgrSBl3w94Fd1
=NAfA
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--
