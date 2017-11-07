From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 00/12] gpio: Tight IRQ chip integration
Date: Tue, 7 Nov 2017 12:13:44 +0100
Message-ID: <20171107111344.GA7314@ulmo>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
 <ca8c7138-2e87-0481-ac8c-7077bed749f6@ti.com>
 <20171106111807.GA6756@ulmo>
 <e5996910-43a0-a75e-5f7f-a0606e05d914@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e5996910-43a0-a75e-5f7f-a0606e05d914@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2017 at 05:13:33PM -0600, Grygorii Strashko wrote:
>=20
>=20
> On 11/06/2017 05:18 AM, Thierry Reding wrote:
> > On Fri, Nov 03, 2017 at 05:30:30PM -0500, Grygorii Strashko wrote:
> >> Hi
> >>
> >> On 11/02/2017 12:49 PM, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> Hi Linus,
> >>>
> >>> here's the latest series of patches that implement the tighter IRQ ch=
ip
> >>> integration. I've dropped the banked infrastructure for now as per the
> >>> discussion with Grygorii.
> >>>
> >>> The first couple of patches are mostly preparatory work in order to
> >>> consolidate all IRQ chip related fields in a new structure and create
> >>> the base functionality for adding IRQ chips.
> >>>
> >>> After that, I've added the Tegra186 GPIO support patch that makes use=
 of
> >>> the new tight integration.
> >>>
> >>> Changes in v6:
> >>> - rebased on latest linux-gpio devel branch
> >>> - one patch dropped due to rebase
> >>>
> >>> Changes in v5:
> >>> - dropped the banked infrastructure patches for now (Grygorii)
> >>> - allocate interrupts on demand, rather than upfront (Grygorii)
> >>> - split up the first patch further as requested by Grygorii
> >>>
> >>> Not sure what happened in between here. Notes in commit logs indicate
> >>> that this is actually version 5, but I can't find the cover letter for
> >>> v3 and v4.
> >>>
> >>> Changes in v2:
> >>> - rename pins to lines for consistent terminology
> >>> - rename gpio_irq_chip_banked_handler() to
> >>>     gpio_irq_chip_banked_chained_handler()
> >>>
> >>
> >> Sry, for delayed reply, very sorry.
> >>
> >> Patches 1 - 9, 11 : looks good, so
> >> Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
> >>
> >> Patch 10 - unfortunately not all my comment were incorporated [1],
> >> so below diff on top of patch 10
> >> which illustrates what i want and also converts gpio-omap to use new i=
nfra as
> >> test for this new infra.
> >>
> >> Pls, take a look
> >>
> >> [1] https://www.spinics.net/lists/linux-tegra/msg31145.html
> >=20
> > Most of the changes I had deemed to be material for follow-up patches
> > since they aren't immediately relevant to the gpio_irq_chip conversion
> > nor needed by the Tegra186 patch.
> >=20
> > However, a couple of the hunks below seem like they should be part of
> > the initial series.
> >=20
> >> -----------><-------------
> >>  From 210fe3ad7a642691a1b7603e441f6980b10ff2b4 Mon Sep 17 00:00:00 2001
> >> From: Grygorii Strashko <grygorii.strashko@ti.com>
> >> Date: Fri, 3 Nov 2017 17:24:51 -0500
> >> Subject: [PATCH] [not for merge] gpiolib: update and test new gpioirq =
chip
> >>   infra
> >>
> >> changes in gpiolib:
> >>   - move set_parent to gpiochip_irq_map() and use parents instead of m=
ap for only
> >>     one parent
> >>   - add gpio_irq_chip->first_irq for static IRQ allocation
> >>   - fix nested =3D true if parent_handler not set
> >>   - fix gpiochip_irqchip_remove() if parent_handler not set
> >>   - get of_node from gpiodev
> >>   - fix lock_key: drivers do not need to set it, but looks a bit overc=
omplicated
> >>     as lock_class_key will be created for each gpiochip_add_data() cal=
l.
> >>     Honestly, do not seem better way :(
> >>
> >> GPIO OMAP driver updated to use new gpioirq chip infra and tested on a=
m335x-evm.
> >> seems it's working - can see irqs from keys.
> >>
> >> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> >> ---
> >>   drivers/gpio/gpio-omap.c    | 36 ++++++++++++++--------------
> >>   drivers/gpio/gpiolib.c      | 58 +++++++++++++++++++----------------=
----------
> >>   include/linux/gpio/driver.h | 32 ++++++++++++++++++++++++-
> >>   3 files changed, 73 insertions(+), 53 deletions(-)
> > [...]
> >> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > [...]
> >> @@ -1642,6 +1644,7 @@ static int gpiochip_irq_map(struct irq_domain *d=
, unsigned int irq,
> >>   			    irq_hw_number_t hwirq)
> >>   {
> >>   	struct gpio_chip *chip =3D d->host_data;
> >> +	int err =3D 0;
> >>  =20
> >>   	if (!gpiochip_irqchip_irq_valid(chip, hwirq))
> >>   		return -ENXIO;
> >> @@ -1658,6 +1661,12 @@ static int gpiochip_irq_map(struct irq_domain *=
d, unsigned int irq,
> >>   		irq_set_nested_thread(irq, 1);
> >>   	irq_set_noprobe(irq);
> >>  =20
> >> +	if (chip->irq.num_parents =3D=3D 1)
> >> +		err =3D irq_set_parent(irq, chip->irq.parents[0]);
> >> +	else if (chip->irq.map)
> >> +		err =3D irq_set_parent(irq, chip->irq.map[hwirq]);
> >> +	if (err < 0)
> >> +		return err;
> >=20
> > Yeah, this looks sensible. Both in that this is a slightly better place
> > to call it and that the handling for num_parents =3D=3D 1 is necessary,=
 too.
> >=20
> >>   	/*
> >>   	 * No set-up of the hardware will happen if IRQ_TYPE_NONE
> >>   	 * is passed as default type.
> >> @@ -1712,30 +1721,18 @@ static void gpiochip_irq_relres(struct irq_dat=
a *d)
> >>  =20
> >>   static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
> >>   {
> >> -	unsigned int irq;
> >> -	int err;
> >> -
> >>   	if (!gpiochip_irqchip_irq_valid(chip, offset))
> >>   		return -ENXIO;
> >>  =20
> >> -	irq =3D irq_create_mapping(chip->irq.domain, offset);
> >> -	if (!irq)
> >> -		return 0;
> >> -
> >> -	if (chip->irq.map) {
> >> -		err =3D irq_set_parent(irq, chip->irq.map[offset]);
> >> -		if (err < 0)
> >> -			return err;
> >> -	}
> >> -
> >> -	return irq;
> >> +	return irq_create_mapping(chip->irq.domain, offset);
> >>   }
> >>  =20
> >>   /**
> >>    * gpiochip_add_irqchip() - adds an IRQ chip to a GPIO chip
> >>    * @gpiochip: the GPIO chip to add the IRQ chip to
> >>    */
> >> -static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
> >> +static int gpiochip_add_irqchip_key(struct gpio_chip *gpiochip,
> >> +				    struct lock_class_key *lock_key)
> >>   {
> >>   	struct irq_chip *irqchip =3D gpiochip->irq.chip;
> >>   	const struct irq_domain_ops *ops;
> >> @@ -1753,17 +1750,8 @@ static int gpiochip_add_irqchip(struct gpio_chi=
p *gpiochip)
> >>   	}
> >>  =20
> >>   	type =3D gpiochip->irq.default_type;
> >> -	np =3D gpiochip->parent->of_node;
> >> -
> >> -#ifdef CONFIG_OF_GPIO
> >> -	/*
> >> -	 * If the gpiochip has an assigned OF node this takes precedence
> >> -	 * FIXME: get rid of this and use gpiochip->parent->of_node
> >> -	 * everywhere
> >> -	 */
> >> -	if (gpiochip->of_node)
> >> -		np =3D gpiochip->of_node;
> >> -#endif
> >> +	/* called from gpiochip_add_data() and is set properly */
> >> +	np =3D gpiochip->gpiodev->dev.of_node;
> >=20
> > Indeed, looks like we have this twice now.
> >=20
> >>  =20
> >>   	/*
> >>   	 * Specifying a default trigger is a terrible idea if DT or ACPI is
> >> @@ -1789,7 +1777,8 @@ static int gpiochip_add_irqchip(struct gpio_chip=
 *gpiochip)
> >>   		ops =3D &gpiochip_domain_ops;
> >>  =20
> >>   	gpiochip->irq.domain =3D irq_domain_add_simple(np, gpiochip->ngpio,
> >> -						     0, ops, gpiochip);
> >> +						     gpiochip->irq.first_irq,
> >> +						     ops, gpiochip);
> >>   	if (!gpiochip->irq.domain)
> >>   		return -EINVAL;
> >=20
> > This seems backward. You just spent a lot of time getting rid of all
> > users of first_irq (it's actually the reason why I dropped one of the
> > patches from the series, since first_irq is no longer used), so why
> > reintroduce it?
>=20
> Yes. It required for HW/drivers not supported (or partially supported)
> SPARSE_IRQ. And it's not exactly the same as dropped base_irq.
> If SPARSE_IRQ not supported - driver should ensure that proper
>  Linux IRQ range allocated (or reserved) and pass first_irq number to the=
 gpiolib
> For example, in case of OMAP GPIO this is required for OMAP1 support and
> driver has code
>   irq_base =3D devm_irq_alloc_descs(bank->chip.parent, -1, 0, bank->width=
, 0);
>=20
> irq_base makes no sense in case of SPARSE_IRQ compatible driver and
> therefore was removed from gpiolib to avoid mis-usage - drivers should
> maintain it by itself if requred.

But this is not something that is currently being used. I understand
that you'll want to add this in order to support fixed IRQ numbers on
OMAP, but I don't see why it would need to be part of this series. It
will simply be dead code until the OMAP patches get merged.

> >> @@ -1818,9 +1807,9 @@ static int gpiochip_add_irqchip(struct gpio_chip=
 *gpiochip)
> >>   		}
> >>  =20
> >>   		gpiochip->irq.nested =3D false;
> >> -	} else {
> >> -		gpiochip->irq.nested =3D true;
> >>   	}
> >> +	/* GPIO driver might not specify parent_handler, but it doesn't mean
> >> +	 * it's irq_nested, as driver may use request_irq() */
> >=20
> > That's certainly how irq_nested is used in gpiolib, though. Interrupts
> > are considered either cascaded or nested. Maybe this needs clarification
> > in general?
>=20
> No. Please, take closer look at=20
> gpiochip_set_nested_irqchip()=20
> gpiochip_set_cascaded_irqchip()
> gpiochip_set_chained_irqchip()
> gpiochip_set_nested_irqchip()
>  and how they are used.
> Also, take a look on OMAP driver - it doesn't install chained handler.
>=20
> gpiolib now can discover automatically only when child irqs are not nested
> (nested here means - threaded nested), therefore different APIs were intr=
oduced
> gpiochip_set_chained_irqchip()
> gpiochip_set_nested_irqchip()
>=20
> So, with your change:
> - nested =3D false; can be set auto if parent_handler provided
> - nested =3D <set by driver> if no parent_handler provided
> because with this patch full GPIO IRQ configuration expected to be done
> from inside  gpiochip_add_data().

Sorry if I'm being dense. The only user-callable functions currently are
gpiochip_set_chained_irqchip() and gpiochip_set_nested_irqchip(). Both
internally call gpiochip_set_cascaded_irqchip() and the only difference
is that the former passes a parent handler while the latter doesn't. So
this seems to me like exactly the same thing that gpiochip_add_irqchip()
does in my series.

I think there's some ambiguity in how irq_nested is currently being used
because it really means two things: a) not-chained and b) threaded. So I
think what we want is to separate these. For a) I think it's pretty much
solved because we have the parent handler that disambiguates. So instead
of just setting irq.nested =3D false when a parent handler is available we
should probably also WARN if the driver has set irq.nested =3D true and
force it to false.

Then, as you suggested, leave the else branch open to allow the driver
to specify whether or not it uses threaded handlers so that
gpiochip_irq_map() and gpiochip_irq_unmap() will know to call
irq_set_nested_thread().

In this case, perhaps it would be better to rename irq.nested to
irq.threaded. Then we no longer need to check/force irq.nested for
chained IRQ chips and instead use only irq.threaded to have interrupts
marked as nested/threaded.

> >>  =20
> >>   	acpi_gpiochip_request_interrupts(gpiochip);
> >>  =20
> >> @@ -1839,7 +1828,7 @@ static void gpiochip_irqchip_remove(struct gpio_=
chip *gpiochip)
> >>  =20
> >>   	acpi_gpiochip_free_interrupts(gpiochip);
> >>  =20
> >> -	if (gpiochip->irq.chip) {
> >> +	if (gpiochip->irq.chip && gpiochip->irq.parent_handler) {
> >>   		struct gpio_irq_chip *irq =3D &gpiochip->irq;
> >>   		unsigned int i;
> >>  =20
> >=20
> > Yeah, this seems like a good idea, though I think this is safe
> > regardless of irq.parent_handler.
> >=20
> >> @@ -1972,7 +1961,8 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
> >>  =20
> >>   #else /* CONFIG_GPIOLIB_IRQCHIP */
> >>  =20
> >> -static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
> >> +static inline int gpiochip_add_irqchip_key(struct gpio_chip *gpiochip,
> >> +					   struct lock_class_key *lock_key)
> >>   {
> >>   	return 0;
> >>   }
> >> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> >> index 51fc7b0..3254996 100644
> >> --- a/include/linux/gpio/driver.h
> >> +++ b/include/linux/gpio/driver.h
> >> @@ -128,6 +128,15 @@ struct gpio_irq_chip {
> >>   	 * in IRQ domain of the chip.
> >>   	 */
> >>   	unsigned long *valid_mask;
> >> +
> >> +	/**
> >> +	 * @first_irq:
> >> +	 *
> >> +	 * Required for static irq allocation.
> >> +	 * if set irq_domain_add_simple() will allocate and map all IRQs
> >> +	 * during initialization.
> >> +	 */
> >> +	unsigned int first_irq;
> >=20
> > Again, what was the point of removing all users of this if we need to
> > add it again?
> >=20
> > It seems to me like dynamic allocation should be a prerequisite for
> > drivers to use this new code, otherwise we'll just end up adding special
> > cases to this otherwise generic code.
>=20
> The idea, as i see it, is to be able to re-use you change for as much dri=
vers
> as possible (as I illustrated for OMAP) and in this case we need support =
backward
> compatibility with non SPARSE_IRQ compatible drivers.

Okay, understood. How about we focus on getting the current series
merged and then we can add this hunk as a preparator patch for the OMAP
conversion series?

> >=20
> >>   };
> >>  =20
> >>   static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip=
 *chip)
> >> @@ -312,8 +321,29 @@ struct gpio_chip {
> >>   extern const char *gpiochip_is_requested(struct gpio_chip *chip,
> >>   			unsigned offset);
> >>  =20
> >> +extern int gpiochip_add_data_key(struct gpio_chip *chip, void *data,
> >> +				 struct  *irq_lock_key);
> >> +#ifdef CONFIG_LOCKDEP
> >> +/*
> >> + * Lockdep requires that each irqchip instance be created with a
> >> + * unique key so as to avoid unnecessary warnings. This upfront
> >> + * boilerplate static inlines provides such a key for each
> >> + * unique instance which is created now from inside gpiochip_add_data=
_key().
> >> + */
> >> +static inline int gpiochip_add_data(struct gpio_chip *chip, void *dat=
a)
> >> +{
> >> +	static struct lock_class_key key;
> >> +
> >> +	return gpiochip_add_data_key(chip, data, key);
> >> +}
> >=20
> > This looks like a neat improvement, but I think it can be done in a
> > follow-up to remove the boilerplate in drivers.
>=20
> Can't agree here - it better to be considered now.=20
> Now only two GPIO drivers define lock_class_key:
> ./drivers/gpio/gpio-bcm-kona.c:static struct lock_class_key gpio_lock_cla=
ss;
> ./drivers/gpio/gpio-brcmstb.c:static struct lock_class_key brcmstb_gpio_i=
rq_lock_class;
>=20
> and these drivers do not use gpioirq framework (your tegra driver will be=
 the third).
>=20
> So, if proposed changes will be applied all drivers switched to use it wi=
ll need to define
> its own lock_class_key again and it will be step back.

I think this would be a minor, mostly mechanical refactoring to do as
follow-up. But since you feel very strongly about it, I'll add that into
the series.

Thierry

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloBlWUACgkQ3SOs138+
s6FmPw/+JcUojICAi+0HGbglGzDwv8qMULt0LLlOEoIeCLOa4oFE265s9oXQpwWC
iV7YagqM1p2Ol4AxxdO5XIyYMuDe6gQ0BnIbdErpKWiRStyV0BzcYYXePW0ncqu7
+2WbuPInd8ZD5mef18140cz8qmP6P6LssoyInd+umzDEx58fnu3hSnIX5ziHRtAh
WEpnNHstQqJqKcgbXHazOgDHtv8tixBmCTpACQPOIGYd3tDNI9/Fb180krYod9o0
0XZq9K9muvVS4EM6HH/pLTwD5WP71dDUrGcPPr2b40J2pOnID81TYTdiCpgPyaqM
hs6Zb6yjsiAw2F1Z+w1KSUS5LtCLX4b6TZjJzQTLiWnI5Ows4GEn/RqutV4GK73i
wPwPjamjj+rgj2DXE74jc7qb08mak8Gl8sDzT9kqPUAiov7q9nRzRjqNSsaIAhaT
lG7L4wI0dbhxF067RPU39Fo/U8zAciqs/GBIKzf0M3fwvzgFae352flNkO9b1mU0
iD9nJAriWPIwsP6h+mwNJbaFPDXPtyUoWP8GiBJ68fMotEYvD9ahYJCEYQlJGyw0
YxXWE0X6NKpX/SURiYk5ClKWxrspUyjjNsgLkNnkL7lz1Uv7hH6ZDzGcuOURF8hl
YDkHJyVR0NLhLtCOtbuEVnMnoWBsOlXcQ/OGyBSMsuv4iVCcAXk=
=BjiA
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
