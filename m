From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 9/9] ARM: tegra: Default configuration updates for
 v4.3-rc1
Date: Fri, 11 Sep 2015 17:59:48 +0200
Message-ID: <20150911155946.GA13945@ulmo.nvidia.com>
References: <20150819091358.GA26627@ulmo>
 <1439977724.4135.90.camel@collabora.co.uk>
 <20150819103305.GF26627@ulmo>
 <CANMBJr6DSXW-h8P8__LKBu-Xv77T35JwxHWvarvqy1keVrtVQQ@mail.gmail.com>
 <CAMAWPa_rus4z+Sg3Uff7ndqrpB8dF1c1rQBVQ9r7vXh6PFcVkQ@mail.gmail.com>
 <55F2AF45.5040706@nvidia.com>
 <20150911123759.GA8473@ulmo>
 <55F2D2E3.4010906@nvidia.com>
 <20150911132526.GB21673@ulmo>
 <55F2F895.5040704@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55F2F895.5040704-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2015 at 04:51:49PM +0100, Jon Hunter wrote:
>=20
> On 11/09/15 14:25, Thierry Reding wrote:
>=20
> [snip]
>=20
> > Works for me 100% of the time. Unloading and reloading isn't a problem
> > either. What revision of the Jetson TK1 do you have? Mine is a C.2
>=20
> Unfortunately, I am not sure it is whatever is in Paul's automation rig
> [0]. However, I have also reproduced this on a tegra124 nyan-big in the
> office.

I was able to reproduce this using a busybox initial ramdisk. Just to
make sure I built a separate one from git and it exposes the same
behaviour. I suspect that this is some sort of weird interaction between
mdev and async probing and nobody's noticed so far because async probing
isn't very common (at least in the ARM world).

I'll be off for the weekend soonish, but I'll try to find some more time
next week to track this down.

Thierry

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV8vpvAAoJEN0jrNd/PrOhUPIQAJZeBw7tKUU6fmHF8nZ+UCIO
T5Z7AgCaoOHKovQfBmm41xFb+cc4Wr+Mazp1oq3PJvK8AzfVSAIpYsSnC6p4RSJt
Ouh5sTgFER0jMR+dAX1RXNglvfnxfOM012TtpYqyAqgUimovrh+B1LqfkhHbxwT5
HVg+lNWM0b2YsqXuabOh0F4eNrulZ8zm9vIYqx8jDECX9/pRwWfJyj2t2av6GWKv
F3pO7lY1u3TZnGAQ4m7PcJn3enGrKtAG0eM8mCfM/mzgmAdvJCmNgh1aDGcapNec
rS6Ump0cgs3Yia6zrZ3AknQwPsdLDfw+w1Vy70hSgau5xZfztzT/TIHDrR5vnftL
w3oUdFfT454JE5PDyUU7jHSuOow0rEYuEFEqpZw75nx3kBmcG8S3avDea706dXpU
eSowGwsVOMOqvreFuiTYI0X7PZoG+6DqUlvulOU4R1T9v3tK8F4vTJhB3nE6kFEW
eNPdRxRXnVeKq1sq5ui8U3Zfhjj8SnaNTgpgSTiDcF0cuqQ1eWoI452Ne4JixNPy
6VihAdDjsQuhH/I6Nwtehxme4+oltqVeCwIJBrkSzvhCbL/SsSlWwRLZjEwQb507
YfDKf0jM87p0aO9jBgJxQlNpPC4gouM1NBd3TCk7Kf/D0XYxCZU0zwKURhuvW/AD
+L2UmWfskzuinT24l82F
=/mvM
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
