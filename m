From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC 6/6] bus: Add support for Tegra NOR controller
Date: Mon, 25 Jul 2016 13:14:43 +0200
Message-ID: <20160725111443.GB21170@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-7-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468935397-11926-7-git-send-email-mirza.krak@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mirza Krak <mirza.krak@gmail.com>
Cc: swarren@wwwdotorg.org, gnurou@gmail.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@armlinux.org.uk
List-Id: linux-tegra@vger.kernel.org


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 03:36:37PM +0200, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak@gmail.com>
>=20
> The NOR bus can be used to connect high-speed devices such as NOR flash,
> FPGAs, DSPs, CAN chips, Wi-Fi chips etc.
>=20
> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> ---
>  drivers/bus/Kconfig     |   7 +++
>  drivers/bus/Makefile    |   1 +
>  drivers/bus/tegra-nor.c | 118 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 126 insertions(+)
>  create mode 100644 drivers/bus/tegra-nor.c
>=20
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index 3b205e2..b74be7d8 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -145,6 +145,13 @@ config TEGRA_ACONNECT
>  	  Driver for the Tegra ACONNECT bus which is used to interface with
>  	  the devices inside the Audio Processing Engine (APE) for Tegra210.
>=20
> +config TEGRA_NOR
> +	tristate "Nvidia Tegra NOR flash bus driver a.k.a GMI/SNOR"
> +		depends on ARCH_TEGRA_2x_SOC || ARCH_TEGRA_3x_SOC

I think an ARCH_TEGRA dependency is enough here.

> +		depends on OF

You can drop this because Tegra has been OF-only for a long time now.

> +		help
> +			Driver for NOR flash bus found on Tegra30/20 SOC`s.

Maybe make this "Driver for GMI controller found on NVIDIA Tegra SoCs."
or similar in light of the name change.

>  config UNIPHIER_SYSTEM_BUS
>  	tristate "UniPhier System Bus driver"
>  	depends on ARCH_UNIPHIER && OF
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index ac84cc4..46d0129 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -18,5 +18,6 @@ obj-$(CONFIG_OMAP_OCP2SCP)	+=3D omap-ocp2scp.o
>  obj-$(CONFIG_SUNXI_RSB)		+=3D sunxi-rsb.o
>  obj-$(CONFIG_SIMPLE_PM_BUS)	+=3D simple-pm-bus.o
>  obj-$(CONFIG_TEGRA_ACONNECT)	+=3D tegra-aconnect.o
> +obj-$(CONFIG_TEGRA_NOR)		+=3D tegra-nor.o
>  obj-$(CONFIG_UNIPHIER_SYSTEM_BUS)	+=3D uniphier-system-bus.o
>  obj-$(CONFIG_VEXPRESS_CONFIG)	+=3D vexpress-config.o
> diff --git a/drivers/bus/tegra-nor.c b/drivers/bus/tegra-nor.c
> new file mode 100644
> index 0000000..1e48113
> --- /dev/null
> +++ b/drivers/bus/tegra-nor.c
> @@ -0,0 +1,118 @@
> +/*
> + * Driver for Nvidia NOR Flash bus a.k.a SNOR/GMI.

Nit: I encourage the use of "NVIDIA" as spelling for consistency.

> + *
> + * Copyright (C) 2016 Host Mobility AB. All rights reserved.
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +
> +#define TEGRA_NOR_TIMING_REG_COUNT	2
> +
> +#define TEGRA_NOR_CONFIG			0x00
> +#define TEGRA_NOR_STATUS			0x04
> +#define TEGRA_NOR_ADDR_PTR			0x08
> +#define TEGRA_NOR_AHB_ADDR_PTR		0x0c
> +#define TEGRA_NOR_TIMING0			0x10
> +#define TEGRA_NOR_TIMING1			0x14
> +#define TEGRA_NOR_MIO_CONFIG		0x18
> +#define TEGRA_NOR_MIO_TIMING		0x1c
> +#define TEGRA_NOR_DMA_CONFIG		0x20
> +#define TEGRA_NOR_CS_MUX_CONFIG		0x24
> +
> +#define TEGRA_NOR_CONFIG_GO				BIT(31)
> +
> +static const struct of_device_id nor_id_table[] =3D {
> +	/* Tegra30 */
> +	{ .compatible =3D "nvidia,tegra30-nor", .data =3D NULL, },
> +	/* Tegra20 */
> +	{ .compatible =3D "nvidia,tegra20-nor", .data =3D NULL, },
> +
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nor_id_table);
> +
> +
> +static int __init nor_parse_dt(struct platform_device *pdev,
> +				void __iomem *base)
> +{
> +	struct device_node *of_node =3D pdev->dev.of_node;
> +	u32 config, timing[TEGRA_NOR_TIMING_REG_COUNT];
> +	int ret;
> +
> +	ret =3D of_property_read_u32_array(of_node, "nvidia,cs-timing",
> +					 timing, TEGRA_NOR_TIMING_REG_COUNT);
> +	if (!ret) {
> +		writel(timing[0], base + TEGRA_NOR_TIMING0);
> +		writel(timing[1], base + TEGRA_NOR_TIMING1);
> +	}
> +
> +	ret =3D of_property_read_u32(of_node, "nvidia,config", &config);
> +	if (ret)
> +		return ret;
> +
> +	config |=3D TEGRA_NOR_CONFIG_GO;
> +	writel(config, base + TEGRA_NOR_CONFIG);

My preference would be for the tegra_gmi_parse_dt() function not to do
any register programming. Instead I think it would be better to store
any of the parameters inside a struct tegra_gmi and do the programming
=66rom within tegra_gmi_probe() (or via an other function such as
tegra_gmi_initialize(), called from tegra_gmi_probe()).

The reason is that you'll most likely want to do this programming when
you resume from suspend, and you could reuse tegra_gmi_initialize() to
do that.

> +
> +	if (of_get_child_count(of_node))
> +		ret =3D of_platform_populate(of_node,
> +				   of_default_bus_match_table,
> +				   NULL, &pdev->dev);

Why the extra check? of_platform_populate() is almost a no-op if there
aren't any children anyway. What it will do is set the OF_POPULATED_BUS
flag, but I think we want that irrespective of whether or not there are
any children.

Was there any problem with calling it unconditionally that made you opt
for the extra check?

Also, I think you can call of_platform_default_populate(), which is a
little shorter than the above because you can omit the match table.

> +
> +	return ret;
> +}
> +
> +static int __init nor_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct clk *clk;
> +	void __iomem *base;
> +	int ret;
> +
> +	/* get the resource */
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	/* get the clock */
> +	clk =3D devm_clk_get(&pdev->dev, NULL);

Let's use a consumer name here. The problem with a NULL consumer name is
that it effectively restricts the DT binding. It means that whatever the
clock is its name needs to be the first in a clock-names property. We'll
likely get away with this because there's only one clock, but should we
ever need to add another we'd need to add wording to the device tree
bindings that the "gmi" entry needs to be first.

I'm not sure if that's clear, so I'll try to explain in other words: If
you pass a NULL consumer name to clk_get() it will simply use the first
clock in the clocks property. If you want to later extend the DT binding
by adding a clock in a backwards-compatible way, you'll need to add the
restriction that the "gmi" clock (the one that was previously unnamed)
must be the first in the clock-names and clocks properties.

That's all a little confusing, so let's avoid this by giving it a proper
consumer name to begin with.

> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	ret =3D clk_prepare_enable(clk);
> +	if (ret)
> +		return ret;
> +
> +	/* parse the device node */
> +	ret =3D nor_parse_dt(pdev, base);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s fail to create devices.\n",
> +			pdev->dev.of_node->full_name);
> +		clk_disable_unprepare(clk);
> +		return ret;
> +	}

The good thing if you don't do any programming in tegra_gmi_parse_dt(),
is that you can easily move the clk_prepare_enable() call to here where
things can't fail anymore, so you don't have to add cleanup code.

> +
> +	dev_info(&pdev->dev, "Driver registered.\n");

Please avoid this kind of output. Users expect that everything will work
so you want to let them know when something goes wrong, and be quiet
when all goes as expected.

> +	return 0;
> +}
> +
> +static struct platform_driver nor_driver =3D {
> +	.driver =3D {
> +		.name		=3D "tegra-nor",
> +		.of_match_table	=3D nor_id_table,
> +	},
> +};
> +module_platform_driver_probe(nor_driver, nor_probe);
> +
> +MODULE_AUTHOR("Mirza Krak <mirza.krak@gmail.com");
> +MODULE_DESCRIPTION("NVIDIA Tegra NOR Bus Driver");
> +MODULE_LICENSE("GPL");

You're header comment says GPL version 2, which means that the
MODULE_LICENSE needs to be "GPL v2". "GPL" means "version 2 or later".

Thierry

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlfSgAAoJEN0jrNd/PrOhkyUP/1qLRiQ7xm/WhwQuqH+xcMs4
swMHAWJKj+b3xmkO7rMztaXYgGio8/PV1E+6fpGA5ixjCd8tF0ejb0qditKwECkR
qSPckyWwpmbeeQDJae89OpYJWjvZiBk93ju/+IEm+PWEdDX84P794NHMqOYQ1Fvu
Zli9GSPgrRmoSptU5q6CozeKveyABPq7sKR9OAdc3NmoCFWdonPRFA7aibU6EOqj
hHNhzIrcTbGq9kHmF4ahzrZOBDLGCqMRQzE+0ovNZF2AhjwAJ3TOHaN5v7/4pY9c
FWQsjo4UXoX7DU0fmjlggo3EhVgmnI9vXIzVSWnoojJQhCkHF6l/XgoSEcFeCn35
1RlqZ2Bs9UkrUFNlwkx5gGD8E+FX8F0lhpx4EqGxYiw3MzOxwodEyJGE14W25i++
vKZRMlrIiDXA1LMdsRFPW0g3XmPwliA9jdmqMOxDJ4BvD3iAWHa4IEoENzIq+yqH
vIuBwXtE+ptKwuVblDbVT1aO5YIp6MsEy+MUEBxPzwG1ME+jX9vPQXQ+brtCvIgD
3QNz7kkzpTaJnM5m8nO6VzGAzV2cLpXL2X/4zi4cguBKu9D2+w0qORZEwpyaqg7i
ezKtEUBZ/7O7e8zplAdr0Fv6WVEmCwvLxPP9JPCQxKQPqR8SNSabYmtH6UYtey5W
ZCUgEZquJOUZSEYPYAX9
=8L+t
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
