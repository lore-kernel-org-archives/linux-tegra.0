From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/5] gpio: Add support for hierarchical IRQ domains
Date: Tue, 18 Dec 2018 23:06:53 +0100
Message-ID: <20181218220652.GB4227@mithrandir>
References: <20181129170312.23625-1-thierry.reding@gmail.com>
 <20181129170312.23625-2-thierry.reding@gmail.com>
 <CACRpkdYhgCsr2w-MgwdLDvcZXDhkvn2_sgvGW8VskK1=3kVASw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYhgCsr2w-MgwdLDvcZXDhkvn2_sgvGW8VskK1=3kVASw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
List-Id: linux-tegra@vger.kernel.org


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2018 at 02:41:01PM +0100, Linus Walleij wrote:
> Hi Thierry!
>=20
> thanks a lot for the patch! This is really in the right direction
> of how I want things to go with hierarchical IRQs.
>=20
> Some comments:
>=20
> On Thu, Nov 29, 2018 at 6:03 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> >  config GPIOLIB_IRQCHIP
> > -       select IRQ_DOMAIN
> > +       select IRQ_DOMAIN_HIERARCHY
>=20
> I understand that IRQ_DOMAIN_HIERARCHY implies
> IRQ_DOMAIN but I kind of like if we anyway select both
> (unless Kconfig dislikes it).
>=20
> Otherwise it looks like we're just using hierarchies.

Okay, I can add that.

>=20
> >  static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
> >  {
> > +       struct irq_domain *domain =3D chip->irq.domain;
> > +
> >         if (!gpiochip_irqchip_irq_valid(chip, offset))
> >                 return -ENXIO;
> >
> > +       if (irq_domain_is_hierarchy(domain)) {
> > +               struct irq_fwspec spec;
> > +
> > +               spec.fwnode =3D domain->fwnode;
> > +               spec.param_count =3D 2;
> > +               spec.param[0] =3D offset;
> > +               spec.param[1] =3D 0;
> > +
> > +               return irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, &=
spec);
> > +       }
> > +
> >         return irq_create_mapping(chip->irq.domain, offset);
> >  }
>=20
> This is really nice.
>=20
> > -       gpiochip->to_irq =3D gpiochip_to_irq;
> > +       /*
> > +        * Allow GPIO chips to override the ->to_irq() if they really n=
eed to.
> > +        * This should only be very rarely needed, the majority should =
be fine
> > +        * with gpiochip_to_irq().
> > +        */
> > +       if (!gpiochip->to_irq)
> > +               gpiochip->to_irq =3D gpiochip_to_irq;
>=20
> And I see this is what your driver does, which leaves the default
> domain hierarchy callback path unused.

Actually this is only temporary until the patch that uses a sparse
number space (with the valid masks). After the last patch in the series
the need to override this goes away, so I could follow-up with a patch
to revert this. Or alternatively we could squash the two Tegra patches.
I think keeping them separate is slightly nicer.

Of course, I would even prefer to not move to the sparse number space,
but you seemed to feel very strongly about it last time we discussed
this.

> It's better if you indirect the pointer like we do with some other
> irqchip stuff (see Hans Verkuils patches), i.e. if ->to_irq
> is defined, we save that function pointer and call that at the
> end of the gpiochip_to_irq() pointer, then we override it
> with our own.
>=20
> Since the Tegra186 clearly .to_irq() clearly is mostly the
> same plus some extra, this should work fine and give
> lesser lines of code in that driver.

That sounds an awful lot like a midlayer. I'm not a big fan of that at
all. There are various reasons for this, but others have described it in
much better detail than I could. See here for example:

	https://lwn.net/Articles/336262/

In this particular case one potential problem is that gpiochip_to_irq()
might not always do the right things for everyone, and that it turn may
incentivize people to work around it creatively. For example, one driver
may want to perform some operation before gpiochip_to_irq() is called,
while another driver may have to perform an operation after the call. If
you move towards a midlayer there's no way to satisfy both, unless you
go and add pre- and post-operations of some sort.

I'd like to propose that we instead provide gpiochip_to_irq() as a
helper that drivers can call into. In order to do that, we just need to
make sure that drivers have access to it. Then they can override the
->to_irq() like this:

	static int foo_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
	{
		/* do something before */
		...

		err =3D gpiochip_to_irq(chip, offset);
		if (err < 0)
			return err;

		/* do something after */
		...
	}

That way we get all the benefits of sharing the code and at the same
time we don't impose any artificial constraints on drivers. Typically in
the library pattern drivers that don't need anything extra would simply
set gpiochip_to_irq() as their implementation, so the default assignment
in the gpiolib core wouldn't be necessary, but that's just a minor
implementation detail.

What do you think?

Thierry

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwZb3gACgkQ3SOs138+
s6FYFRAAstifgpcibGXEpdbs8id+FrL945YboMHIJ2FohiW/cefjmM/l8xKtTCSL
QsdqyfgAKUa53SroKOZZfU9wrmSXkpX3Q4Lme4VgHwMAOasplVdEtTs5i0hHKzCW
+yrdpsJEEopEgYyUgUL+ickd6vG8S4+u67LTprwYWgEj20PBog4FdeOMBQP/h4Q5
muHE/WtRR+H/wQZDE4a9t0FyO9Kiu0CSNM1E4CzMYyHV9+orExZyB36CLteHCRyd
KJleS3PfeUySxRhKWRVISMMRMpq4K1c1+JqYqumTamvBiwy9wgs1uvSZOWKaVcUU
HBRb9YXZs0pvX0a89vk2seGWUqAxigVAWN/hS6q1e8Y6j1Ybijc4787ByBBx4GAl
0lo1Cxaf6GOjfrESnaa6xexQK13MZ6DL7t5u/XvJBk9S/F4v2Y4GWUMt8tMCIvyG
v9QWMrr8UpzRp/+Ir4LHaS537obT/DhVFImYkZtTuUnPS2IYLbkItLP8pNP1imGh
FRQeotEZj/JZgwwUa0TWNEKSZXdIxA5xqqi7c9aeg8adiVl/R6Yf4Bkew5nPIziB
1Syr7mQwwEzjzECBi0tfnu3uD08Ecj6nVLWCvlI1rTAqzIV0BgrJbD7btzfo7VFo
UEwPB6J20ipMeOwoP1CDEYM8MWfU+7UvTzbBg60HopKem+NFGC4=
=BCPy
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
