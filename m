From: Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v3 14/16] usb: chipidea: tegra: Stop managing PHY's power
Date: Mon, 30 Dec 2019 02:24:40 +0000
Message-ID: <20191230022437.GC5283@b29397-desktop>
References: <20191228203358.23490-1-digetx@gmail.com>
 <20191228203358.23490-15-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228203358.23490-15-digetx@gmail.com>
Content-Language: en-US
Content-ID: <CA1EFAA76B873D4EB7085D0BBD969BC1@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 19-12-28 23:33:56, Dmitry Osipenko wrote:
> Tegra's USB PHY driver now provides generic PHY init/shutdown callbacks
> and thus the custom PHY management could be removed from Tegra-specific
> part of the ChipIdea driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 9 ---------
>  1 file changed, 9 deletions(-)
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
> --=20
> 2.24.0
>=20

Acked-by: Peter Chen <peter.chen@nxp.com>

--=20

Thanks,
Peter Chen=
