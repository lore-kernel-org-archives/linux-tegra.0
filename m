From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V7 5/9] mfd: Add driver for NVIDIA Tegra XUSB
Date: Wed, 29 Apr 2015 10:23:48 +0100
Message-ID: <20150429092348.GQ9169@x1>
References: <1430174242-29465-1-git-send-email-abrestic@chromium.org>
 <1430174242-29465-6-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430174242-29465-6-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, 27 Apr 2015, Andrew Bresticker wrote:

> Add an MFD driver for the XUSB host complex found on NVIDIA Tegra124
> and later SoCs.
>=20
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Cc: Samuel Ortiz <sameo@linux.intel.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
> New for v7.
> ---
>  drivers/mfd/Kconfig      |   7 ++
>  drivers/mfd/Makefile     |   1 +
>  drivers/mfd/tegra-xusb.c | 167 +++++++++++++++++++++++++++++++++++++=
++++++++++
>  include/soc/tegra/xusb.h |  19 ++++++
>  4 files changed, 194 insertions(+)
>  create mode 100644 drivers/mfd/tegra-xusb.c
>  create mode 100644 include/soc/tegra/xusb.h
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index d5ad04d..61872b4 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1430,6 +1430,13 @@ config MFD_STW481X
>  	  in various ST Microelectronics and ST-Ericsson embedded
>  	  Nomadik series.
> =20
> +config MFD_TEGRA_XUSB
> +	tristate "NVIDIA Tegra XUSB"
> +	depends on ARCH_TEGRA
> +	select MFD_CORE
> +	help
> +	  Support for the XUSB complex found on NVIDIA Tegra124 and later S=
oCs.
> +
>  menu "Multimedia Capabilities Port drivers"
>  	depends on ARCH_SA1100
> =20
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 0e5cfeb..7588caf 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -181,6 +181,7 @@ obj-$(CONFIG_MFD_HI6421_PMIC)	+=3D hi6421-pmic-co=
re.o
>  obj-$(CONFIG_MFD_DLN2)		+=3D dln2.o
>  obj-$(CONFIG_MFD_RT5033)	+=3D rt5033.o
>  obj-$(CONFIG_MFD_SKY81452)	+=3D sky81452.o
> +obj-$(CONFIG_MFD_TEGRA_XUSB)	+=3D tegra-xusb.o
> =20
>  intel-soc-pmic-objs		:=3D intel_soc_pmic_core.o intel_soc_pmic_crc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC)	+=3D intel-soc-pmic.o
> diff --git a/drivers/mfd/tegra-xusb.c b/drivers/mfd/tegra-xusb.c
> new file mode 100644
> index 0000000..d30d259
> --- /dev/null
> +++ b/drivers/mfd/tegra-xusb.c
> @@ -0,0 +1,167 @@
> +/*
> + * NVIDIA Tegra XUSB MFD driver
> + *
> + * Copyright (C) 2015 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mfd/core.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#include <soc/tegra/xusb.h>
> +
> +struct tegra_xusb_soc_data {
> +	struct mfd_cell *devs;
> +	unsigned int num_devs;
> +};
> +
> +static struct resource tegra_xhci_resources[] =3D {
> +	{
> +		.name =3D "host",
> +		.flags =3D IORESOURCE_IRQ,
> +	},
> +	{
> +		.name =3D "xhci",
> +		.flags =3D IORESOURCE_MEM,
> +	},
> +	{
> +		.name =3D "ipfs",
> +		.flags =3D IORESOURCE_MEM,
> +	},
> +};
> +
> +static struct resource tegra_xusb_mbox_resources[] =3D {
> +	{
> +		.name =3D "smi",
> +		.flags =3D IORESOURCE_IRQ,
> +	},
> +};

DEFINE_RES_IRQ_NAMED()

> +static struct mfd_cell tegra124_xusb_devs[] =3D {
> +	{
> +		.name =3D "tegra-xhci",
> +		.of_compatible =3D "nvidia,tegra124-xhci",
> +	},
> +	{
> +		.name =3D "tegra-xusb-mbox",
> +		.of_compatible =3D "nvidia,tegra124-xusb-mbox",
> +	},
> +};
> +
> +static const struct tegra_xusb_soc_data tegra124_xusb_data =3D {
> +	.devs =3D tegra124_xusb_devs,
> +	.num_devs =3D ARRAY_SIZE(tegra124_xusb_devs),
> +};
> +
> +static const struct of_device_id tegra_xusb_of_match[] =3D {
> +	{ .compatible =3D "nvidia,tegra124-xusb", .data =3D &tegra124_xusb_=
data },

Yuk!  Why are you mixing platform data and DT in this way?

Why can't you just stick all of this in DT?

> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);
> +static struct regmap_config tegra_fpci_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};
> +
> +static int tegra_xusb_probe(struct platform_device *pdev)
> +{
> +	const struct tegra_xusb_soc_data *soc;
> +	const struct of_device_id *match;
> +	struct tegra_xusb *xusb;
> +	struct resource *res;
> +	void __iomem *fpci_base;
> +	int irq, ret;
> +
> +	xusb =3D devm_kzalloc(&pdev->dev, sizeof(*xusb), GFP_KERNEL);
> +	if (!xusb)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, xusb);
> +
> +	match =3D of_match_node(tegra_xusb_of_match, pdev->dev.of_node);
> +	soc =3D match->data;
> +
> +	irq =3D platform_get_irq_byname(pdev, "host");
> +	if (irq < 0)
> +		return irq;
> +	tegra_xhci_resources[0].start =3D irq;
> +	tegra_xhci_resources[0].end =3D irq;
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "xhci");
> +	if (!res)
> +		return -ENODEV;
> +	tegra_xhci_resources[1].start =3D res->start;
> +	tegra_xhci_resources[1].end =3D res->end;
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "ipfs");
> +	if (!res)
> +		return -ENODEV;
> +	tegra_xhci_resources[2].start =3D res->start;
> +	tegra_xhci_resources[2].end =3D res->end;
> +
> +	soc->devs[0].resources =3D tegra_xhci_resources;
> +	soc->devs[0].num_resources =3D ARRAY_SIZE(tegra_xhci_resources);
> +
> +	irq =3D platform_get_irq_byname(pdev, "smi");
> +	if (irq < 0)
> +		return irq;
> +	tegra_xusb_mbox_resources[0].start =3D irq;
> +	tegra_xusb_mbox_resources[0].end =3D irq;
> +
> +	soc->devs[1].resources =3D tegra_xusb_mbox_resources;
> +	soc->devs[1].num_resources =3D ARRAY_SIZE(tegra_xusb_mbox_resources=
);
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "fpci");
> +	fpci_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(fpci_base))
> +		return PTR_ERR(fpci_base);

This stuff is not good.

Either let MFD handle it with mfd_cells or stick all of this stuff in
DT and parse it from the child devices.

> +	tegra_fpci_regmap_config.max_register =3D res->end - res->start - 3=
;
> +	xusb->fpci_regs =3D devm_regmap_init_mmio(&pdev->dev, fpci_base,
> +						&tegra_fpci_regmap_config);
> +	if (IS_ERR(xusb->fpci_regs)) {
> +		ret =3D PTR_ERR(xusb->fpci_regs);
> +		dev_err(&pdev->dev, "Failed to init regmap: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D mfd_add_devices(&pdev->dev, -1, soc->devs, soc->num_devs,
> +			      NULL, 0, NULL);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to add MFD devices: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tegra_xusb_remove(struct platform_device *pdev)
> +{
> +	mfd_remove_devices(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver tegra_xusb_driver =3D {
> +	.probe =3D tegra_xusb_probe,
> +	.remove =3D tegra_xusb_remove,
> +	.driver =3D {
> +		.name =3D "tegra-xusb",
> +		.of_match_table =3D tegra_xusb_of_match,
> +	},
> +};
> +module_platform_driver(tegra_xusb_driver);
> +
> +MODULE_DESCRIPTION("NVIDIA Tegra XUSB MFD");
> +MODULE_AUTHOR("Andrew Bresticker <abrestic@chromium.org>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/soc/tegra/xusb.h b/include/soc/tegra/xusb.h
> new file mode 100644
> index 0000000..9d28d90
> --- /dev/null
> +++ b/include/soc/tegra/xusb.h
> @@ -0,0 +1,19 @@
> +/*
> + * Copyright (C) 2014 NVIDIA Corporation
> + * Copyright (C) 2014 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + */
> +
> +#ifndef __SOC_TEGRA_XUSB_H__
> +#define __SOC_TEGRA_XUSB_H__
> +
> +struct regmap;
> +
> +struct tegra_xusb {
> +	struct regmap *fpci_regs;

Are you going to add to this?

> +};
> +
> +#endif /* __SOC_TEGRA_XUSB_H__ */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
