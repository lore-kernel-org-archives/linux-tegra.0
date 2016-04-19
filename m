From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 3/3] gpio: tegra: Add support for gpio debounce
Date: Tue, 19 Apr 2016 14:36:02 +0200
Message-ID: <20160419123602.GD8284@ulmo.ba.sec>
References: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com>
 <1461059020-25373-3-git-send-email-ldewangan@nvidia.com>
 <57160BCD.4080005@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57160BCD.4080005@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, gnurou@gmail.com, swarren@wwwdotorg.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 11:43:25AM +0100, Jon Hunter wrote:
>=20
> On 19/04/16 10:43, Laxman Dewangan wrote:
> > NVIDIA's Tegra210 support the HW debounce in the GPIO
> > controller for all its GPIO pins.
> >=20
> > Add support for setting debounce timing by implementing the
> > set_debounce callback of gpiochip.
> >=20
> > Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> >=20
> > ---
> > Changes from V1:
> > - Write debounce count before enable.
> > - Make sure the debounce count do not have any boot residuals.
> > ---
> >  drivers/gpio/gpio-tegra.c | 49 +++++++++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 49 insertions(+)
>=20
> [snip]
>=20
> > @@ -327,6 +360,9 @@ static int tegra_gpio_resume(struct device *dev)
> >  			tegra_gpio_writel(bank->oe[p], GPIO_OE(gpio));
> >  			tegra_gpio_writel(bank->int_lvl[p], GPIO_INT_LVL(gpio));
> >  			tegra_gpio_writel(bank->int_enb[p], GPIO_INT_ENB(gpio));
> > +			tegra_gpio_writel(bank->dbc_cnt[p], GPIO_DBC_CNT(gpio));
> > +			tegra_gpio_writel(bank->dbc_enb[p],
> > +					  GPIO_MSK_DBC_EN(gpio));
>=20
> If these registers are not valid on Tegra devices prior to Tegra210, I
> don't think we should write to these locations on those devices (even if
> we are writing back the values read).
>=20
> > @@ -351,6 +387,10 @@ static int tegra_gpio_suspend(struct device *dev)
> >  			bank->oe[p] =3D tegra_gpio_readl(GPIO_OE(gpio));
> >  			bank->int_enb[p] =3D tegra_gpio_readl(GPIO_INT_ENB(gpio));
> >  			bank->int_lvl[p] =3D tegra_gpio_readl(GPIO_INT_LVL(gpio));
> > +			bank->dbc_enb[p] =3D tegra_gpio_readl(
> > +							GPIO_MSK_DBC_EN(gpio));
> > +			bank->dbc_enb[p] =3D (bank->dbc_enb[p] << 8) ||
> > +						bank->dbc_enb[p];
>=20
> Same here, not sure we should even bother reading these for Tegra's
> before Tegra210.

Indeed. This patch already introduces the debounce_supported capability
in the SoC data, so access to these registers could be guarded by that.

Thierry

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFiYyAAoJEN0jrNd/PrOhmCoP/A3SMAWXWB7Th0pTmTeuHstz
F6PAIFSLJCohiKsv0x1uDpNSiCmnEzL6fFzFDuzFht9BMgoVkVVox99fLRZGF4TR
R6Hr5vToHn/rHLVQOt3ic3CNBGb2l3x0T3nOU3rLzAZ5NDkwSdPh/5GgWoNQa8rO
kgjqYH3eq1rmTyO602vpEMg7+7cptWfQ9gatlz6+TcV5Y3HrM+8g5O3nbf4FH4zk
S9fWL2MrYcu81YSoQKIUoxqz4Ii9x8Z61Uvfk1xFOj0Lpu7Vb770IugHxw6ykK+w
Q2A8Ru+ZRsI/+qeMZbJAaIxAl+lF2E7tgn4SFkoF6PKp1sUQdYc2EaGxtcwAXFcl
7e+//eaihogpm5U7jiuXBjAwTKHd9dj98v0B6OSAtsHlVVKXgrihRieDU0TUPp9m
ZfSX1rCjIMNY7yef8DE32+7WtZnUztvZ6uZbzOYuFNiPopHE7E29e/PAY3qdMAn2
t4TqggwNvAF/z/h4UsM2Q4222Lz2b4HS7IMqwKJc5yTX7kKbYfuKxVq+V65ImrWT
JjMrLKz7lt/mTLpXikSYk61zrWGAYv7gujPgRL7yTpB2112e58Mrb0W0ZLZRkmhy
6ULvnCQAHDI5I0Ub5/LDrjvYnhupsXkKXnPa1rBB5KKv55K2c6aX0sCUwGOLdaNV
FONhfuKcsJ50Tn0aDpbD
=+Jhs
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
