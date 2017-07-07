From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: vic: add NULL check on of_match_device()
 return value
Date: Fri, 7 Jul 2017 11:25:51 +0200
Message-ID: <20170707092551.GB15652@ulmo.fritz.box>
References: <20170707061626.GA14016@embeddedgus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170707061626.GA14016@embeddedgus>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Gustavo A. R. Silva" <garsilva-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2017 at 01:16:26AM -0500, Gustavo A. R. Silva wrote:
> Check return value from call to of_match_device()
> in order to prevent a NULL pointer dereference.
>=20
> In case of NULL print error message and return.
>=20
> Signed-off-by: Gustavo A. R. Silva <garsilva-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/vic.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> index 47cb1aa..7e11825 100644
> --- a/drivers/gpu/drm/tegra/vic.c
> +++ b/drivers/gpu/drm/tegra/vic.c
> @@ -283,6 +283,11 @@ static int vic_probe(struct platform_device *pdev)
>  	int err;
> =20
>  	match =3D of_match_device(vic_match, dev);
> +	if (!match) {
> +		dev_err(&pdev->dev, "failed to match device\n");
> +		return -ENODEV;
> +	}

Someone would have to go to great lengths to trigger this condition,
might as well let it crash as a warning that they've done something
wrong.

Thierry

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAllfU58ACgkQ3SOs138+
s6FJyRAAqv2egX6f6nfZMueRCg3e4PR/FO300tqygd6zT0kH/AoHRMRvbtC17n4+
ZwsmRBi9NmwqrzMnnaxjZ+j1K0h66NCakK59yycrbUaBVHyAJL2N9blVooJsdm1i
cHzO3j0CDZ1L+FntfXwQDLG5UDtmnXKRvpaFEuUyUIT7zDjNLcsRPl57iOc9Hvpx
90V7IUDf2cATzhTUhOsENnRFpWzeGKhg7KTFxB+QsVb3kWccKRd07c532xpT9Myi
8uX7lY7UOHdwJ/9E+hl1y7uf94AmShHJHgS/Nke0SV8iPac6Z2DuI0bv2YOKzNoK
eLnbRmB48eoNSyPs1jwMolNO3cRgM2z9AKmTEwsuJgocups8x1xvw1TUXzX4tbZs
7+xIS4KOC8NxomOmr+8m/a4vn+4Xsyq/v8TWhEqhcZZ+r9gqV2aO02sw2kZIw4fW
TZKvXpHR1zK5HJ0i/TT7rlOO3eFN4mcru3fXNWBe1Q9ZDCC/e1UhbrzBTTEsRueT
6rr2WkTzy04vLhH5fLTdklynXVge40M0N9/uTc8nsu4w2cvl3oyD9ZndlWrFs83g
yUbmG1BVlAjGLYs2SEZ+eIHQJXVfiL20KQ5luUpvs/KtraCOTM1Zo9sE01+OwZ8K
0GzeX2hNCX7m7n/BkquVGWNn1XJkUPTToaCMD8jBMUMQT5tBeHo=
=QlgR
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
