From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: drm/tegra: sor: Implement sor1_brick clock
Date: Thu, 14 Jul 2016 14:56:12 +0200
Message-ID: <20160714125611.GB3189@ulmo.ba.sec>
References: <20160701205813.GA12447@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160701205813.GA12447@mwanda>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2016 at 11:58:13PM +0300, Dan Carpenter wrote:
> Hello Thierry Reding,
>=20
> The patch a7ba8310c7f5: "drm/tegra: sor: Implement sor1_brick clock"
> from Oct 1, 2015, leads to the following static checker warning:
>=20
> 	drivers/gpu/drm/tegra/sor.c:318 tegra_clk_sor_brick_get_parent()
> 	warn: assigning (-22) to unsigned variable 'parent'
>=20
> drivers/gpu/drm/tegra/sor.c
>    314  static u8 tegra_clk_sor_brick_get_parent(struct clk_hw *hw)
>                ^^
> returns u8.
>=20
>    315  {
>    316          struct tegra_clk_sor_brick *brick =3D to_brick(hw);
>    317          struct tegra_sor *sor =3D brick->sor;
>    318          u8 parent =3D -EINVAL;

This ultimately has the effect of setting u8 to 0xff, which is the most
natural value to signify that the parent is invalid. But yeah, it's not
nice to rely on this behaviour, so I've used U8_MAX instead now.

Thanks,
Thierry

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXh4voAAoJEN0jrNd/PrOh1/YQALXfyXCyL60+YKjM/WLAocdL
wIFfA6e7aSdlANIFNckhG74YlQhzP+C8y5d1Tmkjgx1s17D7oBtMOMHCHCeHR0im
s3T44Bzu6AJn182Xgl49AAmMpLIh5OQWWXQK852OlPN3+p1Jzone+YQh8NZJfCS8
tnGdai/tjoO+OJaijyntSwQ0Duq6koyOhV4GG8wEFnxFbfGlLXRMt2NuvMmTdW4q
xSUwEjbFBQ1/4OQwhuNkRJVauuhbfx0f8O7nJAf8lRHLqriU0g2jMLCf7QVuhiQ3
L/1f5HfEImJXcYfT3eeuNu7ohXoUEFuYiTLMwUtRI8IbMQ1T/klJWvt4yD6/KcrK
WSme1IyOh2vwZjNyhTFDmwMWWOFbTqNoHkA1VIkAR6Qi+5pdme0W6fqITHJCLRzG
IeZ41gjKf+TjCB20H/jQWxjJmybqKsAgemHm724AsNySESKSyysicpAPBcPyohG3
OX09W+I9VUjPOA6VG1SNWD0CpwmGqUNoRueGOuX7OBIflGFaqb/tmCo50XbBXQEZ
EfvkMV22qMfvGhIzwOBzkf6FmNvqnZ15xHMPmRVxAqObYgprsc/kf1iCrqW8Eu8s
vGx6UwrcJ9ZSo9M39f66AOOcyul2rIfwlWgOzlYlvDxbovZus2nDP5Bhw/2X/sb6
Ls+XH9uaEXVKFUWo9/bk
=sCfC
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
