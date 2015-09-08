From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH v2] ARM: tegra: paz00: use con_id's to refer GPIO's ingpiod_lookup table
Date: Tue, 08 Sep 2015 09:59:11 +0200
Message-ID: <3738507.JjVW9EvTJ3@fb07-iapwap2>
References: <1435673759-11996-1-git-send-email-digetx@gmail.com> <55ED5721.80508@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3403769.ohlsyk9j4l"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <55ED5721.80508@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

--nextPart3403769.ohlsyk9j4l
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 7. September 2015, 12:21:37 schrieb Dmitry Osipenko:
> 30.06.2015 17:15, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Commit 72daceb9a10a ("net: rfkill: gpio: Add default GPIO driver ma=
ppings
> > for ACPI") removed possibility to request GPIO by table index for n=
on-ACPI
> > platforms without changing it users. As result "shutdown" GPIO requ=
est
> > will fail if request for "reset" GPIO succeeded or "reset" will be
> > requested instead of "shutdown" if "reset" wasn't defined. Fix it b=
y
> > making gpiod_lookup_table use con_id's instead of indexes.
> >=20
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > Fixes: 72daceb (net: rfkill: gpio: Add default GPIO driver mappings=
 for
> > ACPI) Cc: <stable@vger.kernel.org> # v3.19+
> > Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> > ---
> >=20
> > v2: s/GPIO_LOOKUP_IDX/GPIO_LOOKUP/, otherwise "shutdown" GPIO won't=
 be
> > requested>=20
> >   arch/arm/mach-tegra/board-paz00.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm/mach-tegra/board-paz00.c
> > b/arch/arm/mach-tegra/board-paz00.c index fbe74c6..49d1110 100644
> > --- a/arch/arm/mach-tegra/board-paz00.c
> > +++ b/arch/arm/mach-tegra/board-paz00.c
> > @@ -39,8 +39,8 @@ static struct platform_device wifi_rfkill_device =
=3D {
> >=20
> >   static struct gpiod_lookup_table wifi_gpio_lookup =3D {
> >  =20
> >   =09.dev_id =3D "rfkill_gpio",
> >   =09.table =3D {
> >=20
> > -=09=09GPIO_LOOKUP_IDX("tegra-gpio", 25, NULL, 0, 0),
> > -=09=09GPIO_LOOKUP_IDX("tegra-gpio", 85, NULL, 1, 0),
> > +=09=09GPIO_LOOKUP("tegra-gpio", 25, "reset", 0),
> > +=09=09GPIO_LOOKUP("tegra-gpio", 85, "shutdown", 0),
> >=20
> >   =09=09{ },
> >   =09
> >   =09},
> >  =20
> >   };
>=20
> Ping

also=20

Tested-by: Marc Dietrich <marvin24@gmx.de>

I thing this should go through the tegra-soc tree. Thierry? Stephen?

Marc

--nextPart3403769.ohlsyk9j4l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJV7pVPAAoJEKyeR39HFBtoP2cH/jnfj3sd5sheORZnC76uTj+I
g6koeh2Ezv3OjLiTbWeIBgQD20BDN7qQl53jNa8XXIWpjwKZ/Dqqu7NLEQpmVreg
dNxZJ+GC8ACkDDjdd36HIMCFbsllVM1RYot0Mtk/eid8v3V6WYKopERDDke8qLrh
nGGzSZKNRqMVkqPAeOAkPaWnliJ8IwlXypuy/NjqoQf3EHo0Cvs02DQJc4jNEAGu
zfULvN8laXWuQBV4K+wZlrS2jUSd/MnFeX1DQcLZRGYLijezjrArqIFnnyxHNYuC
lLTPoaGbejlBORCqFqCCmOOC985jXB6IOrsjjV+ihfXn1vGqeQNi/Sayrj3HK3c=
=xKHl
-----END PGP SIGNATURE-----

--nextPart3403769.ohlsyk9j4l--
