From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH -next 10/30] pinctrl: tegra: use
 devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 14:52:11 +0200
Message-ID: <20191017125211.GA3768303@ulmo>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
 <20191017122640.22976-11-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191017122640.22976-11-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: linus.walleij@linaro.org, manivannan.sadhasivam@linaro.org, afaerber@suse.de, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, jesper.nilsson@axis.com, lars.persson@axis.com, ludovic.desroches@microchip.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, vz@mleia.com, narmstrong@baylibre.com, geert+renesas@glider.be, daniel@zonque.org, haojian.zhuang@gmail.com, wens@csie.org, jonathanh@nvidia.com, agross@kernel.org
List-Id: linux-tegra@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2019 at 08:26:20PM +0800, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 4 +---
>  drivers/pinctrl/tegra/pinctrl-tegra.c      | 3 +--
>  2 files changed, 2 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl=
/tegra/pinctrl-tegra-xusb.c
> index f2fa1f7..6f7b376 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> @@ -873,7 +873,6 @@ int tegra_xusb_padctl_legacy_probe(struct platform_de=
vice *pdev)
>  {
>  	struct tegra_xusb_padctl *padctl;
>  	const struct of_device_id *match;
> -	struct resource *res;
>  	struct phy *phy;
>  	int err;
> =20
> @@ -894,8 +893,7 @@ int tegra_xusb_padctl_legacy_probe(struct platform_de=
vice *pdev)
>  	match =3D of_match_node(tegra_xusb_padctl_of_match, pdev->dev.of_node);
>  	padctl->soc =3D match->data;
> =20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	padctl->regs =3D devm_ioremap_resource(&pdev->dev, res);
> +	padctl->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(padctl->regs))
>  		return PTR_ERR(padctl->regs);
> =20
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegr=
a/pinctrl-tegra.c
> index e9a7cbb..692d8b3 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -781,8 +781,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  		return -ENOMEM;
> =20
>  	for (i =3D 0; i < pmx->nbanks; i++) {
> -		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
> -		pmx->regs[i] =3D devm_ioremap_resource(&pdev->dev, res);
> +		pmx->regs[i] =3D devm_platform_ioremap_resource(pdev, i);
>  		if (IS_ERR(pmx->regs[i]))
>  			return PTR_ERR(pmx->regs[i]);
>  	}
> --=20
> 2.7.4
>=20
>=20

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2oY/kACgkQ3SOs138+
s6FgNw/+NID79dubYxesxorqI1f3Qx/IwcfoDiRN4AKvBhcJwBc3NKVGf/hLYpqL
YuiRdhCR9PDTEAhuX5Hk86vPnUn4G9c7PXHjcCnXJS05Bf4HOuCvrEvKhn1aBSJg
BKpQYyXht8ekGsWrhu6lHAs5TGDL+mqaw6OrDh0llnlnRSrWMeYIntmqhN9hWNUA
r0dlzs3Kt4uxPwJ+LD/yLHdaMLHsL7FVzZOyODJgrS7iepKhPNFNxshPH75xVQo7
FxzRu3voR+YjModyfO5X83hg8FnKh85Lvc5Ovhm7rjjWrQo73xCv2YfYjL6O5opg
Ig2FBF2R3zyUzxNvg2xOuLD29Jf0Rbb48V8A3VkTzcSTSU4I6Pp91O+IJzSI3NPV
Q+JtwCuflch6NG4JcvDJPCfqy6gUftF9c7/jcd8XFF/fFYdbwcpouUyOkifrbZh6
uRyvEvKoR5Tdy+wolglL2srp9kHFUJbBgUKmvkuN9IP5297f1/SMeHhQTJ9NRWOd
YcnQZsbNoJsUjNiE4v81BsXcWle7IANdhhY2vZShNcJxZATiektLeCO4FmN+pCIV
nII5+ZV2MPnJk0xxu3w0/0AYbQbJAFaXHLvB/zhYcJcAyAC47qyv6K1s24zj/i1T
FWPpngjetj8eTK50ENzsHDS46hyVpvQsVHsjuckItF1R3bmExPo=
=hNUZ
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
