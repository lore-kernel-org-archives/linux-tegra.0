From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 00/12] gpio: Tight IRQ chip integration
Date: Mon, 6 Nov 2017 12:18:07 +0100
Message-ID: <20171106111807.GA6756@ulmo>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
 <ca8c7138-2e87-0481-ac8c-7077bed749f6@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ca8c7138-2e87-0481-ac8c-7077bed749f6-l0cyMroinI0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 03, 2017 at 05:30:30PM -0500, Grygorii Strashko wrote:
> Hi=20
>=20
> On 11/02/2017 12:49 PM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Hi Linus,
> >=20
> > here's the latest series of patches that implement the tighter IRQ chip
> > integration. I've dropped the banked infrastructure for now as per the
> > discussion with Grygorii.
> >=20
> > The first couple of patches are mostly preparatory work in order to
> > consolidate all IRQ chip related fields in a new structure and create
> > the base functionality for adding IRQ chips.
> >=20
> > After that, I've added the Tegra186 GPIO support patch that makes use of
> > the new tight integration.
> >=20
> > Changes in v6:
> > - rebased on latest linux-gpio devel branch
> > - one patch dropped due to rebase
> >=20
> > Changes in v5:
> > - dropped the banked infrastructure patches for now (Grygorii)
> > - allocate interrupts on demand, rather than upfront (Grygorii)
> > - split up the first patch further as requested by Grygorii
> >=20
> > Not sure what happened in between here. Notes in commit logs indicate
> > that this is actually version 5, but I can't find the cover letter for
> > v3 and v4.
> >=20
> > Changes in v2:
> > - rename pins to lines for consistent terminology
> > - rename gpio_irq_chip_banked_handler() to
> >    gpio_irq_chip_banked_chained_handler()
> >=20
>=20
> Sry, for delayed reply, very sorry.
>=20
> Patches 1 - 9, 11 : looks good, so
> Acked-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
>=20
> Patch 10 - unfortunately not all my comment were incorporated [1],=20
> so below diff on top of patch 10
> which illustrates what i want and also converts gpio-omap to use new infr=
a as
> test for this new infra.
>=20
> Pls, take a look
>=20
> [1] https://www.spinics.net/lists/linux-tegra/msg31145.html

Most of the changes I had deemed to be material for follow-up patches
since they aren't immediately relevant to the gpio_irq_chip conversion
nor needed by the Tegra186 patch.

However, a couple of the hunks below seem like they should be part of
the initial series.

> -----------><-------------
> From 210fe3ad7a642691a1b7603e441f6980b10ff2b4 Mon Sep 17 00:00:00 2001
> From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> Date: Fri, 3 Nov 2017 17:24:51 -0500
> Subject: [PATCH] [not for merge] gpiolib: update and test new gpioirq chip
>  infra
>=20
> changes in gpiolib:
>  - move set_parent to gpiochip_irq_map() and use parents instead of map f=
or only
>    one parent
>  - add gpio_irq_chip->first_irq for static IRQ allocation
>  - fix nested =3D true if parent_handler not set
>  - fix gpiochip_irqchip_remove() if parent_handler not set
>  - get of_node from gpiodev
>  - fix lock_key: drivers do not need to set it, but looks a bit overcompl=
icated
>    as lock_class_key will be created for each gpiochip_add_data() call.
>    Honestly, do not seem better way :(
>=20
> GPIO OMAP driver updated to use new gpioirq chip infra and tested on am33=
5x-evm.
> seems it's working - can see irqs from keys.
>=20
> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/gpio/gpio-omap.c    | 36 ++++++++++++++--------------
>  drivers/gpio/gpiolib.c      | 58 +++++++++++++++++++--------------------=
------
>  include/linux/gpio/driver.h | 32 ++++++++++++++++++++++++-
>  3 files changed, 73 insertions(+), 53 deletions(-)
[...]
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
[...]
> @@ -1642,6 +1644,7 @@ static int gpiochip_irq_map(struct irq_domain *d, u=
nsigned int irq,
>  			    irq_hw_number_t hwirq)
>  {
>  	struct gpio_chip *chip =3D d->host_data;
> +	int err =3D 0;
> =20
>  	if (!gpiochip_irqchip_irq_valid(chip, hwirq))
>  		return -ENXIO;
> @@ -1658,6 +1661,12 @@ static int gpiochip_irq_map(struct irq_domain *d, =
unsigned int irq,
>  		irq_set_nested_thread(irq, 1);
>  	irq_set_noprobe(irq);
> =20
> +	if (chip->irq.num_parents =3D=3D 1)
> +		err =3D irq_set_parent(irq, chip->irq.parents[0]);
> +	else if (chip->irq.map)
> +		err =3D irq_set_parent(irq, chip->irq.map[hwirq]);
> +	if (err < 0)
> +		return err;

Yeah, this looks sensible. Both in that this is a slightly better place
to call it and that the handling for num_parents =3D=3D 1 is necessary, too.

>  	/*
>  	 * No set-up of the hardware will happen if IRQ_TYPE_NONE
>  	 * is passed as default type.
> @@ -1712,30 +1721,18 @@ static void gpiochip_irq_relres(struct irq_data *=
d)
> =20
>  static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
> -	unsigned int irq;
> -	int err;
> -
>  	if (!gpiochip_irqchip_irq_valid(chip, offset))
>  		return -ENXIO;
> =20
> -	irq =3D irq_create_mapping(chip->irq.domain, offset);
> -	if (!irq)
> -		return 0;
> -
> -	if (chip->irq.map) {
> -		err =3D irq_set_parent(irq, chip->irq.map[offset]);
> -		if (err < 0)
> -			return err;
> -	}
> -
> -	return irq;
> +	return irq_create_mapping(chip->irq.domain, offset);
>  }
> =20
>  /**
>   * gpiochip_add_irqchip() - adds an IRQ chip to a GPIO chip
>   * @gpiochip: the GPIO chip to add the IRQ chip to
>   */
> -static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
> +static int gpiochip_add_irqchip_key(struct gpio_chip *gpiochip,
> +				    struct lock_class_key *lock_key)
>  {
>  	struct irq_chip *irqchip =3D gpiochip->irq.chip;
>  	const struct irq_domain_ops *ops;
> @@ -1753,17 +1750,8 @@ static int gpiochip_add_irqchip(struct gpio_chip *=
gpiochip)
>  	}
> =20
>  	type =3D gpiochip->irq.default_type;
> -	np =3D gpiochip->parent->of_node;
> -
> -#ifdef CONFIG_OF_GPIO
> -	/*
> -	 * If the gpiochip has an assigned OF node this takes precedence
> -	 * FIXME: get rid of this and use gpiochip->parent->of_node
> -	 * everywhere
> -	 */
> -	if (gpiochip->of_node)
> -		np =3D gpiochip->of_node;
> -#endif
> +	/* called from gpiochip_add_data() and is set properly */
> +	np =3D gpiochip->gpiodev->dev.of_node;

Indeed, looks like we have this twice now.

> =20
>  	/*
>  	 * Specifying a default trigger is a terrible idea if DT or ACPI is
> @@ -1789,7 +1777,8 @@ static int gpiochip_add_irqchip(struct gpio_chip *g=
piochip)
>  		ops =3D &gpiochip_domain_ops;
> =20
>  	gpiochip->irq.domain =3D irq_domain_add_simple(np, gpiochip->ngpio,
> -						     0, ops, gpiochip);
> +						     gpiochip->irq.first_irq,
> +						     ops, gpiochip);
>  	if (!gpiochip->irq.domain)
>  		return -EINVAL;

This seems backward. You just spent a lot of time getting rid of all
users of first_irq (it's actually the reason why I dropped one of the
patches from the series, since first_irq is no longer used), so why
reintroduce it?

> =20
> @@ -1818,9 +1807,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *g=
piochip)
>  		}
> =20
>  		gpiochip->irq.nested =3D false;
> -	} else {
> -		gpiochip->irq.nested =3D true;
>  	}
> +	/* GPIO driver might not specify parent_handler, but it doesn't mean
> +	 * it's irq_nested, as driver may use request_irq() */

That's certainly how irq_nested is used in gpiolib, though. Interrupts
are considered either cascaded or nested. Maybe this needs clarification
in general?

> =20
>  	acpi_gpiochip_request_interrupts(gpiochip);
> =20
> @@ -1839,7 +1828,7 @@ static void gpiochip_irqchip_remove(struct gpio_chi=
p *gpiochip)
> =20
>  	acpi_gpiochip_free_interrupts(gpiochip);
> =20
> -	if (gpiochip->irq.chip) {
> +	if (gpiochip->irq.chip && gpiochip->irq.parent_handler) {
>  		struct gpio_irq_chip *irq =3D &gpiochip->irq;
>  		unsigned int i;
> =20

Yeah, this seems like a good idea, though I think this is safe
regardless of irq.parent_handler.

> @@ -1972,7 +1961,8 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
> =20
>  #else /* CONFIG_GPIOLIB_IRQCHIP */
> =20
> -static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
> +static inline int gpiochip_add_irqchip_key(struct gpio_chip *gpiochip,
> +					   struct lock_class_key *lock_key)
>  {
>  	return 0;
>  }
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 51fc7b0..3254996 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -128,6 +128,15 @@ struct gpio_irq_chip {
>  	 * in IRQ domain of the chip.
>  	 */
>  	unsigned long *valid_mask;
> +
> +	/**
> +	 * @first_irq:
> +	 *
> +	 * Required for static irq allocation.
> +	 * if set irq_domain_add_simple() will allocate and map all IRQs
> +	 * during initialization.
> +	 */
> +	unsigned int first_irq;

Again, what was the point of removing all users of this if we need to
add it again?

It seems to me like dynamic allocation should be a prerequisite for
drivers to use this new code, otherwise we'll just end up adding special
cases to this otherwise generic code.

>  };
> =20
>  static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *ch=
ip)
> @@ -312,8 +321,29 @@ struct gpio_chip {
>  extern const char *gpiochip_is_requested(struct gpio_chip *chip,
>  			unsigned offset);
> =20
> +extern int gpiochip_add_data_key(struct gpio_chip *chip, void *data,
> +				 struct lock_class_key *irq_lock_key);
> +#ifdef CONFIG_LOCKDEP
> +/*
> + * Lockdep requires that each irqchip instance be created with a
> + * unique key so as to avoid unnecessary warnings. This upfront
> + * boilerplate static inlines provides such a key for each
> + * unique instance which is created now from inside gpiochip_add_data_ke=
y().
> + */
> +static inline int gpiochip_add_data(struct gpio_chip *chip, void *data)
> +{
> +	static struct lock_class_key key;
> +
> +	return gpiochip_add_data_key(chip, data, key);
> +}

This looks like a neat improvement, but I think it can be done in a
follow-up to remove the boilerplate in drivers.

Thierry

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloAROsACgkQ3SOs138+
s6GYuA//YBQGs4cyYcX6CCoiBLdznosG1qf96YC76fistKTpLIbR9rJN+Wxj5gc+
2Oueio2XkOWGP+rZTPkgbqejx0BW3TzjOeMYPUtsRdYfGZFhW6xmGcyAom5HuiP5
wIqn8iMUepDluob1doS9k0RTDtsU06GBBeLKlDs0RH3ZorFgkd96UTjSHeIYvp+d
pRHzacFQixscy6UnfljwyvpA2gdgfuwRt4uaz+9nW0IMsaOMiDid7bOY3dxdRq3R
RcHNFxkf5DVST028sa56Ivl4nugXyoJCbFejYStlq5CCWchfrgJDrTO9NAelFZJU
J/hlWnoyWeMr0d9nDiINnAaw2hxENWrkgDOxb3q+E5vto/vpuZoDGRP/JwX+40Al
NeRCIJscOX8rJ1We0RbqWy0YbPuHtUENC5WbO89HpAoyTLiMASJhE5ivZgECpJ9v
ZbBlMqTWgKJuTGe7lJ/ODxVoZHzHw57Xz60zsvld4Lg8McpdlJghiZrzIAQ+kb9A
1dEpjbyNbqS9Ox3zfJLVFqCj96lIJ8wzWmdUcJXqFpSFzW2mTgM3qHhOhp+Bh9m9
qHZuUC64L6JIvyRke5WEx6ruVQ+no/ubFl5F0ZJeu/64SZk2BZnyrrXpdcDcyazR
TCI/22xbmstF5OtTQmKf54TXwqkLdL9jxTIay7PIC2JfKC22TRo=
=b/JZ
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
