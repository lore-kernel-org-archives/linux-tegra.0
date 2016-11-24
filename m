From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpio: Add Tegra186 support
Date: Thu, 24 Nov 2016 16:08:41 +0100
Message-ID: <20161124150841.GC26657@ulmo.ba.sec>
References: <20161122173042.GA3239@ulmo.ba.sec>
 <20161122175539.3897-1-thierry.reding@gmail.com>
 <58368E84.6040104@nvidia.com>
 <20161124144411.GA26657@ulmo.ba.sec>
 <5836FCCF.1030109@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5836FCCF.1030109@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Suresh Mangipudi <smangipudi@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2016 at 08:14:31PM +0530, Laxman Dewangan wrote:
>=20
> On Thursday 24 November 2016 08:14 PM, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Thu, Nov 24, 2016 at 12:23:56PM +0530, Laxman Dewangan wrote:
> > > On Tuesday 22 November 2016 11:25 PM, Thierry Reding wrote:
> > > > +static inline struct tegra_gpio *to_tegra_gpio(struct gpio_chip *c=
hip)
> > > > +{
> > > > +	return container_of(chip, struct tegra_gpio, gpio);
> > > > +}
> > > You dont need this as gpiochip_get_data(chip); can provide the requir=
ed
> > > driver specific data.
> > It's common practice to embed the struct gpio_chip within a driver-
> > specific structure, and it's equally common to use a container_of() to
> > get at the embedding structure.
>=20
> I am saying that you dont need this new APIs, GPIO framework already supp=
ort
> this via the call gpiochip_get_data(chip); which you provided when adding
> gpiochip().

Okay, it looks like this is the standard way to do this within the GPIO
subsystem. I can switch to that.

> > > > +	gpio->gpio.parent =3D &pdev->dev;
> > > > +
> > > > +	gpio->gpio.get_direction =3D tegra186_gpio_get_direction;
> > > > +	gpio->gpio.direction_input =3D tegra186_gpio_direction_input;
> > > > +	gpio->gpio.direction_output =3D tegra186_gpio_direction_output;
> > > > +	gpio->gpio.get =3D tegra186_gpio_get,
> > > > +	gpio->gpio.set =3D tegra186_gpio_set;
> > > > +	gpio->gpio.to_irq =3D tegra186_gpio_to_irq;
> > > > +
> > > > +	gpio->gpio.base =3D -1;
> > > > +
> > > > +	for (i =3D 0; i < gpio->soc->num_ports; i++)
> > > > +		gpio->gpio.ngpio +=3D gpio->soc->ports[i].pins;
> > > > +
> > > Our DT binding does not say this. We assume that we have 8 gpios per =
port.
> > > so this will not work at all.
> > This has nothing to do with the device tree binding. What the device
> > tree binding defines is the indices to use to obtain a given GPIO within
> > a given port. What numbering the driver uses internally is completely up
> > to the driver implementation.
> >=20
> > Oh, and the above works just fine.
>=20
>=20
> Nop, it will not work. The reason is:
> include/dt-binding/gpio/tegra186-gpio.h
>=20
>=20
> #define TEGRA_MAIN_GPIO(port, offset) \
>         ((TEGRA_MAIN_GPIO_PORT_##port * 8) + offset)
>=20
>=20
> so in your DTS file, if you use this macro for the gpio number then you w=
ill
> have pin per port as 8.
> And so your total GPIO is 23 *8 (Port CC) but in source code ngpio is very
> less.

Yes, within the source code, ngpio will be the exact number of pins that
the GPIO controller physically exposes. But that still works fine, feel
free to test the driver if you don't believe me. The translation from
one numberspace to the other is done in tegra186_gpio_of_xlate().

Thierry

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYNwJ5AAoJEN0jrNd/PrOhxOoP/jyZw5khvTMUKpiUwwp68X6I
2nEXSq9DbMMZ4yfAK1lhgcGvyxsOidlNFeH0nNMw3ozCi++gaLNTaB2q3fgLvpm2
hd7Wt/Juc693E3Gzj13dNyOCL1kxxW0G6spwcOSV1Vtc/CitslHA0/IITyp04ohY
VFaC4fqpxVi0tSpYuiqnsL4TSBVHoObJUfrpG35+Wnd8FEdjAahcGvaib5hdhNIH
K1g9UY7+v31Z5lxueU0ciS1CxLBT38SnrMetrK1fPJefubi1fhCc1XLsyFYmXUmr
aoVC/OmqiIZsGRFQWnO+W74Ig/TvrSv17Bf5lQyq6EhkxxztPkhNH5ZfekM8bgaE
7QtG4xHulWUBOpcfYvvqM55dI0g/PQQKqmkF2QzoZUo609nsmaEvpRcbNBsgeT27
RW6VniVzE+pAc+ZC14tQIIil2WBK/I29n98aTkUReEQUVt4zugpCWEg6BE7735Yo
pttUpgXoOXQC7D7nhIp7mUC1BwwpkeZqJl8luhHo/82HKU/XLwosdyopewyYcybi
rBasJtPJEr770xQyFRmfOzmLGJkzrWyfyXFChWkl8YgKOW2aY3QYxhaJa4Djlym/
vS4S8k8OKG60uo4TlIbsPvalFXAOBUYKAbEeLTjIfNPmiJxtMxMjlzSqbSFIhsMw
QdBBaWrUCwomm9FZ2ypU
=+cyD
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
