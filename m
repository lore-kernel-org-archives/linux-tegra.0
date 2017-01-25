From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH v2 2/6] ARM: tegra: nyan: Use external control for
 bq24735 charger
Date: Wed, 25 Jan 2017 12:01:55 +0100
Message-ID: <1485342115.1224.0.camel@paulk.fr>
References: <20170122154753.31942-1-contact@paulk.fr>
         <20170122154753.31942-2-contact@paulk.fr>
         <20170125105940.GC9344@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-URqawIfcHm2Sglwq67Jn"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170125105940.GC9344@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>, Peter Rosin <peda@axentia.se>
List-Id: linux-tegra@vger.kernel.org


--=-URqawIfcHm2Sglwq67Jn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 janvier 2017 =C3=A0 11:59 +0100, Thierry Reding a =C3=A9crit=
=C2=A0:
> On Sun, Jan 22, 2017 at 04:47:49PM +0100, Paul Kocialkowski wrote:
> > Nyan boards come with an embedded controller that controls when to
> > enable and disable the charge. Thus, it should not be left up to the
> > kernel to handle that.
> >=20
> > Using the ti,external-control property allows specifying this use-case.
> >=20
> > Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> > ---
> > =C2=A0arch/arm/boot/dts/tegra124-nyan.dtsi | 1 +
> > =C2=A01 file changed, 1 insertion(+)
>=20
> Is the ti,ac-detect-gpios property still useful in that case? I guess it
> would still allow to monitor whether or not a charger is connected, even
> if the EC determines that it shouldn't charge.

Yes, this is mostly what the bq24735 is used for in nyan devices: reporting
connection and disconnection events.

> Anyway, I've applied this.

Thanks!

--=20
Paul Kocialkowski, developer of free digital technology at the lower levels

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-URqawIfcHm2Sglwq67Jn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAliIhaMACgkQhP3B6o/u
lQyJrhAAkMExufjsKy5vcpWLVAGyemRPyrHlSOZpjHdlTAqeLw3SIXNrIFBU7KhW
a9lwW93MyQ6XQLsE45hQq92qI9JgNmmbbBoq2i4OLiEyK5r3fGseGE1WQOuQiO8E
OGSqmEMfZUs3Q1KUcpTpQSmRPVSTe3vmd0KqM5efbCbv7sr0tcrb2Ja0erGjA79e
VEWEThOY0x2bHYo8rItC/Nu8vhvB7PMH2hBYEBJsWdX7ymT8xpL9Q13Okc+5IHFw
Trqy80TNAo0f2WbCZ/m2GVBAAG1Citj+5YgErMhKs6eFEfo+UZvX6PJrEs3Jgduj
tEYQn5vLPXXYwd6miwEzDETvD0HK9DFFiULdPFba09qagZ9QDXXNCZn1ISmji0iD
WYqW6dyK33ezav0E7EUkV1gRG+DeVw2GdST8IfdR9lYr+7WyBrFU8FI7dEbJnnHk
6QNtx+2FSYiKcK+LVLC+qI+35OeXgpjEqHAYIoI3jmww5acpV6UJeBPGzWNv8qc6
s+UjjIydIgE4sahQuNmCEvwqMbjBfd1ggqXLi39+6ye27l+pu2yJLmEZUx9XKD+S
oMoXnZyfboZyXyNwuUj0Kr2hDq2hvsHZJz96F6fS7Wz6q1dMj7gkmZoQBOr5ydGO
kOJ7nH+CnFL0cHT0FVZ+qDiU7FYkCeJT3tYx1lq9oFCuhudFOqE=
=Pb0W
-----END PGP SIGNATURE-----

--=-URqawIfcHm2Sglwq67Jn--
