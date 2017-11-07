From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 00/12] gpio: Tight IRQ chip integration
Date: Tue, 7 Nov 2017 19:19:09 +0100
Message-ID: <20171107181909.GC7314@ulmo>
References: <20171102174941.3461-1-thierry.reding@gmail.com>
 <ca8c7138-2e87-0481-ac8c-7077bed749f6@ti.com>
 <20171106111807.GA6756@ulmo>
 <e5996910-43a0-a75e-5f7f-a0606e05d914@ti.com>
 <20171107111344.GA7314@ulmo>
 <4d4de485-9b38-642d-b883-ec85909c01b3@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4d4de485-9b38-642d-b883-ec85909c01b3@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2017 at 11:00:41AM -0600, Grygorii Strashko wrote:
>=20
>=20
> On 11/07/2017 05:13 AM, Thierry Reding wrote:
> > On Mon, Nov 06, 2017 at 05:13:33PM -0600, Grygorii Strashko wrote:
> > >=20
> > >=20
> > > On 11/06/2017 05:18 AM, Thierry Reding wrote:
> > > > On Fri, Nov 03, 2017 at 05:30:30PM -0500, Grygorii Strashko wrote:
> > > > > Hi
> > > > >=20
> > > > > On 11/02/2017 12:49 PM, Thierry Reding wrote:
> > > > > > From: Thierry Reding <treding@nvidia.com>
> > > > > >=20
> > > > > > Hi Linus,
> > > > > >=20
> > > > > > here's the latest series of patches that implement the tighter =
IRQ chip
> > > > > > integration. I've dropped the banked infrastructure for now as =
per the
> > > > > > discussion with Grygorii.
> > > > > >=20
> > > > > > The first couple of patches are mostly preparatory work in orde=
r to
> > > > > > consolidate all IRQ chip related fields in a new structure and =
create
> > > > > > the base functionality for adding IRQ chips.
> > > > > >=20
> > > > > > After that, I've added the Tegra186 GPIO support patch that mak=
es use of
> > > > > > the new tight integration.
> > > > > >=20
> > > > > > Changes in v6:
> > > > > > - rebased on latest linux-gpio devel branch
> > > > > > - one patch dropped due to rebase
> > > > > >=20
> > > > > > Changes in v5:
> > > > > > - dropped the banked infrastructure patches for now (Grygorii)
> > > > > > - allocate interrupts on demand, rather than upfront (Grygorii)
> > > > > > - split up the first patch further as requested by Grygorii
> > > > > >=20
> > > > > > Not sure what happened in between here. Notes in commit logs in=
dicate
> > > > > > that this is actually version 5, but I can't find the cover let=
ter for
> > > > > > v3 and v4.
> > > > > >=20
> > > > > > Changes in v2:
> > > > > > - rename pins to lines for consistent terminology
> > > > > > - rename gpio_irq_chip_banked_handler() to
> > > > > >      gpio_irq_chip_banked_chained_handler()
> > > > > >=20
> > > > >=20
> > > > > Sry, for delayed reply, very sorry.
> > > > >=20
> > > > > Patches 1 - 9, 11 : looks good, so
> > > > > Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > > > >=20
> > > > > Patch 10 - unfortunately not all my comment were incorporated [1],
> > > > > so below diff on top of patch 10
> > > > > which illustrates what i want and also converts gpio-omap to use =
new infra as
> > > > > test for this new infra.
> > > > >=20
> > > > > Pls, take a look
> > > > >=20
> > > > > [1] https://www.spinics.net/lists/linux-tegra/msg31145.html
> > > >=20
> > > > Most of the changes I had deemed to be material for follow-up patch=
es
> > > > since they aren't immediately relevant to the gpio_irq_chip convers=
ion
> > > > nor needed by the Tegra186 patch.
> > > >=20
> > > > However, a couple of the hunks below seem like they should be part =
of
> > > > the initial series.
> > > >=20
> > > > > -----------><-------------
> > > > >   From 210fe3ad7a642691a1b7603e441f6980b10ff2b4 Mon Sep 17 00:00:=
00 2001
> > > > > From: Grygorii Strashko <grygorii.strashko@ti.com>
> > > > > Date: Fri, 3 Nov 2017 17:24:51 -0500
> > > > > Subject: [PATCH] [not for merge] gpiolib: update and test new gpi=
oirq chip
> > > > >    infra
> > > > >=20
> > > > > changes in gpiolib:
> > > > >    - move set_parent to gpiochip_irq_map() and use parents instea=
d of map for only
> > > > >      one parent
> > > > >    - add gpio_irq_chip->first_irq for static IRQ allocation
> > > > >    - fix nested =3D true if parent_handler not set
> > > > >    - fix gpiochip_irqchip_remove() if parent_handler not set
> > > > >    - get of_node from gpiodev
> > > > >    - fix lock_key: drivers do not need to set it, but looks a bit=
 overcomplicated
> > > > >      as lock_class_key will be created for each gpiochip_add_data=
() call.
> > > > >      Honestly, do not seem better way :(
> > > > >=20
> > > > > GPIO OMAP driver updated to use new gpioirq chip infra and tested=
 on am335x-evm.
> > > > > seems it's working - can see irqs from keys.
> > > > >=20
> > > > > Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > > > > ---
> > > > >    drivers/gpio/gpio-omap.c    | 36 ++++++++++++++--------------
> > > > >    drivers/gpio/gpiolib.c      | 58 +++++++++++++++++++----------=
----------------
> > > > >    include/linux/gpio/driver.h | 32 ++++++++++++++++++++++++-
> > > > >    3 files changed, 73 insertions(+), 53 deletions(-)
> > > > [...]
> > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > [...]
> > > > > @@ -1642,6 +1644,7 @@ static int gpiochip_irq_map(struct irq_doma=
in *d, unsigned int irq,
> > > > >    			    irq_hw_number_t hwirq)
> > > > >    {
> > > > >    	struct gpio_chip *chip =3D d->host_data;
> > > > > +	int err =3D 0;
> > > > >    	if (!gpiochip_irqchip_irq_valid(chip, hwirq))
> > > > >    		return -ENXIO;
> > > > > @@ -1658,6 +1661,12 @@ static int gpiochip_irq_map(struct irq_dom=
ain *d, unsigned int irq,
> > > > >    		irq_set_nested_thread(irq, 1);
> > > > >    	irq_set_noprobe(irq);
> > > > > +	if (chip->irq.num_parents =3D=3D 1)
> > > > > +		err =3D irq_set_parent(irq, chip->irq.parents[0]);
> > > > > +	else if (chip->irq.map)
> > > > > +		err =3D irq_set_parent(irq, chip->irq.map[hwirq]);
> > > > > +	if (err < 0)
> > > > > +		return err;
> > > >=20
> > > > Yeah, this looks sensible. Both in that this is a slightly better p=
lace
> > > > to call it and that the handling for num_parents =3D=3D 1 is necess=
ary, too.
> > > >=20
> > > > >    	/*
> > > > >    	 * No set-up of the hardware will happen if IRQ_TYPE_NONE
> > > > >    	 * is passed as default type.
> > > > > @@ -1712,30 +1721,18 @@ static void gpiochip_irq_relres(struct ir=
q_data *d)
> > > > >    static int gpiochip_to_irq(struct gpio_chip *chip, unsigned of=
fset)
> > > > >    {
> > > > > -	unsigned int irq;
> > > > > -	int err;
> > > > > -
> > > > >    	if (!gpiochip_irqchip_irq_valid(chip, offset))
> > > > >    		return -ENXIO;
> > > > > -	irq =3D irq_create_mapping(chip->irq.domain, offset);
> > > > > -	if (!irq)
> > > > > -		return 0;
> > > > > -
> > > > > -	if (chip->irq.map) {
> > > > > -		err =3D irq_set_parent(irq, chip->irq.map[offset]);
> > > > > -		if (err < 0)
> > > > > -			return err;
> > > > > -	}
> > > > > -
> > > > > -	return irq;
> > > > > +	return irq_create_mapping(chip->irq.domain, offset);
> > > > >    }
> > > > >    /**
> > > > >     * gpiochip_add_irqchip() - adds an IRQ chip to a GPIO chip
> > > > >     * @gpiochip: the GPIO chip to add the IRQ chip to
> > > > >     */
> > > > > -static int gpiochip_add_irqchip(struct gpio_chip *gpiochip)
> > > > > +static int gpiochip_add_irqchip_key(struct gpio_chip *gpiochip,
> > > > > +				    struct lock_class_key *lock_key)
> > > > >    {
> > > > >    	struct irq_chip *irqchip =3D gpiochip->irq.chip;
> > > > >    	const struct irq_domain_ops *ops;
> > > > > @@ -1753,17 +1750,8 @@ static int gpiochip_add_irqchip(struct gpi=
o_chip *gpiochip)
> > > > >    	}
> > > > >    	type =3D gpiochip->irq.default_type;
> > > > > -	np =3D gpiochip->parent->of_node;
> > > > > -
> > > > > -#ifdef CONFIG_OF_GPIO
> > > > > -	/*
> > > > > -	 * If the gpiochip has an assigned OF node this takes precedence
> > > > > -	 * FIXME: get rid of this and use gpiochip->parent->of_node
> > > > > -	 * everywhere
> > > > > -	 */
> > > > > -	if (gpiochip->of_node)
> > > > > -		np =3D gpiochip->of_node;
> > > > > -#endif
> > > > > +	/* called from gpiochip_add_data() and is set properly */
> > > > > +	np =3D gpiochip->gpiodev->dev.of_node;
> > > >=20
> > > > Indeed, looks like we have this twice now.
> > > >=20
> > > > >    	/*
> > > > >    	 * Specifying a default trigger is a terrible idea if DT or A=
CPI is
> > > > > @@ -1789,7 +1777,8 @@ static int gpiochip_add_irqchip(struct gpio=
_chip *gpiochip)
> > > > >    		ops =3D &gpiochip_domain_ops;
> > > > >    	gpiochip->irq.domain =3D irq_domain_add_simple(np, gpiochip->=
ngpio,
> > > > > -						     0, ops, gpiochip);
> > > > > +						     gpiochip->irq.first_irq,
> > > > > +						     ops, gpiochip);
> > > > >    	if (!gpiochip->irq.domain)
> > > > >    		return -EINVAL;
> > > >=20
> > > > This seems backward. You just spent a lot of time getting rid of all
> > > > users of first_irq (it's actually the reason why I dropped one of t=
he
> > > > patches from the series, since first_irq is no longer used), so why
> > > > reintroduce it?
> > >=20
> > > Yes. It required for HW/drivers not supported (or partially supported)
> > > SPARSE_IRQ. And it's not exactly the same as dropped base_irq.
> > > If SPARSE_IRQ not supported - driver should ensure that proper
> > >   Linux IRQ range allocated (or reserved) and pass first_irq number t=
o the gpiolib
> > > For example, in case of OMAP GPIO this is required for OMAP1 support =
and
> > > driver has code
> > >    irq_base =3D devm_irq_alloc_descs(bank->chip.parent, -1, 0, bank->=
width, 0);
> > >=20
> > > irq_base makes no sense in case of SPARSE_IRQ compatible driver and
> > > therefore was removed from gpiolib to avoid mis-usage - drivers should
> > > maintain it by itself if requred.
> >=20
> > But this is not something that is currently being used. I understand
> > that you'll want to add this in order to support fixed IRQ numbers on
> > OMAP, but I don't see why it would need to be part of this series. It
> > will simply be dead code until the OMAP patches get merged.
>=20
> My opinion is that if this modification will be merged in gpiolib - drive=
rs
> should be able to use it out of the box.
>=20
> Any way finial decision is up to Linus.

Alright, I've sent v7 that should address all of the remaining issues.
I've squashed a couple of the fixes you had pointed out into the tight
integration patch and added another three patches on top for the first
IRQ support, nested vs. threaded disambiguation and one for the
automatic lock dep key creation.

Thierry

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloB+RkACgkQ3SOs138+
s6FdMBAAuYEAXKcO3xw+okWGm78O5dYjSmjk0x1mnM9+J5/cyAGYzCZXYr7EwPvA
kUUWuWOSAdHqRHyyvvBXig9PrmAxv3Yh0c3p0CRqCPt7BOgw5EJ2e3pW5hyqX53q
GEiLuOyxe46ZkpdOHUXTiaIyfAD01p+AK7uzgUBlIu3WQXra7T7mh/SuB8L4Ummf
lyyA505ftyGO+bDnjOiGdqxDBScxr/qQQtt+1GA4V+R7/snhf9FweOFZXCeEUXvc
UUlO9TsqLKVi8AqTl8RoeehT1uj4+IPMjdjieJOh7UComomndnJId2TLcVMxNYje
HnGHfdhBq3fjkJWhwgYjxleYhe6fDVJj+7/Sdit7b9QbDwmFxThsp9OzGFJ9Fuqt
lqwAvvh+qCoBxBPoB135LnobpM7eT+dhYch3dIb631p29oW6sCqDg7MDyo6gi+f7
DWZoqddyxvCQmZobGrBI0+tHITEl8xrUhKB5Kt9CDArPMcEDmQcm1C4VIV1ZCtgj
obvOSrbRFGXgO6d/HRle/S11YtdMTOA2WmgZZALA0DP8x/5Y8hw75OGRdvR5K4MZ
fxFvAcZBkLBPT6O4xAVvb5SDk5TwrGySJOAO1iXsvj07hkiolCqqC6aZxNerCwXO
XgPhN+mioM1KwGvYRGesO6e92FlA+KcTVZkGtpBo1o0pJ7sxem4=
=A2eq
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
