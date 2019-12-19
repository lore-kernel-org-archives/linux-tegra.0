From: Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v1 2/4] usb: phy: tegra: Hook up init/shutdown callbacks
Date: Thu, 19 Dec 2019 06:56:22 +0000
Message-ID: <20191219065619.GA19921@b29397-desktop>
References: <20191218175313.16235-1-digetx@gmail.com>
 <20191218175313.16235-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191218175313.16235-3-digetx@gmail.com>
Content-Language: en-US
Content-ID: <0CB838B09A557D448A0D56A5C91782AA@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 19-12-18 20:53:11, Dmitry Osipenko wrote:
> Generic PHY provides init/shutdown callbacks which allow USB-host drivers
> to abstract PHY's hardware management in a common way. This change allows
> to remove Tegra-specific PHY handling from the ChipIdea driver.
>=20
> Note that ChipIdea's driver shall be changed at the same time because it
> turns PHY ON without the PHY's initialization and this doesn't work now,
> resulting in a NULL dereference of phy->freq because it's set during of
> the PHY's initialization.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c |   9 --
>  drivers/usb/phy/phy-tegra-usb.c      | 165 +++++++++++++++++----------
>  2 files changed, 102 insertions(+), 72 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 0c9911d44ee5..7455df0ede49 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -83,13 +83,6 @@ static int tegra_udc_probe(struct platform_device *pde=
v)
>  		return err;
>  	}
> =20
> -	/*
> -	 * Tegra's USB PHY driver doesn't implement optional phy_init()
> -	 * hook, so we have to power on UDC controller before ChipIdea
> -	 * driver initialization kicks in.
> -	 */
> -	usb_phy_set_suspend(udc->phy, 0);
> -
>  	/* setup and register ChipIdea HDRC device */
>  	udc->data.name =3D "tegra-udc";
>  	udc->data.flags =3D soc->flags;
> @@ -109,7 +102,6 @@ static int tegra_udc_probe(struct platform_device *pd=
ev)
>  	return 0;
> =20
>  fail_power_off:
> -	usb_phy_set_suspend(udc->phy, 1);
>  	clk_disable_unprepare(udc->clk);
>  	return err;
>  }
> @@ -119,7 +111,6 @@ static int tegra_udc_remove(struct platform_device *p=
dev)
>  	struct tegra_udc *udc =3D platform_get_drvdata(pdev);
> =20
>  	ci_hdrc_remove_device(udc->dev);
> -	usb_phy_set_suspend(udc->phy, 1);
>  	clk_disable_unprepare(udc->clk);
> =20
>  	return 0;
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-=
usb.c
> index ea7ef1dc0b42..15bd253d53c9 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -238,23 +238,6 @@ static int utmip_pad_open(struct tegra_usb_phy *phy)
>  {
>  	int ret;
> =20
> -	phy->pad_clk =3D devm_clk_get(phy->u_phy.dev, "utmi-pads");
> -	if (IS_ERR(phy->pad_clk)) {
> -		ret =3D PTR_ERR(phy->pad_clk);
> -		dev_err(phy->u_phy.dev,
> -			"Failed to get UTMIP pad clock: %d\n", ret);
> -		return ret;
> -	}
> -
> -	phy->pad_rst =3D devm_reset_control_get_optional_shared(
> -						phy->u_phy.dev, "utmi-pads");
> -	if (IS_ERR(phy->pad_rst)) {
> -		ret =3D PTR_ERR(phy->pad_rst);
> -		dev_err(phy->u_phy.dev,
> -			"Failed to get UTMI-pads reset: %d\n", ret);
> -		return ret;
> -	}
> -
>  	ret =3D clk_prepare_enable(phy->pad_clk);
>  	if (ret) {
>  		dev_err(phy->u_phy.dev,
> @@ -315,6 +298,18 @@ static int utmip_pad_close(struct tegra_usb_phy *phy=
)
>  	return ret;
>  }

Acked-by: Peter Chen <peter.chen@nxp.com>

Felipe, would you please queue this series after reviewing for USB PHY
changes? If not, Dmitry may need to split the patch.

Peter
> =20
> +static void ulpi_close(struct tegra_usb_phy *phy)
> +{
> +	int err;
> +
> +	err =3D gpio_direction_output(phy->reset_gpio, 1);
> +	if (err < 0) {
> +		dev_err(phy->u_phy.dev,
> +			"ULPI reset GPIO %d direction not asserted: %d\n",
> +			phy->reset_gpio, err);
> +	}
> +}
> +
>  static void utmip_pad_power_on(struct tegra_usb_phy *phy)
>  {
>  	unsigned long val, flags;
> @@ -761,14 +756,19 @@ static int ulpi_phy_power_off(struct tegra_usb_phy =
*phy)
>  	return gpio_direction_output(phy->reset_gpio, 0);
>  }
> =20
> -static void tegra_usb_phy_close(struct tegra_usb_phy *phy)
> +static void tegra_usb_phy_close(struct usb_phy *u_phy)
>  {
> -	if (!IS_ERR(phy->vbus))
> -		regulator_disable(phy->vbus);
> +	struct tegra_usb_phy *phy =3D container_of(u_phy, struct tegra_usb_phy,
> +						 u_phy);
> =20
> -	if (!phy->is_ulpi_phy)
> +	if (phy->is_ulpi_phy)
> +		ulpi_close(phy);
> +	else
>  		utmip_pad_close(phy);
> =20
> +	if (!IS_ERR(phy->vbus))
> +		regulator_disable(phy->vbus);
> +
>  	clk_disable_unprepare(phy->pll_u);
>  }
> =20
> @@ -788,7 +788,7 @@ static int tegra_usb_phy_power_off(struct tegra_usb_p=
hy *phy)
>  		return utmi_phy_power_off(phy);
>  }
> =20
> -static int	tegra_usb_phy_suspend(struct usb_phy *x, int suspend)
> +static int tegra_usb_phy_suspend(struct usb_phy *x, int suspend)
>  {
>  	struct tegra_usb_phy *phy =3D container_of(x, struct tegra_usb_phy, u_p=
hy);
>  	if (suspend)
> @@ -801,54 +801,25 @@ static int ulpi_open(struct tegra_usb_phy *phy)
>  {
>  	int err;
> =20
> -	phy->clk =3D devm_clk_get(phy->u_phy.dev, "ulpi-link");
> -	if (IS_ERR(phy->clk)) {
> -		err =3D PTR_ERR(phy->clk);
> -		dev_err(phy->u_phy.dev, "Failed to get ULPI clock: %d\n", err);
> -		return err;
> -	}
> -
> -	err =3D devm_gpio_request(phy->u_phy.dev, phy->reset_gpio,
> -		"ulpi_phy_reset_b");
> -	if (err < 0) {
> -		dev_err(phy->u_phy.dev, "Request failed for GPIO %d: %d\n",
> -			phy->reset_gpio, err);
> -		return err;
> -	}
> -
>  	err =3D gpio_direction_output(phy->reset_gpio, 0);
>  	if (err < 0) {
>  		dev_err(phy->u_phy.dev,
> -			"GPIO %d direction not set to output: %d\n",
> +			"ULPI reset GPIO %d direction not deasserted: %d\n",
>  			phy->reset_gpio, err);
>  		return err;
>  	}
> =20
> -	phy->ulpi =3D otg_ulpi_create(&ulpi_viewport_access_ops, 0);
> -	if (!phy->ulpi) {
> -		dev_err(phy->u_phy.dev, "Failed to create ULPI OTG\n");
> -		err =3D -ENOMEM;
> -		return err;
> -	}
> -
> -	phy->ulpi->io_priv =3D phy->regs + ULPI_VIEWPORT;
>  	return 0;
>  }
> =20
> -static int tegra_usb_phy_init(struct tegra_usb_phy *phy)
> +static int tegra_usb_phy_init(struct usb_phy *u_phy)
>  {
> +	struct tegra_usb_phy *phy =3D container_of(u_phy, struct tegra_usb_phy,
> +						 u_phy);
>  	unsigned long parent_rate;
>  	int i;
>  	int err;
> =20
> -	phy->pll_u =3D devm_clk_get(phy->u_phy.dev, "pll_u");
> -	if (IS_ERR(phy->pll_u)) {
> -		err =3D PTR_ERR(phy->pll_u);
> -		dev_err(phy->u_phy.dev,
> -			"Failed to get pll_u clock: %d\n", err);
> -		return err;
> -	}
> -
>  	err =3D clk_prepare_enable(phy->pll_u);
>  	if (err)
>  		return err;
> @@ -884,8 +855,17 @@ static int tegra_usb_phy_init(struct tegra_usb_phy *=
phy)
>  	if (err < 0)
>  		goto fail;
> =20
> +	err =3D tegra_usb_phy_power_on(phy);
> +	if (err)
> +		goto close_phy;
> +
>  	return 0;
> =20
> +close_phy:
> +	if (phy->is_ulpi_phy)
> +		ulpi_close(phy);
> +	else
> +		utmip_pad_close(phy);
>  fail:
>  	clk_disable_unprepare(phy->pll_u);
>  	return err;
> @@ -1134,22 +1114,77 @@ static int tegra_usb_phy_probe(struct platform_de=
vice *pdev)
>  		tegra_phy->vbus =3D ERR_PTR(-ENODEV);
>  	}
> =20
> -	tegra_phy->u_phy.dev =3D &pdev->dev;
> -	err =3D tegra_usb_phy_init(tegra_phy);
> -	if (err < 0)
> +	tegra_phy->pll_u =3D devm_clk_get(&pdev->dev, "pll_u");
> +	err =3D PTR_ERR_OR_ZERO(tegra_phy);
> +	if (err) {
> +		dev_err(&pdev->dev, "Failed to get pll_u clock: %d\n", err);
>  		return err;
> +	}
> =20
> +	if (tegra_phy->is_ulpi_phy) {
> +		tegra_phy->clk =3D devm_clk_get(&pdev->dev, "ulpi-link");
> +		err =3D PTR_ERR_OR_ZERO(tegra_phy->clk);
> +		if (err) {
> +			dev_err(&pdev->dev,
> +				"Failed to get ULPI clock: %d\n", err);
> +			return err;
> +		}
> +
> +		err =3D devm_gpio_request(&pdev->dev, tegra_phy->reset_gpio,
> +			"ulpi_phy_reset_b");
> +		if (err < 0) {
> +			dev_err(&pdev->dev, "Request failed for GPIO %d: %d\n",
> +				tegra_phy->reset_gpio, err);
> +			return err;
> +		}
> +
> +		tegra_phy->ulpi =3D otg_ulpi_create(&ulpi_viewport_access_ops, 0);
> +		if (!tegra_phy->ulpi) {
> +			dev_err(&pdev->dev, "Failed to create ULPI OTG\n");
> +			err =3D -ENOMEM;
> +			return err;
> +		}
> +
> +		tegra_phy->ulpi->io_priv =3D tegra_phy->regs + ULPI_VIEWPORT;
> +	} else {
> +		tegra_phy->pad_clk =3D devm_clk_get(&pdev->dev, "utmi-pads");
> +		err =3D PTR_ERR_OR_ZERO(tegra_phy->pad_clk);
> +		if (err) {
> +			dev_err(&pdev->dev,
> +				"Failed to get UTMIP pad clock: %d\n", err);
> +			return err;
> +		}
> +
> +		tegra_phy->pad_rst =3D devm_reset_control_get_optional_shared(
> +						&pdev->dev, "utmi-pads");
> +		err =3D PTR_ERR_OR_ZERO(tegra_phy->pad_rst);
> +		if (err) {
> +			dev_err(&pdev->dev,
> +				"Failed to get UTMI-pads reset: %d\n", err);
> +			return err;
> +		}
> +	}
> +
> +	tegra_phy->u_phy.dev =3D &pdev->dev;
> +	tegra_phy->u_phy.init =3D tegra_usb_phy_init;
> +	tegra_phy->u_phy.shutdown =3D tegra_usb_phy_close;
>  	tegra_phy->u_phy.set_suspend =3D tegra_usb_phy_suspend;
> =20
>  	platform_set_drvdata(pdev, tegra_phy);
> =20
>  	err =3D usb_add_phy_dev(&tegra_phy->u_phy);
> -	if (err < 0) {
> -		tegra_usb_phy_close(tegra_phy);
> -		return err;
> -	}
> +	if (err < 0)
> +		goto free_ulpi;
> =20
>  	return 0;
> +
> +free_ulpi:
> +	if (tegra_phy->ulpi) {
> +		kfree(tegra_phy->ulpi->otg);
> +		kfree(tegra_phy->ulpi);
> +	}
> +
> +	return err;
>  }
> =20
>  static int tegra_usb_phy_remove(struct platform_device *pdev)
> @@ -1157,7 +1192,11 @@ static int tegra_usb_phy_remove(struct platform_de=
vice *pdev)
>  	struct tegra_usb_phy *tegra_phy =3D platform_get_drvdata(pdev);
> =20
>  	usb_remove_phy(&tegra_phy->u_phy);
> -	tegra_usb_phy_close(tegra_phy);
> +
> +	if (tegra_phy->ulpi) {
> +		kfree(tegra_phy->ulpi->otg);
> +		kfree(tegra_phy->ulpi);
> +	}
> =20
>  	return 0;
>  }
> --=20
> 2.24.0
>=20

--=20

Thanks,
Peter Chen=
