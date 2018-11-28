From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: tegra186-gpio: Add wakeup parent support
Date: Wed, 28 Nov 2018 11:44:36 +0100
Message-ID: <20181128104436.GA22559@ulmo>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
 <20180921102546.12745-8-thierry.reding@gmail.com>
 <20181015144612.GA23929@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181015144612.GA23929@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 15, 2018 at 09:46:12AM -0500, Rob Herring wrote:
> On Fri, Sep 21, 2018 at 12:25:44PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Tegra186 and later have some top-level controls for wake events in the
> > power management controller (PMC). In order to enable the system to wake
> > up from low power states, additional registers in the PMC need to be
> > programmed. Add a wakeup-parent property to establish this relationship
> > between the GPIO controller and the PMC.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../devicetree/bindings/gpio/nvidia,tegra186-gpio.txt      | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpi=
o.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> > index adff16c71d21..cbb51a8990c3 100644
> > --- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> > +++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> > @@ -127,6 +127,11 @@ Required properties:
> >              - 8: Active low level-sensitive.
> >              Valid combinations are 1, 2, 3, 4, 8.
> > =20
> > +Optional properties:
> > +- wake-parent
> > +    A phandle to the Power Management Controller (PMC) that contains t=
op-
> > +    level controls to enable the wake-up capabilities of some GPIOs.
> > +
> >  Example:
> > =20
> >  #include <dt-bindings/interrupt-controller/irq.h>
> > @@ -148,6 +153,7 @@ gpio@2200000 {
> >  	#gpio-cells =3D <2>;
> >  	interrupt-controller;
> >  	#interrupt-cells =3D <2>;
> > +	wakeup-parent =3D <&pmc>;
> >  };
> > =20
> >  gpio@c2f0000 {
> > @@ -162,4 +168,5 @@ gpio@c2f0000 {
> >  	#gpio-cells =3D <2>;
> >  	interrupt-controller;
> >  	#interrupt-cells =3D <2>;
> > +	wakeup-parent =3D <&pmc>;
>=20
> If all the GPIO instances point to the same PMC and have no per instance=
=20
> data, why do you need this in DT? You can just search for the compatible=
=20
> node.

That would be slightly annoying to do. I mean, we'd have to somehow
construct the compatible string that we're looking for. I guess we could
get around this mostly by just looking for a device matching one of the
entries in a "pmc_gpio_of_match" table. That would potentially match a
Tegra194 GPIO against a Tegra186 PMC, but that should never happen in
practice because it'd be a bug in the DT.

Although that somewhat depends on exactly what we mean by "compatible".
Technically the Tegra194 PMC is compatible with the Tegra186 PMC in
terms of register layout and so on. However, since both chips have
undergone quite some changes with regards to the pins they expose, the
set of wake events exposed on Tegra186 and Tegra194 varies wildly. So if
that means that the compatible needs to be different (I think it should)
then we could go with the OF match table approach.

Actually, thinking about it some more, even if we had a Tegra186
fallback compatible string in the Tegra194 PMC's device tree node, we'd
still be matching on the correct instance, and therefore get the right
IRQ domain for the hierarchy.

I'll rework the patches accordingly.

Thierry

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv+cZIACgkQ3SOs138+
s6EyIA/+LkKrq620emgEtZpd9U8q5GjkFRVNO7ncdVE1d3P1znsFtICWHyX0Iux5
r3V0vB7/R4HoH0bPDZzJdbFH/BrsWRf9H2E+S7LbFNsBDuN07vjHQlDGexR82c5q
h0D+QQ9JYzJkqciahQlqIvJ/AulAbXfozP/3jxlq0FtSSnc3apn8YDyRV1kWCDnc
IOgW59NqqBBoXCz1cBXIk+U22NvbtxLVL/qR+TjQJIsHZKWh7Kqv6oAZM53xW7XJ
sLt3Hvvot+6pwfOMQAhViix/MZgIM/Yq8gmy7ZmPW4JpIOtHvtqoIekrdpw2M+8q
gjsv1yU/4zrgtlRq4FqEqJjFAPNo6lnFt3uas1be1PrzDVQU1BYe6DPtqJhileFa
gi2kBD+MfPPGaz58IXnpCFHZ+ynoj/lzqlU85txkXC7C4iTHtn7NKhGA3g7+7Pok
FQNlhm1VKjzyac7qFu3MLtXy7Yit+k9AFqmYh7PtH9OfX5C046lnawKiEahzAd5c
AQrxCT7/Q+dRVWXTRhZ4YQyBeYRLM/cayFgUrRs3lB0zNf4Kdv+dW7WcW2P64+i1
T9dfM5cq/Su66zqOWp1KT/wqOG5aUk4OovC6CsYv7wtMAGtiWBozzizYDBSji6dl
XwEX54BBof0kWZAhShV0lSB469yw3m3ebkluFoVGy0fNVyN+muw=
=U3yi
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
