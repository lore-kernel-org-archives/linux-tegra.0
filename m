From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: tegra: nyan-big: Include compatible revisions
 for proper detection
Date: Tue, 20 Sep 2016 19:53:24 +0200
Message-ID: <1474394004.1215.2.camel@paulk.fr>
References: <20160828173246.32621-1-contact@paulk.fr>
         <20160828173246.32621-3-contact@paulk.fr>
         <a9485a88-55a5-9dd1-1a1b-a6c0a78ff476@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-zbscI9PGNQnPZLbGSG+y"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a9485a88-55a5-9dd1-1a1b-a6c0a78ff476-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--=-zbscI9PGNQnPZLbGSG+y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 septembre 2016 =C3=A0 18:41 +0100, Jon Hunter a =C3=A9crit=C2=
=A0:
> On 28/08/16 18:32, Paul Kocialkowski wrote:
> >=20
> > Depthcharge (the payload used with cros devices) will attempt to detect
> > boards using their revision. This includes all the known revisions for
> > the nyan-big board so that the dtb can be selected preferably.
>=20
> May be I am missing something here, but for the mainline there is only
> one dtb available and so why is this needed for the mainline?

There is indeed a single dts in mainline, but depthcharge will use the revi=
sion
to match the compatible string (e.g. it will look for google,nyan-big-rev5,=
 not
google,nyan-big), so we need to list them all in that single dts. Otherwise=
,
depthcharge will fall back to the default config, which may or may not be
suitable for nyan.

--=20
Paul Kocialkowski, developer of low-level free software for embedded device=
s

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-zbscI9PGNQnPZLbGSG+y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX4XeVAAoJEIT9weqP7pUM+XsP/RJJKEbsBJE4Dvgs4uIloUmj
dYLtUGOxle/h5IHGDxxaA4WTafKsZgkCkt4NdCJ5GtRLly63iO5+dL3JnApabBSE
NYfzE37j2ETLJRo2oHyZ8zjujhYuyhBp/EX8kKFBU3O3TG3pJpn3s80n72qMlK0u
goRXZrO6KjYEyu5lQpKuewf+U6duQu7ILjLKOXt7KG7Ds+BLLWFpRQwLVUHiA9qE
zFj73wp40hjN62B1+1MWmjLbEs33UsycD6e741QmLOGH0yuaHV18rfEwZ+9ioa8F
avxbMZWFoIub43l9ebUv3Gd0KYMHKu4J80bggi+MtxaB7Dtfw0qWSn9GONyQtEgv
m/24TPpSojeqJzOfcc70nVQEjIqekDgihs9vDZpjs7VdrUJ22osnBRcuLnDhlMCJ
RubaxYAUoAOX8JZngYT3dV4asra1BasGu7fU0yvfVGfBqTH1Bnvf+ILpTPnuEqaY
qtI/Nw/Nkcu6cuZoFmtit0Sxxlraazc5Uw/ECQzxruzVWKqwHRIRObbmM06Q0ypr
kWH+QZp6wMxq1MJrJnkC0cpMXR6dYb+La9iaAqgE97swMl6jR2/rUSGmZulS1gif
mq1o0DFk6j6rfZc6axNtYcmg51Q2OPRXzHWvr0GSb9wwJN57c5T8vz8UIz/kpKMh
mxQanFlMLuxslPK6YwcJ
=8V7d
-----END PGP SIGNATURE-----

--=-zbscI9PGNQnPZLbGSG+y--
