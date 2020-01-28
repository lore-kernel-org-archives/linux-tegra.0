From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V3 05/18] phy: tegra: xusb: Add support to get companion
 USB 3 port
Date: Tue, 28 Jan 2020 18:40:51 +0100
Message-ID: <20200128174051.GC2293590@ulmo>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-6-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1577704195-2535-6-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2019 at 04:39:42PM +0530, Nagarjuna Kristam wrote:
> Tegra XUSB host, device mode driver requires the USB 3 companion port
> number for corresponding USB 2 port. Add API to retrieve the same.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V3:
>  - Added Reviewed-by updates to commit message.
> ---
> V2:
>  - Added -ENODEV as return instead of -1, to sync other errors.
> ---
>  drivers/phy/tegra/xusb.c       | 21 +++++++++++++++++++++
>  include/linux/phy/tegra/xusb.h |  2 ++
>  2 files changed, 23 insertions(+)
>=20
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 536b2fc..80dbc57 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -1274,6 +1274,27 @@ int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
>  }
>  EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_port_reset);
> =20
> +int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padct=
l,
> +				    unsigned int port)
> +{
> +	struct tegra_xusb_usb2_port *usb2 =3D tegra_xusb_find_usb2_port(padctl,
> +								      port);

Nit: may be better to move the initialization of the variable to below,
right before the line that checks the validity of the pointer.

Other than that, looks good:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4wciMACgkQ3SOs138+
s6FkZA/9FHtGkDhpfIWIFxolCiSJnOiP9ZEL76PdXvDTBl0QMD7W+HEEOP7y320y
kLMJ+0tVLMwO2G2ArlIxEL2n+/yqzgmekiF5tG2ERDjqss0xK7Kekw0CeGC2yRof
rx0Nf1y3AMXt92Gsc8W+bGFDIu/3LuUHpfLMBa/wktTW53C87znLtFfdHIz5Jkk8
+0B2eLoPqoRB9B0AN0d4R6rHX4RplD7teD8N4a1BNhLIgt1nQRCDUdmkp51AAnfU
wAUAeAUtHJfLAusc4W7Xy1hVyW2IwX2C2AvCdA8nM6DJozNBnjPy9OsP4Tv7i3Rs
sSXSckeEDFVB7G2XUivcD96oKpE2CRrv4sD7Ru/94S9X6TotMlboUl/0LE3pM0Dr
naPJ8xSBeWPhtKwd3rm3AQ0ajUx8KEXs3otfm8lIG0aTQ34PYXapbIo58xumM/zh
p6IHHFWBuc0B7jv08+7XxUs3agcjRVlaDlmGv48Ku91rZkUZXHHEc5QRJfnl7FEQ
Z6Jgozux8EQXFuGm5O8xOusG0G+NuQXrljCEnf9PTTfNfQeZ0bpqeuvXT/3uByM/
+3pDDCaMjsy0CYPCpKsca3dWaoxsm4+mzcaECFXZWFqbPLxdzNYB3nVhcC3COlXe
ARlhLHHOdiNSqhveiPdYLffPNnqbdfmNGpdtbb1k0fEtXCbYGBs=
=yeBp
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--
