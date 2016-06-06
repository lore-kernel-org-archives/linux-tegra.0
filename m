From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mfd: max77620: Fix FPS switch statements
Date: Mon, 6 Jun 2016 17:32:16 +0200
Message-ID: <20160606153216.GA9517@ulmo.ba.sec>
References: <1463075104-26924-1-git-send-email-rklein@nvidia.com>
 <5734C2C2.2060207@nvidia.com>
 <9716c1c8-dd2b-8444-6ec9-567d07fe8971@nvidia.com>
 <20160531073022.GA1729@dell>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160531073022.GA1729@dell>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2016 at 08:30:22AM +0100, Lee Jones wrote:
> On Fri, 27 May 2016, Rhyland Klein wrote:
>=20
> > On 5/12/2016 1:52 PM, Laxman Dewangan wrote:
> > >=20
> > > On Thursday 12 May 2016 11:15 PM, Rhyland Klein wrote:
> > >> When configuring FPS during probe, assuming a DT node is present for
> > >> FPS, the code can run into a problem with the switch statements in
> > >> max77620_config_fps() and max77620_get_fps_period_reg_value(). Namel=
y,
> > >> in the case of chip->chip_id =3D=3D MAX77620, it will set
> > >> fps_[mix|max]_period but then fall through to the default switch case
> > >> and return -EINVAL. Returning this from max77620_config_fps() will
> > >> cause probe to fail.
> > >>
> > >=20
> > > Thanks for fixes.
> > > Missed when converting if-else to switch.
> > >=20
> > > Reviewed-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> >=20
> > Lee, I noticed this hasn't been merged yet, but without it platforms
> > using the max77620 can easily (if it has FPS nodes) fail to probe. Is
> > there anything blocking it?
>=20
> Yes, it was sent too late in the cycle.

Can we still have this for v4.7? It's clearly -rc material.

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXVZd8AAoJEN0jrNd/PrOhq1wQALXzFW0Gkef0gxgLRhmlVhaI
oXRy8Y3m+KnWjvczErRYUR+OhR0Q7ieAHmInp5g7aCsH4BlwhzEeHcTtjdd2sNY1
xKSDDYKHhjjdiWg5NBphT5F24WUECRl/UeOZVb7OV58YwGti6pzGKp1+nMw7Djii
cE0SAy6+trV44E+wUp09rISCkOk6/A5EUYbFV4VPyPfhzqpqIFKad3AAe7OW/AsF
MTFH/Wjl1tuWutLv/UUJgQnBY7bi5upptDJkV/DeT38LHKkWmsBCHLkTEl5pmJYq
xxuj6K6dBOanHc0FgbGga7XSRbbQxxljYBVgKJsnNRrYpKx5kqIh9/a9/6djd9zZ
jgqJJoJdwoEWBhLS1ftV/ibwyFsYTqm/lHid5oCKP75Ijn6KY4oRu62yoCcF261C
xVKxRMehRe137gA12sKO/ozIaTaxYUt1Ux+m+sSsEUG4iojQrWutP6DCTQ24v0ch
KtsX5xCHF4gM8ZliUInItEJmwJSLkJYke7Le9euQfihZRYs8ar9l/526cfw6WG6p
R6taNnmTxyeNo+lUDuqdJGcUc9Lq+ivjUACpz6o6/q7CbUro3SRmN6SOxM7P7b2W
PO6/6dyIHVxhpXjkayYU5+uDtZE8iU1dyxuy+GSsThClOgGCPVcIJOiaD8kSjTu5
C6O+Y3eRZmvZcRHZ4RMv
=TR0H
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
