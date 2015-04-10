From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2 0/4]  arm: tegra: implement NVEC driver using tegrai2c.
Date: Fri, 10 Apr 2015 23:35:23 +0200
Message-ID: <20150410213523.GA15596@katana>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
 <20150403194635.GC2016@katana>
 <1549160.njMIY2NVTi@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1549160.njMIY2NVTi@fb07-iapwap2>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> One thing where we need your help as a I2C maintainer is how to represent=
 an=20
> i2c slave device using device-tree. You may remember our discussion in th=
e=20
> past from here [1] where you suggested to just make a slave client by its=
=20
> compatible name. Stephen Warren from NVIDIA raised some concerns about th=
is=20
> solution because it may not be appropriate in all possible future cases (=
which=20
> is what a proper device-tree representation should take care off). He ins=
tead=20
> suggested to mark a slave client by adding some flag to the reg property,=
 to=20
> be able to handle a situation where both master client and slave client h=
ave=20
> the same i2c bus address forming a loopback (e.g. for testing purpose) on=
 the=20
> same bus. More details here [2].
>=20
> I hope with this post I can join the different discussions somehow so we =
are=20
> able to find a common sense which is acceptable for all.

I'll have a look again for 4.2.


--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVKEIbAAoJEBQN5MwUoCm2npcQAKhYep55sSHykI3YzN7HdWkA
nwQNlpDHo11YFK+TXbKoU5TWqhvmbE++kqyTK+9muGFq3+9LzpGp/5mbGmkSCiWr
UBhQBLIIhckJBjrSm6kW6fHNsrUCYxlm3dTmdjpiMklr+5lRxx7a39wem5zn4NpH
biRh8Orh92KIV46TTfd2xQqiVHZAFJQ/CJf8oSsfyJ4oV/sLsrDG1uLG9NJA7B5+
EBoVtZF0WZaxe5Hgkt7chAjY6j6D4GR4nde/569i8H3lJdhwZkINGN23qXeT+zXB
81rM9UFqwwxo+/VFH4rfFLTeIuoUT0H8yTfP0LLSYJFrSqI+Nhlbh+8gwC4oL38o
1wmJECygPBhVFNFaISn0DbfSvuRdludnivoF8iruhD4puNPfhEYSKZcOs8Bwym2K
T6XuUJ3D87a9xnK2iYAanh/1NU1JNh/jSV6wek2gp+Jft6i/ff5I+uAv/nqhC4kJ
wbOLDEYRpaV5UIkZtquwsi7WAHnw1BE9r70BlFwERf82Q0P/i4JII6ZmMi7kcxM5
cuucwVVsebwYC2yhoiKVe5VJtJ1eRp08cEKifrnzKHS2MdW4wyGrLwjeEzDAGdyD
uQLwbSZCHXlf0olo1+6zJqYn3JhvWP4ulJ1pbZJW5L0sWr25yhXzYAaMeOuFrhYK
1JeheuoM71PxthoUCN/S
=+6bJ
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
