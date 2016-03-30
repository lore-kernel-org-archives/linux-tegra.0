From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: Fix deadlock during regulator registration
Date: Wed, 30 Mar 2016 16:34:27 -0700
Message-ID: <20160330233427.GZ2350@sirena.org.uk>
References: <1459354153-6352-1-git-send-email-jonathanh@nvidia.com>
 <56FC607D.3020108@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DG78IEnUmLKoW088"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56FC607D.3020108-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--DG78IEnUmLKoW088
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2016 at 07:25:49PM -0400, Javier Martinez Canillas wrote:

> You are doing some cleanup of the clean and scrub error paths by removing
> rdev and returning ERR_PTR(ret) directly. I believe that should be in a
> separate patch since is not related to the fix.

There needs to be some reorganization due to the movement with the mutex
handling.

--DG78IEnUmLKoW088
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/GKCAAoJECTWi3JdVIfQUlwH/05fAR11oeVz0zxKa3DLcxkZ
hGzKFaSgQpwNEb9/NrgoJ5Z9Pk6+vdYHHDkLUieRN+Bh57nPTh2Ezvzlgu32RJ/c
ceo9tjmo97vLgx9/qgFXutfTgxZsApCAYQfKCQx+9rgRHYM6tWMbR0AB3JaTEoHk
Vmyw3/tdCC/IsfUiRD+AwBIO2YMJJjopEtzp69PnG0MiWQQBNG4PUe+su2xEQ572
zRqd6BXT5air4Erg4A9m5NgGSw3pu1AZhw7j00oVjU3BK0prYFhUzrvPZgc1WTN5
aygnamJs3OziTqMwf6+4gEncGeTf/PHL0nkTTEYYk7h6+Mln7XAOJSkMrF6J4ZE=
=xyBh
-----END PGP SIGNATURE-----

--DG78IEnUmLKoW088--
