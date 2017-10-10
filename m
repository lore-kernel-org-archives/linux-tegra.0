From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 15/16] gpio: tegra: Use banked GPIO infrastructure
Date: Tue, 10 Oct 2017 12:27:27 +0200
Message-ID: <20171010102727.GA24484@ulmo>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <20170928095628.21966-16-thierry.reding@gmail.com>
 <dfeb33cf-34b5-259d-cf83-f065d75444f3@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dfeb33cf-34b5-259d-cf83-f065d75444f3@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 04:22:29PM -0500, Grygorii Strashko wrote:
>=20
>=20
> On 09/28/2017 04:56 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert the Tegra GPIO driver to use the banked GPIO infrastructure,
> > which simplifies some parts of the driver.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/gpio/Kconfig      |   1 +
> >   drivers/gpio/gpio-tegra.c | 203 ++++++++++++++++++++++---------------=
---------
> >   2 files changed, 98 insertions(+), 106 deletions(-)
> >=20
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index db3e446ad9b3..458157d6d491 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -439,6 +439,7 @@ config GPIO_TEGRA
> >   	default ARCH_TEGRA
> >   	depends on ARCH_TEGRA || COMPILE_TEST
>=20
> ...=20
>=20
> > @@ -616,76 +617,66 @@ static int tegra_gpio_probe(struct platform_devic=
e *pdev)
> >   	tgi->ic.irq_set_wake		=3D tegra_gpio_irq_set_wake;
> >   #endif
> >  =20
> > +	irq =3D &tgi->gc.irq;
> > +	irq->chip =3D &tgi->ic;
> > +	irq->handler =3D handle_simple_irq;
> > +	irq->lock_key =3D &tegra_gpio_lock_class;
>=20
> As per current gpiolib design lockdep lock_class_key is assigned=20
> automatically and hidden from gpiolib users.=20
> Why do you need to do the same manually?

Can you elaborate? I don't see the lock class key getting set anywhere.
gpiolib does set if for interrupts, but only if the drivers assigned it
before adding the chip.

Thierry

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlncoI0ACgkQ3SOs138+
s6ELJA//R70F5e38MSl0CjvYT2I0sdN6GJmj6grz6WCBVzDtBTN8LQbsDYBEjef1
QlO5iDiRm3BvOBNKBg7dPkqasoh+P0esVINDoOKaR+qtDGRdM8bRC0CR+Nh3qyuO
UIIcOp1Sz8CHowCW42KJNNWkTSL9fcZ65lqJDAdDYy+dXdDpuGhBdkpGnFyUkISz
lRExFh4AnOJfnvM+DWC4M2r03r51gSupN8xX4sYq4q/16hci9F04yqgkLtdyDPqu
K7mEntxqW3S96KRCV/V4aj4lv735yRNemnFvOCa7io02StjSuHKWnwvd1DEa9K14
A1WOLUMlP3uQNkZyBmZ+qSOLlr83Nr4bYEA+VJV4O+ZqwuFMSdX1qMM/9vwE4DBB
rInpQkg7YjA/yv6FkugymhNlDFLeFI21XtxSy2fvModvjWWfxTRmOvOLrXY4Uwh5
6Qs4AZ6Qe5njUUWiOV1j0DEHryjJnk7lKmdF0DdNgROuGJjB8SZJwZ/a8MyezfBh
cD51jKtHFHe+U/Rrad6+MjTUtvh8pzGFYo9Ce4JubOX+JK/YHuzYi1zhEon7ZysT
iVCnMzgvwBv8tT+M57UeGuY2NdUG8F9bOlMIwI+t79rqe4oH7PnR4paVN80IGEuy
xXp6nfASxKfEwz9h8CATdejNj/RyeFlA066O+lwQBU8XieGGack=
=gLdi
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
