From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH 1/4] ARM: tegra: nyan: Use proper IRQ type definitions
Date: Wed, 21 Sep 2016 11:31:22 +0200
Message-ID: <1474450282.1239.21.camel@paulk.fr>
References: <20160828173246.32621-1-contact@paulk.fr>
         <ef69b6d2-ce6b-ff76-5c04-ab2176eb6ecc@nvidia.com>
         <1474395289.1215.20.camel@paulk.fr>
         <0ca614bf-4d27-9948-03e3-472d059f2153@nvidia.com>
         <1474446366.1239.17.camel@paulk.fr>
         <eb7540c0-4abd-86c0-7777-78fe1f12bc59@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-i6G+j71m1l5yNPoDaK6G"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <eb7540c0-4abd-86c0-7777-78fe1f12bc59@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--=-i6G+j71m1l5yNPoDaK6G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending with the right CC chain.

Le mercredi 21 septembre 2016 =C3=A0 10:06 +0100, Jon Hunter a =C3=A9crit=
=C2=A0:
> On 21/09/16 09:26, Paul Kocialkowski wrote:
> >=20
> >=20
> > * PGP Signed by an unknown key
> >=20
> > Le mercredi 21 septembre 2016 =C3=A0 08:52 +0100, Jon Hunter a =C3=A9cr=
it :
> > >=20
> > >=20
> > > On 20/09/16 19:14, Paul Kocialkowski wrote:
> > > >=20
> > > >=20
> > > >=20
> > > > >=20
> > > > >=20
> > > > > Old Signed by an unknown key
> > > >=20
> > > > Le mardi 20 septembre 2016 =C3=A0 18:15 +0100, Jon Hunter a =C3=A9c=
rit :
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > On 28/08/16 18:32, Paul Kocialkowski wrote:
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > This switches a few interrupt definitions that were using
> > > > > > GPIO_ACTIVE_HIGH as IRQ type, which is invalid.
> > > > >=20
> > > > > May be you are right, but this does not describe why this is inva=
lid.
> > > > > Can you elaborate?
> > > >=20
> > > > GPIO_ACTIVE_HIGH is simply not the right kind of define to use in t=
he
> > > > "interrupts" devicetree property. Values provided there are underst=
ood
> > > > as
> > > > IRQ_TYPE_ defines.
> > >=20
> > > Right, but you are changing the type as GPIO_ACTIVE_HIGH =3D 0 and
> > > IRQ_TYPE_EDGE_FALLING =3D 2 and there is no comment about why this ha=
s
> > > been changed. It might be correct, but you need to explain it.
> >=20
> > This actually makes the IRQ trigger values consistent with the drivers,=
 that
> > define them regardless of devicetree anyway. The max98090 driver
> > has IRQF_TRIGGER_FALLING and bq24735 has IRQF_TRIGGER_RISING |
> > IRQF_TRIGGER_FALLING.
> >=20
> > This is really more of a cosmetic change, it doesn't impact actual use.
>=20
> So you are saying that the drivers don't actually use the DT types?

It appears so. At least they are hardcoded in the kernel driver.

>=20
> =C2=A0May be that is ok, and yes this is cosmetic, but this should be sta=
ted in
> the changelog as it is not clear what is going on here.

Fair enough, will do in v2.

--=20
Paul Kocialkowski, developer of low-level free software for embedded device=
s

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-i6G+j71m1l5yNPoDaK6G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX4lNqAAoJEIT9weqP7pUMvV8P/RXy74MdU2gqNItD/oSEXb7b
i52U81fv4cQUImlDAmIJa09ZhzoVf08CnpL/0wFkuVgbGWbIThKaafJwyagyodZ1
mu8V+ZgSVI6tzr824abL/csm8s1NCjFY6cJr+HEfhBtMmowEiQYdHkAOLiBSOqvQ
1l6OkUQxdAzQkvtcz/7/72TDVPNZ7wB0fFz876UtKzq7Sq38eMGI8xMu9DEfSLqr
CzayiogfSmll6o6XjYNpL4LL0VPF9yZKC+UYRq+aC0Yx0P16+X4PQURYGxbiYD9t
gABrcUgI7yp4iE2n5MPezcycqUQWQbr8MnK/FcRt0E5Qaoe8mRcRzPXgU2qvQ5lW
5XpAyt/ptE9JR0OYgPsUJ+1NMBkHOhoiypPMAY5cyW6+4zOKabUstBRkAhhAzQ+v
2u1F0ifdB6gyQXOPMgzJ6/IlVCYKKy03yOCpJ+3To5WlHW74nWpY7RfkbU7cHoY0
FPyAQ/GEkduGoQCLS0vRjPiXlQ5GyQMnHHMHA2qwP4weLZrYhiX+k8jLHi3C5+SZ
/5dYxPZEgp2RGlLas55FryXqKuITcThmmOSuGHpLpxf6KLloFnwkwYyinaEQlAqU
oWT2BtVwJpoEbQqO83a32YYMX7XuOu7z7HMy0WRAEgWRUtgDkGhCJ5wlFvkGK3ZG
YZFW8mMX7S3WGpMny/JQ
=8dJ+
-----END PGP SIGNATURE-----

--=-i6G+j71m1l5yNPoDaK6G--
