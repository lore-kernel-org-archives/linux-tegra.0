From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 12/12] gpio: Add Tegra186 support
Date: Thu, 13 Apr 2017 17:19:44 +0200
Message-ID: <20170413151944.GA27388@ulmo.ba.sec>
References: <20170403160532.20282-1-thierry.reding@gmail.com>
 <20170403160532.20282-13-thierry.reding@gmail.com>
 <CACRpkdaQacEqqW9Vdn7mtnZMH_VvL1B-35VFV=PcORwgtLz2eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaQacEqqW9Vdn7mtnZMH_VvL1B-35VFV=PcORwgtLz2eg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 02:38:44PM +0200, Linus Walleij wrote:
> On Mon, Apr 3, 2017 at 6:05 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>=20
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Tegra186 has two GPIO controllers that are largely register compatible
> > between one another but are completely different from the controller
> > found on earlier generations.
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v3:
> > - make use of GPIOLIB_IRQCHIP for IRQ chip handling
>=20
> So this is the interesting patch where you make use of the new
> tightly integrated IRQchip.
>=20
> > +struct tegra_gpio {
> > +       struct gpio_chip gpio;
> > +       struct irq_chip intc;
> > +       unsigned int num_irq;
> > +       unsigned int *irq;
>=20
> So I find it a bit strange that the array of irq parents is still kept ar=
ound
> when you add so much infrastructure. Could this not just go into the core
> so that is natively able to handle multiple parents cleanly?

I did this on purpose because I'd like to avoid making this new
infrastructure into too much of a midlayer. The mechanism to parse
interrupts may depend on the driver. Perhaps a good middle ground
would be to provide generic helpers that will parse this, while
keeping the possibility to let the driver specify the list?

> > +static int tegra186_gpio_of_xlate(struct gpio_chip *chip,
> > +                                 const struct of_phandle_args *spec,
> > +                                 u32 *flags)
> > +{
> > +       struct tegra_gpio *gpio =3D gpiochip_get_data(chip);
> > +       unsigned int port, pin, i, offset =3D 0;
> > +
> > +       if (WARN_ON(chip->of_gpio_n_cells < 2))
> > +               return -EINVAL;
> > +
> > +       if (WARN_ON(spec->args_count < chip->of_gpio_n_cells))
> > +               return -EINVAL;
> > +
> > +       port =3D spec->args[0] / 8;
> > +       pin =3D spec->args[0] % 8;
>=20
> Actually modular ports/banks is something we will also see again and
> have seen before. Maybe this should be a new core xlate function
> just taking some MOD argument.

This xlate function uses driver-specific data to compute the hwirq
number of the specified GPIO. That's not something I think we can easily
turn into a generic helper, not without adding a lot more infrastructure
than we already have. One of the problems that I see with adding too
much infrastructure is that the core will become completely unwieldy
because it has to take care of too many special cases.

> > +static void tegra186_gpio_irq(struct irq_desc *desc)
> > +{
> > +       struct tegra_gpio *gpio =3D irq_desc_get_handler_data(desc);
> > +       struct irq_domain *domain =3D gpio->gpio.irq.domain;
> > +       struct irq_chip *chip =3D irq_desc_get_chip(desc);
> > +       unsigned int parent =3D irq_desc_get_irq(desc);
> > +       unsigned int i, offset =3D 0;
> > +
> > +       chained_irq_enter(chip, desc);
> > +
> > +       for (i =3D 0; i < gpio->soc->num_ports; i++) {
> > +               const struct tegra_gpio_port *port =3D &gpio->soc->port=
s[i];
> > +               void __iomem *base =3D gpio->base + port->offset;
> > +               unsigned int pin, irq;
> > +               unsigned long value;
> > +
> > +               /* skip ports that are not associated with this control=
ler */
> > +               if (parent !=3D gpio->irq[port->irq])
> > +                       goto skip;
>=20
> This parent-to-irq lookup I think the core should handle.

Again, this is based heavily on data that is highly Tegra-specific. If
we wanted to support something like this in the core, we'd have to add
some generic version of struct tegra_gpio_port, which has the
disadvantage of making it more difficult to support for drivers that
have only a single parent interrupt.

> > +static int tegra186_gpio_irq_domain_xlate(struct irq_domain *domain,
> > +                                         struct device_node *np,
> > +                                         const u32 *spec, unsigned int=
 size,
> > +                                         unsigned long *hwirq,
> > +                                         unsigned int *type)
> > +{
> > +       struct tegra_gpio *gpio =3D gpiochip_get_data(domain->host_data=
);
> > +       unsigned int port, pin, i, offset =3D 0;
> > +
> > +       if (size < 2)
> > +               return -EINVAL;
> > +
> > +       port =3D spec[0] / 8;
> > +       pin =3D spec[0] % 8;
>=20
> Here is this MOD business again. This is clearly a pattern.

The same as above applies. Yes, we could support this in the core but at
the expense of making it difficult to write simple drivers.

> > +       err =3D of_irq_count(pdev->dev.of_node);
> > +       if (err < 0)
> > +               return err;
> > +
> > +       gpio->num_irq =3D err;
>=20
> This variable (err) has a confusing name. This is clearly not an error
> at this point. Can you rename it to "ret" or something?

Yeah, why not.

> > +       gpio->irq =3D devm_kcalloc(&pdev->dev, gpio->num_irq, sizeof(*g=
pio->irq),
> > +                                GFP_KERNEL);
> > +       if (!gpio->irq)
> > +               return -ENOMEM;
> > +
> > +       for (i =3D 0; i < gpio->num_irq; i++) {
> > +               err =3D platform_get_irq(pdev, i);
> > +               if (err < 0)
> > +                       return err;
> > +
> > +               gpio->irq[i] =3D err;
> > +       }
>=20
> So this array of parent IRQs I think should be stored in the core
> gpio irqchip, not here locally in the driver.

Well, it's already stored in the struct gpio_irq_chip, but it is the
driver that allocates it, because the mechanism to construct it is
driver-specific, hence I prefer it to be in the driver to make it
explicit that it is the driver that owns it. That way the array of
interrupts stored in struct gpio_irq_chip can be defined as merely a
reference, so it is very clear that the core shouldn't touch it. In
fact I had thought about making it even more explicit by making the
struct gpio_irq_chip carry a const unsigned int * for these.

If we only store it in the core, it becomes ambiguous who owns it.
Should the core be responsible for freeing it? How does the core decide
that it is responsible for managing it?

> > +       for (i =3D 0, offset =3D 0; i < gpio->soc->num_ports; i++) {
> > +               const struct tegra_gpio_port *port =3D &gpio->soc->port=
s[i];
> > +               char *name;
> > +
> > +               for (j =3D 0; j < port->pins; j++) {
> > +                       name =3D devm_kasprintf(gpio->gpio.parent, GFP_=
KERNEL,
> > +                                             "P%s.%02x", port->name, j=
);
> > +                       if (!name)
> > +                               return -ENOMEM;
> > +
> > +                       names[offset + j] =3D name;
> > +               }
> > +
> > +               offset +=3D port->pins;
> > +       }
>=20
> Interesting way of using the names array. This will override any names
> from the device tree I think, don't you want to use gpio-line-names =3D "=
"..
> in the device tree instead?

I don't think this overrides any names provided in DT. The names are
picked up from this arry in gpiochip_set_desc_names(), which is called
before of_gpiochip_add() where the names are read from DT. So this will
effectively make the driver set default names for the pins, but allow
these names to be overridden by DT.

Putting these names into DT feels wrong because they can easily be
generated from the port and pin numbers.

> > +       irq =3D &gpio->gpio.irq;
> > +       irq->chip =3D &gpio->intc;
> > +       irq->first =3D 0;
> > +       irq->domain_ops =3D &tegra186_gpio_irq_domain_ops;
> > +       irq->handler =3D handle_simple_irq;
> > +       irq->lock_key =3D &tegra186_gpio_lock_class;
> > +       irq->default_type =3D IRQ_TYPE_NONE;
> > +       irq->parent_handler =3D tegra186_gpio_irq;
> > +       irq->parent_handler_data =3D gpio;
> > +       irq->num_parents =3D gpio->num_irq;
> > +       irq->parents =3D gpio->irq;
> > +
> > +       irq->map =3D devm_kcalloc(&pdev->dev, gpio->gpio.ngpio,
> > +                               sizeof(*irq->map), GFP_KERNEL);
> > +       if (!irq->map)
> > +               return -ENOMEM;
> > +
> > +       for (i =3D 0, offset =3D 0; i < gpio->soc->num_ports; i++) {
> > +               const struct tegra_gpio_port *port =3D &gpio->soc->port=
s[i];
> > +
> > +               for (j =3D 0; j < port->pins; j++)
> > +                       irq->map[offset + j] =3D irq->parents[port->irq=
];
> > +
> > +               offset +=3D port->pins;
> > +       }
>=20
> So this is the core API use. But setting up the map in the driver, that
> seems too much to implement over and over again for all drivers
> don't you think? Also to have local irqdomain operations. All that
> should be in the core and be reusable IMO.

Like I said above, the mapping is highly specific to Tegra. The only way
to move this into the core is to provide even more infrastructure. I'm
not sure that would be wise at this point. Maybe that can be added at a
later point when we have more samples.

Similarly I think having the driver specify IRQ domain operations is
useful because it increases the flexibility to do what drivers need,
rather than restricting the drivers to what the midlayer defines. If we
wrap all of this into the core, we're likely going to face situations
where we either have to rework or add quirks to the core because some
drivers need some extra flexibility.

The above tries to implement the infrastructure as a library of helpers
which has the advantage that for the common cases the core can provide
helpers, but drivers can also substitute their own if they need to.

> I would imagine that the core keeps track of the parent IRQs and
> will make sure to free up all maps of all IRQs when the GPIOchip
> is removed.
>=20
> Maybe I'm missing something about this, I was simply expecting
> a full multi-parent handling and tracking in the core, moving the
> drivers that now loose track of their parents over to that as well.

There are two pieces to this: this series prepares the infrastructure to
deal with multiple parent interrupts better and uses that infrastructure
in the new Tegra driver. But it also keeps the driver-specific bits in
the driver. Certainly there's a possibility to refactor some of that
later on, but I think it's premature to do that right away. We'd need to
convert a slew of other drivers first to see if the same pattern appears
or if these are chip-specific after all.

Thierry

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljvlw0ACgkQ3SOs138+
s6H1yQ/+Pxc1JoKHLndq0N+o50esNH02ChnsWnQpN5CZxVFUG3ZI5tMV7dQ85qcE
d8P2jF9Y3eOIP3t9uWwtYKyIgI1tOmzLi1kwcQsM3vEpKhChAtixS4aVqsfscqcV
rRYog7gIn9ODd/tK8dOQmVlGWTAtBAFBgI+w+MriKmblL0jESro5MEWlUUE4XlQp
ycz0QAqCLYijxdHaQQFLNAKPfLxov3Zs6EKMdwOo2pHp8X2azJoOaTv1mUYRZ8dB
STFncGgnUwHqxVxMNj73Jn/gkCThhrWxtQx5FmWrqvTyc53UQUDYNFebidnngkgL
S/rDUBpgiZd1TrKyWC/Yew8a1e11iXiyysGUzD++rw4/XDGKbYrsZ2NRpZsXgcBA
VmjEuoLG2q7H1VqOjbTKNAF3HQFWdU6HQSii4/L4FmD/5iwIiG6M3xKh31Id2Yr2
epZIlQRQ+aw9UvTxUP+XEH4lKkU5fqeilCtlxGg+4/tIZDx0YMSsMqPNGX4+qI0V
V8VFMAlkVZCo5//sArzapz5QNr1BP5d4Pa6CZyCcFMco4e6V33Gps39XQLLfHrex
IoFW+uIA9rbRNCoMw9x9XECx8CvaLew0Fsne8Eqyxe1lq7Fy4/gnh/OmwKSagpXa
r+zROzSOKv7kOAbT+q2QtAqPvcECvyzTVL3+ScqM9e5vVSjxmbs=
=LMku
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
