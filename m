From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: core: add regulator_get_linear_step()
Date: Fri, 7 Jun 2013 10:09:23 +0100
Message-ID: <20130607090923.GH31367@sirena.org.uk>
References: <alpine.DEB.2.02.1306070753420.32163@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+plSmdOTvOCX/8Oy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1306070753420.32163-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <mlongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--+plSmdOTvOCX/8Oy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2013 at 08:06:56AM +0000, Paul Walmsley wrote:

> Applies on v3.10-rc4.  Will be used by the upcoming Tegra DFLL clocksourc=
e=20
> driver, which will build its own table of voltage-to-VSEL values by=20
> querying the regulator framework.

Can you show the code please?

--+plSmdOTvOCX/8Oy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRsaM6AAoJELSic+t+oim9s+EQAIo1T9CipQV4RuC0ONe6h/yh
erpT87tehwzWJLstitDRsh26EVt523IEv55yV/P8OE4Z2cG6lhzrNMTR+KfJQQtE
ahU6DjoxtCFlclJJ+5jnFFRzAQnsZopeK3WgAh0FReYde18VUUg9PL1A8iRIOwH8
nVoIkuSl6gH3IcFMZxwExSo2g/cZjcKBfP12RD4Ajko757suGmVWwJnlG3GXw7pr
2auSB8EFqn2q6YzHaZ8wGwMnPYSb4CKGAQ3Yn5V0rA5MmmzKLRwWZ/7IyP+IxHKz
urg0pCeXFHuN4qOiQrK2Ua8DPpAoEi2akgp/TN3sZOHX9cv4M1I0RBaLZldyYeZN
LP3lW57xAVyBUEDKMr9V95VkE3OcmD7wB7pVma2IfbOIGWAJUMXLDbC2BzHAkRC/
zhNRWkRguO6MTj/9lR2tnv+5rDBFYayFzXLZaMiusLR/xVO/2q9FBeUA1IBwqFry
tRK09sBQqVP9J4WVUYQQx9Nu8ygke/BivJuhqNbf657zMSNCzjgwzg1rRXvYr1VR
y1ujDUFEiq9KqzhhjyulVVE4OirWKT5MvNXKTS/nKeu5gvjBbg73CkVj5nQGLIgu
nExxyQp8SALyTgNqgn/QC287CYXuFuW2QC557D3Of7d9oEU+Zv9GzLrh6Y5x+DPy
NzAS6GSdnJlmqmdDGoP9
=D1qQ
-----END PGP SIGNATURE-----

--+plSmdOTvOCX/8Oy--
