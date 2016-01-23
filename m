From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: fix a possible NULL dereference
Date: Sat, 23 Jan 2016 12:07:26 +0100
Message-ID: <20160123110725.GB2036@katana>
References: <1447313163-23848-1-git-send-email-clabbe.montjoie@gmail.com>
 <20151112122923.GA31671@ulmo>
 <20151112125422.GA3758@Red>
 <20151112132837.GF31671@ulmo>
 <20151112134519.GJ24008@pengutronix.de>
 <20151112135500.GA1131@ulmo>
 <20151112145458.GB3758@Red>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151112145458.GB3758@Red>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LABBE Corentin <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, LABBE Corentin <montjoie.mailing-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Perhaps is it better that I resent a version which use of_device_get_match_data() ?

I'd like that for both of your patches anyhow. It is more concise and
better to read IMO.


--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWo17tAAoJEBQN5MwUoCm2csYP/R3cgU4oqnU8y34avHHxTesj
Po46XZcoF0JgoxAdfruKoV+f2l3Y/Dwn5qzkX+7nP0Q6DwtHMewNdRISIiAb2nGn
Xwjd/1yFXN4sr26OHBzLuCben5C441naL8khbREcUZ3z8qLGhGTbFigc7p+nngr/
4Lxjws5DdsnVHlUptdZ+6JpJ557evszHOk/zuNolBvl/CBaMcHOnjP6PTRotenV+
J/frJ41xpXFFITCmnL4VyN1biEsZgXHF5b9srME+Tk9Ap0g3USfX4rPPY0JyKN0G
qfupWAnsjz8qZ6+VP7ElCMFRLZArJYYEmYNhXz9+4Cw/D/cZo82csXzuxYF0l5YZ
JEECXPG2oZsE0iQVzLCsi6STL70ET/CFVUzwI3/vZAgxShnkNLuqigeAnx1plAed
E98Q600Ln7paDOmrNaDX2uA21DpifldghYW+8EqNJVP8E2pJE6iqgO+fdwwUnnLJ
uWiHLzCFJJu7K5ilj6U+h7nDfJ84CR/dYeTy7v0BK9vTkTGHqhgqtQ4xpGSy8ts4
6odpVXYEP1vQEgLrU6nEdX/mJTh7qUJiX+tmyM3vLXfsXnlEmY08p+7ahKtvJmXT
YyvtdEPeM+BgtQ7iWV4ddS42R3A+0Eo5YXUxWnLKwZRZ7RMc+lKJEscSvfi4okhb
pLYrXNGYHNcujBCLS/DH
=bsSO
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
