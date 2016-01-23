From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: fix a possible NULL dereference
Date: Sat, 23 Jan 2016 11:56:46 +0100
Message-ID: <20160123105645.GA2036@katana>
References: <1447313163-23848-1-git-send-email-clabbe.montjoie@gmail.com>
 <20151112122923.GA31671@ulmo>
 <20151112125422.GA3758@Red>
 <20151112132837.GF31671@ulmo>
 <20151112134519.GJ24008@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151112134519.GJ24008-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LABBE Corentin <montjoie.mailing-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LABBE Corentin <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

> That's equivalent to
>=20
> 	if (dev->of_node)
> 		return of_driver_match_device(dev, drv);
>=20
> and was already suggested in the thread referenced from my reply to
> http://article.gmane.org/gmane.linux.kernel/2083641 :-)

Did you make a proper patch out of it? Can't find it, though I also
think this would be useful.

Acked-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>

All the best,

   Wolfram

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWo1xtAAoJEBQN5MwUoCm203MP/1gwlaJN6AIs1LNdTdvJwDvW
aLwpbldiGIaBM4BOsvt7JF43OquRt8poHsQyaz8wml5WJcIXv/yiBorM9YV/QOVT
WmcOsajBH81MPQiF98NaPFahNBbJl2dvp08kHjRbiCk+QcZ4lQtiLLdivJ6eI0Tk
d1/QcdeBYILsSIjb7xNnBV6Otj0wbsGFrSYLzNv9RZ+OM25sSd6UB0WnNqb/sEUB
qsIBrY2/WJb62JZ5r3UXcdEPf9280yLMdFrHXMUS5bvzZ9qxSXOeQj6335cb+aQd
+jc98kC1KWI4Xn7Fs4+v9Dg6/HccrFor/NyUiEJMJQM/UmNU/2kK8kJRPsrtNgOd
HdYSm/wZgadUQEkwpOgigcQTOYfyKoVdhO9AYi8j+VmwQsM9qOHwf/5NjJ6lICi6
W86Hxv2AaIWiRbx/eX9WZT5oeqrhQS9jseE+1r/AAmbImXFG+iZthMckqpVrLs8I
sgc2AqOcyu4An8X9n0y/b65K/O89ipG9KBV2pdMHaRsoxNRPS9+AUL82e+yz97li
IGWLFYRVN8Y+nrta7fb9rh8A/mPKnQXG6Jx+6RSkx1/GN14nE4441o4rbodCFUxj
uz86qDiTJ19eoohcLwdNrt6wFQv2uiyW8DUmVabpfyng+Y1p6O9QtF/k3dGZWt4l
mE/ZinGMl3MT2HbOdHsN
=wmTp
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
