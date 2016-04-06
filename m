From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v10 4/9] phy: Add Tegra XUSB pad controller support
Date: Wed, 6 Apr 2016 18:13:42 +0530
Message-ID: <5705047E.4050700@ti.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-4-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457108379-20794-4-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Friday 04 March 2016 09:49 PM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add a new driver for the XUSB pad controller found on NVIDIA Tegra SoCs.
> This hardware block used to be exposed as a pin controller, but it turns
> out that this isn't a good fit. The new driver and DT binding much more
> accurately describe the hardware and are more flexible in supporting new
> SoC generations.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v9:
> - export public API for direct use by the xHCI driver (replaces mailbox
>   API which had introduced a nasty circular dependency)
> 
>  drivers/phy/Kconfig                        |    2 +
>  drivers/phy/Makefile                       |    2 +
>  drivers/phy/tegra/Kconfig                  |    8 +
>  drivers/phy/tegra/Makefile                 |    5 +
>  drivers/phy/tegra/xusb-tegra124.c          | 1747 ++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.c                   | 1017 ++++++++++++++++
>  drivers/phy/tegra/xusb.h                   |  421 +++++++
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c |   20 +-
>  include/linux/phy/tegra/xusb.h             |   30 +
>  9 files changed, 3236 insertions(+), 16 deletions(-)
>  create mode 100644 drivers/phy/tegra/Kconfig
>  create mode 100644 drivers/phy/tegra/Makefile
>  create mode 100644 drivers/phy/tegra/xusb-tegra124.c
>  create mode 100644 drivers/phy/tegra/xusb.c
>  create mode 100644 drivers/phy/tegra/xusb.h
>  create mode 100644 include/linux/phy/tegra/xusb.h
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 0124d17bd9fe..4bf65ceb3250 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -407,4 +407,6 @@ config PHY_CYGNUS_PCIE
>  	  Enable this to support the Broadcom Cygnus PCIe PHY.
>  	  If unsure, say N.
>  
> +source "drivers/phy/tegra/Kconfig"
> +
>  endmenu
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index c80f09df3bb8..82709141d072 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -50,3 +50,5 @@ obj-$(CONFIG_PHY_TUSB1210)		+= phy-tusb1210.o
>  obj-$(CONFIG_PHY_BRCMSTB_SATA)		+= phy-brcmstb-sata.o
>  obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
>  obj-$(CONFIG_PHY_CYGNUS_PCIE)		+= phy-bcm-cygnus-pcie.o
> +
> +obj-$(CONFIG_ARCH_TEGRA) += tegra/
> diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
> new file mode 100644
> index 000000000000..a3b1de953fb7
> --- /dev/null
> +++ b/drivers/phy/tegra/Kconfig
> @@ -0,0 +1,8 @@
> +config PHY_TEGRA_XUSB
> +	tristate "NVIDIA Tegra XUSB pad controller driver"
> +	depends on ARCH_TEGRA
> +	help
> +	  Choose this option if you have an NVIDIA Tegra SoC.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called phy-tegra-xusb.
> diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
> new file mode 100644
> index 000000000000..31150b4337cd
> --- /dev/null
> +++ b/drivers/phy/tegra/Makefile
> @@ -0,0 +1,5 @@
> +obj-$(CONFIG_PHY_TEGRA_XUSB) += phy-tegra-xusb.o
> +
> +phy-tegra-xusb-y += xusb.o
> +phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_124_SOC) += xusb-tegra124.o
> +phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) += xusb-tegra124.o
> diff --git a/drivers/phy/tegra/xusb-tegra124.c b/drivers/phy/tegra/xusb-tegra124.c
> new file mode 100644
> index 000000000000..6340d43688d3
> --- /dev/null
> +++ b/drivers/phy/tegra/xusb-tegra124.c
> @@ -0,0 +1,1747 @@
> +/*
> + * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include <soc/tegra/fuse.h>
> +
> +#include "xusb.h"
> +
> +#define FUSE_SKU_CALIB_HS_CURR_LEVEL_PADX_SHIFT(x) ((x) ? 15 : 0)
> +#define FUSE_SKU_CALIB_HS_CURR_LEVEL_PAD_MASK 0x3f
> +#define FUSE_SKU_CALIB_HS_IREF_CAP_SHIFT 13
> +#define FUSE_SKU_CALIB_HS_IREF_CAP_MASK 0x3
> +#define FUSE_SKU_CALIB_HS_SQUELCH_LEVEL_SHIFT 11
> +#define FUSE_SKU_CALIB_HS_SQUELCH_LEVEL_MASK 0x3
> +#define FUSE_SKU_CALIB_HS_TERM_RANGE_ADJ_SHIFT 7
> +#define FUSE_SKU_CALIB_HS_TERM_RANGE_ADJ_MASK 0xf
> +
> +#define XUSB_PADCTL_USB2_PORT_CAP 0x008
> +#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_SHIFT(x) ((x) * 4)
> +#define XUSB_PADCTL_USB2_PORT_CAP_PORT_CAP_MASK 0x3
> +#define XUSB_PADCTL_USB2_PORT_CAP_DISABLED 0x0
> +#define XUSB_PADCTL_USB2_PORT_CAP_HOST 0x1
> +#define XUSB_PADCTL_USB2_PORT_CAP_DEVICE 0x2
> +#define XUSB_PADCTL_USB2_PORT_CAP_OTG 0x3
> +
> +#define XUSB_PADCTL_SS_PORT_MAP 0x014
> +#define XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(x) (1 << (((x) * 4) + 3))
> +#define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_SHIFT(x) ((x) * 4)
> +#define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(x) (0x7 << ((x) * 4))
> +#define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(x, v) (((v) & 0x7) << ((x) * 4))
> +#define XUSB_PADCTL_SS_PORT_MAP_PORT_MAP_MASK 0x7
> +
> +#define XUSB_PADCTL_ELPG_PROGRAM 0x01c
> +#define XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN (1 << 26)
> +#define XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN_EARLY (1 << 25)
> +#define XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN (1 << 24)
> +#define XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_VCORE_DOWN(x) (1 << (18 + (x) * 4))
> +#define XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN_EARLY(x) \
> +							(1 << (17 + (x) * 4))
> +#define XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN(x) (1 << (16 + (x) * 4))
> +
> +#define XUSB_PADCTL_IOPHY_PLL_P0_CTL1 0x040
> +#define XUSB_PADCTL_IOPHY_PLL_P0_CTL1_PLL0_LOCKDET (1 << 19)
> +#define XUSB_PADCTL_IOPHY_PLL_P0_CTL1_REFCLK_SEL_MASK (0xf << 12)
> +#define XUSB_PADCTL_IOPHY_PLL_P0_CTL1_PLL_RST (1 << 1)
> +
> +#define XUSB_PADCTL_IOPHY_PLL_P0_CTL2 0x044
> +#define XUSB_PADCTL_IOPHY_PLL_P0_CTL2_REFCLKBUF_EN (1 << 6)
> +#define XUSB_PADCTL_IOPHY_PLL_P0_CTL2_TXCLKREF_EN (1 << 5)
> +#define XUSB_PADCTL_IOPHY_PLL_P0_CTL2_TXCLKREF_SEL (1 << 4)
> +
> +#define XUSB_PADCTL_IOPHY_USB3_PADX_CTL2(x) (0x058 + (x) * 4)
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_CDR_CNTL_SHIFT 24
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_CDR_CNTL_MASK 0xff
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_CDR_CNTL_VAL 0x24
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_SHIFT 16
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_MASK 0x3f
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_SHIFT 8
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_MASK 0x3f
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_SHIFT 8
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_MASK 0xffff
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_VAL 0xf070
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_WANDER_SHIFT 4
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_WANDER_MASK 0xf
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_WANDER_VAL 0xf
> +
> +#define XUSB_PADCTL_IOPHY_USB3_PADX_CTL4(x) (0x068 + (x) * 4)
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_SHIFT 24
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_MASK 0x1f
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_SHIFT 16
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_MASK 0x7f
> +#define XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_VAL 0x002008ee
> +
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL2(x) ((x) < 2 ? 0x078 + (x) * 4 : \
> +					       0x0f8 + (x) * 4)
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_SHIFT 28
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_MASK 0x3
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_VAL 0x1
> +
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL5(x) ((x) < 2 ? 0x090 + (x) * 4 : \
> +					       0x11c + (x) * 4)
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL5_RX_QEYE_EN (1 << 8)
> +
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL6(x) ((x) < 2 ? 0x098 + (x) * 4 : \
> +					       0x128 + (x) * 4)
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SHIFT 24
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_G_Z_MASK 0x3f
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_TAP_MASK 0x1f
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_AMP_MASK 0x7f
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_SHIFT 16
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_MASK 0xff
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_G_Z 0x21
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_TAP 0x32
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_AMP 0x33
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_CTLE_Z 0x48
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_LATCH_G_Z 0xa1
> +
> +#define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x) (0x0a0 + (x) * 4)
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD_ZI (1 << 21)
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD2 (1 << 20)
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD (1 << 19)
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL0_LS_RSLEW_SHIFT 14
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL0_LS_RSLEW_MASK 0x3
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL0_LS_RSLEW_VAL(x) ((x) ? 0x0 : 0x3)
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_SLEW_SHIFT 6
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_SLEW_MASK 0x3f
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_SLEW_VAL 0x0e
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_CURR_LEVEL_SHIFT 0
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_CURR_LEVEL_MASK 0x3f
> +
> +#define XUSB_PADCTL_USB2_OTG_PADX_CTL1(x) (0x0ac + (x) * 4)
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL1_HS_IREF_CAP_SHIFT 9
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL1_HS_IREF_CAP_MASK 0x3
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL1_TERM_RANGE_ADJ_SHIFT 3
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL1_TERM_RANGE_ADJ_MASK 0x7
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_DR (1 << 2)
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_DISC_FORCE_POWERUP (1 << 1)
> +#define XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_CHRP_FORCE_POWERUP (1 << 0)
> +
> +#define XUSB_PADCTL_USB2_BIAS_PAD_CTL0 0x0b8
> +#define XUSB_PADCTL_USB2_BIAS_PAD_CTL0_PD (1 << 12)
> +#define XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_DISCON_LEVEL_SHIFT 2
> +#define XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_DISCON_LEVEL_MASK 0x7
> +#define XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_DISCON_LEVEL_VAL 0x5
> +#define XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_SHIFT 0
> +#define XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_MASK 0x3
> +
> +#define XUSB_PADCTL_HSIC_PADX_CTL0(x) (0x0c0 + (x) * 4)
> +#define XUSB_PADCTL_HSIC_PAD_CTL0_TX_RSLEWN_SHIFT 12
> +#define XUSB_PADCTL_HSIC_PAD_CTL0_TX_RSLEWN_MASK 0x7
> +#define XUSB_PADCTL_HSIC_PAD_CTL0_TX_RSLEWP_SHIFT 8
> +#define XUSB_PADCTL_HSIC_PAD_CTL0_TX_RSLEWP_MASK 0x7
> +#define XUSB_PADCTL_HSIC_PAD_CTL0_TX_RTUNEN_SHIFT 4
> +#define XUSB_PADCTL_HSIC_PAD_CTL0_TX_RTUNEN_MASK 0x7
> +#define XUSB_PADCTL_HSIC_PAD_CTL0_TX_RTUNEP_SHIFT 0
> +#define XUSB_PADCTL_HSIC_PAD_CTL0_TX_RTUNEP_MASK 0x7
> +
> +#define XUSB_PADCTL_HSIC_PADX_CTL1(x) (0x0c8 + (x) * 4)
> +#define XUSB_PADCTL_HSIC_PAD_CTL1_RPU_STROBE (1 << 10)
> +#define XUSB_PADCTL_HSIC_PAD_CTL1_RPU_DATA (1 << 9)
> +#define XUSB_PADCTL_HSIC_PAD_CTL1_RPD_STROBE (1 << 8)
> +#define XUSB_PADCTL_HSIC_PAD_CTL1_RPD_DATA (1 << 7)
> +#define XUSB_PADCTL_HSIC_PAD_CTL1_PD_ZI (1 << 5)
> +#define XUSB_PADCTL_HSIC_PAD_CTL1_PD_RX (1 << 4)
> +#define XUSB_PADCTL_HSIC_PAD_CTL1_PD_TRX (1 << 3)
> +#define XUSB_PADCTL_HSIC_PAD_CTL1_PD_TX (1 << 2)
> +#define XUSB_PADCTL_HSIC_PAD_CTL1_AUTO_TERM_EN (1 << 0)
> +
> +#define XUSB_PADCTL_HSIC_PADX_CTL2(x) (0x0d0 + (x) * 4)
> +#define XUSB_PADCTL_HSIC_PAD_CTL2_RX_STROBE_TRIM_SHIFT 4
> +#define XUSB_PADCTL_HSIC_PAD_CTL2_RX_STROBE_TRIM_MASK 0x7
> +#define XUSB_PADCTL_HSIC_PAD_CTL2_RX_DATA_TRIM_SHIFT 0
> +#define XUSB_PADCTL_HSIC_PAD_CTL2_RX_DATA_TRIM_MASK 0x7
> +
> +#define XUSB_PADCTL_HSIC_STRB_TRIM_CONTROL 0x0e0
> +#define XUSB_PADCTL_HSIC_STRB_TRIM_CONTROL_STRB_TRIM_MASK 0x1f
> +
> +#define XUSB_PADCTL_USB3_PAD_MUX 0x134
> +#define XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(x) (1 << (1 + (x)))
> +#define XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(x) (1 << (6 + (x)))
> +
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL1 0x138
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL1_LOCKDET (1 << 27)
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL1_MODE (1 << 24)
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL0_REFCLK_NDIV_SHIFT 20
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL0_REFCLK_NDIV_MASK 0x3
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL_PWR_OVRD (1 << 3)
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL_RST (1 << 1)
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL_IDDQ (1 << 0)
> +
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL2 0x13c
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL2_PLL1_CP_CNTL_SHIFT 20
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL2_PLL1_CP_CNTL_MASK 0xf
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL2_PLL0_CP_CNTL_SHIFT 16
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL2_PLL0_CP_CNTL_MASK 0xf
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL2_TCLKOUT_EN (1 << 12)
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL2_TXCLKREF_SEL (1 << 4)
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL2_XDIGCLK_SEL_SHIFT 0
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL2_XDIGCLK_SEL_MASK 0x7
> +
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL3 0x140
> +#define XUSB_PADCTL_IOPHY_PLL_S0_CTL3_RCAL_BYPASS (1 << 7)
> +
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL1 0x148
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL1_IDDQ_OVRD (1 << 1)
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL1_IDDQ (1 << 0)
> +
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL2 0x14c
> +
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL5 0x158
> +
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL6 0x15c
> +
> +struct tegra124_xusb_fuse_calibration {
> +	u32 hs_curr_level[3];
> +	u32 hs_iref_cap;
> +	u32 hs_term_range_adj;
> +	u32 hs_squelch_level;
> +};

All these calibration data can come from dt and a generic PHY function to set
these data to registers.

But before that can be done we have to standardize the bindings for every
calibration data and then add a generic PHY function :-/ That might take some
time to add, so for now I'm okay to have all calibration data in driver.
> +
> +struct tegra124_xusb_padctl {
> +	struct tegra_xusb_padctl base;
> +
> +	struct tegra124_xusb_fuse_calibration fuse;
> +};
> +
> +static inline struct tegra124_xusb_padctl *
> +to_tegra124_xusb_padctl(struct tegra_xusb_padctl *padctl)
> +{
> +	return container_of(padctl, struct tegra124_xusb_padctl, base);
> +}
> +
.
.
<snip>
.
.

> +
> +static const char * const tegra124_ulpi_functions[] = {
> +	"snps",
> +	"xusb",
> +};
> +
> +static const struct tegra_xusb_lane_soc tegra124_ulpi_lanes[] = {
> +	TEGRA124_LANE("ulpi-0", 0x004, 12, 0x1, ulpi),
> +};
> +
> +static struct tegra_xusb_lane *
> +tegra124_ulpi_lane_probe(struct tegra_xusb_pad *pad, struct device_node *np,
> +			 unsigned int index)
> +{
> +	struct tegra_xusb_ulpi_lane *ulpi;
> +	int err;
> +
> +	ulpi = kzalloc(sizeof(*ulpi), GFP_KERNEL);
> +	if (!ulpi)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&ulpi->base.list);
> +	ulpi->base.soc = &pad->soc->lanes[index];
> +	ulpi->base.index = index;
> +	ulpi->base.pad = pad;
> +	ulpi->base.np = np;
> +

ulpi PHY's can be found dynamically right? Should this use the ulpi phy library?

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
