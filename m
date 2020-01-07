From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH 05/13] mailbox: bcm2835: convert to
 devm_platform_ioremap_resource
Date: Tue, 07 Jan 2020 11:57:07 +0100
Message-ID: <bb661c1013f5e05407f93a134f221fb0988ce63f.camel@suse.de>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
         <20191228183538.26189-5-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-y5AsCnHtvQY7mJ+3+eeo"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228183538.26189-5-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>, jassisinghbrar@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, lftan@altera.com, matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, nios2-dev@lists.rocketboards.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--=-y5AsCnHtvQY7mJ+3+eeo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-12-28 at 18:35 +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks!

>  drivers/mailbox/bcm2835-mailbox.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-
> mailbox.c
> index 39761d190545..79f93c9c7682 100644
> --- a/drivers/mailbox/bcm2835-mailbox.c
> +++ b/drivers/mailbox/bcm2835-mailbox.c
> @@ -137,7 +137,6 @@ static int bcm2835_mbox_probe(struct platform_device
> *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	int ret =3D 0;
> -	struct resource *iomem;
>  	struct bcm2835_mbox *mbox;
> =20
>  	mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> @@ -153,8 +152,7 @@ static int bcm2835_mbox_probe(struct platform_device
> *pdev)
>  		return -ENODEV;
>  	}
> =20
> -	iomem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	mbox->regs =3D devm_ioremap_resource(&pdev->dev, iomem);
> +	mbox->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mbox->regs)) {
>  		ret =3D PTR_ERR(mbox->regs);
>  		dev_err(&pdev->dev, "Failed to remap mailbox regs: %d\n", ret);


--=-y5AsCnHtvQY7mJ+3+eeo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl4UZAMACgkQlfZmHno8
x/5XXwgAlWhWoPbAnKlacluRU3wwe6Bf/fyJCILvfBL9w8HbTcoFBOIX1v57lLdQ
vd8AzkmNgkzmUYyMOpKcyUI6+YQDgtc4qKutzeA7fLNS5oo2b0XB3tRwZa1ng1oJ
vknawhQvjlzIjfNNzO5UKIVWgSoVqZlHmuQyuRN6pemg9IgT7VaEEL/rEo1uOkix
eCyerYBXqS8Y5Ty0Y7KOjrDM2wFiggH/r6Y4mt+2Mto5pZDbY4CtBD1JjSb4u8eS
8TF9+Pf7Jqh/NW0xAz1x40aq+J77rPsKecWm96kWnJBTUyTx4Seh6mHsZQl1Nxej
fZAJaanhMv0nlXusFg/vtaSBr94lkQ==
=bWd1
-----END PGP SIGNATURE-----

--=-y5AsCnHtvQY7mJ+3+eeo--
