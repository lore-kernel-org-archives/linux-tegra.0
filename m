From: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Date: Fri, 31 Jan 2020 05:27:17 +0000
Message-ID: <20200131052716.GA30672@b29397-desktop>
References: <20200127023548.27107-1-pgwipeout@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200127023548.27107-1-pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Content-ID: <6A4B4B302F48934DA0D49F700EDD2297-jdb/QiT5osKcE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 20-01-26 21:35:48, Peter Geis wrote:
> The ci_hdrc_tegra driver does not currently support dual role mode, but
> it does not explicitly prevent its use.
> Certain devices support dual role mode, but not automatic role switch.
> This can cause the device to lock up during initialization of the
> driver.

If the driver only supports peripheral mode, you could set dr_mode as
peripheral-only at glue layer, it would not be override by core.c.
See ci_get_platdata.

But one thing I could not understand, if the driver doesn't support
dual-role, how could you do manual role switch?

>=20
> Detect this state by checking for the extcon phandle when dual role mode
> is set to otg.
> If it doesn't exist request the driver to only enable manual role
> switching.
>=20
> Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")
> Signed-off-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 7455df0ede49..2f6f6ce3e8f5 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -89,6 +89,13 @@ static int tegra_udc_probe(struct platform_device *pde=
v)
>  	udc->data.usb_phy =3D udc->phy;
>  	udc->data.capoffset =3D DEF_CAPOFFSET;
> =20
> +	/* check the dual mode and warn about bad configurations */
> +	if (usb_get_dr_mode(&pdev->dev) =3D=3D USB_DR_MODE_OTG &&
> +	   !of_property_read_bool(pdev->dev.of_node, "extcon")) {
> +		dev_warn(&pdev->dev, "no extcon registered, otg unavailable");
> +		udc->data.flags |=3D CI_HDRC_DUAL_ROLE_NOT_OTG;
> +	}
> +

The CI_HDRC_DUAL_ROLE_NOT_OTG flag may not be suitable here, please see
comments for it.
=20
>  	udc->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
>  				      pdev->num_resources, &udc->data);
>  	if (IS_ERR(udc->dev)) {
> --=20
> 2.17.1
>=20

--=20

Thanks,
Peter Chen=
