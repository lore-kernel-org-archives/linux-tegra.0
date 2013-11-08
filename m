From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 1/2] drm/tegra: return -EFAULT if copy_from_user() fails
Date: Fri, 8 Nov 2013 13:35:37 +0100
Message-ID: <20131108123536.GB31551@ulmo.nvidia.com>
References: <20131108100737.GX27977@elgon.mountain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131108100737.GX27977-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2013 at 01:07:37PM +0300, Dan Carpenter wrote:
> copy_from_user() returns the number of bytes remaining if it fails, but
> we want to return -EFAULT here.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

Applied (manually because there was a conflict with the __user
annotation fix that I did earlier).

Thanks,
Thierry

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSfNqYAAoJEN0jrNd/PrOhiE8P/jvqYROBktA+4jbdrkSHmOmH
f7vpkr6LPNEWmd75PbBNSr7MkZZYE9UiW47V4F95LUtZiZ2xGv0AgVaSRJq98W+b
Y9nmI8MtnWEX+ReS4QOzE/fzQYk13lDEG0jlBu3JYjKNVaSwlvOSDklbcjWvY2cM
C0Exsx/re3GBRbNsxXoNpU4ptPIZRPNV3ka6nlY8FCF8pCSfreQewoIOoT0uOTp+
ZGQTArvczYwstsg/u4mI36ODPbcsR5dX5Y87wEdqJJ+jE31F1u/jkG25KYDlMAqf
+AQDtmVR9ZXEeLsEmU+vI5tGxMF7xGHNadfSTgEgZF5fXZT9xZWha4EKpiwEndGd
3sVkAPUdYXlleWu6mfst33wYSGGVGhiWlXiGKjqTkRsqn+rwppVNAlQGZ9/HvtVB
vAfXKPbZVLpWoCfAdzQIX9bB+5H8p75o++DayEEyX02T7ugQI3LatKhrkXUP6BA7
ueqqPA/MDWZxcAV3IEh7sHGpPKSLHKu8c+IRISAaKXl6otWJAaG10Eqtb25cmiza
1Z3f39zNKl3Sfg7FgvsUu0AfXl3F6sq2cykUS1Y5HJY/Tmw+kzPrgzVb2YpOCVQn
eiClcsyoowjF2g7TXUpC0InR6xMszOIOQYyrRcum/W8VmZOFG9f6Ti7zDp7OaSVt
UwOBhiifew/fBwA9PEhG
=YesS
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
