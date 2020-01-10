From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] ARM: dts: tegra20: paz00: Add memory timings
Date: Fri, 10 Jan 2020 15:42:31 +0100
Message-ID: <20200110144231.GF2233456@ulmo>
References: <20191218185957.29237-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NGIwU0kFl1Z1A3An"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20191218185957.29237-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NGIwU0kFl1Z1A3An
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 09:59:57PM +0300, Dmitry Osipenko wrote:
> PAZ00 board has two variants of DDR2 SDRAM devices for External Memory:
> one is Hynix HY5PS1G831CLFP-Y5 and the other is Micron MT47H128M8CF-25:H.
> The Micron variant doesn't have official timings in the wild, hence only
> timings for the Hynix are added. The memory frequency-scaling was tested
> using the Tegra20 devfreq driver.
>=20
> Tested-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-paz00.dts | 46 +++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)

Applied to for-5.6/arm/dt, thanks.

Thierry

--NGIwU0kFl1Z1A3An
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4YjVcACgkQ3SOs138+
s6HkpA/8CbhhHcQAkwJsrNO3qGrC0BCvrr95IzgmK2dlrt4HRaX0xI93G/7lAs3A
ESdv1OCJbpBUYV5qILm9PXeCaUPHgQVbRB/vf3WvJxFUqtOHeo2wP8931G3RsWVK
ZVql+BiFRh9+DNt12XcAATzsQ0UKA49+SVib7oR4jr7DYcWLqKrUyHeGkORLBUfa
ayLd/MrZg0gRG+u4cWgV5uw8J1gfWoyt1mq3hBSyvFGNhNuk+OIdsXZRpjrfGY53
6DriMKW0Lm0/vX6z4vAs05NBQttmYO0twCVTkqD/QthAz2ssBxBsizou7PyivxYo
elP0ufCAugGveccayZ3nv9vOU8TIBNpAWTu7teiNndB64SWUNZjnYLeQhS1SmzEW
hNudE74BlQsG3tNtOhvAq4TihFcl1dDMG2O4eV9Kll05X2BSAlVwZWUVJ0wdYclL
j9qEGReoJuyPweinCP5SRXdgqRoMQZsGFXm/B4F6a987OEiEXUJ4tVchSoAu0z1t
aIkHm1Y4VpQrivAh/7cFj5JUbxQxmAGLx6sqkAy+9B141Vw/oLYHdCibs7OfDxip
JGGwV7BLtunWMhi7fs1XKb4X+ocZlBd8+WSYLwWwwKU60VUJa4AU/TeBO8UL+RKB
1Wa8250M4xugLICBcfJi8ed/jfPbcbntXGiJkpnNsF5BZY1dUaY=
=ljwl
-----END PGP SIGNATURE-----

--NGIwU0kFl1Z1A3An--
