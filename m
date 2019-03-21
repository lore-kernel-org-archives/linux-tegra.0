From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH -next] phy: tegra: xusb: fix typo in
 tegra186_usb2_pad_probe()
Date: Thu, 21 Mar 2019 16:05:37 +0100
Message-ID: <20190321150537.GB8939@ulmo>
References: <20190321085436.94975-1-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190321085436.94975-1-weiyongjun1@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2019 at 08:54:36AM +0000, Wei Yongjun wrote:
> Fix a typo in tegra186_usb2_pad_probe(), 'usb2->clk' should be
> 'priv->usb2_trk_clk'.
>=20
> Fixes: b8998e928030 ("phy: tegra: xusb: Add Tegra186 support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Good catch!

Acked-by: Thierry Reding <treding@nvidia.com>

>=20
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> index 11ad6e4e4711..a627fe0b8e54 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -467,8 +467,8 @@ tegra186_usb2_pad_probe(struct tegra_xusb_padctl *pad=
ctl,
>  	}
> =20
>  	priv->usb2_trk_clk =3D devm_clk_get(&pad->dev, "trk");
> -	if (IS_ERR(usb2->clk)) {
> -		err =3D PTR_ERR(usb2->clk);
> +	if (IS_ERR(priv->usb2_trk_clk)) {
> +		err =3D PTR_ERR(priv->usb2_trk_clk);
>  		dev_dbg(&pad->dev, "failed to get usb2 trk clock: %d\n", err);
>  		goto unregister;
>  	}
>=20
>=20
>=20

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyTqD0ACgkQ3SOs138+
s6GUgw/9HS6iD2OHPaeTstUqq7OVEzmQN7eRKd8nYqtSLLswJhubqAlJALcbM2pH
1S3dgKjBNmmEsFcLw293WZuMZHLAXzmX4fdKFYwNAnNmNBQflXQsy0DhAjDtupyK
Fts/ASsmq3EKfunnAhog7Ld9xBIrEBA73ahPjY1nOv+prlpiTuq6oZvx+xSayt6G
uTG1Zl2eBWV1DRwy+oTQo6lqy5OkaRDLRTxdq5Tzv1uwlG3EQ0b18T+cKJR905Pg
PInaYNeJsFuu3pusoHdqcKgwzMmYP/EXXLH6oUcBhX4qHZJoHn0mIz86ZZA97cA6
l6oL0+7ZM28jkbjRN0cHP0C6Zlr0vd2iPCxsz7G5rkr0fiVoHGYVOt6+vLhGCsLI
GRCjYZ0L58fEW90L7nIM/sXKVT5iixS+wRBrxTq9+6ix5AzMnkDFPbiKvQH683ZY
9EyQb8DUye0AKycFME/atCJtsjQF2t85YXEuQxJ3W2EINzPlvkOw/4mJdxR/nKts
2GwOxIw9wF073JegGqXWpe0+T1gaJ71om+pIv3QFhe4rCEgSLklHN0wyLTUf/8uO
+aUkY3CjFIv0rS5vFYUDJAGJSClHd+mY8HYgvTdqmQacC7DppaW7X0YruSVtG1XN
k1SxuHT8YfqNybwgtjeZhRn/7f02DuDVHDhl4g0uTcigXtjJALE=
=VM3Q
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
