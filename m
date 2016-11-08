From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add driver to configure voltage and
 power of io pads
Date: Tue, 8 Nov 2016 15:42:11 +0100
Message-ID: <20161108144211.GA2244@ulmo.ba.sec>
References: <1478077742-25437-1-git-send-email-ldewangan@nvidia.com>
 <1478077742-25437-3-git-send-email-ldewangan@nvidia.com>
 <CACRpkdb4DQLzQWHxuZi=TDaeigNzVJV8TN1jsQfOHKF7yPLrUg@mail.gmail.com>
 <58201401.8050805@nvidia.com>
 <CACRpkdZo+527t4O9gX0U2VOaAYj7fnt7X0wynByBdYN5=2mDsA@mail.gmail.com>
 <5821A6D3.7010000@nvidia.com>
 <CACRpkdYO9ZCTGVdnyhVZ4DNLsHq+d-1_xuws2be8yab+MsyyVw@mail.gmail.com>
 <5821D49E.2070308@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5821D49E.2070308@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 07:05:26PM +0530, Laxman Dewangan wrote:
>=20
> On Tuesday 08 November 2016 06:59 PM, Linus Walleij wrote:
> > On Tue, Nov 8, 2016 at 11:20 AM, Laxman Dewangan <ldewangan@nvidia.com>=
 wrote:
> > > On Tuesday 08 November 2016 03:45 PM, Linus Walleij wrote:
> > > > If you can *actually* change the volatage, it needs to be modeled
> > > > as a (fixed voltage?) regulator, not as a custom property for the p=
in
> > > > control attributes. I guess you definiately need the regulator fram=
ework
> > > > to accumulate and infer the different consumer requirements anyway
> > > > in that case.
> > > The PMIC voltage output is changed via regulator calls.
> > > Here, we need to have two configruations for given voltage level of
> > > interface:
> > > * One at IO voltage from PMIC via regulator call to change votlage of=
 IO
> > > rail.
> > > * Second, configure the IO pad register to tell the IO voltage level =
so that
> > > it can configured internally for that level.
> > I understand! (I think.)
>=20
> Thanks,
>=20
> >=20
> > But then the two things (A) changing the regulator voltage and (B) chan=
ging
> > the pin setting need to happen at the same time do they
> > not?
> >=20
> > Now you're just hardcoding something into these device tree properties
> > and hoping that the regulators will somehow be set up in accordance to
> > what you set up for the pads in the device tree, correct?
>=20
> There is two types of configuration in given platform, the IO voltage does
> not get change (fixed in given platform) and in some of cases, get change
> dynamically like SDIO3.0 where the voltage switches to 3.3V and 1.8V.
>=20
> Yes, it can be integrated with the regulator handle and then it can call =
the
> required configurations through notifier and regulator_get_voltage().
> But I think it is too much complex for the static configurations. This
> mandate also to populate the regulator handle and all power tree.

It looks as if regulator notifiers should be able to support whatever
use-cases we may have (I suspect that we really only need pre- and post-
voltage-change notifications.

> The simple way for static configuration (case where voltage does not get
> change), just take the power tree IO voltage from DT and configure the IO
> pad control register.

For static configurations where we have a regulator along with a pinmux
setting for the I/O voltage we could potentially run into issues where
both settings don't match. How would we handle that?

> For dynamic case, there is some sequence need to be followed based on
> voltage direction change (towards lower or towards higher) for the voltage
> change and the IO pad voltage configuration and it is simple to do it from
> client driver.

Are patches available for this? It'd be useful to know how this will end
up being used in order to come up with the best solution.

In general I think it's good to send a complete series of patches, even
if it's long and spans multiple subsystems. As it is it's difficult for
anyone else (myself included) to understand where this is headed, which
makes it more complicated than necessary to get at the final solution.

> > To me it seems like the pins/pads should all have an <&phandle> to
> > the regulator controlling its voltage output, in the device tree.
> >=20
> > In the Linux kernel, the driver has to regulator_[bulk_]get() this for
> > each pin, check the voltage with regulator_get_voltage() and set up
> > this according to the supplied voltage.
> >=20
> > The driver then ideally should subscribe to regulator voltage notifier
> > events to change the setting if the voltage changes. I guess. But
> > atleast the first step seems inevitable: get the voltage from a regulat=
or.
> >=20
> > Else there is no dependency between the regulator and its consumer.
> >=20
> > So what your pins need is a regulator phandle, not a magic value to
> > be poked into a register, hoping things will match up.
> >=20
> > I understand that this is a simple quick-and-dirty solution but it is
> > not the right solution.
>=20
>=20
> Yaah, the static power tree configuration is much simple in this approach
> without having regulator drivers and support.
>=20
> Integrating with regulator driver can be done here also.
>=20
> I like to have both approach, through pinmux DT and also from regulator. =
So
> based on the platform, if regulator supported then populate required
> properties in DT for regulator else go on standard pinmux DT way (for
> non-regulator cases).

Again, it would be best to see this in actual use. Right now it's not
clear that we'll even have both cases. Implementing both approaches will
mean potentially unused code.

On another note: in my experience you seldom need both cases, since the
dynamic configuration is the hard one, and the static configuration will
usually be a special case of the dynamic configuration.

Thierry

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIeRBAAoJEN0jrNd/PrOh8d0QAIkb2T1InFCAAQ9Xhgcu8ovC
dlvbpYfUzBnQLzXCTMT0CLScHVk3Tr8gXkWx9GAHi+Kk9gPc2S+xVU6T+01xnaz6
LdiFEZa0zbswMbNN35gD81lMZtRvEz93B2yrI3KLbUC9WUFLXUe9lehI9xWSyzvg
kXRbTnD16PYZFaMueFdoTMYCixeMFk3gl3TLc5n72/CMi3vGBVDoYPZ9wNhNFUws
Jqj1E2p5wHxcTfS84z9NTC/PN7dnxwdI1FM18jF21BiEyz7EIjWzc6bZh6BVgXT8
4wIDgEu3ws/VIS3GgR9NGJFVJshP75YByujOOJja5H9clCnTNAYQYeJHmWC7Nb7K
uHrfJJmUMem8W/feO3jGQAvUrsH3GRJ9vnndevklJMF9b+bceE+1Cd19UuhlSwqJ
S3SvDKUfIfBXcQgOqFZ6p0ghbQ6HGDP0mlfl7ksaRU2QcGNyZA3HUyTPSDgrKhpB
1gJWYCgv2SRyZMXrKm+LLl5TLS4aksZllAhWV35TWpdTOolal2Sy2TFTpbhmENhS
LWPGyaS5YJcVQmylgXhyndkU6/uLKCEjLBSxY2NWYTEnlxwU5aAhsEWi0MOtiRe+
BBIEN7VlyrN+wgN7HRXfzFBJl3eOc/mkYVqRJPEtVwAT+NgDzzIkTZLNjZWCo8P0
dcOc0wD8qfPoxec/mkDf
=dcdG
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
