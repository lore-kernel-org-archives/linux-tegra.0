From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 4/6] mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver
Date: Tue, 12 Jun 2018 15:17:09 +0300
Message-ID: <1545813.ZRopxvRBbF@dimapc>
References: <20180611205224.23340-1-stefan@agner.ch> <20180611205224.23340-5-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611205224.23340-5-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Monday, 11 June 2018 23:52:22 MSK Stefan Agner wrote:
> Add support for the NAND flash controller found on NVIDIA
> Tegra 2 SoCs. This implementation does not make use of the
> command queue feature. Regular operations/data transfers are
> done in PIO mode. Page read/writes with hardware ECC make
> use of the DMA for data transfer.
> 
> Signed-off-by: Lucas Stach <dev@lynxeye.de>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  MAINTAINERS                       |    7 +
>  drivers/mtd/nand/raw/Kconfig      |    6 +
>  drivers/mtd/nand/raw/Makefile     |    1 +
>  drivers/mtd/nand/raw/tegra_nand.c | 1248 +++++++++++++++++++++++++++++
>  4 files changed, 1262 insertions(+)
>  create mode 100644 drivers/mtd/nand/raw/tegra_nand.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58b9861ccf99..c2e5571c85d4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13844,6 +13844,13 @@ M:	Laxman Dewangan <ldewangan@nvidia.com>
>  S:	Supported
>  F:	drivers/input/keyboard/tegra-kbc.c
> 
> +TEGRA NAND DRIVER
> +M:	Stefan Agner <stefan@agner.ch>
> +M:	Lucas Stach <dev@lynxeye.de>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
> +F:	drivers/mtd/nand/raw/tegra_nand.c
> +
>  TEGRA PWM DRIVER
>  M:	Thierry Reding <thierry.reding@gmail.com>
>  S:	Supported
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 19a2b283fbbe..e9093f52371e 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -534,4 +534,10 @@ config MTD_NAND_MTK
>  	  Enables support for NAND controller on MTK SoCs.
>  	  This controller is found on mt27xx, mt81xx, mt65xx SoCs.
> 
> +config MTD_NAND_TEGRA
> +	tristate "Support for NAND controller on NVIDIA Tegra"
> +	depends on ARCH_TEGRA || COMPILE_TEST
> +	help
> +	  Enables support for NAND flash controller on NVIDIA Tegra SoC.
> +
>  endif # MTD_NAND
> diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
> index 165b7ef9e9a1..d5a5f9832b88 100644
> --- a/drivers/mtd/nand/raw/Makefile
> +++ b/drivers/mtd/nand/raw/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_MTD_NAND_HISI504)	        += 
hisi504_nand.o
>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
>  obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
>  obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_ecc.o mtk_nand.o
> +obj-$(CONFIG_MTD_NAND_TEGRA)		+= tegra_nand.o
> 
>  nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
>  nand-objs += nand_amd.o
> diff --git a/drivers/mtd/nand/raw/tegra_nand.c
> b/drivers/mtd/nand/raw/tegra_nand.c new file mode 100644
> index 000000000000..dd23a5eb6af3
> --- /dev/null
> +++ b/drivers/mtd/nand/raw/tegra_nand.c
> @@ -0,0 +1,1248 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2018 Stefan Agner <stefan@agner.ch>
> + * Copyright (C) 2014-2015 Lucas Stach <dev@lynxeye.de>
> + * Copyright (C) 2012 Avionic Design GmbH
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>

The "delay.h" looks obsolete now, maybe you could drop it.
