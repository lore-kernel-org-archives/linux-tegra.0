From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: nyan: Use proper IRQ type definitions
Date: Wed, 21 Sep 2016 10:26:06 +0200
Message-ID: <1474446366.1239.17.camel@paulk.fr>
References: <20160828173246.32621-1-contact@paulk.fr>
         <ef69b6d2-ce6b-ff76-5c04-ab2176eb6ecc@nvidia.com>
         <1474395289.1215.20.camel@paulk.fr>
         <0ca614bf-4d27-9948-03e3-472d059f2153@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-NH6xfKpqKgS2U3dwsddV"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0ca614bf-4d27-9948-03e3-472d059f2153-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--=-NH6xfKpqKgS2U3dwsddV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 21 septembre 2016 =C3=A0 08:52 +0100, Jon Hunter a =C3=A9crit=
=C2=A0:
> On 20/09/16 19:14, Paul Kocialkowski wrote:
> >=20
> > * PGP Signed by an unknown key
> >=20
> > Le mardi 20 septembre 2016 =C3=A0 18:15 +0100, Jon Hunter a =C3=A9crit =
:
> > >=20
> > > On 28/08/16 18:32, Paul Kocialkowski wrote:
> > > >=20
> > > >=20
> > > > This switches a few interrupt definitions that were using
> > > > GPIO_ACTIVE_HIGH as IRQ type, which is invalid.
> > >=20
> > > May be you are right, but this does not describe why this is invalid.
> > > Can you elaborate?
> >=20
> > GPIO_ACTIVE_HIGH is simply not the right kind of define to use in the
> > "interrupts" devicetree property. Values provided there are understood =
as
> > IRQ_TYPE_ defines.
>=20
> Right, but you are changing the type as GPIO_ACTIVE_HIGH =3D 0 and
> IRQ_TYPE_EDGE_FALLING =3D 2 and there is no comment about why this has
> been changed. It might be correct, but you need to explain it.

This actually makes the IRQ trigger values consistent with the drivers, tha=
t
define them regardless of devicetree anyway. The max98090 driver
has=C2=A0IRQF_TRIGGER_FALLING and bq24735 has IRQF_TRIGGER_RISING |
IRQF_TRIGGER_FALLING.

This is really more of a cosmetic change, it doesn't impact actual use.

--=20
Paul Kocialkowski, developer of low-level free software for embedded device=
s

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-NH6xfKpqKgS2U3dwsddV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX4kQeAAoJEIT9weqP7pUMEoEP/jzk7mIPfaUalIRNc44GxK9N
LCy5ft98G+x9vl8GpVHchmGVS9J1mr+sy3aeYtx3Edz3IF878nV4ew6MPporAIDg
BnQdnhxRX/8+eFtQ70h0PaTtRyFhxQF4+wwdExrEr+eh+/aIcB1xpSH/YiC1hPXF
EpnfYgJ9Rkl3BLu68ByooAA8/DRVe/Bk/993IVdH8g1v1PlXZK7pEQQV4l5JKKFc
uUnr5VMHh8I/J2JJkRdT5aWzWyxLsCgbsVND4J6hf9IdmN+ez6Rmol0tNGQLAeDH
7z4Md8WsdHsFnLtfIYbwsd2hkw2I1+tYojmAtmscqfeYTV5HXi6zxZHQz7IOVj4J
BRJxRrZAnWniO+dlCRrswtogU9hlGbSKIRWKU3jJsMDoPqx2ruq7Cy2i1sRAbWHj
pXn37mbfLwi/twwCy6uk2CVGWVNn2LVSY2fOQMKlzphkaCxsnw6hU8qMFotuw988
sG1qc59OfFUmf5P4jJ5einY8ki7LDVXcrhB22QP2FYgvT/EJiuH1MS7JNkUN/Ea0
6uNyp6KNT13LlvVTPLNfb2epaaIZpKyXaRWEvg3wlMejBkB4V9OzyXgkw7/VkhKa
6exGtsIlvvXuM7nLW2HG91IWzI/Bpj/co54t0mgYI+r0KC1Vdt4nJO6xDvOBEsFe
KxzNe09LEsUjh6POr09y
=rDC3
-----END PGP SIGNATURE-----

--=-NH6xfKpqKgS2U3dwsddV--
