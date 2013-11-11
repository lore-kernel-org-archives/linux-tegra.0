From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] drm/tegra: small leak on error in tegra_fb_alloc()
Date: Mon, 11 Nov 2013 10:03:49 +0100
Message-ID: <20131111090348.GD3884@ulmo.nvidia.com>
References: <20131110053406.GB13643@elgon.mountain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0IvGJv3f9h+YhkrH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131110053406.GB13643-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0IvGJv3f9h+YhkrH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 09, 2013 at 09:34:06PM -0800, Dan Carpenter wrote:
> If we don't have enough memory for ->planes then we leak "fb".
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

Hi Dan,

Thanks for catching this. Perhaps tweak the commit subject to:

	drm/tegra: fix small leak on error in tegra_fb_alloc()

?

One additional comment below.

> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index 490f771..1362d78 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -98,8 +98,10 @@ static struct tegra_fb *tegra_fb_alloc(struct drm_devi=
ce *drm,
>  		return ERR_PTR(-ENOMEM);
> =20
>  	fb->planes =3D kzalloc(num_planes * sizeof(*planes), GFP_KERNEL);
> -	if (!fb->planes)
> -		return ERR_PTR(-ENOMEM);
> +	if (!fb->planes) {
> +		err =3D -ENOMEM;
> +		goto free_fb;
> +	}
> =20
>  	fb->num_planes =3D num_planes;
> =20
> @@ -112,12 +114,17 @@ static struct tegra_fb *tegra_fb_alloc(struct drm_d=
evice *drm,
>  	if (err < 0) {
>  		dev_err(drm->dev, "failed to initialize framebuffer: %d\n",
>  			err);
> -		kfree(fb->planes);
> -		kfree(fb);
> -		return ERR_PTR(err);
> +		goto free_planes;
>  	}
> =20
>  	return fb;
> +
> +free_planes:
> +	kfree(fb->planes);
> +free_fb:
> +	kfree(fb);
> +
> +	return ERR_PTR(err);
>  }

I think in this case I'd actually prefer for the kfree(fb) to be
duplicated and not have this error unwind. It's actually shorter
to do it that way in this case.

What I mean is:

	if (!fb->planes) {
		kfree(fb);
		return ERR_PTR(-ENOMEM);
	}

Thierry

--0IvGJv3f9h+YhkrH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSgJ10AAoJEN0jrNd/PrOhfCQP/0EtfeUAndsmbUcZtWr8aaK3
OujUBnumx/2ht+ceVg4YYwJf+JJg3hQnVcyrSnuzgi0KolYP1W5dY+5OhkSc8dSB
5j94lN6PEiNNe+8pEmwKcd5IBfbDQMS8fh2wt3seNIgaZK4910AWaGHVn3bFb1ZH
XXNFqxK94aXnNESdVOdUoaNslnajheg9ScmxM9g5WgdsFKOOlzXBtRDM8cTfZN1a
sME896vu1ck5IAeHJCORW7hPB0EDrbVMX/+U8ODhwYEyFSOFy1H+Xy3nEL24ovoh
C1IV4XCO0sTrX2RbFPNUQSisQyO28LML9SQ/nPYU5Br8Hl+/55TW452VVZ9xH8aJ
67WSU29lU0G3FQ2eqUgrcf9t8pFTP0L3G5KW/tRJ4FFHffZyqmGj7tgg2Z2Xezj7
ETFnjYnQrG7BnFGl54jdDkKGlohR404TuP9eYYlFDj2bKkvoInkabvUmf9FhZNxS
qTNRi286ruYym44RfoR/cn0YPkpmyQP1tn2yzyuP+dOZCpN1aX1bl2vDNX1R0pm0
hcGeZq2ebRGWZMKV4LAC/bVp8XSGapxEYel63YzoyR7HRC9eUeCf3BQ2tLy9nt1A
uKkH9XZBe7VQr0Nwaf6kb3UpCsRIBJQHRzWO6wMppedDuIOqY0nVLIuejV2hPW4C
IkXjQko6j6TLsHBYFykw
=tUVD
-----END PGP SIGNATURE-----

--0IvGJv3f9h+YhkrH--
