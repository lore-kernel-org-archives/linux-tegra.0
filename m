From: Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v3 15/16] usb: chipidea: tegra: Add USB_TEGRA_PHY to
 driver's dependencies
Date: Mon, 30 Dec 2019 02:25:01 +0000
Message-ID: <20191230022459.GD5283@b29397-desktop>
References: <20191228203358.23490-1-digetx@gmail.com>
 <20191228203358.23490-16-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228203358.23490-16-digetx@gmail.com>
Content-Language: en-US
Content-ID: <E439EE9989653A4D8683C7AE56AF83FC@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 19-12-28 23:33:57, Dmitry Osipenko wrote:
> Now, when ci_hdrc_tegra kernel module is loaded, the phy_tegra_usb module
> is loaded too regardless of kernel's configuration. Previously this
> problem was masked because Tegra's EHCI driver is usually enabled in
> kernel's config and thus PHY driver was getting loaded because of it, but
> now I was making some more thorough testing and noticed that PHY's module
> isn't getting auto-loaded without the host driver.
>=20
> Note that ChipIdea's driver doesn't use any of the exported functions of
> phy_tegra_usb module and thus the module needs to be requested explicitly=
.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/Kconfig         | 1 +
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 6 ++++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
> index ae850b3fddf2..d53db520e209 100644
> --- a/drivers/usb/chipidea/Kconfig
> +++ b/drivers/usb/chipidea/Kconfig
> @@ -7,6 +7,7 @@ config USB_CHIPIDEA
>  	select RESET_CONTROLLER
>  	select USB_ULPI_BUS
>  	select USB_ROLE_SWITCH
> +	select USB_TEGRA_PHY if ARCH_TEGRA
>  	help
>  	  Say Y here if your system has a dual role high speed USB
>  	  controller based on ChipIdea silicon IP. It supports:
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 7455df0ede49..8bc11100245d 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -53,6 +53,12 @@ static int tegra_udc_probe(struct platform_device *pde=
v)
>  	struct tegra_udc *udc;
>  	int err;
> =20
> +	if (IS_MODULE(CONFIG_USB_TEGRA_PHY)) {
> +		err =3D request_module("phy_tegra_usb");
> +		if (err)
> +			return err;
> +	}
> +
>  	udc =3D devm_kzalloc(&pdev->dev, sizeof(*udc), GFP_KERNEL);
>  	if (!udc)
>  		return -ENOMEM;
> --=20
> 2.24.0
>=20

Acked-by: Peter Chen <peter.chen@nxp.com>

--=20

Thanks,
Peter Chen=
