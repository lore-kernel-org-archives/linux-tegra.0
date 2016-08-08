From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/6] bus: Add support for Tegra Generic Memory Interface
Date: Mon, 8 Aug 2016 14:47:51 +0100
Message-ID: <fae8dbaf-53e9-dcfe-f755-32f7b28f4c9f@nvidia.com>
References: <1470512452-8322-1-git-send-email-mirza.krak@gmail.com>
 <1470512452-8322-7-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470512452-8322-7-git-send-email-mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 06/08/16 20:40, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> The Generic Memory Interface bus can be used to connect high-speed
> devices such as NOR flash, FPGAs, DSPs...
> 
> Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/bus/Kconfig     |   7 ++
>  drivers/bus/Makefile    |   1 +
>  drivers/bus/tegra-gmi.c | 224 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 232 insertions(+)
>  create mode 100644 drivers/bus/tegra-gmi.c
> 
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index 3b205e2..88bbf2c 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -145,6 +145,13 @@ config TEGRA_ACONNECT
>  	  Driver for the Tegra ACONNECT bus which is used to interface with
>  	  the devices inside the Audio Processing Engine (APE) for Tegra210.
>  
> +config TEGRA_GMI
> +	tristate "Tegra Generic Memory Interface bus driver"
> +		depends on ARCH_TEGRA
> +		help
> +			Driver for the Tegra Generic Memory Interface bus which can be used
> +			to attach devices such as NOR, UART, FPGA and more.
> +
>  config UNIPHIER_SYSTEM_BUS
>  	tristate "UniPhier System Bus driver"
>  	depends on ARCH_UNIPHIER && OF
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index ac84cc4..34e2bab 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -18,5 +18,6 @@ obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
>  obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
>  obj-$(CONFIG_SIMPLE_PM_BUS)	+= simple-pm-bus.o
>  obj-$(CONFIG_TEGRA_ACONNECT)	+= tegra-aconnect.o
> +obj-$(CONFIG_TEGRA_GMI)		+= tegra-gmi.o
>  obj-$(CONFIG_UNIPHIER_SYSTEM_BUS)	+= uniphier-system-bus.o
>  obj-$(CONFIG_VEXPRESS_CONFIG)	+= vexpress-config.o
> diff --git a/drivers/bus/tegra-gmi.c b/drivers/bus/tegra-gmi.c
> new file mode 100644
> index 0000000..7a45442
> --- /dev/null
> +++ b/drivers/bus/tegra-gmi.c
> @@ -0,0 +1,224 @@
> +/*
> + * Driver for NVIDIA Generic Memory Interface
> + *
> + * Copyright (C) 2016 Host Mobility AB. All rights reserved.
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/reset.h>
> +
> +#define TEGRA_GMI_CONFIG			0x00
> +#define TEGRA_GMI_CONFIG_GO			BIT(31)
> +#define TEGRA_GMI_BUS_WIDTH_32BIT	BIT(30)
> +#define TEGRA_GMI_MUX_MODE			BIT(28)
> +#define TEGRA_GMI_RDY_BEFORE_DATA	BIT(24)
> +#define TEGRA_GMI_RDY_ACTIVE_HIGH	BIT(23)
> +#define TEGRA_GMI_ADV_ACTIVE_HIGH	BIT(22)
> +#define TEGRA_GMI_OE_ACTIVE_HIGH	BIT(21)
> +#define TEGRA_GMI_CS_ACTIVE_HIGH	BIT(20)
> +#define TEGRA_GMI_CS_SELECT(x)		((x & 0x7) << 4)
> +
> +#define TEGRA_GMI_TIMING0			0x10
> +#define TEGRA_GMI_MUXED_WIDTH(x)	((x & 0xf) << 12)
> +#define TEGRA_GMI_HOLD_WIDTH(x)		((x & 0xf) << 8)
> +#define TEGRA_GMI_ADV_WIDTH(x)		((x & 0xf) << 4)
> +#define TEGRA_GMI_CE_WIDTH(x)		(x & 0xf)
> +
> +#define TEGRA_GMI_TIMING1			0x14
> +#define TEGRA_GMI_WE_WIDTH(x)		((x & 0xff) << 16)
> +#define TEGRA_GMI_OE_WIDTH(x)		((x & 0xff) << 8)
> +#define TEGRA_GMI_WAIT_WIDTH(x)		(x & 0xff)
> +
> +struct tegra_gmi_priv {
> +	void __iomem *base;
> +
> +	u32 snor_config;
> +	u32 snor_timing0;
> +	u32 snor_timing1;
> +
> +	struct clk *clk;
> +};
> +
> +static void tegra_gmi_init(struct device *dev, struct tegra_gmi_priv *priv)
> +{
> +	writel(priv->snor_timing0, priv->base + TEGRA_GMI_TIMING0);
> +	writel(priv->snor_timing1, priv->base + TEGRA_GMI_TIMING1);
> +
> +	priv->snor_config |= TEGRA_GMI_CONFIG_GO;
> +	writel(priv->snor_config, priv->base + TEGRA_GMI_CONFIG);
> +}
> +
> +static int tegra_gmi_parse_dt(struct device *dev, struct tegra_gmi_priv *priv)
> +{
> +	struct device_node *of_node = dev->of_node;
> +	u32 property;
> +
> +	/* configuration */
> +
> +	if (of_property_read_bool(of_node, "nvidia,snor-data-width-32bit"))
> +		priv->snor_config |= TEGRA_GMI_BUS_WIDTH_32BIT;
> +
> +	if (of_property_read_bool(of_node, "nvidia,snor-mux-mode"))
> +		priv->snor_config |= TEGRA_GMI_MUX_MODE;
> +
> +	if (of_property_read_bool(of_node, "nvidia,snor-rdy-active-before-data"))

Line is over 80 characters.

> +		priv->snor_config |= TEGRA_GMI_RDY_BEFORE_DATA;
> +
> +	if (of_property_read_bool(of_node, "nvidia,snor-rdy-inv"))
> +		priv->snor_config |= TEGRA_GMI_RDY_ACTIVE_HIGH;
> +
> +	if (of_property_read_bool(of_node, "nvidia,snor-adv-inv"))
> +		priv->snor_config |= TEGRA_GMI_ADV_ACTIVE_HIGH;
> +
> +	if (of_property_read_bool(of_node, "nvidia,snor-oe-inv"))
> +		priv->snor_config |= TEGRA_GMI_OE_ACTIVE_HIGH;
> +
> +	if (of_property_read_bool(of_node, "nvidia,snor-cs-inv"))
> +		priv->snor_config |= TEGRA_GMI_CS_ACTIVE_HIGH;
> +
> +	if (!of_property_read_u32(of_node, "nvidia,snor-cs-select", &property))
> +		priv->snor_config |= TEGRA_GMI_CS_SELECT(property);
> +
> +	/* Timing, the default values that are provided are reset values */
> +
> +	if (!of_property_read_u32(of_node, "nvidia,snor-muxed-width", &property))

Line is over 80 characters.

> +		priv->snor_timing0 |= TEGRA_GMI_MUXED_WIDTH(property);
> +	else
> +		priv->snor_timing0 |= TEGRA_GMI_MUXED_WIDTH(1);
> +
> +	if (!of_property_read_u32(of_node, "nvidia,snor-hold-width", &property))
> +		priv->snor_timing0 |= TEGRA_GMI_HOLD_WIDTH(property);
> +	else
> +		priv->snor_timing0 |= TEGRA_GMI_HOLD_WIDTH(1);
> +
> +	if (!of_property_read_u32(of_node, "nvidia,snor-adv-width", &property))
> +		priv->snor_timing0 |= TEGRA_GMI_ADV_WIDTH(property);
> +	else
> +		priv->snor_timing0 |= TEGRA_GMI_ADV_WIDTH(1);
> +
> +	if (!of_property_read_u32(of_node, "nvidia,snor-ce-width", &property))
> +		priv->snor_timing0 |= TEGRA_GMI_CE_WIDTH(property);
> +	else
> +		priv->snor_timing0 |= TEGRA_GMI_CE_WIDTH(4);
> +
> +	if (!of_property_read_u32(of_node, "nvidia,snor-we-width", &property))
> +		priv->snor_timing1 |= TEGRA_GMI_WE_WIDTH(property);
> +	else
> +		priv->snor_timing1 |= TEGRA_GMI_WE_WIDTH(1);
> +
> +	if (!of_property_read_u32(of_node, "nvidia,snor-oe-width", &property))
> +		priv->snor_timing1 |= TEGRA_GMI_OE_WIDTH(property);
> +	else
> +		priv->snor_timing1 |= TEGRA_GMI_OE_WIDTH(1);
> +
> +	if (!of_property_read_u32(of_node, "nvidia,snor-wait-width", &property))
> +		priv->snor_timing1 |= TEGRA_GMI_WAIT_WIDTH(property);
> +	else
> +		priv->snor_timing1 |= TEGRA_GMI_WAIT_WIDTH(3);
> +
> +	return of_platform_default_populate(of_node, NULL, dev);

Seems odd to do this here. Why not as the last thing in probe once the
GMI has been setup correctly?

> +}
> +
> +static int tegra_gmi_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct clk *clk;
> +	struct device *dev = &pdev->dev;
> +	struct reset_control *rst;
> +	struct tegra_gmi_priv *priv;
> +	void __iomem *base;
> +	int ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = base;

If you allocate the memory first, you can get rid of this extra base
variable.

> +	clk = devm_clk_get(dev, "gmi");
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "can not get clock\n");
> +		return PTR_ERR(clk);
> +	}
> +
> +	priv->clk = clk;

Why not set priv->clk directly from calling devm_clk_get? Then you don't
this extra clk variable.

> +
> +	rst = devm_reset_control_get(dev, "gmi");
> +	if (IS_ERR(rst)) {
> +		dev_err(dev, "can not get reset\n");
> +		return PTR_ERR(rst);
> +	}
> +
> +	ret = tegra_gmi_parse_dt(dev, priv);
> +	if (ret) {
> +		dev_err(dev, "fail to create devices.\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(clk);
> +	if (ret) {
> +		dev_err(dev, "fail to enable clock.\n");
> +		return ret;
> +	}
> +
> +	reset_control_assert(rst);
> +	udelay(2);
> +	reset_control_deassert(rst);
> +
> +	tegra_gmi_init(dev, priv);
> +
> +	dev_set_drvdata(dev, priv);
> +
> +	return 0;
> +}
> +
> +static int tegra_gmi_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;

Do you really need this dev variable?

> +	struct tegra_gmi_priv *priv = dev_get_drvdata(dev);
> +	void __iomem *base = priv->base;

Do you really need this base variable?

> +	u32 config;
> +
> +	of_platform_depopulate(dev);
> +
> +	config = readl(base + TEGRA_GMI_CONFIG);
> +	config &= ~TEGRA_GMI_CONFIG_GO;
> +	writel(config, base + TEGRA_GMI_CONFIG);
> +
> +	clk_disable_unprepare(priv->clk);

What about asserting the reset?

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tegra_gmi_id_table[] = {
> +	{ .compatible = "nvidia,tegra20-gmi", },
> +	{ .compatible = "nvidia,tegra30-gmi", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tegra_gmi_id_table);
> +
> +static struct platform_driver tegra_gmi_driver = {
> +	.probe = tegra_gmi_probe,
> +	.remove = tegra_gmi_remove,
> +	.driver = {
> +		.name		= "tegra-gmi",
> +		.of_match_table	= tegra_gmi_id_table,
> +	},
> +};
> +module_platform_driver(tegra_gmi_driver);
> +
> +MODULE_AUTHOR("Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org");
> +MODULE_DESCRIPTION("NVIDIA Tegra GMI Bus Driver");
> +MODULE_LICENSE("GPL v2");
> 

Cheers
Jon

-- 
nvpublic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
