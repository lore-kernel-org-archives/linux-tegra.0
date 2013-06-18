From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Fix kernel panics with certain I2C tps6* chips
Date: Tue, 18 Jun 2013 17:59:04 +0200
Message-ID: <20130618155903.GC7718@katana>
References: <1371550481-28126-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371550481-28126-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2013 at 01:14:39PM +0300, Tuomas Tynkkynen wrote:
> Hi,
>=20
> Latest linux-next head (next-20130617) seems to have some backwards-incom=
patible
> changes to the i2c core, which breaks the tps* drivers in our boards and =
cause
> panics on boot.
>=20
> v2 changes: Don't override platform data from DT in tps65910


Thanks for pointing out. I am going to revert the commit in hope for a
better solution.

So, this series is not needed.


--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRwIPHAAoJEBQN5MwUoCm2ZoEQAKA/n0v92XanhzBsif6KFikq
FhyAgjf73vDRyTbMwhz0krrCZ6z3JxtCdmQsIQidxWEi4EQMgSBOPZcl3viBrWj0
iykiv/w1h9Kz2Hm6a89mmrvdqP3LijpssNaMGSTp88uqfF8H5vL0zutMhaNGcvX1
r/BNzs4yVJUOwMK5NXDu0wPn0bJHqo8sjeYaLeUFXxOmDWDo1NMtkZthNtrPHKw6
Rcnh9pTJQwf4X/VU+zeGBgQPoAN0WSe1zarjy1tBxfwFrfbm+pujfAbfhtoUA2T5
wbsHNwFmeRozYrJ7/GrO5pVuvLTJBJOqBiEa40DHbP5rWkiCJiYUDP2P52y7VPec
/5qsM8vZbE1KkLw3K/7s/86d6HjiiTj7D/HBhj3TblIdUWXphO9gFN7aRKoQOdIb
Frcb3q2+OZrJ1LeLMeGT4golejW62ZGHZ1rPZth8VSvEGFeCg5JURG0xx11nALro
9ksB8B1T/j8m2Wb8ev8yPZHBzHH4VzgOE72h8Kk9IB9Gcx0oGQkN1Z+iNL2UyVIh
9IUA1mg76EQDe4kwCpWBeDrcC+c7n7ypqNE0rLmbM3iXN/sk8lKRbSJLY04dIYZr
OoqQ42BNSbiwOoYWDfthZBjbODEEo1hmqrgxsCzq+VvTBZgXzzjxmGRSPE55F0hE
lgXqpDdu9s2wkwbtvMXP
=oHeR
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
