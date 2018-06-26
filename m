From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH] usb: chipidea: tegra: Use aligned DMA on Tegra114/124
Date: Tue, 26 Jun 2018 02:22:42 +0000
Message-ID: <HE1PR04MB1450E820FEC8C9B31251057E8B490@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <20180625075843.31878-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180625075843.31878-1-marcel@ziswiler.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-tegra@vger.kernel.org

=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 7f4d2b6af37a..772851bee99b 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -33,11 +33,11 @@ static const struct tegra_udc_soc_info
> tegra30_udc_soc_info =3D {  };
>=20
>  static const struct tegra_udc_soc_info tegra114_udc_soc_info =3D {
> -	.flags =3D 0,
> +	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
>  };
>=20
>  static const struct tegra_udc_soc_info tegra124_udc_soc_info =3D {
> -	.flags =3D 0,
> +	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
>  };
>=20
>  static const struct of_device_id tegra_udc_of_match[] =3D {
> --

Applied, thanks.

Peter
