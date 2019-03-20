From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH -next] phy: tegra: xusb: Make two functions static
Date: Wed, 20 Mar 2019 09:42:11 +0100
Message-ID: <20190320084211.GB6043@ulmo>
References: <20190319153219.4196-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190319153219.4196-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yue Haibing <yuehaibing@huawei.com>
Cc: jckuo@nvidia.com, kishon@ti.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2019 at 11:32:19PM +0800, Yue Haibing wrote:
> From: YueHaibing <yuehaibing@huawei.com>
>=20
> Fix sparse warning:
>=20
> drivers/phy/tegra/xusb-tegra186.c:250:6: warning: symbol 'tegra_phy_xusb_=
utmi_pad_power_on' was not declared. Should it be static?
> drivers/phy/tegra/xusb-tegra186.c:281:6: warning: symbol 'tegra_phy_xusb_=
utmi_pad_power_down' was not declared. Should it be static?
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Sigh... I evidently need to improve my build scripts.

Acked-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> index 11ad6e4..7a308b4 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -247,7 +247,7 @@ static void tegra186_utmi_bias_pad_power_off(struct t=
egra_xusb_padctl *padctl)
>  	mutex_unlock(&padctl->lock);
>  }
> =20
> -void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
> +static void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
>  {
>  	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
>  	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> @@ -278,7 +278,7 @@ void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
>  }
> =20
> -void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
> +static void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
>  {
>  	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
>  	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> --=20
> 2.7.4
>=20
>=20

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyR/OMACgkQ3SOs138+
s6EFXg//e+QC0f53RB2Uvq0TIRG2Hv8pWteQzCdIfGJo0BsysI7l9RiMkUJLzT/r
/0DkeOg3DpiOcivXXqaOONggMduMqLwFIVML5+yupRjZ0NooFzZd3Dz7twi50lpc
dSjIvXL0VpVJ4Ii4E20l02zjaMTz5I1sPE9yDTZhWVwEojcAVcsKVIzjzuygZTC4
Gmtb0fR8u/Qc2UVkb0RhUzh3TU/4K900tlp3sKornxW0BEMd9WUTH9R+9R1eq0j6
5e3epfx0BkUIXEDzGE2ggmGsyWGC8HbXgrrWlrmJi2cj/TBV/M6RaEvs+1OOwEBZ
gq3GyAbcMkqrr6IbinF9azw6bnnNX8vxIacD0ohITgWPB1Ui2kl2UuPRrWP547jc
Sq4cqLPOiz58Hy5HuI368XgC4XgJY29A60Rm6OH9rhzDt48B3idfP+nUELzeJEbG
hiAI6e+FkUvCGQ+pFsIVjN9+/ft16rB6OHZwHc5QTHgjvOobutDxVywtjrPD12Lm
Wyb67eGPqHAsBrip0IPdGjZ4cQeGzhUL2gAFPicP2tY7EeyYor8ToFGpvgkIjB2V
YfHi6DKvL1jhCNOAk+RzWZq4bTLuSFPEYqord9qup8Js4nadBL8gAzZdLOdkHTDx
k4lbsJ+P4zZSo3DE4Ej7kOQC4Tgwj1jXbi1vsvBgP989A9JbGXA=
=NJhj
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
