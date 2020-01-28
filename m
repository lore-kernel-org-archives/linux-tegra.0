From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V3 04/18] phy: tegra: xusb: Add usb-phy support
Date: Tue, 28 Jan 2020 18:38:40 +0100
Message-ID: <20200128173840.GB2293590@ulmo>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-5-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1577704195-2535-5-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2019 at 04:39:41PM +0530, Nagarjuna Kristam wrote:
> For USB 2 ports that has usb-role-switch enabled, add usb-phy for
> corresponding USB 2 phy. USB role changes from role switch are then
> updated to corresponding host and device mode drivers via usb-phy notifier
> block.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V3:
>  - Updated arguments and variable allignments as per Thierry inputs.
> ---
> V2:
>  - Added dev_set_drvdata for port->dev.
> ---
>  drivers/phy/tegra/xusb.c | 71 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.h |  2 ++
>  2 files changed, 76 insertions(+)
>=20
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 11ea9b5..536b2fc 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -533,6 +533,8 @@ static int tegra_xusb_port_init(struct tegra_xusb_por=
t *port,
>  	if (err < 0)
>  		goto unregister;
> =20
> +	dev_set_drvdata(&port->dev, port);
> +
>  	return 0;
> =20
>  unregister:
> @@ -545,6 +547,8 @@ static void tegra_xusb_port_unregister(struct tegra_x=
usb_port *port)
>  	if (!IS_ERR_OR_NULL(port->usb_role_sw)) {
>  		of_platform_depopulate(&port->dev);
>  		usb_role_switch_unregister(port->usb_role_sw);
> +		cancel_work_sync(&port->usb_phy_work);
> +		usb_remove_phy(&port->usb_phy);
>  	}
> =20
>  	device_unregister(&port->dev);
> @@ -563,15 +567,62 @@ static const char * const usb_roles[] =3D {
>  	[USB_ROLE_DEVICE]	=3D "device",
>  };
> =20
> +static void tegra_xusb_usb_phy_work(struct work_struct *work)
> +{
> +	struct tegra_xusb_port *port =3D container_of(work,
> +						    struct tegra_xusb_port,
> +						    usb_phy_work);
> +	enum usb_role role =3D usb_role_switch_get_role(port->usb_role_sw);
> +
> +	dev_dbg(&port->dev, "%s: calling notifier for role %s\n", __func__,
> +		usb_roles[role]);

Nit: I'd add parentheses into the above message, after %s, to highlight
that this is the name of a function.

> +
> +	atomic_notifier_call_chain(&port->usb_phy.notifier, role,
> +				   &port->usb_phy);
> +}
> +
>  static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role role)
>  {
> +	struct tegra_xusb_port *port =3D dev_get_drvdata(dev);
> +
>  	dev_dbg(dev, "%s: role %s\n", __func__, usb_roles[role]);
> =20
> +	schedule_work(&port->usb_phy_work);
> +
>  	return 0;
>  }
> =20
> +static int tegra_xusb_set_peripheral(struct usb_otg *otg,
> +				     struct usb_gadget *gadget)
> +{
> +	struct tegra_xusb_port *port =3D container_of(otg->usb_phy,
> +						    struct tegra_xusb_port,
> +						    usb_phy);
> +
> +	if (gadget !=3D NULL)
> +		schedule_work(&port->usb_phy_work);
> +
> +	return 0;
> +}
> +
> +static int tegra_xusb_set_host(struct usb_otg *otg, struct usb_bus *host)
> +{
> +	struct tegra_xusb_port *port =3D container_of(otg->usb_phy,
> +						    struct tegra_xusb_port,
> +						    usb_phy);
> +
> +	if (host !=3D NULL)
> +		schedule_work(&port->usb_phy_work);
> +
> +	return 0;
> +}
> +
> +
>  static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
>  {
> +	struct tegra_xusb_lane *lane =3D tegra_xusb_find_lane(port->padctl,
> +							    "usb2",
> +							    port->index);

Nit: This looks slightly awkward. It might be worth just declaring the
variable here and move the initialization to a separate line following
the declarations because then it fits on a single line.

>  	struct usb_role_switch_desc role_sx_desc =3D {
>  		.fwnode =3D dev_fwnode(&port->dev),
>  		.set =3D tegra_xusb_role_sw_set,
> @@ -587,6 +638,29 @@ static int tegra_xusb_setup_usb_role_switch(struct t=
egra_xusb_port *port)
>  		return err;
>  	}
> =20
> +	INIT_WORK(&port->usb_phy_work, tegra_xusb_usb_phy_work);
> +
> +	port->usb_phy.otg =3D devm_kzalloc(&port->dev,
> +					 sizeof(struct usb_otg), GFP_KERNEL);

Nit: typically you try to fill up a line as much as possible before you
wrap, so the sizeof(...) can go onto the first line.

> +	if (!port->usb_phy.otg)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Assign phy dev to usb-phy dev. Host/device drivers can use phy
> +	 * reference to retrieve usb-phy details.
> +	 */
> +	port->usb_phy.dev =3D &lane->pad->lanes[port->index]->dev;
> +	port->usb_phy.dev->driver =3D port->padctl->dev->driver;
> +	port->usb_phy.otg->usb_phy =3D &port->usb_phy;
> +	port->usb_phy.otg->set_peripheral =3D tegra_xusb_set_peripheral;
> +	port->usb_phy.otg->set_host =3D tegra_xusb_set_host;
> +
> +	err =3D usb_add_phy_dev(&port->usb_phy);
> +	if (err < 0) {
> +		dev_err(&port->dev, "Failed to add usbphy: %d\n", err);

Nit: "failed to add USB PHY: %d\n", to make this more consistent with
the existing error messages.

Other than that, looks great:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4wcZ8ACgkQ3SOs138+
s6EffQ//UdnjEtNVNKfHdQYj5Uj6j5MwVFl6K4Yqba6a/Ju5y/BTc0QCJ4qbInsj
w6g19X3jypklMuswztnYQEWsvfh2RHQ5nt734acXM8pBYMWQP+3OhRR/KZI1I4LP
pMyhpghZ8fIV5bCiu51+eN8ak5qtFj/YmLlgCOFQu5WwcLd/J+/q5j0UWoAhn/d0
G2PpyFQjyy34y4VCEgbVjCrk4vYhzsRYca1cLvDYYX0bGRHHelPqlhlf2wz12M/w
osJF0B7XRTNi7+neoqMQDfjNLYs9OtqNn0GkyrzN0dXhhVGN+kUD5eF5kf+gSYJC
a6rJXHM56IKWrrnEhc5BqFO6CIEyjMWdTTLvd8a1z92DdWorpav8o7iQl8NkIXFf
8vJv78HCq1pzpMzrYFsvYLnKPM1oP7tOyHUdXLqefhzKE6Dl2qdYw0S/kB7MxBr8
vyO5sVTvY64WY8iXnQklMaJiw7tqfsScJSNeF3Z+R1rfKbCuJfhqXmPDTfbCn6Ht
3YMxHSBtCLJ642sID0VQQEfmHPhpMhS6jhBTXtD9RDt8EdwSTT8n8yiXJBKPadd3
WGNLWTtiG9DNWX8AzXYkz4Xm49MUJ9zSTjuAs3AbKkG6scNnJECgsM4hxxfiw9sI
mPnC6+OqfxMGJkMR5civhYF66mfumx3ZpegxWTcjAsjjsIwH9Og=
=wSAb
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
