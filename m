From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] gpu: host1x: Add locking to syncpt
Date: Fri, 11 Nov 2016 15:33:03 +0100
Message-ID: <20161111143303.GB4967@ulmo.ba.sec>
References: <20161108175135.32004-1-mperttunen@nvidia.com>
 <20161108175135.32004-2-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161108175135.32004-2-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 07:51:33PM +0200, Mikko Perttunen wrote:
[...]
> @@ -86,7 +88,17 @@ static struct host1x_syncpt *host1x_syncpt_alloc(struc=
t host1x *host,
>  	else
>  		sp->client_managed =3D false;
> =20
> +	mutex_unlock(&host->syncpt_mutex);
>  	return sp;
> +
> +err_alloc_name:

It's better to use labels that describe what they do, rather than when
they get called.

> +	host1x_syncpt_base_free(sp->base);
> +	sp->base =3D NULL;
> +err_alloc_base:
> +	sp =3D NULL;

This is useless because the variable is no longer used after this and
goes out of scope.

I fixed up these two issues and applied.

Thanks,
Thierry

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYJdafAAoJEN0jrNd/PrOhEp8QAJE8R++IsgZhe1tfmVUCOmHk
6L5cIGWt/8gexJ+iOFKFYkjV1FPj2XgIwoNwDXsgq+tP5SvmwJ5rUbuH/SY48fZk
ymsLIDpDcLPwWfLqsUMRjfWE0/N6q6K0Ax036epSXbw788EFKsi28+hOqMA3gAtf
z6v/KevF1wo4v9D3iKl4X+MegN5j8vznT09nt3PEJCtkulgocJJw9xRDrNRqUN5H
sKCy/CIJrsq+MjKN2VToHaOf0Bxb1i2Z1DnM8fGUJa8D7whC+bUvINGmHWc18+c6
5ax7y/dESjmOy+/ebra4zId5VY0YAFaKd6k0o5pRjMP3aB38uC6abZFyWf/XiGEY
G/P0Gojst0mdJLU95pjzKcWT5XtBON+OIesBJ4w2Co4I1hSTG7gibe9IZbcOjJwV
vUIydawkQ8zHYWcKWUwGdRspNUzxcKal+6C8DLU6YEC3ddnWitjClgei0nRRkr4v
O6kyfF7eSlB+mXR69DkrvalfeLiVyoil/vCrz9CW3Nj3cBiZWwJdVTUmuiXAEsc6
jNpjOwrQ8ni+5voNd3w1CITHnmhsaub24Npig7x6OIlEP7Z14+3RhntxLH1mm7IN
nW6azItb571BC2jnIrCiinavOV5QogLg25oOBbdGNIhmag3Gf/wRAHBepJYdFV1I
u+srexx1loejRXMZq2G2
=qWCW
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
