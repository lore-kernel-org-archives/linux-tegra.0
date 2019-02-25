From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v1] usb: chipidea: tegra: Fix missed
 ci_hdrc_remove_device()
Date: Mon, 25 Feb 2019 02:27:19 +0000
Message-ID: <VI1PR04MB5327FE97DC8C68B4D56DE0A98B7A0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190224153622.8877-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190224153622.8877-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

=20
>=20
> Fixes: dfebb5f43a78827a ("usb: chipidea: Add support for Tegra20/30/114/1=
24")

I suppose you need to apply at stable tree too, right?

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c
> b/drivers/usb/chipidea/ci_hdrc_tegra.c
> index 772851bee99b..12025358bb3c 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -130,6 +130,7 @@ static int tegra_udc_remove(struct platform_device *p=
dev)
> {
>  	struct tegra_udc *udc =3D platform_get_drvdata(pdev);
>=20
> +	ci_hdrc_remove_device(udc->dev);
>  	usb_phy_set_suspend(udc->phy, 1);
>  	clk_disable_unprepare(udc->clk);
>=20
=20
Acked-by: Peter Chen <peter.chen@nxp.com>

Hi Greg, would you still accept the bug-fix for this release (v5.0)? Or I s=
end you later?

Peter
