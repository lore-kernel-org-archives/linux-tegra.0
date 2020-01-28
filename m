From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V3 03/18] phy: tegra: xusb: Add usb-role-switch support
Date: Tue, 28 Jan 2020 18:32:44 +0100
Message-ID: <20200128173244.GA2293590@ulmo>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-4-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1577704195-2535-4-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2019 at 04:39:40PM +0530, Nagarjuna Kristam wrote:
> If usb-role-switch property is present in USB 2 port, register
> usb-role-switch to receive usb role changes.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V3:
>  - Driver aborts if usb-role-switch is not added in dt forotg/peripheral
>    roles.
>  - Added role name strings instead of enum values in debug prints.
>  - Updated arguments and variable allignments as per Thierry inputs.
> ---
> V2:
>  - Removed dev_set_drvdata for port->dev.
>  - Added of_platform_depopulate during error handling and driver removal.
> ---
>  drivers/phy/tegra/Kconfig |  1 +
>  drivers/phy/tegra/xusb.c  | 57 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.h  |  3 +++
>  3 files changed, 61 insertions(+)
>=20
> diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
> index f9817c3..df07c4d 100644
> --- a/drivers/phy/tegra/Kconfig
> +++ b/drivers/phy/tegra/Kconfig
> @@ -2,6 +2,7 @@
>  config PHY_TEGRA_XUSB
>  	tristate "NVIDIA Tegra XUSB pad controller driver"
>  	depends on ARCH_TEGRA
> +	select USB_CONN_GPIO
>  	help
>  	  Choose this option if you have an NVIDIA Tegra SoC.
> =20
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index f98ec39..11ea9b5 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -523,6 +523,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_por=
t *port,
>  	port->dev.type =3D &tegra_xusb_port_type;
>  	port->dev.of_node =3D of_node_get(np);
>  	port->dev.parent =3D padctl->dev;
> +	port->dev.driver =3D padctl->dev->driver;

This looks wrong. I don't think driver's are supposed to set this
because it basically means that the device is being attached to the
driver, but in this case it doesn't get probed by the driver and in
fact the ports don't match the pad controller, so they can't really
be driven by the same driver.

Is there any particular reason why you need this?

Thierry

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4wcDkACgkQ3SOs138+
s6FsghAAoD/UomjaeZd8bY2R43NpHXrHIRhlcnRJUrm2NQzod8kdj9tkUH093usf
t+oPi+lizbJqV3P8wJUrk0wNPAz1B+2TchrcpuWXzc/orwcMhQVhV4Vw/B3psEo3
jxL0UE5bhSdErLS4enDP8lu9XiKfDBM5rXwroRYYWogQK86I3RLPeW+WJEzLbDfR
gJH47XBA7ZMTP3EmBXd92NZZA0+2CSiAjwoT5QC4+EJpYdhJTDPjmxQbZY/dHB37
TKu7s1tJMSz14Vkypgh2ExUufbk+f3JlYEka2R+DWXHSN3e2vLixoMtVIwYlaM33
AWAlBHW7iJPxGmoZLY3QyjF3fZOMvOzRRI/GwIbY+F6kwPFEiZHmoPruBVLKyg4a
4q0hkBD/O2Q/8A/boju/7eUVw3WXRFzVvSYHoKVvl3rsY6o4hIlAuGj6crkaDarh
gPJYvJh6eDY5snTEM98/Xmrme82PKLaXJGcf8FBZ1ZCUQoak4EX2mop+30Ml38Ly
ABLHIaubha4ciqJ4DZwX5lwuUQyEXSgr1IKeLklGBuIvK6ffvsjSK9fYHasGUrmz
V2W+urskYuFQPefo0zND/vBGFtYTWbFz+cQxNWz/F4uU1j8adbVb5txSgOleRutF
lXfIGLpnOk+eGhf/it6b6phm/AKz2FgJt3d2E4xNMq27JuMUsuk=
=nbqn
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
