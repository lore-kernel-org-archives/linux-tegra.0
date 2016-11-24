From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpio: Add Tegra186 support
Date: Thu, 24 Nov 2016 15:44:11 +0100
Message-ID: <20161124144411.GA26657@ulmo.ba.sec>
References: <20161122173042.GA3239@ulmo.ba.sec>
 <20161122175539.3897-1-thierry.reding@gmail.com>
 <58368E84.6040104@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <58368E84.6040104-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2016 at 12:23:56PM +0530, Laxman Dewangan wrote:
>=20
> On Tuesday 22 November 2016 11:25 PM, Thierry Reding wrote:
> > +static inline struct tegra_gpio *to_tegra_gpio(struct gpio_chip *chip)
> > +{
> > +	return container_of(chip, struct tegra_gpio, gpio);
> > +}
>=20
> You dont need this as gpiochip_get_data(chip); can provide the required
> driver specific data.

It's common practice to embed the struct gpio_chip within a driver-
specific structure, and it's equally common to use a container_of() to
get at the embedding structure.

> > +static const struct tegra_gpio_port *
> > +tegra186_gpio_get_port(struct tegra_gpio *gpio, unsigned int *pin)
> > +{
> > +	unsigned int start =3D 0, i;
> > +
> > +	for (i =3D 0; i < gpio->soc->num_ports; i++) {
> > +		const struct tegra_gpio_port *port =3D &gpio->soc->ports[i];
> > +
> > +		if (*pin >=3D start && *pin < start + port->pins) {
> > +			*pin -=3D start;
> > +			return port;
> > +		}
> > +
> > +		start +=3D port->pins;
> > +	}
> > +
> Why not get the port from pins and then calculate with fixed offset.
> We will not need the loop if we know the port number.

Because we don't know what the port is until we've determined that the
pin is within the range of the port. This function determines what port
a given pin is in, then returns the relative index of the pin within
that port.

> > +static int tegra186_gpio_direction_output(struct gpio_chip *chip,
> > +					  unsigned int offset, int level)
> > +{
> > +	struct tegra_gpio *gpio =3D to_tegra_gpio(chip);
> > +	void __iomem *base;
> > +	u32 value;
> > +
> > +	/* configure output level first */
> > +	chip->set(chip, offset, level);
> We can directly call the apis instead of function pointer at this point.

That would mean reshuffling the functions or having an unneeded forward
declaration of tegra186_gpio_set().

> > +static struct lock_class_key tegra186_gpio_lock_class;
> We will have two instance of the driver (normal and AON) and so this will=
 be
> shared between them.
> Do we really support multiple instance with same variable?

As the type and name indicate this is to track a specific class of lock.
It's fine to use a single variable with multiple instances. It is in
fact an error to try and make these per-instance.

> > +	gpio->gpio.label =3D "tegra186-gpio";
> Two instance will have same name. Better to say tegra186-gpio and
> tegra186-gpio-aon.

Good point. I suppose we could either add this to struct tegra_gpio_soc
or simply use the device tree node name.

> > +	gpio->gpio.parent =3D &pdev->dev;
> > +
> > +	gpio->gpio.get_direction =3D tegra186_gpio_get_direction;
> > +	gpio->gpio.direction_input =3D tegra186_gpio_direction_input;
> > +	gpio->gpio.direction_output =3D tegra186_gpio_direction_output;
> > +	gpio->gpio.get =3D tegra186_gpio_get,
> > +	gpio->gpio.set =3D tegra186_gpio_set;
> > +	gpio->gpio.to_irq =3D tegra186_gpio_to_irq;
> > +
> > +	gpio->gpio.base =3D -1;
> > +
> > +	for (i =3D 0; i < gpio->soc->num_ports; i++)
> > +		gpio->gpio.ngpio +=3D gpio->soc->ports[i].pins;
> > +
>=20
> Our DT binding does not say this. We assume that we have 8 gpios per port.
> so this will not work at all.

This has nothing to do with the device tree binding. What the device
tree binding defines is the indices to use to obtain a given GPIO within
a given port. What numbering the driver uses internally is completely up
to the driver implementation.

Oh, and the above works just fine.

> > +static const struct tegra_gpio_port tegra186_main_ports[] =3D {
> > +	[TEGRA_MAIN_GPIO_PORT_A]  =3D { 0x2000, 7 },
> Use C99 style initialization which is like
>    .offset =3D
>    .pins =3D

I suppose I could do that.

Thanks,
Thierry

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYNvy3AAoJEN0jrNd/PrOhj/MQAMKNxmqFLB+zi8efn8hGScgH
x6j2nsikJTleHsrFF4fVzgNI6RuH1k+Dp01CeStlLMWtO1dhEpUUI7SebqvTBNLp
RoVISVLW4V2GRczHY9ZLuaYS+bx6RhSr3VjNiL+SZXYoBK5vtBqVHjXOA7xtxPdK
GgKbe+f46ajggRTrhX8bteVgOBoNBzBv71NZ37nEGmtku2Z/5Qw6PHV7rm7SzzsB
C68QG3MKQMiXbmajUFMXNowx2F4VuNs35kIL0F7iP3qbnX+nfO8bqUKCPWHabybX
fI2PwSo5WZepFvxWuu8WADJ91p6QLWncFkmxH/CRmiU/mH/Sxv5SZg7hU+Cx0ELb
fGlPZ195f6/UnZ/6sAx04R93Bf3G+02NlcSGCkZbh/54zO/WiwW+aEg708jwGQGs
g3gpCx3v+yrGTxM9DlErWw7nLL0N54K6QITgV/eg2Vq2IBzrc0dMmcDl2v11LEAy
9XgngzeR2972fkpLVmYGMb+XfXAPQCNp8NjfKwHlj038TnKcQpj1a6P8X4gUGPsg
l4wj0zEF4ARyGjDoOpH7EWosNq983TDH5FOUo2H30SO9RvP3zz4rxXill2aR1vxW
7cNSgNkRnGon/bJtoIbkCHllL9ErKFR5ZryKooYtGD/zWkmuF8Pj5eqt8V1Q1SHn
u68CjEhV1NL1PcEWP2IS
=WIRC
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
