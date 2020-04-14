From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
 Tegra210
Date: Tue, 14 Apr 2020 18:48:08 +0200
Message-ID: <20200414164808.GA15932@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-12-thierry.reding@gmail.com>
 <543bfc3b-2bb9-01d3-62da-89d1f0b18a5b@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <543bfc3b-2bb9-01d3-62da-89d1f0b18a5b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 07:40:55PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > -	/* EMC training timer */
>=20
> Guess this comment isn't really needed from the start, or should it be ke=
pt?

Nope, I'll remove it since the code is already pretty explicit.

Thierry

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V6UYACgkQ3SOs138+
s6FQnRAAwJoMauB0YUdSUVh1pXLf4jHxluqKui/zk3P9bXAk7mLipovO5mcIkkHM
lYPBh/nhQGROQJVqOuf3JBG13bkJvK8DwONh/k6n/GFo6tR8wCid4UX4IEiErdR+
sM/977LWhcid/wgZPtLv4vT2+M3pY3ZdqDOYIVf9ZHxD8DkLIIOKZ5IavNCfD/GF
xA1qhkmrlAiuV3GGP5mFDeq+bYml1ZVfxV2eSFq4fIFWzCcK18AQjzdweOkRLG5t
H3AoaiIVk9D5SnuH1zy/fsWHc0kMhhEE5iSsTL/uUM2Rm8687u9kCzjz0lxEz2Z6
1zOIuQM5rExo+C5IXR+Z7AvVIl3uR+NxJD98JstB6NPK7jPTG7F7PX1gdXVx2VGg
3N/9o7x17N8Ns3mM8enK2YrP605ExK8zvAlJaAbWJDzoeLoQDFsmvSmIKk8Tl5VF
0p+lFEK/T8yIlXwd4xn4pOHmmZX4+dqJP/7v0O2egfcMBRUB48BeCPDv1H0/Lice
taivRgUpG8GZv2VwGNywnXYhpAnvOTOmIxqcFFB8Nqp0abTwoSrYqZ1Nd3dukNHj
7QrRkysO6p2cEA/ZZK7YAuFK3AVk1gSYLJy3hI9LM6rNWe/6jr1H1WY4SteIxvtU
lVkvtwMHwkxbpwrLWoLHRUI+ibmblRdWJjf+1R7Kw7auKbngZEY=
=EqDC
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
