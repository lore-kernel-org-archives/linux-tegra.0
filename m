From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 5/9] mfd: Add driver for NVIDIA Tegra XUSB
Date: Wed, 13 May 2015 15:37:15 +0100
Message-ID: <20150513143715.GZ3394@x1>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org>
 <1430761002-9327-6-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430761002-9327-6-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 04 May 2015, Andrew Bresticker wrote:

> Add an MFD driver for the XUSB host complex found on NVIDIA Tegra124
> and later SoCs.

What else does it do besides USB?

> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> Changes from v7:
>  - Have child nodes get non-shared memory and interrupts from DT.
>  - Use of_platform_populate rather than mfd_add_devices.
>  - Get rid of struct tegra_xusb.
> New for v7.
> ---
>  drivers/mfd/Kconfig      |  7 +++++
>  drivers/mfd/Makefile     |  1 +
>  drivers/mfd/tegra-xusb.c | 75 ++++++++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 83 insertions(+)
>  create mode 100644 drivers/mfd/tegra-xusb.c
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
> index 0000000..e11fa23
> --- /dev/null
> +++ b/drivers/mfd/tegra-xusb.c
> @@ -0,0 +1,75 @@
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
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +static const struct of_device_id tegra_xusb_of_match[] =3D {
> +	{ .compatible =3D "nvidia,tegra124-xusb", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);

If you're not using this to patch on, I'd prefer you place it next to
where it's first used i.e. down at the bottom of the file.

> +static struct regmap_config tegra_fpci_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};
> +
> +static int tegra_xusb_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct regmap *fpci_regs;
> +	void __iomem *fpci_base;
> +	int ret;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	fpci_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(fpci_base))
> +		return PTR_ERR(fpci_base);
> +
> +	tegra_fpci_regmap_config.max_register =3D res->end - res->start - 3=
;
> +	fpci_regs =3D devm_regmap_init_mmio(&pdev->dev, fpci_base,
> +					  &tegra_fpci_regmap_config);
> +	if (IS_ERR(fpci_regs)) {
> +		ret =3D PTR_ERR(fpci_regs);
> +		dev_err(&pdev->dev, "Failed to init regmap: %d\n", ret);
> +		return ret;
> +	}
> +	platform_set_drvdata(pdev, fpci_regs);
> +
> +	ret =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->=
dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to add sub-devices: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver tegra_xusb_driver =3D {
> +	.probe =3D tegra_xusb_probe,

No .remove()?

> +	.driver =3D {
> +		.name =3D "tegra-xusb",
> +		.of_match_table =3D tegra_xusb_of_match,
> +	},
> +};
> +module_platform_driver(tegra_xusb_driver);
> +
> +MODULE_DESCRIPTION("NVIDIA Tegra XUSB MFD");
> +MODULE_AUTHOR("Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
