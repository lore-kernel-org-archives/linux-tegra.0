From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: nyan: Use proper IRQ type definitions
Date: Tue, 20 Sep 2016 20:14:49 +0200
Message-ID: <1474395289.1215.20.camel@paulk.fr>
References: <20160828173246.32621-1-contact@paulk.fr>
         <ef69b6d2-ce6b-ff76-5c04-ab2176eb6ecc@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-8otpdRp68sDOyBOorK7e"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ef69b6d2-ce6b-ff76-5c04-ab2176eb6ecc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--=-8otpdRp68sDOyBOorK7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 septembre 2016 =C3=A0 18:15 +0100, Jon Hunter a =C3=A9crit=C2=
=A0:
> On 28/08/16 18:32, Paul Kocialkowski wrote:
> >=20
> > This switches a few interrupt definitions that were using
> > GPIO_ACTIVE_HIGH as IRQ type, which is invalid.
>=20
> May be you are right, but this does not describe why this is invalid.
> Can you elaborate?

GPIO_ACTIVE_HIGH is simply not the right kind of define to use in the
"interrupts" devicetree property. Values provided there are understood as
IRQ_TYPE_ defines.

Also, a similar commit[0] was pushed to the cros kernel tree.

Cheers,

[0]:=C2=A0https://chromium.googlesource.com/chromiumos/third_party/kernel/+=
/f77288938d571b48c9736ac3703cea370c002434

> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> > ---
> > =C2=A0arch/arm/boot/dts/tegra124-nyan.dtsi | 4 ++--
> > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi
> > b/arch/arm/boot/dts/tegra124-nyan.dtsi
> > index 271505e..30a77ec 100644
> > --- a/arch/arm/boot/dts/tegra124-nyan.dtsi
> > +++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
> > @@ -59,7 +59,7 @@
> > =C2=A0			compatible =3D "maxim,max98090";
> > =C2=A0			reg =3D <0x10>;
> > =C2=A0			interrupt-parent =3D <&gpio>;
> > -			interrupts =3D <TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
> > +			interrupts =3D <TEGRA_GPIO(H, 4)
> > IRQ_TYPE_EDGE_FALLING>;
>=20
> If this in invalid then the DT binding doc for the max98090 should be
> updated as well.
>=20
> >=20
> > =C2=A0		};
> > =C2=A0
> > =C2=A0		temperature-sensor@4c {
> > @@ -325,7 +325,7 @@
> > =C2=A0					reg =3D <0x9>;
> > =C2=A0					interrupt-parent =3D <&gpio>;
> > =C2=A0					interrupts =3D <TEGRA_GPIO(J, 0)
> > -							GPIO_ACTIVE_HIGH>;
> > +							IRQ_TYPE_EDGE_BOTH>
> > ;
> > =C2=A0					ti,ac-detect-gpios =3D <&gpio
> > =C2=A0							TEGRA_GPIO(J, 0)
> > =C2=A0							GPIO_ACTIVE_HIGH>;
> >=20
>=20
> Cheers
> Jon
>=20
--=20
Paul Kocialkowski, developer of low-level free software for embedded device=
s

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-8otpdRp68sDOyBOorK7e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX4XyZAAoJEIT9weqP7pUMm54P/Ay1A8mbFDgrLhrHe0fRjOic
o6zwwbYpvhB3nNad41GLzRQIvZsb8ZJoO72I7lcmckPTrYWOlyGGsBzhnxhZEv2b
80fUCcttpBmWmIZbND8jgkyMoONA32CFeedSkGoR8y6Xdl5dklMrlBJQiB6tWi55
xa6cYOxV75uTVrBcW4mz7J+TuoyiDx+53Y26kBPIV4X1OFGY77vsFNhZIbqDNQpH
hwE2nb5u3UagKgGrqkCNOxOaXvl/ml3h0y0BYjk4vD6ROhGGKpEfbhfDR2qbTSMM
7hYrr8FlTXL7fuwRzyRcVLXLRKHhS1sUVy9SfIUnaXvgHklHjR94ZH7eZPC5qdEH
RjAn+XUFiwTEff49VZSj5yEcwz2EIX6NXgukD3qm02V+M5IFpTRLCVFHkSW/ZN2W
oEltK7gKMYggYeWhk8t4FYEZ4WZd0BavY+gXK5LXCfrM5U29qMMZSK1rNgXZptRx
qroGvyg6B8/zxUVc+lYWqiXVJg93Xl6toUCQjnCgPDwNM54jhsFOWTxyj7jqUBe9
+rjYYAUATHKBsk1EWdaPjkVrunxn/HVwq7IA8/vV0unysef8alLnn3B9NVCwZbWy
z9nS4LDn65N2odRNH46Wf6Uelq76pGMvGF31SUNh6b+daF94DJPCzTxJdcG/Lzwk
3QJ7NNxiFS9LVjsxW6Kr
=+SCZ
-----END PGP SIGNATURE-----

--=-8otpdRp68sDOyBOorK7e--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
