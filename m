From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 5/8] phy: tegra: xusb: Add soc ops API to enable UTMI
 PAD protection
Date: Tue, 28 Apr 2020 12:15:15 +0200
Message-ID: <20200428101515.GE3592148@ulmo>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-6-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1586939108-10075-6-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 01:55:05PM +0530, Nagarjuna Kristam wrote:
> When USB charger is enabled, UTMI PAD needs to be protected according
> to the direction and current level. Add support for the same on Tegra210
> and Tegra186.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V2:
>  - Commit message coorected.
>  - Patch re-based.
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 40 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb-tegra210.c | 31 ++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.h          | 13 +++++++++++++
>  3 files changed, 84 insertions(+)

Oh wait... you're not actually adding custom public APIs for this but
are simply wiring this through the SoC-specific code. Okay, that seems
fine to me.

Ignore my comments on the prior two patches.

> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> index f862254..03bdb5b 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -68,6 +68,13 @@
>  #define   PORTX_SPEED_SUPPORT_MASK		(0x3)
>  #define     PORT_SPEED_SUPPORT_GEN1		(0x0)
> =20
> +#define USB2_BATTERY_CHRG_OTGPADX_CTL1(x)       (0x84 + (x) * 0x40)
> +#define  PD_VREG                                (1 << 6)
> +#define  VREG_LEV(x)                            (((x) & 0x3) << 7)
> +#define  VREG_DIR(x)                            (((x) & 0x3) << 11)
> +#define  VREG_DIR_IN                            VREG_DIR(1)
> +#define  VREG_DIR_OUT                           VREG_DIR(2)
> +
>  #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x)	(0x88 + (x) * 0x40)
>  #define  HS_CURR_LEVEL(x)			((x) & 0x3f)
>  #define  TERM_SEL				BIT(25)
> @@ -289,6 +296,37 @@ static void tegra_phy_xusb_utmi_pad_power_down(struc=
t phy *phy)
>  	usb2->powered_on =3D false;
>  }
> =20
> +static void tegra186_xusb_padctl_utmi_pad_set_protection_level(
> +				struct tegra_xusb_port *port, int level,
> +				enum tegra_vbus_dir dir)

It's more idiomatic to wrap after the return type and while at it,
perhaps make this name a little shorter, like so:

    static void
    tegra186_xusb_padctl_utmi_pad_set_protection(struct tegra_xusb_port *po=
rt,
						 int level,
						 enum tegra_vbus_dir dir)

> +{
> +	u32 value;
> +	struct tegra_xusb_padctl *padctl =3D port->padctl;
> +	unsigned int index =3D port->index;
> +
> +	value =3D padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
> +
> +	if (level < 0) {
> +		/* disable pad protection */
> +		value |=3D PD_VREG;
> +		value &=3D ~VREG_LEV(~0);
> +		value &=3D ~VREG_DIR(~0);
> +	} else {
> +		if (dir =3D=3D TEGRA_VBUS_SOURCE)
> +			value |=3D VREG_DIR_OUT;
> +		else if (dir =3D=3D TEGRA_VBUS_SINK)
> +			value |=3D VREG_DIR_IN;
> +
> +		value &=3D ~PD_VREG;
> +		value &=3D ~VREG_DIR(~0);
> +		value &=3D ~VREG_LEV(~0);
> +		value |=3D VREG_LEV(level);
> +	}
> +
> +	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
> +}
> +
> +

There's an extra blank line above that can be dropped.

>  static int tegra186_xusb_padctl_vbus_override(struct tegra_xusb_padctl *=
padctl,
>  					       bool status)
>  {
> @@ -935,6 +973,8 @@ static const struct tegra_xusb_padctl_ops tegra186_xu=
sb_padctl_ops =3D {
>  	.vbus_override =3D tegra186_xusb_padctl_vbus_override,
>  	.utmi_pad_power_on =3D tegra_phy_xusb_utmi_pad_power_on,
>  	.utmi_pad_power_down =3D tegra_phy_xusb_utmi_pad_power_down,
> +	.utmi_pad_set_protection_level =3D
> +			tegra186_xusb_padctl_utmi_pad_set_protection_level,
>  };
> =20
>  #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-t=
egra210.c
> index caf0890..7d84f1a 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -74,6 +74,8 @@
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_VAL 0x1
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18 (1 << 6)
> +#define USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV(x) (((x) & 0x3) << 7)
> +#define USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_DIR(x) (((x) & 0x3) << 11)
> =20
>  #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x) (0x088 + (x) * 0x40)
>  #define XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD_ZI (1 << 29)
> @@ -1116,6 +1118,33 @@ void tegra210_usb2_pad_power_down(struct phy *phy)
>  	usb2->powered_on =3D false;
>  }
> =20
> +static void tegra210_xusb_padctl_utmi_pad_set_protection_level(
> +				struct tegra_xusb_port *port, int level,
> +				enum tegra_vbus_dir dir)

Same comment as above.

> +{
> +	u32 value;
> +	struct tegra_xusb_padctl *padctl =3D port->padctl;
> +	unsigned int index =3D port->index;
> +
> +	value =3D padctl_readl(padctl,
> +			     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
> +
> +	if (level < 0) {
> +		/* disable pad protection */
> +		value |=3D XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
> +		value &=3D USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV(~0);
> +		value &=3D ~USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_DIR(~0);
> +	} else {
> +		value &=3D ~XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
> +		value &=3D ~USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_DIR(~0);
> +		value &=3D USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV(~0);
> +		value |=3D USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV(level);
> +	}
> +
> +	padctl_writel(padctl, value,
> +		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
> +}
> +
>  static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mod=
e,
>  				      int submode)
>  {
> @@ -2291,6 +2320,8 @@ static const struct tegra_xusb_padctl_ops tegra210_=
xusb_padctl_ops =3D {
>  	.utmi_port_reset =3D tegra210_utmi_port_reset,
>  	.utmi_pad_power_on =3D tegra210_usb2_pad_power_on,
>  	.utmi_pad_power_down =3D tegra210_usb2_pad_power_down,
> +	.utmi_pad_set_protection_level =3D
> +			tegra210_xusb_padctl_utmi_pad_set_protection_level,
>  };
> =20
>  static const char * const tegra210_xusb_padctl_supply_names[] =3D {
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index 6995fc4..79e96b0 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -259,6 +259,17 @@ to_sata_pad(struct tegra_xusb_pad *pad)
>   */
>  struct tegra_xusb_port_ops;
> =20
> +/*
> + * Tegra OTG port VBUS direction:
> + * default (based on port capability) or
> + * as source or sink
> + */
> +enum tegra_vbus_dir {
> +	TEGRA_VBUS_DEFAULT,
> +	TEGRA_VBUS_SOURCE,
> +	TEGRA_VBUS_SINK
> +};

Can't we key off of something like the OTG mode? I thought we already
carried that elsewhere.

> +
>  struct tegra_xusb_port {
>  	struct tegra_xusb_padctl *padctl;
>  	struct tegra_xusb_lane *lane;
> @@ -398,6 +409,8 @@ struct tegra_xusb_padctl_ops {
>  	int (*utmi_port_reset)(struct phy *phy);
>  	void (*utmi_pad_power_on)(struct phy *phy);
>  	void (*utmi_pad_power_down)(struct phy *phy);
> +	void (*utmi_pad_set_protection_level)(struct tegra_xusb_port *port,
> +					int max_ua, enum tegra_vbus_dir dir);

You call the variable "max_ua" here but it's "level" in the
implementations, which is slightly confusing. Please choose one and
stick with it. Also, if it's a value in microamperes, perhaps just make
it unsigned int?

Thierry

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oAjMACgkQ3SOs138+
s6HnBw//ZjUsnod3XAMDdcAZQjZ7EBM/xu0ED9w5Al3D45Iag0fGfmDbX5z/C4SF
8671usCmdMZkCYxA+F+8xDx+GISy46qMylOx5W1P6Exw6XxNMTCuryxBzm9K529+
OxugKnoAFsXcKMn6rY0Gwx5GoukzzBR6UXQ2CUAwwbpDrEKcvO3BxleCYzy+U57h
K0+3fLVsJly1glCJcr+me0vcWgVKvD0/HvhTziWMV89vKA6LJe9Yr/CDZiLDE0M/
Xigxs6GnLGATNIPnREkyFcuKlRYJO0Jrlf63XfTqJVL04SxfPxlHunUJhaGq4oeP
2R7E61eIKQrZdFJfrFWQ9d0++nIRTZVWAi2Do/jX+eygGx9qd4bBNJbmuXDzz9FM
V1o1+Hu0+Q6grasIa0Z0UepA2G7MKpeqIYStyffDmeyNmM/A25bjGozDaoB5UPKM
E4Akl99hU9UwT/n1lCVEbSZTRRSmht3es+lCkTA3wji76dHrist0M26ax6gXvjGp
NV9sJf1D+N7yhg9Z7/J2vGifFZE+ZHVEd1+egMXVqBYQhU769GoDF69HBaZTRMpm
F3dHKxhYKBHRwPx/ibrYvDy7xNOrMpnx7TuzQndXHwtA8GNVHtwH92m5omnge+jr
ttcI+xy6g4je4+Nik188Oc+WIhgF6JgW13dNB0HGHLU/c9F8+HI=
=Cnp9
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--
