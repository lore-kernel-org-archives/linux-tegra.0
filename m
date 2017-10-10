From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 14/16] gpio: Add support for banked GPIO controllers
Date: Tue, 10 Oct 2017 13:00:50 +0200
Message-ID: <20171010110050.GB24484@ulmo>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <20170928095628.21966-15-thierry.reding@gmail.com>
 <ff3b45ec-2af0-5f34-aae8-bb54e892a64a@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ff3b45ec-2af0-5f34-aae8-bb54e892a64a-l0cyMroinI0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 04:52:21PM -0500, Grygorii Strashko wrote:
>=20
>=20
> On 09/28/2017 04:56 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Some GPIO controllers are subdivided into multiple logical blocks called
> > banks (or ports). This is often caused by the design assigning separate
> > resources, such as register regions or interrupts, to each bank, or some
> > set of banks.
> >=20
> > This commit adds support for describing controllers that have such a
> > banked design and provides common code for dealing with them.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >   drivers/gpio/gpiolib-of.c   | 101 +++++++++++++++++++++++++++++++++++=
++++++
> >   drivers/gpio/gpiolib.c      |  98 +++++++++++++++++++++++++++++++++++=
+++++
> >   include/linux/gpio/driver.h | 108 +++++++++++++++++++++++++++++++++++=
+++++++++
> >   include/linux/of_gpio.h     |  10 ++++
> >   4 files changed, 317 insertions(+)
> >=20
> > diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> > index bfcd20699ec8..9baabe00966d 100644
> > --- a/drivers/gpio/gpiolib-of.c
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -309,6 +309,107 @@ int of_gpio_simple_xlate(struct gpio_chip *gc,
> >   }
> >   EXPORT_SYMBOL(of_gpio_simple_xlate);
> >  =20
> > +/**
> > + * gpio_banked_irq_domain_xlate - decode an IRQ specifier for banked c=
hips
> > + * @domain: IRQ domain
> > + * @np: device tree node
> > + * @spec: IRQ specifier
> > + * @size: number of cells in IRQ specifier
> > + * @hwirq: return location for the hardware IRQ number
> > + * @type: return location for the IRQ type
> > + *
> > + * Translates the IRQ specifier found in device tree into a hardware I=
RQ
> > + * number and an interrupt type.
> > + *
> > + * Returns:
> > + * 0 on success or a negative error code on failure.
> > + */
> > +int gpio_banked_irq_domain_xlate(struct irq_domain *domain,
> > +				 struct device_node *np,
> > +				 const u32 *spec, unsigned int size,
> > +				 unsigned long *hwirq,
> > +				 unsigned int *type)
> > +{
> > +	struct gpio_chip *gc =3D domain->host_data;
> > +	unsigned int bank, line, i, offset =3D 0;
> > +
> > +	if (size < 2)
> > +		return -EINVAL;
> > +
> > +	bank =3D (spec[0] >> gc->of_gpio_bank_mask) & gc->of_gpio_bank_shift;
> > +	line =3D (spec[0] >> gc->of_gpio_line_mask) & gc->of_gpio_line_shift;
> > +
> > +	if (bank >=3D gc->num_banks) {
> > +		dev_err(gc->parent, "invalid bank number: %u\n", bank);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (line >=3D gc->banks[bank]->num_lines) {
> > +		dev_err(gc->parent, "invalid line number: %u\n", line);
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (i =3D 0; i < bank; i++)
> > +		offset +=3D gc->banks[i]->num_lines;
>=20
> Just to clarify, why is above iteration required?

This is used to handle the generic case where not all banks have the
same number of lines. In order to avoid having to separately deal with
non-existing lines, drivers are supposed to register only the exact
number of lines they support.

However, the binding may be written such that the (bank, line) pair is
encoded in one cell. To make that easier to construct and parse, simple
OR'ing is used, perhaps like this:

	index =3D (((bank) << 3) | (line))

However, if not all banks have 8 lines, this leaves blanks in the number
space when working your way back.

So the above iteration maps the sparse number space of the specifier to
the dense number space of per-chip lines.

> > +	*type =3D spec[1] & IRQ_TYPE_SENSE_MASK;
> > +	*hwirq =3D offset + line;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(gpio_banked_irq_domain_xlate);
> > +
> > +/**
> > + * of_gpio_banked_xlate - translate GPIO specifier to a GPIO number an=
d flags
> > + * @gc: GPIO chip
> > + * @gpiospec: GPIO specifier
> > + * @flags: return location for flags parsed from the GPIO specifier
> > + *
> > + * This translation function takes into account multiple banks that ca=
n make
> > + * up a single controller. Each bank can contain one or more pins. A s=
ingle
> > + * cell in the specifier is used to represent a (bank, pin) pair, with=
 each
> > + * encoded in different fields. The &gpio_chip.of_gpio_bank_shift and
> > + * &gpio_chip.of_gpio_bank_mask fields, and &gpio_chip.of_gpio_line_sh=
ift and
> > + * &gpio_chip.of_gpio_line_mask are used to specify the encoding.
> > + *
> > + * Returns:
> > + * The chip-relative index of the pin given by the GPIO specifier.
> > + */
> > +int of_gpio_banked_xlate(struct gpio_chip *gc,
> > +			 const struct of_phandle_args *gpiospec, u32 *flags)
> > +{
> > +	unsigned int offset =3D 0, bank, line, i;
> > +	const u32 *spec =3D gpiospec->args;
> > +
> > +	if (WARN_ON(gc->of_gpio_n_cells < 2))
> > +		return -EINVAL;
> > +
> > +	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
> > +		return -EINVAL;
> > +
> > +	bank =3D (spec[0] >> gc->of_gpio_bank_shift) & gc->of_gpio_bank_mask;
> > +	line =3D (spec[0] >> gc->of_gpio_line_shift) & gc->of_gpio_line_mask;
> > +
> > +	if (bank >=3D gc->num_banks) {
> > +		dev_err(gc->parent, "invalid bank number: %u\n", bank);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (line >=3D gc->banks[bank]->num_lines) {
> > +		dev_err(gc->parent, "invalid line number: %u\n", line);
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (i =3D 0; i < bank; i++)
> > +		offset +=3D gc->banks[i]->num_lines;
> > +
> > +	if (flags)
> > +		*flags =3D spec[1];
> > +
> > +	return offset + line;
> > +}
> > +EXPORT_SYMBOL(of_gpio_banked_xlate);
>=20
> Adding above two functions means adding new GPIO bindings (may be optiona=
l,
> but common).

No. This function is used to parse bindings that use an encoding of
(bank, line) pairs in one cell. Tegra and Tegra186 are two such
examples, though they seem to be the only ones doing this.

>=20
> > +
> >   /**
> >    * of_mm_gpiochip_add_data - Add memory mapped GPIO chip (bank)
> >    * @np:		device node of the GPIO chip
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index c15fb858848a..b3bd19b793d3 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1765,6 +1765,57 @@ static int gpiochip_add_irqchip(struct gpio_chip=
 *gpiochip)
> >   	gpiochip->to_irq =3D gpiochip_to_irq;
> >   	gpiochip->irq.default_type =3D type;
> >  =20
> > +	if (gpiochip->num_banks > 0 && !gpiochip->irq.map) {
> > +		struct gpio_irq_chip *irq =3D &gpiochip->irq;
> > +		unsigned int i, j, offset =3D 0;
> > +
> > +		if (!irq->parents) {
> > +			chip_err(gpiochip, "no parent interrupts defined\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		irq->map =3D devm_kcalloc(gpiochip->parent, gpiochip->ngpio,
> > +					sizeof(*irq->map), GFP_KERNEL);
> > +		if (!irq->map)
> > +			return -ENOMEM;
> > +
> > +		for (i =3D 0; i < gpiochip->num_banks; i++) {
> > +			struct gpio_bank *bank =3D gpiochip->banks[i];
> > +			unsigned int parent =3D bank->parent_irq;
>=20
>=20
>=20
> > +
> > +			for (j =3D 0; j < bank->num_lines; j++) {
> > +				if (parent >=3D irq->num_parents) {
> > +					chip_err(gpiochip,
> > +						 "invalid parent interrupt: %u\n",
> > +						 parent);
> > +					return -EINVAL;
> > +				}
> > +
> > +				irq->map[offset + j] =3D irq->parents[parent];
> > +			}
> > +
> > +			offset +=3D bank->num_lines;
>=20
> Most of gpio drivers, you've listed in [1], have only one parent
> (waste of memory). There should be way not to store it permanently.

I'm sure we can find a way to special-case this for optimization. The
condition above could be extended to include

	gpiochip->irq.num_parents > 1

And a similar special case added to gpiochip_to_irq() to set the single
parent if no map is available.

> > +		}
> > +	}
> > +
> > +	if (gpiochip->num_banks > 0) {
> > +		unsigned int i;
> > +
> > +		for (i =3D 0; i < gpiochip->num_banks; i++) {
> > +			struct gpio_bank *bank =3D gpiochip->banks[i];
> > +			unsigned int num_lines =3D bank->num_lines;
> > +
> > +			bank->pending =3D devm_kcalloc(gpiochip->parent,
> > +						     BITS_TO_LONGS(num_lines),
> > +						     sizeof(unsigned long),
> > +						     GFP_KERNEL);
> > +			if (!bank->pending)
> > +				return -ENOMEM;
> > +
> > +			bank->chip =3D gpiochip;
> > +		}
> > +	}
> > +
> >   	if (gpiochip->irq.domain_ops)
> >   		ops =3D gpiochip->irq.domain_ops;
> >   	else
> > @@ -1973,6 +2024,53 @@ int gpiochip_irqchip_add_key(struct gpio_chip *g=
piochip,
> >   }
> >   EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
> >  =20
> > +/**
> > + * gpio_irq_chip_banked_chained_handler - interrupt handler for banked=
 IRQ chips
> > + * @desc: IRQ descriptor
> > + *
> > + * Drivers can use this interrupt handler for banked GPIO controllers.=
 This
> > + * implementation iterates over all banks and handles pending interrup=
ts of
> > + * the pins associated with the bank.
> > + *
> > + * This function uses driver specific parts, split out into the
> > + * &gpio_chip.update_bank() callback, to retrieves the interrupt pendi=
ng
> > + * state for each of the GPIOs exposed by the given bank.
> > + */
> > +void gpio_irq_chip_banked_chained_handler(struct irq_desc *desc)
> > +{
> > +	struct gpio_chip *gpio =3D irq_desc_get_handler_data(desc);
>=20
> As per Patch 1 - there are no restriction to use parent_handler_data with
> this standard handler - in this case parent_handler_data might not be str=
uct gpio_chip.

Well, that would have to be considered a driver bug. I can add a comment
to the kerneldoc about this if you have any concerns.

> > +	struct irq_chip *irq =3D irq_desc_get_chip(desc);
> > +	unsigned int parent =3D irq_desc_get_irq(desc);
> > +	struct gpio_irq_chip *chip =3D &gpio->irq;
> > +	unsigned int i, offset =3D 0;
> > +
> > +	chained_irq_enter(irq, desc);
> > +
> > +	for (i =3D 0; i < gpio->num_banks; i++) {
> > +		struct gpio_bank *bank =3D gpio->banks[i];
> > +		unsigned int line, virq;
> > +
> > +		if (parent !=3D chip->parents[bank->parent_irq])
> > +			goto skip;
>=20
> You've used this handler in gpio-tegra.c.=20
> So for compatible =3D "nvidia,tegra20-gpio":
> - there are will be 7 parent irqs/banks.
> - gpiochip will be used as chained_handler data.
>=20
> So, how will it work:
> - for bank0 it will take 1 iteration to get correct bank structure
> - but for bank7 - 7 iteration always (in hot path?)

Yes, that's correct. This could potentially be optimized by passing in
the right bank as handler data. I think the above code is fairly simple
and straightforward, and this is quite little overhead, so I'm not sure
it's very useful to optimize at this point.

> > +
> > +		chip->update_bank(bank);
>=20
> Half of gpio drivers, you've listed in [1] required access to common
> Interrupt status registers before proceeding to banks.

I'm sure we can add some additional callback(s) to account for those
cases.

> > +
> > +		for_each_set_bit(line, bank->pending, bank->num_lines) {
> > +			virq =3D irq_find_mapping(chip->domain, offset + line);
> > +			if (WARN_ON(virq =3D=3D 0))
> > +				continue;
>=20
> drivers might require to do additional action before/after generic_handle=
_irq()
> (intel_mid_irq_handler())

That could be done from within ->update_bank(). Or it could be done in
an additional callback if necessary. Alternatively they may just not be
able to use this particular implementation and just provide their own
instead. This isn't meant to be a universal solution for every case, but
rather provide a meaningful helper that can be used when appropriate to
reduce boilerplate.

> > +
> > +			generic_handle_irq(virq);
> > +		}
> > +
> > +skip:
> > +		offset +=3D bank->num_lines;
> > +	}
> > +
> > +	chained_irq_exit(irq, desc);
> > +}
> > +EXPORT_SYMBOL_GPL(gpio_irq_chip_banked_chained_handler);
>=20
> chained IRQ handler is not RT friendly (no control from User space)

I don't understand this comment. What are you suggesting?

Thierry

> > +
> >   #else /* CONFIG_GPIOLIB_IRQCHIP */
> >  =20
> >   static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
> > diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> > index c453e0716228..3caa08b3d2b6 100644
>=20
> [...]
>=20
> >  =20
> >   /**
> >=20
>=20
>=20
>=20
> [1] https://www.spinics.net/lists/linux-tegra/msg31105.html
>=20
> --=20
> regards,
> -grygorii

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlncqF8ACgkQ3SOs138+
s6Hhbg//bcRq+Ui5/CbNmkNmOGL4+UL3RPOZfvtxU9BaT+x+vwGFX/NrNNKeX/Ek
LOAIhIvE1nZbSczINNNBhMozHNjn9ttQQtnvsS/Dd65A+VRXxSFAJ6eJWVAhgPCf
T8HmRgIRbkSonmJjW9+5o68UVvI8EkEqZl6o+ck2gMzDZKDYXSXnCfDiV/w4cScH
+YYNO4xm084FOXF2+P9qrzc9H8b3WVsi/flCxbBwq2gMpr/YChjq0Tbuizh8xqJa
YcMjxVXdfHKYfy5RtkXHyxbdHVtxg0Crscl69A+qV9z76ZMZnHKzFRYsbkVm83jr
QfL3LhTsiU4zzAqnD8ZUsFE47X/SBdarm+omu+h+cvZCVNsQWqdSsbvSQrJLUHBA
v/QDlApTW4AvzUgUI/Mk/YSrPwiZvfQ9kcMjth3eOMthMRPnE+IIpOd0YXPjdfHG
eBbSsMdaj+uLoPG2UFMCA3NFv5XjjhfRkuqsq1hutCUQ2J7aOOwEMhTa7y/N4kuL
fPhag8znJEyyuO6pRmaJ02uyzzXtCjqZ5nI1dlYuS1xT4wYFdDXG9GLHNST5D/YE
6Ems66YkIfuQjnRHzqG2JVOWes5Vbjjo5I9TBOVXeN9EaYFrtVMMcWV1w3ETPMAk
o6yXCARJlv0s7AGnAFbmvuIbYzPIwMKo4TK3WkPeqjCs6IHjelI=
=L3B+
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
