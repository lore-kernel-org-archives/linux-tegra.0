From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 05/18] phy: tegra: xusb: Add support to get companion USB
 3 port
Date: Fri, 6 Dec 2019 15:57:40 +0100
Message-ID: <20191206145740.GE2085684@ulmo>
References: <1575629421-7039-1-git-send-email-nkristam@nvidia.com>
 <1575629421-7039-6-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HeFlAV5LIbMFYYuh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1575629421-7039-6-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--HeFlAV5LIbMFYYuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2019 at 04:20:08PM +0530, Nagarjuna Kristam wrote:
> Tegra XUSB host, device mode driver requires the USB 3 companion port
> number for corresponding USB 2 port. Add API to retrieve the same.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb.c       | 21 +++++++++++++++++++++
>  include/linux/phy/tegra/xusb.h |  2 ++
>  2 files changed, 23 insertions(+)
>=20
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 4c86c99..2e73cf8 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -1254,6 +1254,27 @@ int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
>  }
>  EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_port_reset);
> =20
> +int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padct=
l,
> +				    unsigned int port)
> +{
> +	struct tegra_xusb_usb2_port *usb2 =3D tegra_xusb_find_usb2_port(padctl,
> +								      port);
> +	struct tegra_xusb_usb3_port *usb3;
> +	int i;
> +
> +	if (!usb2)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < padctl->soc->ports.usb3.count; i++) {
> +		usb3 =3D tegra_xusb_find_usb3_port(padctl, i);
> +		if (usb3 && usb3->port =3D=3D usb2->base.index)
> +			return usb3->base.index;
> +	}
> +
> +	return -1;

Since you return -EINVAL above, callers will have to interpret negative
return values as standard errors, which would make this EPERM. That does
not really make sense. Perhaps something like -ENODEV would be more
appropriate in this case?

Thierry

> +}
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_get_usb3_companion);
> +
>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
>  MODULE_DESCRIPTION("Tegra XUSB Pad Controller driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xus=
b.h
> index 1235865..71d9569 100644
> --- a/include/linux/phy/tegra/xusb.h
> +++ b/include/linux/phy/tegra/xusb.h
> @@ -21,4 +21,6 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra=
_xusb_padctl *padctl,
>  int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
>  					bool val);
>  int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
> +int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padct=
l,
> +					 unsigned int port);
>  #endif /* PHY_TEGRA_XUSB_H */
> --=20
> 2.7.4
>=20

--HeFlAV5LIbMFYYuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3qbGQACgkQ3SOs138+
s6EBng//ZD1txYbayU7r8gWWPywLZYTWLkLPBVoXL2gb0lhitZLGZMtXVx7CyDKr
XAh4D1V7NqZBg8rSvmYNcEpCsybaZS8BFfKTqOQD9BO0TUIGVoKCzlcyh+OeuP4M
jN/v+rJprwWWjQbaZHsaKVydTJvjY4lngXubBnowibIg89ZDKJpZETSCR3h0bBEz
1Eos0KAbSOa6+s5yJ3nnNFbIvRM7NGDWECFXB18hR9H5koQ808qCw9+/s9qcaA9w
eNru53dXdPGhLRUFl+5AFoJBrkWwgweT/MJ2RZ616c6xGJgPXJbJHK32AsMGNnsc
1ubGAxO4/3Nd4rt5JfL+07yKyFDXSjx5KEsCSJOwx72q89+M1Hk6vJ/yq4U0Ngno
7icQaGNz9WnvO4Pf1WdNMaqmMZaGn5hMHV+hVc9j+Icks3ZhYpwnxcBy8KRd8p23
n223vdogFfx8kCSsoE6CXl0qJ5Eac1jZfjPlAhLQLmk6bnWdLc1WgiA8V5w4iuK8
7MQV0rKipFuEUfEMU70M5OsqRuqHIQX7YLk6q1/Nsg5T8D2h7MksVqvHGxVjvzoF
YJqu/HI/0rK0wSvO/0knMsWGnipb19tii0jOe7NRB6CwcTsr1rn0eoaSojRt0Xm5
SYfPnXB2+BOtcPFuSMpzkvC0U9yGIRTU4lVB8iNrdz4R/gkYRxo=
=CtXd
-----END PGP SIGNATURE-----

--HeFlAV5LIbMFYYuh--
