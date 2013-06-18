From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: tps51632: Get regulator name from i2c_client
Date: Tue, 18 Jun 2013 12:44:36 +0100
Message-ID: <20130618114436.GM1403@sirena.org.uk>
References: <1371551413-12346-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xluWKNDh2/FEVhBx"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371551413-12346-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xluWKNDh2/FEVhBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2013 at 01:30:13PM +0300, Mikko Perttunen wrote:
> Commit "i2c: core: make it possible to match a pure device tree driver"
> changed semantics of the i2c probing for device tree devices.
> Device tree probed devices now get a NULL i2c_device_id pointer.
> This causes the regulator name to be set to NULL and the regulator
> registration to fail.

Applied, thanks.  Though it does seem like we should just be hard coding
this string anyway...

--xluWKNDh2/FEVhBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRwEghAAoJELSic+t+oim9AIcP/jhoJ+Y5sS9W6S4Q+fmhHNCS
0vNN2LyEVmu9ktoWdQRbB9AV4tdbxPfRdOLgYbHLlef2NyliIYPexY+mOO5lL1gA
UQfr9i5HMFcriaTsAQlM81ySY5yis5L6GuP6iNwTLoCt8ozzcX91tj5B29WN+Gi5
Ta85fOG4TgtmqUVtp8wgqIfPh08JvEfZYUzh2mINt4F+BdHVt6P65FR6Mj1BtXU2
DvjEKAgPqxWZTDBIcOuLRms2D20Y1qkdBw5WK/iF0MgmTYWj8RkGAZkqsK19D8Yp
Zugrq4fx29+NsTfcnVJQ/wfpu/ZhPhhLy2Ix3cBGLZzx3pG1h+UkP5Uz6VVq6amM
L1IsrY/UR7KnU3abAg02ULUWZqseYF46qXf+7jSwANCM9KvrOshGo1g+GqyMB1rP
jc+OBFF0pNxCQ1ZBeoRh/9sKpKUAE+AD5p2gpEBnIWPeygRom1FIld3lBRgmbOot
Vv81xemhvpJxamSV8Xe1zm1vbptbJXKOJMKHriVFf1N28y3Dgmnikmcc5L3PjJlk
7pYfNE3t8kUpPG07O4gbT5sotnEGPtHcxbA7S8QTH+9n4xnBdgG92lv8wVnWmXRO
eMfBMuEIeDcPSWNT3PjPp+geUXGFytpLKzVY9NPkRwPGBanKWUPyInX8nHDjVcUR
WTkQr+ul/PJPWv4iCM0R
=iqjm
-----END PGP SIGNATURE-----

--xluWKNDh2/FEVhBx--
