From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH 11/17] ASoC: Tegra I2S: Add device tree
	binding
Date: Wed, 23 Nov 2011 08:04:49 +0100
Message-ID: <20111123070449.GD5255@avionic-0098.adnet.avionic-design.de>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
	<1322011285-4002-12-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2374266364936124611=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1322011285-4002-12-git-send-email-swarren@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, alsa-devel@alsa-project.org, Mike Rapoport <mike@compulab.co.il>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Ian Lartey <ian@opensource.wolfsonmicro.com>, Rob Herring <rob.herring@calxeda.com>, Marc Dietrich <marvin24@gmx.de>, Grant Likely <grant.likely@secretlab.ca>, linux-tegra@vger.kernel.org, John Bonesio <bones@secretlab.ca>, Leon Romanovsky <leon@leon.nu>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Liam Girdwood <lrg@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============2374266364936124611==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="llIrKcgUOe3dCx0c"
Content-Disposition: inline


--llIrKcgUOe3dCx0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  .../devicetree/bindings/sound/tegra20-i2s.txt      |   16 +++++++++++
>  sound/soc/tegra/tegra_i2s.c                        |   29 ++++++++++++++=
++---
>  2 files changed, 40 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/tegra20-i2s.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/sound/tegra20-i2s.txt b/Do=
cumentation/devicetree/bindings/sound/tegra20-i2s.txt
> new file mode 100644
> index 0000000..d38abdc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tegra20-i2s.txt
> @@ -0,0 +1,16 @@
> +NVIDIA Tegra 20 I2S controller
> +
> +Required properties:
> +- compatible : "nvidia,tegra20-i2s"
> +- reg : Should contain I2S registers location and length
> +- interrupts : Should contain I2S interrupt
> +- dma-channel : The Tegra DMA controller's channel ID for this I2S contr=
oller
> +
> +Example:
> +
> +i2s@70002800 {
> +	compatible =3D "nvidia,tegra20-i2s";
> +	reg =3D <0x70002800 0x200>;
> +	interrupts =3D < 45 >;
> +	dma-channel =3D < 2 >;
> +};
> diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
> index 3c0cbd2..b4e19a5 100644
> --- a/sound/soc/tegra/tegra_i2s.c
> +++ b/sound/soc/tegra/tegra_i2s.c
> @@ -36,6 +36,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/io.h>
> +#include <linux/of.h>
>  #include <mach/iomap.h>
>  #include <sound/core.h>
>  #include <sound/pcm.h>
> @@ -332,6 +333,7 @@ static __devinit int tegra_i2s_platform_probe(struct =
platform_device *pdev)
>  	struct tegra_i2s * i2s;
>  	struct resource *mem, *memregion, *dmareq;
>  	int ret;
> +	u32 dma_ch;
> =20
>  	i2s =3D devm_kzalloc(&pdev->dev, sizeof(struct tegra_i2s), GFP_KERNEL);
>  	if (!i2s) {
> @@ -360,9 +362,19 @@ static __devinit int tegra_i2s_platform_probe(struct=
 platform_device *pdev)
> =20
>  	dmareq =3D platform_get_resource(pdev, IORESOURCE_DMA, 0);
>  	if (!dmareq) {
> -		dev_err(&pdev->dev, "No DMA resource\n");
> -		ret =3D -ENODEV;
> -		goto err_clk_put;
> +		/*
> +		 * FIXME: Perhaps there should be a standard binding for this
> +		 * that ends up creating the IORESOURCE_DMA resource for us.
> +		 */
> +		if (of_property_read_u32(pdev->dev.of_node,
> +					 "nvidia,dma-channels",

The binding documentation says the property is called "nvidia,dma-channel"
but you use "nvidia,dma-channel*s*" here.

> +					 &dma_ch) < 0) {
> +			dev_err(&pdev->dev, "No DMA resource\n");
> +			ret =3D -ENODEV;
> +			goto err_clk_put;
> +		}
> +	} else {
> +		dma_ch =3D dmareq->start;
>  	}
> =20
>  	memregion =3D devm_request_mem_region(&pdev->dev, mem->start,
> @@ -383,12 +395,12 @@ static __devinit int tegra_i2s_platform_probe(struc=
t platform_device *pdev)
>  	i2s->capture_dma_data.addr =3D mem->start + TEGRA_I2S_FIFO2;
>  	i2s->capture_dma_data.wrap =3D 4;
>  	i2s->capture_dma_data.width =3D 32;
> -	i2s->capture_dma_data.req_sel =3D dmareq->start;
> +	i2s->capture_dma_data.req_sel =3D dma_ch;
> =20
>  	i2s->playback_dma_data.addr =3D mem->start + TEGRA_I2S_FIFO1;
>  	i2s->playback_dma_data.wrap =3D 4;
>  	i2s->playback_dma_data.width =3D 32;
> -	i2s->playback_dma_data.req_sel =3D dmareq->start;
> +	i2s->playback_dma_data.req_sel =3D dma_ch;
> =20
>  	i2s->reg_ctrl =3D TEGRA_I2S_CTRL_FIFO_FORMAT_PACKED;
> =20
> @@ -422,10 +434,16 @@ static int __devexit tegra_i2s_platform_remove(stru=
ct platform_device *pdev)
>  	return 0;
>  }
> =20
> +static const struct of_device_id tegra_i2s_of_match[] __devinitconst =3D=
 {
> +	{ .compatible =3D "nvidia,tegra20-i2s", },
> +	{},
> +};
> +
>  static struct platform_driver tegra_i2s_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  		.owner =3D THIS_MODULE,
> +		.of_match_table =3D tegra_i2s_of_match,
>  	},
>  	.probe =3D tegra_i2s_platform_probe,
>  	.remove =3D __devexit_p(tegra_i2s_platform_remove),
> @@ -436,3 +454,4 @@ MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
>  MODULE_DESCRIPTION("Tegra I2S ASoC driver");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:" DRV_NAME);
> +MODULE_DEVICE_TABLE(of, tegra_i2s_of_match);
> --=20
> 1.7.0.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20

--llIrKcgUOe3dCx0c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7MmxAACgkQZ+BJyKLjJp/O+QCdH5eZEB+Zrz9bCbjvEQ1MibAL
9kYAoKYY8aPaA1EvcIpzqsfAXkjYssoG
=dgWR
-----END PGP SIGNATURE-----

--llIrKcgUOe3dCx0c--

--===============2374266364936124611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============2374266364936124611==--
