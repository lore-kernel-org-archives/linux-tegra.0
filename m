From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] gpio: Add Tegra186 support
Date: Fri, 31 Mar 2017 16:54:37 +0200
Message-ID: <20170331145437.GA16964@ulmo.ba.sec>
References: <20170310162629.31455-1-thierry.reding@gmail.com>
 <CACRpkdZpev7op=4e7DwYfnRpNBPN6U_EXd6G3PqM-XQudLHqow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZpev7op=4e7DwYfnRpNBPN6U_EXd6G3PqM-XQudLHqow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2017 at 03:59:40PM +0200, Linus Walleij wrote:
> On Fri, Mar 10, 2017 at 5:26 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Tegra186 has two GPIO controllers that are largely register compatible
> > between one another but are completely different from the controller
> > found on earlier generations.
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v2:
>=20
> So this still doesn't use GPIOLIB_IRQCHIP even though I pointed
> out that you can assign several parent interrupts to the same
> irqchip.
>=20
> For a recent example see:
> http://marc.info/?l=3Ddevicetree&m=3D149012117004066&w=3D2
> (Notice Gregory's elegant manipulation of the mask.)
>=20
> My earlier reply here:
>=20
> ----------------------
> >> I would prefer if you could try to convert this driver to use
> >> CONFIG_GPIOLIB_IRQCHIP and install a chained interrupt
> >> handler with gpiochip_irqchio_add() + gpiolib_set_chained_irqchip().
> >> It would save us so much trouble and so much complicated
> >> code to maintain for this custom irqdomain.
> >>
> >> I suggest you to look into the mechanisms mentioned in my
> >> previous mail for how to poke holes in the single linear
> >> irqdomain used by this mechanism.
> >>
> >> As it seems, you only have one parent interrupt with all
> >> these IRQs cascading off it as far as I can tell.
> >
> > Like I said in other email, I don't think this will work because the
> > GPIOLIB_IRQCHIP support seems to be limited to cases where a single
> > parent interrupt is used. We could possibly live with a single IRQ
> > handler and data, but we definitely need to request multiple IRQs if
> > we want to be able to use all GPIOs as interrupts.
>=20
> Sorry if I missed that.
>=20
> Actually it works.
>=20
> If you look at gpiochip_set_chained_irqchip() it just calls
> irq_set_chained_handler_and_data() for the parent interrupt.
> ------------------------
>=20
> Just call gpiochip_set_chained_irqchip() for all the irqs, and
> figure out a way to get the right interrupt hardware offset in the
> interrupt handler.

Okay, let me quote the gpiochip_set_chained_irqchip() function here and
explain why I think it's not a proper fit here. This is actually quoting
gpiochip_set_cascaded_irqchip(), but that's what ends up being called.

> static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
> 					  struct irq_chip *irqchip,
> 					  int parent_irq,
> 					  irq_flow_handler_t parent_handler)
> {
> 	unsigned int offset;
>=20
> 	if (!gpiochip->irqdomain) {
> 		chip_err(gpiochip, "called %s before setting up irqchip\n",
> 			 __func__);
> 		return;
> 	}
>=20
> 	if (parent_handler) {
> 		if (gpiochip->can_sleep) {
> 			chip_err(gpiochip,
> 				 "you cannot have chained interrupts on a "
> 				 "chip that may sleep\n");
> 			return;
> 		}
> 		/*
> 		 * The parent irqchip is already using the chip_data for this
> 		 * irqchip, so our callbacks simply use the handler_data.
> 		 */
> 		irq_set_chained_handler_and_data(parent_irq, parent_handler,
> 						 gpiochip);
>=20
> 		gpiochip->irq_chained_parent =3D parent_irq;

If I call this multiple times with different parent_irq parameters, then
only the last one will be stored in gpiochip->irq_chained_parent. Later
on, this is used to disconnect the chained handler and data upon GPIO
chip removal, which means that handler and data for all but the last one
end up dangling.

> 	}
>=20
> 	/* Set the parent IRQ for all affected IRQs */
> 	for (offset =3D 0; offset < gpiochip->ngpio; offset++) {
> 		if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
> 			continue;
> 		irq_set_parent(irq_find_mapping(gpiochip->irqdomain, offset),
> 			       parent_irq);
> 	}
> }

Similarly here, we'd be setting the parent IRQ of all associated GPIOs
to the first, second... last parent IRQ. This is completely unnecessary
work and it's also setting the wrong parent. Note that we don't actually
care about that in the driver right now, but it's still wrong.

> > +config GPIO_TEGRA186
> > +       tristate "NVIDIA Tegra186 GPIO support"
> > +       default ARCH_TEGRA_186_SOC
> > +       depends on ARCH_TEGRA_186_SOC || COMPILE_TEST
> > +       depends on OF_GPIO
>=20
> select GPIOLIB_IRQCHIP
>=20
> > +#include <linux/gpio/driver.h>
> > +#include <linux/gpio.h>
>=20
> Only <linux/gpio/driver.h>
>=20
> You should not use <linux/gpio.h> in drivers, then you are
> doing something wrong.

Yeah, I don't seem to need this at all.

> > +struct tegra_gpio {
> > +       struct gpio_chip gpio;
> > +       struct irq_chip intc;
> > +       unsigned int num_irq;
> > +       unsigned int *irq;
>=20
> Why are you keeping the irqs around after requesting?
> Use devm_*

First I prefer to keep resource request and driver initialization
separate because it makes error recovery more robust. So this is used to
first store the results from platform_get_irq() and later on to iterate
over when installing the chained handlers.

Also, devm_* doesn't exist for irq_set_chained_handler_and_data(). So I
need to keep these around in order to properly uninstall the handlers
again on removal.

> > +
> > +       const struct tegra_gpio_soc *soc;
> > +
> > +       void __iomem *base;
> > +
> > +       struct irq_domain *domain;
>=20
> I don't like custom irq domains it is messy.
> Please do your best to try to use GPIOLIB_IRQCHIP

Like I explained above, I don't think it works the way it is supposed to
for this case. The armada-37xx patch that you linked to earlier seems to
suffer from the same issues in that all but the last parent IRQ handlers
will be left dangling after removal, which would cause the kernel to run
non-existing code if by any chance the interrupts were to still fire for
some reason.

> If you still decide to go with a custom irqdomain, there is
> stuff missing, especially the gpiochip_lock_as_irq()
> calls from the irqchip .irq_request/release_resources()
> callbacks, see the gpiolib.c implementation in the
> helpers there for reference.

Good catch. I will add those.

Thierry

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljebaoACgkQ3SOs138+
s6EZgA/8DqMTpDFeUMvmU1QtR5SRYSXICCm6AJ9fVORqOcLUhbDc4w+syIfZ5lec
QfwozLEQmg7aUmeRpPg1qHK0zNVcMOzRw+PGg+8LD0oulWwLdCNN3IENkt4fV2Du
sXI2l+yRa0gWh7T0mo5ifzZQOeOedo4dN6iHB5AyO8hSB2ZKeYaBIzf44jsMot5i
icWVvBjB4qlZxI6ZvcUWw6F0168/8RrYxxYGXfc/HQvf3aJPB5D+HzNLNs5OUE5W
GrZbdSKoS7eqCOh673QkIpI48wdaLAFPe+egk52iqTT/NjL+bzGbQ8q5E7omWr5t
jOz1LKvrQaJk0JEAD9c4jlIfS4ujtX87/Q6E5YHaqH5GqhGywSx8O1hOeGhU7xNC
nDWFESJ2GjfAglUfA6tcZlOraeUtlzDDS5ES9zrmgkx7ATzHNPtd0Hpwd9AGiMNl
eUaGNX/mX2BbpS3xDBA8XMbBB5wF22uVG633VCgXSl9iweC2HrSymKUdwCeQ6ZlR
UVwQIzyqvdq07VXTC9nAfsUKhZAqDpBuAH6W52biAl4ugLInJtvseR/bkT4pA5p3
Bo1HfkWNE/phAxjMVFRBRIg2Bpw8wSBn7WflK/+YCKd8SRd7QCIllV5BLxQlEKxX
bqwbOL+zI91bFifvV+Gpl2rDXUNP++C7+q0kkhDWfq3HCuRdwvk=
=yFlU
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
