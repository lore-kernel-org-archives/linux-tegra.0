From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 2/3] gpio: tegra: Remove the need of keeping device
 handle for gpio driver
Date: Tue, 19 Apr 2016 14:33:23 +0200
Message-ID: <20160419123323.GC8284@ulmo.ba.sec>
References: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com>
 <1461059020-25373-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461059020-25373-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, swarren@wwwdotorg.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 03:13:39PM +0530, Laxman Dewangan wrote:
> Remove the file static device handle variable for keeping device handle
> of driver as this is just required for error prints. The required device
> handle are available from gpiochip structure.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 1b0c497..de022a9 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -80,7 +80,6 @@ struct tegra_gpio_soc_config {
>  	u32 upper_offset;
>  };
> =20
> -static struct device *dev;
>  static struct irq_domain *irq_domain;
>  static void __iomem *regs;
>  static u32 tegra_gpio_bank_count;
> @@ -240,7 +239,8 @@ static int tegra_gpio_irq_set_type(struct irq_data *d=
, unsigned int type)
> =20
>  	ret =3D gpiochip_lock_as_irq(&tegra_gpio_chip, gpio);
>  	if (ret) {
> -		dev_err(dev, "unable to lock Tegra GPIO %d as IRQ\n", gpio);
> +		dev_err(tegra_gpio_chip.parent,
> +			"unable to lock Tegra GPIO %d as IRQ\n", gpio);

Can't we get rid of the tegra_gpio_chip global variable altogether? We
set a struct tegra_gpio_bank * as the chip data for each of the
interrupts, so if we added a back link to the GPIO chip to each bank
we could easily get at the GPIO chip (and its parent device) from the
IRQ chip implementation.

>  		return ret;
>  	}
> =20
> @@ -465,8 +465,6 @@ static int tegra_gpio_probe(struct platform_device *p=
dev)
>  	int i;
>  	int j;
> =20
> -	dev =3D &pdev->dev;
> -
>  	config =3D of_device_get_match_data(&pdev->dev);
>  	if (!config) {
>  		dev_err(&pdev->dev, "Error: No device match found\n");
> @@ -488,6 +486,8 @@ static int tegra_gpio_probe(struct platform_device *p=
dev)
>  	}
> =20
>  	tegra_gpio_chip.ngpio =3D tegra_gpio_bank_count * 32;
> +	tegra_gpio_chip.parent =3D &pdev->dev;
> +

This adds a gratuitous blank line.

Thierry

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFiWQAAoJEN0jrNd/PrOhAXMQAJbleBYZZ6Cqez5u/aZE9uCy
Pgbhc5+rScbXPN4m/8Li55CrKvEflJb4GPyi8SYbh2lix2eUmomUFVyZ1q6+1zhe
T0mElS+CHYvSduW7u/0nkevvBT477e07VdWrpa16kO122AnxgyeSMeljXZEqB9yj
AKj+MnCh4U2vF08QqT3qJptxjoCiYqY0ClmgW81O9YS101aQG0R4ZGujhMA9fKm/
EGbWqDd/5riTty2oo79P0pvXDVbQc0DDWAcIjtXNePZONnhGmb1DuURqbq5TqF/5
1bzmq+Ra9rsNowh+xNvnlvoctA0blA5q9M2dugC2qbeFpPafbNrpJuxxTMZcabVD
QGJy1AWWxhPPGGjMGHJI8rOxHGXglaFpKWP97ZataCBQ4jyftNT42omQ60KRXAHy
NDCfoi618qD63jVPSqCOh0eg5/+mXH6EwbRgTHcp6rkRq5jA4tFGvT5fDyRWUiAV
IWDqTzvi6rjXQM+iixDDPAHeyc5OgwIqUc4hQ5JU6UVwP5vBcqQoARPjSWU/Tow+
My1x453FeDnAI3ynCe/z4/kT/N1u8ZjOrlZbVTMSrxBVw7oXGE+ZTOyRcr1ocgPz
Y0711YEtH1bgBxAYtgU4qa9ahuL0T9eqCOahV2KULocQMP4+HlmBexgOGf29ddGO
FyViGEKfVHE+sWys+FVT
=HZoa
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
