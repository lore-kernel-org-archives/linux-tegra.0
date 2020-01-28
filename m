From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V3 10/18] usb: gadget: tegra-xudc: Add usb-phy support
Date: Tue, 28 Jan 2020 19:02:13 +0100
Message-ID: <20200128180213.GH2293590@ulmo>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-11-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wayzTnRSUXKNfBqd"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1577704195-2535-11-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wayzTnRSUXKNfBqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2019 at 04:39:47PM +0530, Nagarjuna Kristam wrote:
> usb-phy is used to get notified on the USB role changes. Get usb-phy from
> the utmi phy.

s/utmi phy/UTMI PHY/

>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2-V3:
>  - No changes in this version
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 39 +++++++++++++++++++++++++++++++=
++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc=
/tegra-xudc.c
> index 6ddb974..0f27d57 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -26,7 +26,9 @@
>  #include <linux/reset.h>
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
> +#include <linux/usb/otg.h>
>  #include <linux/usb/role.h>
> +#include <linux/usb/phy.h>
>  #include <linux/workqueue.h>
> =20
>  /* XUSB_DEV registers */
> @@ -488,6 +490,9 @@ struct tegra_xudc {
>  	bool suspended;
>  	bool powergated;
> =20
> +	struct usb_phy *usbphy;
> +	struct notifier_block vbus_nb;
> +
>  	struct completion disconnect_complete;
> =20
>  	bool selfpowered;
> @@ -678,7 +683,22 @@ static void tegra_xudc_usb_role_sw_work(struct work_=
struct *work)
>  		tegra_xudc_device_mode_on(xudc);
>  	else
>  		tegra_xudc_device_mode_off(xudc);
> +}
> +
> +static int tegra_xudc_vbus_notifier(struct notifier_block *nb,
> +					 unsigned long action, void *data)
> +{
> +	struct tegra_xudc *xudc =3D container_of(nb, struct tegra_xudc,
> +					       vbus_nb);
> +
> +	dev_dbg(xudc->dev, "%s action is %ld\n", __func__, action);

I'd add the parentheses here, too. Maybe also a colon:

	"%s(): action is %ld\n"

> +
> +	xudc->role =3D (enum usb_role)action;
> =20
> +	if (!xudc->suspended)
> +		schedule_work(&xudc->usb_role_sw_work);
> +
> +	return NOTIFY_OK;
>  }
> =20
>  static void tegra_xudc_plc_reset_work(struct work_struct *work)
> @@ -1949,6 +1969,9 @@ static int tegra_xudc_gadget_start(struct usb_gadge=
t *gadget,
>  		xudc_writel(xudc, val, CTRL);
>  	}
> =20
> +	if (xudc->usbphy)
> +		otg_set_peripheral(xudc->usbphy->otg, gadget);
> +
>  	xudc->driver =3D driver;
>  unlock:
>  	dev_dbg(xudc->dev, "%s: ret value is %d", __func__, ret);
> @@ -1969,6 +1992,9 @@ static int tegra_xudc_gadget_stop(struct usb_gadget=
 *gadget)
> =20
>  	spin_lock_irqsave(&xudc->lock, flags);
> =20
> +	if (xudc->usbphy)
> +		otg_set_peripheral(xudc->usbphy->otg, NULL);
> +
>  	val =3D xudc_readl(xudc, CTRL);
>  	val &=3D ~(CTRL_IE | CTRL_ENABLE);
>  	xudc_writel(xudc, val, CTRL);
> @@ -3573,10 +3599,15 @@ static int tegra_xudc_probe(struct platform_devic=
e *pdev)
>  	INIT_DELAYED_WORK(&xudc->port_reset_war_work,
>  				tegra_xudc_port_reset_war_work);
> =20
> -	/* Set the mode as device mode and this keeps phy always ON */
> -	dev_info(xudc->dev, "Set usb role to device mode always");

This obsoletes my comment in the previous patch, but maybe consider not
adding it in the first place.

> -	xudc->role =3D USB_ROLE_DEVICE;
> -	schedule_work(&xudc->usb_role_sw_work);
> +	xudc->vbus_nb.notifier_call =3D tegra_xudc_vbus_notifier;
> +	xudc->usbphy =3D devm_usb_get_phy_by_node(xudc->dev,
> +						xudc->utmi_phy->dev.of_node,
> +						&xudc->vbus_nb);
> +	if (IS_ERR(xudc->usbphy)) {
> +		err =3D PTR_ERR(xudc->usbphy);
> +		dev_err(xudc->dev, "failed to get usbphy phy: %d\n", err);

I'd make this: "failed to get USB PHY: %d\n", which is easier to read
than the above.

Thierry

> +		goto free_eps;
> +	}
> =20
>  	pm_runtime_enable(&pdev->dev);
> =20
> --=20
> 2.7.4
>=20

--wayzTnRSUXKNfBqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4wdyQACgkQ3SOs138+
s6GaCRAAmrVKiyZCDWEDR3PdiJ3VE3YYPM3f58d1P0nRXp+vOyC4M7UXVag34+20
x4xZcLy48iV594Y+LDJ+2PW1rgkUrcTQD7ml5giSYU0FBwVsnlqThgamxakxoKVG
ifAVmyPeX0okwcIz3+5I/FGWUyiOhWFZmXxsIep5Qc6OjyyiSfS1W6xTJ8y+c4D0
yc0NHJbFzRbQE3H8FlZQxIK07YBbIQ9puTsuxFywHFhaodYc4ZMynTCXuzRWVyzD
1T4GRYQtarwzvMmzZOP5XxhAF2YXdAv3LoFf+5SKemNpr2vt7+wbPFK+uUFNQRE0
vRrcpDp+Dqc8t6Orz5RR8w5l3R/hjTIV/rsU4hASAw3Sz/YSRZs3Xuc9/z0XdBC/
AGKIIWbx45Twte0tGFqqcekRY7EhI7jfSF/Qd9FEP/xK07yc+uHAw2ezF+FbVJlE
zmSI8ZAcTawjaxPB9GPT/Y1NqJzKkc+fmH7DbeVJJ4db/17pED4uf9qjuS4qhVG7
1au429N1SZB/QQAmIbiuaE53xEnsP1WRrUAu8aJZaJpMFg7U1JSj8rKIRQ6kUq3O
cDvczjGJO9YWWeEF4uazbiR/x/MNovWGl4o8Yv/4tG6jL3fPjVZalIZzp39dwv0e
ovsEes/Q3vzrXMZwk+tdFRmNwiWDkjymzi1Q2zO/rBKhi/PKQHw=
=QHyJ
-----END PGP SIGNATURE-----

--wayzTnRSUXKNfBqd--
