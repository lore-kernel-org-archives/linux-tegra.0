From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V3 07/18] phy: tegra: xusb: Add set_mode support for utmi
 phy on Tegra186
Date: Tue, 28 Jan 2020 18:45:06 +0100
Message-ID: <20200128174506.GE2293590@ulmo>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-8-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r7U+bLA8boMOj+mD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1577704195-2535-8-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--r7U+bLA8boMOj+mD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2019 at 04:39:44PM +0530, Nagarjuna Kristam wrote:
> Add support for set_mode on utmi phy. This allow XUSB host/device mode
> drivers to configure the hardware to corresponding modes.

"utmi" -> "UTMI" in the subject and the commit message.

>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2-V3:
>  - No changes in this version
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 109 ++++++++++++++++++++++++++++++--=
------
>  1 file changed, 87 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> index 84c2739..9a45160 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -301,6 +301,92 @@ static void tegra_phy_xusb_utmi_pad_power_down(struc=
t phy *phy)
>  	tegra186_utmi_bias_pad_power_off(padctl);
>  }
> =20
> +static int tegra186_xusb_padctl_vbus_override(struct tegra_xusb_padctl *=
padctl,
> +					       bool status)
> +{
> +	u32 value;
> +
> +	dev_dbg(padctl->dev, "%s vbus override\n", status ? "set" : "clear");
> +
> +	value =3D padctl_readl(padctl, USB2_VBUS_ID);
> +
> +	if (status) {
> +		value |=3D VBUS_OVERRIDE;
> +		value &=3D ~ID_OVERRIDE(~0);
> +		value |=3D ID_OVERRIDE_FLOATING;
> +	} else {
> +		value &=3D ~VBUS_OVERRIDE;
> +	}
> +
> +	padctl_writel(padctl, value, USB2_VBUS_ID);
> +
> +	return 0;
> +}
> +
> +static int tegra186_xusb_padctl_id_override(struct tegra_xusb_padctl *pa=
dctl,
> +					    bool status)
> +{
> +	u32 value;
> +
> +	dev_dbg(padctl->dev, "%s id override\n", status ? "set" : "clear");
> +
> +	value =3D padctl_readl(padctl, USB2_VBUS_ID);
> +
> +	if (status) {
> +		if (value & VBUS_OVERRIDE) {
> +			value &=3D ~VBUS_OVERRIDE;
> +			padctl_writel(padctl, value, USB2_VBUS_ID);
> +			usleep_range(1000, 2000);
> +
> +			value =3D padctl_readl(padctl, USB2_VBUS_ID);
> +		}
> +
> +		value &=3D ~ID_OVERRIDE(~0);
> +		value |=3D ID_OVERRIDE_GROUNDED;
> +	} else {
> +		value &=3D ~ID_OVERRIDE(~0);
> +		value |=3D ID_OVERRIDE_FLOATING;
> +	}
> +
> +	padctl_writel(padctl, value, USB2_VBUS_ID);
> +
> +	return 0;
> +}
> +
> +static int tegra186_utmi_phy_set_mode(struct phy *phy, enum phy_mode mod=
e,
> +				      int submode)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +	struct tegra_xusb_usb2_port *port =3D tegra_xusb_find_usb2_port(padctl,
> +								lane->index);
> +	int err =3D 0;
> +
> +	mutex_lock(&padctl->lock);
> +
> +	dev_dbg(&port->base.dev, "%s: mode %d", __func__, mode);
> +
> +	if (mode =3D=3D PHY_MODE_USB_OTG) {
> +		if (submode =3D=3D USB_ROLE_HOST) {
> +			tegra186_xusb_padctl_id_override(padctl, true);
> +
> +			err =3D regulator_enable(port->supply);
> +		} else if (submode =3D=3D USB_ROLE_DEVICE) {
> +			tegra186_xusb_padctl_vbus_override(padctl, true);
> +		} else if (submode =3D=3D USB_ROLE_NONE) {
> +			if (regulator_is_enabled(port->supply))

I vaguely recall that we discussed this before, but I don't recall. Why
do we need to check that the regulator is enabled? Regulators are
reference-counted, so as long as the reference count is balanced, there
should be no need to check for this.

If there's really no way to avoid this check, perhaps add a comment that
points out exactly why this is needed?

With that fixed:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--r7U+bLA8boMOj+mD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4wcyIACgkQ3SOs138+
s6E37Q//bbam3CY/x1HTAfm1BwM7131zZzp7TC9NqqFuDL7ie5bJ+EZ/JaEeZTwp
4gfAOPTtzGO3zMFUh8pBCwGuNiUpJtwQMgddekFWeQqeo4R1ssWOSOvYrnVVIt+N
vhcG29TTUQ0EHGUwnJbkB8AG811QauUGXgjA+mabg7fUt91/W9T4gbsgeXCyVtfg
UTjDjhy1Anx8dMaMWrEygse2tnXpXOCZ23YJVr6r3ssxy5+YzP4D81xuhkMLnf9Y
6SSnTgvVwRKVbTeTydl1RlKmvEDJf6DqgpcORh4HGouCFwZL96pK1witeJAXcpjj
3xPH1l5K4VSEWM+c1UQR6UXyHajv6FCmk5By2uoRscrcsObp2JxoEMO/Ofj60kpx
7HChBDhGu2Tg/m3w3tLoZg/DQDVvn+gVwaoqcPSvZC7/fklKB3tXMHkSZOj4qFmp
y4j1EkdzRPhN4cvFl+bRUYk0/dqlOr48SpiZvo5OqxVV/bJDcdl1qKNViw6hSVUh
Ezs77PGwD1xKmur6Mge4qiUVvxfECmKcsqa/Bzmn/DgCTpFDSwuDx4Ehqkq19nI+
dKcpPDIA8WMPXwLagQCTSedosaTE5Nxkgw9IWrnUJuAgZr7dPopEzcwAG19mMqun
8po9CavfSDm4hesW1+T1BK70alG1ykujHWSUTUjVBD2pwYeeCas=
=ILly
-----END PGP SIGNATURE-----

--r7U+bLA8boMOj+mD--
