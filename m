From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V3 09/18] usb: gadget: tegra-xudc: Remove usb-role-switch
 support
Date: Tue, 28 Jan 2020 18:58:03 +0100
Message-ID: <20200128175803.GG2293590@ulmo>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-10-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uc35eWnScqDcQrv5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1577704195-2535-10-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--uc35eWnScqDcQrv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2019 at 04:39:46PM +0530, Nagarjuna Kristam wrote:
> Padctl driver will act as a central driver to receive USB role changes via
> usb-role-switch. This is updated to corresponding host, device drivers.
> Hence remove usb-role-switch from XUDC driver.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2-V3:
>  - No changes in this version
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 65 ++++++++++---------------------=
------
>  1 file changed, 17 insertions(+), 48 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc=
/tegra-xudc.c
> index 634c2c1..6ddb974 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -477,8 +477,8 @@ struct tegra_xudc {
> =20
>  	struct clk_bulk_data *clks;
> =20
> -	enum usb_role device_mode;
> -	struct usb_role_switch *usb_role_sw;
> +	enum usb_role role;
> +	bool device_mode;
>  	struct work_struct usb_role_sw_work;
> =20
>  	struct phy *usb3_phy;
> @@ -596,6 +596,8 @@ static void tegra_xudc_device_mode_on(struct tegra_xu=
dc *xudc)
>  {
>  	int err;
> =20
> +	if (xudc->device_mode)
> +		return;

Could use an extra blank line after the block.

>  	pm_runtime_get_sync(xudc->dev);
> =20
>  	err =3D phy_power_on(xudc->utmi_phy);
> @@ -610,7 +612,8 @@ static void tegra_xudc_device_mode_on(struct tegra_xu=
dc *xudc)
> =20
>  	tegra_xusb_padctl_set_vbus_override(xudc->padctl, true);
> =20
> -	xudc->device_mode =3D USB_ROLE_DEVICE;
> +	xudc->device_mode =3D true;
> +

But this blank line is gratuituous.

>  }
> =20
>  static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
> @@ -619,6 +622,9 @@ static void tegra_xudc_device_mode_off(struct tegra_x=
udc *xudc)
>  	u32 pls, val;
>  	int err;
> =20
> +	if (!xudc->device_mode)
> +		return;
> +
>  	dev_dbg(xudc->dev, "device mode off\n");
> =20
>  	connected =3D !!(xudc_readl(xudc, PORTSC) & PORTSC_CCS);
> @@ -643,7 +649,7 @@ static void tegra_xudc_device_mode_off(struct tegra_x=
udc *xudc)
>  		xudc_writel(xudc, val, PORTSC);
>  	}
> =20
> -	xudc->device_mode =3D USB_ROLE_NONE;
> +	xudc->device_mode =3D false;
> =20
>  	/* Wait for disconnect event. */
>  	if (connected)
> @@ -668,31 +674,13 @@ static void tegra_xudc_usb_role_sw_work(struct work=
_struct *work)
>  	struct tegra_xudc *xudc =3D container_of(work, struct tegra_xudc,
>  					       usb_role_sw_work);
> =20
> -	if (!xudc->usb_role_sw ||
> -		usb_role_switch_get_role(xudc->usb_role_sw) =3D=3D USB_ROLE_DEVICE)
> +	if (xudc->role =3D=3D USB_ROLE_DEVICE)
>  		tegra_xudc_device_mode_on(xudc);
>  	else
>  		tegra_xudc_device_mode_off(xudc);
> =20
>  }
> =20
> -static int tegra_xudc_usb_role_sw_set(struct device *dev, enum usb_role =
role)
> -{
> -	struct tegra_xudc *xudc =3D dev_get_drvdata(dev);
> -	unsigned long flags;
> -
> -	dev_dbg(dev, "%s role is %d\n", __func__, role);
> -
> -	spin_lock_irqsave(&xudc->lock, flags);
> -
> -	if (!xudc->suspended)
> -		schedule_work(&xudc->usb_role_sw_work);
> -
> -	spin_unlock_irqrestore(&xudc->lock, flags);
> -
> -	return 0;
> -}
> -
>  static void tegra_xudc_plc_reset_work(struct work_struct *work)
>  {
>  	struct delayed_work *dwork =3D to_delayed_work(work);
> @@ -729,8 +717,7 @@ static void tegra_xudc_port_reset_war_work(struct wor=
k_struct *work)
> =20
>  	spin_lock_irqsave(&xudc->lock, flags);
> =20
> -	if ((xudc->device_mode =3D=3D USB_ROLE_DEVICE)
> -			      && xudc->wait_for_sec_prc) {
> +	if (xudc->device_mode && xudc->wait_for_sec_prc) {
>  		pls =3D (xudc_readl(xudc, PORTSC) & PORTSC_PLS_MASK) >>
>  			PORTSC_PLS_SHIFT;
>  		dev_dbg(xudc->dev, "pls =3D %x\n", pls);
> @@ -3457,7 +3444,6 @@ static int tegra_xudc_probe(struct platform_device =
*pdev)
>  {
>  	struct tegra_xudc *xudc;
>  	struct resource *res;
> -	struct usb_role_switch_desc role_sx_desc =3D { 0 };
>  	unsigned int i;
>  	int err;
> =20
> @@ -3587,23 +3573,10 @@ static int tegra_xudc_probe(struct platform_devic=
e *pdev)
>  	INIT_DELAYED_WORK(&xudc->port_reset_war_work,
>  				tegra_xudc_port_reset_war_work);
> =20
> -	if (of_property_read_bool(xudc->dev->of_node, "usb-role-switch")) {
> -		role_sx_desc.set =3D tegra_xudc_usb_role_sw_set;
> -		role_sx_desc.fwnode =3D dev_fwnode(xudc->dev);
> -
> -		xudc->usb_role_sw =3D usb_role_switch_register(xudc->dev,
> -							&role_sx_desc);
> -		if (IS_ERR(xudc->usb_role_sw)) {
> -			err =3D PTR_ERR(xudc->usb_role_sw);
> -			dev_err(xudc->dev, "Failed to register USB role SW: %d",
> -					   err);
> -			goto free_eps;
> -		}
> -	} else {
> -		/* Set the mode as device mode and this keeps phy always ON */
> -		dev_info(xudc->dev, "Set usb role to device mode always");
> -		schedule_work(&xudc->usb_role_sw_work);
> -	}
> +	/* Set the mode as device mode and this keeps phy always ON */
> +	dev_info(xudc->dev, "Set usb role to device mode always");

This doesn't seem useful. This is going to be always printed, but it's
not a special case or anything. If it's normal behaviour, no need to
explicitly mention it.

Thierry

> +	xudc->role =3D USB_ROLE_DEVICE;
> +	schedule_work(&xudc->usb_role_sw_work);
> =20
>  	pm_runtime_enable(&pdev->dev);
> =20
> @@ -3643,11 +3616,7 @@ static int tegra_xudc_remove(struct platform_devic=
e *pdev)
>  	pm_runtime_get_sync(xudc->dev);
> =20
>  	cancel_delayed_work(&xudc->plc_reset_work);
> -
> -	if (xudc->usb_role_sw) {
> -		usb_role_switch_unregister(xudc->usb_role_sw);
> -		cancel_work_sync(&xudc->usb_role_sw_work);
> -	}
> +	cancel_work_sync(&xudc->usb_role_sw_work);
> =20
>  	usb_del_gadget_udc(&xudc->gadget);
> =20
> --=20
> 2.7.4
>=20

--uc35eWnScqDcQrv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4wdisACgkQ3SOs138+
s6H6xRAArJGVRB+GkU3P40fijPlK0JeeXNX1gv3gYvkEqKEhNh2EHt4Q0INH9z7b
BdtKuwAy3mMuCT2CuL4gAyi6OlFhLPt2W9t7ZZLfwOd5jEXCGS1VJtIlCaH0t3MC
DTf+5DpOKikXK7Sz4sVtDc9MK2UHSsZpuuFsDGJBgDe2WXgyAdMH2sM3I2WK6EHi
ot1L7MIxftkHSneBNCbD+Fh1sghgVp1NXEuMl19yoBpkqPFwaUygSrpoM9yDpZ3e
oquOBY5ai7LC4C4a6CaLfV12/j61HJY8uDjVoJOD/gJDMegeSOV4oDnujh4CAkos
26qxoYrvUub/yp8ImxvKe+aOrKxnl1YxLXqp/xKBh33EwnuF8qeyy9bJHMXPWqny
1AYH+DBqX34c+hU7RtwGFnGz8a18RBNkgtWV4gMD2Dz/09jqyU6+rF6XfrABdp1b
QwQWdAKLCmXy26TqTZzZoj/0jQNpLlWsBsTkU1UTEOjylCJYJE/iTmzdscpLt5VD
OkFxILQLZD7GVQcLqrE2b3OxKMmEIhKakJ2AtN+4wk5DYMu+0FVvjTDS1255L1xj
6dyMEffCzYK+elFcRrMeB3Z5Lq+9GvXq9a3erBO4S7y+2xrRS+QEf7Swqleu8MzS
ORjZgCsz/vGX1mbqMBXjdMgiZ1eJuKt7UNUM6jcY4+qUg8I3ngo=
=fDEh
-----END PGP SIGNATURE-----

--uc35eWnScqDcQrv5--
