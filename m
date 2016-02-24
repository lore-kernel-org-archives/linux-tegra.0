From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: don't open code of_device_get_match_data()
Date: Wed, 24 Feb 2016 11:25:27 +0100
Message-ID: <20160224102527.GD1391@katana>
References: <1456063089-3403-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456063089-3403-1-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 21, 2016 at 02:57:42PM +0100, Wolfram Sang wrote:
> From: Wolfram Sang <wolfram-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
>=20
> This change will also make Coverity happy by avoiding a theoretical NULL
> pointer dereference; yet another reason is to use the above helper functi=
on
> to tighten the code and make it more readable.
>=20
> Signed-off-by: Wolfram Sang <wolfram-z923LK4zBo2bacvFa/9K2g@public.gmane.org>

Applied to for-next, thanks!


--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWzYUXAAoJEBQN5MwUoCm2G4gP/3IX0XtxNMtElpIpv4grFJ5D
NNnB2SzrKtLkbavlQqw+4GE9wguDDrdtjhYMIxeXWZ9pzCVyVo40902BzCqzxt6r
9GphSvF7WQw+7k9Jjd0i0GHiWYToJfmFqemLD++ytDaF54RRW0o24Ky4itxB8NCU
zQJZBXOD1WkPe+RinLHGEvA/mtB99iBdUm9ZeaBPi8B/5ji+0kCHdatNTXn9rdhn
LnfvhJOPZvXApZJWDo6ZA04WQLRW6v+i0VTFTZMyWiiX/swv8E2qEHr1Enf4TvOD
SkKVoQHLcxVuOyO06tNYAV7q+6ou5fTlPWFw2pyK4SuC4WQxhaO5wMuKhZEhpu/j
wdr+kHjhTwKKqj9tLWh3i4KshPAW0b8oVy+19JuUjmH5AWdpp0QRZ7oF3LVWkEip
Y+0hEgL/yfGzB6+0qjEm18dzXrn78QWzGBEVDF3mbeeBMH5a0kJgtI92XlFpdjQ3
ZeHCxwJ7Phmhs21/OeLNS755unGxFtZg4dm+ZEYxWF8m9WfqV3TkyHCavIVIALHA
96Z6P0YS1Ch+HW9+2u8CGPbEpSpHRhwdqfd5eKxBMYophM71WZo68w7JSP83bZaW
vketmoMKqfY5lD+1ocQby4i5PxWKnQ/IXUR7dRDbIlKUQqlVNixnXS5vf6r0p7ij
m5AWmRRMdjhIdNGPPugE
=Vc+x
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--
