From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 3/3] drm/tegra: dc: Silence RGB output deferred-probe
 error
Date: Thu, 12 Mar 2020 10:33:53 +0100
Message-ID: <20200312093353.GB1199023@ulmo>
References: <20200308223809.23549-1-digetx@gmail.com>
 <20200308223809.23549-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200308223809.23549-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2020 at 01:38:09AM +0300, Dmitry Osipenko wrote:
> Driver fails to probe with -EPROBE_DEFER if display output isn't ready
> yet. This produces a bit noisy error message in KMSG during kernel's boot
> up on Tegra20 and Tegra30 because RGB output tends to be probed earlier
> than a corresponding voltage regulator driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 56d933e81797..d7f2c4654b6b 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -2571,7 +2571,11 @@ static int tegra_dc_probe(struct platform_device *=
pdev)
> =20
>  	err =3D tegra_dc_rgb_probe(dc);
>  	if (err < 0 && err !=3D -ENODEV) {
> -		dev_err(&pdev->dev, "failed to probe RGB output: %d\n", err);
> +		if (err =3D=3D -EPROBE_DEFER)
> +			dev_dbg(&pdev->dev, "RGB output probe deferred\n");
> +		else
> +			dev_err(&pdev->dev, "failed to probe RGB output: %d\n",
> +				err);
>  		return err;
>  	}

I'd prefer if we had just a single message and only differentiate on the
kernel message level, something more along these lines:

	if (err < 0 && err !=3D -ENODEV) {
		const char *level =3D KERN_ERR;

		if (err =3D=3D -EPROBE_DEFER)
			level =3D KERN_DEBUG;

		dev_printk(level, dc->dev, "failed to probe RGB output: %d\n",
			   err);
		return err;
	}

Do you mind if I squash that into your patch?

Thierry

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5qAf0ACgkQ3SOs138+
s6F7cw/+O35lxc5r6vj9s5CaQ62P06ket9HhkxwvO5/+Ja+IWAlbcn5oEGvk+hMh
AhAKUG06jyhsQdTVB1AMzAkX9iNZ/08dThYj+/Ub2u4rU+zWkoDxGT8fKeXoPcDQ
tbl4wq6s+7JL1Xwp2X4Owj3dxq89uZxRFryYjK0gcuaSkXF4IB14QZvca27kri8i
MFA6Scoua9FlPbwGtYy1xqw00HxIPnk0f3iNp8M2VnpNpbMyrX6PFu8xF6SEBDaI
JQkgQa8JfO97fFNdI+G9GnnoWlcrq5SFgtRGF134Cx36e9zxrErTNQzkOsEbY35Z
3M/fmNxAXV8d0erYR7UabwVPZR8FLUHEmjBQ+GoY43D/I+uQIZE5lZWwqLI8Lolx
OnL4f0yBeUGgV7C4xwn2J4zBjGkPCRwmfZAc3OFRANHVf7NDWBF+N9awiKuwrMvV
mq8+XR+mvPBrrrYxlHSDV0m24T/4xDHC88NoZ+fwSgwnV/XKxwbOeddMmL9JHVkb
Mzj193AFrVuPGAEBguXBdVKndajsphdDIjqvUVqnPOJvOHG+5gOgqpzQwiPttaX4
Wh2q6nWMh7I9z5uOv+HgC3UOs44rjQY3XZtJWR3VWrKddevSUAqj1L3C0qnEbtP8
N/HKRWNj8I5bv2RmTBSujVivFFhxJD1mp03nF4PSiPefW3Zkgyg=
=GCDB
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
