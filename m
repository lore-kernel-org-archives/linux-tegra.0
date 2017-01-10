From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: core: Don't use regulators as supplies until
 the parent is bound
Date: Tue, 10 Jan 2017 16:57:17 +0000
Message-ID: <20170110165717.7dfxoyajc5p2h5mr@sirena.org.uk>
References: <1484046069-7893-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="toqmcuanfrokktn4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484046069-7893-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--toqmcuanfrokktn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2017 at 11:01:09AM +0000, Jon Hunter wrote:

> +++ b/drivers/regulator/core.c
> @@ -1553,6 +1553,11 @@ static int regulator_resolve_supply(struct regulat=
or_dev *rdev)
>  		}
>  	}
> =20
> +	if (r->dev.parent && !device_is_bound(r->dev.parent)) {
> +		put_device(&r->dev);
> +		return -EPROBE_DEFER;
> +	}
> +

I realised earlier that this will trigger when the supply and the
consumer are part of the same PMIC which will cause issues as that's a
fairly common setup and won't be resolved by deferring.  Can you please
modify this to only defer if the parent is not the same as the parent of
the regulator we're currently resolving?  Sorry, should've thought of
this yesterday.

--toqmcuanfrokktn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlh1EmwACgkQJNaLcl1U
h9Dsggf/dvE5YkAe8AWO+d4aK5bh5XTp+aam3L9Raskb7GZjKpCV+Puzihljdphp
YAwxhRJtDddbN9opnDDx54KciVKjEdALoxzz8AH7tfaSIHlbqOdQd8IMIjugr1Ig
7ChAnwDMITMjQ+QQH4M611GskeluzYjJe1Ba0F8/kaPiHCg+2D+OtVADNYLURNR+
3/EOT2KJ1b4IuJXx8nmngJlEDKeYhV9GxHjI1FpylVutcQJc9ayhmxePhDsJtPMl
EBiRnjCUxcNUVmLQ+QSHKB3nVjpX8W1NUAyZzq9IlZwfTkPRLi/+B/xDPVSkYQNn
mhwiaTq+EFSGA6gDLSlsB8JYR56vJg==
=PWxm
-----END PGP SIGNATURE-----

--toqmcuanfrokktn4--
