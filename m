From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: core: add regulator_get_linear_step()
Date: Fri, 7 Jun 2013 11:18:45 +0100
Message-ID: <20130607101845.GM31367@sirena.org.uk>
References: <alpine.DEB.2.02.1306070753420.32163@utopia.booyaka.com>
 <20130607090923.GH31367@sirena.org.uk>
 <alpine.DEB.2.02.1306070920010.32163@utopia.booyaka.com>
 <20130607095936.GK31367@sirena.org.uk>
 <alpine.DEB.2.02.1306071000330.32163@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="luEVMvTx1SoZptjd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1306071000330.32163-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <mlongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--luEVMvTx1SoZptjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2013 at 10:03:22AM +0000, Paul Walmsley wrote:

> The IP block has an I2C controller embedded in it that autonomously sends=
=20
> set-voltage commands (across a range of voltages) to the PMIC.  To enable=
=20
> that, the driver must first initialize the IP block with a=20
> voltage-to-selector table.

Ah, right - a one of those!  OK, makes sense, I'll apply.

--luEVMvTx1SoZptjd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRsbOCAAoJELSic+t+oim9jeUP/2Ha1w4ZvNtVZBVuZrlf2lmT
YooYnBLJVc1FIh8KQCdV39KMV5pGqLB2wt189cI5sojUU72R0ewHeNi/6cTeYFii
vm65aN4lEMa+PZmTwpME/dvKTyFXa2EXEC8ylCTCJT0xVSaoI7T6XZ9XkhHC8wm3
NXKpNbKVnsBL52atAaxImM9LIbp3BJfjPLsegKlQ9XFdPvcC4oG+luUZbz+CWzgy
GF86e+5c5MYhxsnxwsYxyKHz2XJWF/0+EDxWyTH9jcYBXdy/eJMVPKKqNzwN4T1x
wXDHZQJIvn/kPJsWJVOjPfQ/WxGzygg5ZihuBF7a4pD3CtExKF3EO/38XD++xHEm
RSuptHUK6FVZq3lWGP8I6RCpYShxuUmjTPJloepMxU+7F270glvnhz2FlfSCS6BR
Vjn8f5wBc/8qV/fKn0Qg9tSnxywLCncZkWCVAH5AuGVmdE94Kr58pUaZ7eeZ/to3
unojWOlOneImF6DdbUlLYbjDzAFqaDoHjY/zZJ3P0koHsMoYGWOSSlVZGs511fri
dta+WX7JCCE64kWSByHJQzcgmmMMz9Xz9W+JpPUmUWXK4DrQeU+We+wZyTJeo9+n
NeclnJfLfYtIk821VTR/dzTpLms9lGruBAraPFu1862d30Q/YCZ54F4psTgyyxpP
XkJ2vaZfwIz2bfTNIu+3
=f+6y
-----END PGP SIGNATURE-----

--luEVMvTx1SoZptjd--
