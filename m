From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] rtc: tegra: Implement suspend clock source
Date: Fri, 14 Jun 2019 15:42:51 +0200
Message-ID: <20190614134251.GG15526@ulmo>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <20190614104747.19712-2-thierry.reding@gmail.com>
 <d3de8c42-3718-d87d-3c38-af18c671036c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m972NQjnE83KvVa/"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d3de8c42-3718-d87d-3c38-af18c671036c@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--m972NQjnE83KvVa/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 03:35:14PM +0300, Dmitry Osipenko wrote:
> 14.06.2019 13:47, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The suspend clock source for Tegra210 and earlier is currently
> > implemented in the Tegra timer driver. However, the suspend clock source
> > code accesses registers that are part of the RTC hardware block, so both
> > can step on each others' toes. In practice this isn't an issue, but
> > there is no reason why the RTC driver can't implement the clock source,
> > so move the code over to the tegra-rtc driver.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
>=20
>=20
> [snip]
>=20
> > +static struct tegra_rtc_info *to_tegra_rtc(struct clocksource *clksrc)
> > +{
> > +	return container_of(clksrc, struct tegra_rtc_info, clksrc);
> > +}
>=20
> Shouldn't hurt to inline this function explicitly because I assume that i=
t won't get
> inlined with a certain kernel configurations, like with enabled ftracing =
for example.

Yeah, makes sense.

Thierry

--m972NQjnE83KvVa/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0DpFsACgkQ3SOs138+
s6EplBAAp8fChDDGmbZBfVk6Q2l6B+DVSC/xTILCrCILX0/KF7FAW2txps1x3BZR
8H5XNqJ48V2bmQbPG2bG9XpKiVF/2UEYboQEpZ1TVO7ZrZSCUBnPtUZ9qtMpLvFb
rSGMIWLioh0EOYIxMtenMqgzqpQAVSibHwJaH+rmVhdb8u69JpdQc3ipov5OAkrK
YT5ySJ9SOdb59l1Mn//SWIMZ4nbNriCXqIVBkna8BCTHK46qtg2P+wDaRBw/iLev
Rk2N+rqJTsdPjenU2D0aEEupJiWgTP0LX3lbGntHgEnlJOSfVWektOKQb7Qbcsk6
9EZUBzvW00f1aMehNUsCWpp6Cg3QYAiWz5v0CouyyK56vIImtktHLGfeqdxj5Rnt
4wNCyPTzzcfSfHitT2hPKaDXtLcF07e0ariEdoLfFhxrSE/ZhlTYI6yFvLsCoZmu
Ubdvqf49cIx2aulZaVzfzLM9VkxDj3B9wfcsfHsA538O4LSCt8WqD0BqlFEyrCbX
tLxN/S3VmBiXHhSNZ6xzKS4WIh9EzPt6Oau59r+0XMDLCxaJtXMoRd/BAEq++YAL
UmpAQtg+0Thaen3XbfhggYDszn8ZBwk+2JrcgkA7f6qpCK9pudYwOnmrAF2APoiP
rtF8c+lvsdIBI/iZOAq12divdWRrDgQzLQxovgqVdslTjA4ii4k=
=GzBW
-----END PGP SIGNATURE-----

--m972NQjnE83KvVa/--
