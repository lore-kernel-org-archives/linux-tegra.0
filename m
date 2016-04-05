From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 4/9] phy: Add Tegra XUSB pad controller support
Date: Tue, 5 Apr 2016 15:16:05 +0200
Message-ID: <20160405131605.GA24972@ulmo.ba.sec>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-4-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457108379-20794-4-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kishon,

The dependencies within this series somewhat complicated, so I'd prefer
to take it all via one tree. Would you be willing to give an Acked-by on
this patch?

Thierry

On Fri, Mar 04, 2016 at 05:19:34PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Add a new driver for the XUSB pad controller found on NVIDIA Tegra SoCs.
> This hardware block used to be exposed as a pin controller, but it turns
> out that this isn't a good fit. The new driver and DT binding much more
> accurately describe the hardware and are more flexible in supporting new
> SoC generations.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v9:
> - export public API for direct use by the xHCI driver (replaces mailbox
>   API which had introduced a nasty circular dependency)
>=20
>  drivers/phy/Kconfig                        |    2 +
>  drivers/phy/Makefile                       |    2 +
>  drivers/phy/tegra/Kconfig                  |    8 +
>  drivers/phy/tegra/Makefile                 |    5 +
>  drivers/phy/tegra/xusb-tegra124.c          | 1747 ++++++++++++++++++++++=
++++++
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
>=20
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 0124d17bd9fe..4bf65ceb3250 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -407,4 +407,6 @@ config PHY_CYGNUS_PCIE
>  	  Enable this to support the Broadcom Cygnus PCIe PHY.
>  	  If unsure, say N.
> =20
> +source "drivers/phy/tegra/Kconfig"
> +
>  endmenu
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index c80f09df3bb8..82709141d072 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -50,3 +50,5 @@ obj-$(CONFIG_PHY_TUSB1210)		+=3D phy-tusb1210.o
>  obj-$(CONFIG_PHY_BRCMSTB_SATA)		+=3D phy-brcmstb-sata.o
>  obj-$(CONFIG_PHY_PISTACHIO_USB)		+=3D phy-pistachio-usb.o
>  obj-$(CONFIG_PHY_CYGNUS_PCIE)		+=3D phy-bcm-cygnus-pcie.o
> +
> +obj-$(CONFIG_ARCH_TEGRA) +=3D tegra/
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
> +obj-$(CONFIG_PHY_TEGRA_XUSB) +=3D phy-tegra-xusb.o
> +
> +phy-tegra-xusb-y +=3D xusb.o
> +phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_124_SOC) +=3D xusb-tegra124.o
> +phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) +=3D xusb-tegra124.o
> diff --git a/drivers/phy/tegra/xusb-tegra124.c b/drivers/phy/tegra/xusb-t=
egra124.c
> new file mode 100644
> index 000000000000..6340d43688d3
> --- /dev/null
> +++ b/drivers/phy/tegra/xusb-tegra124.c
> @@ -0,0 +1,1747 @@
> +/*
> + * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
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
> +#define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(x, v) (((v) & 0x7) << ((x) * 4=
))
> +#define XUSB_PADCTL_SS_PORT_MAP_PORT_MAP_MASK 0x7
> +
> +#define XUSB_PADCTL_ELPG_PROGRAM 0x01c
> +#define XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN (1 << 26)
> +#define XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN_EARLY (1 << 25)
> +#define XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN (1 << 24)
> +#define XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_VCORE_DOWN(x) (1 << (18 + (x)=
 * 4))
> +#define XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN_EARLY(x) \
> +							(1 << (17 + (x) * 4))
> +#define XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN(x) (1 << (16 + (x) *=
 4))
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
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL2(x) ((x) < 2 ? 0x078 + (x) * 4=
 : \
> +					       0x0f8 + (x) * 4)
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_SHIFT 28
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_MASK 0x3
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_VAL 0x1
> +
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL5(x) ((x) < 2 ? 0x090 + (x) * 4=
 : \
> +					       0x11c + (x) * 4)
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_CTL5_RX_QEYE_EN (1 << 8)
> +
> +#define XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL6(x) ((x) < 2 ? 0x098 + (x) * 4=
 : \
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
> +static int tegra124_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
> +{
> +	u32 value;
> +
> +	mutex_lock(&padctl->lock);
> +
> +	if (padctl->enable++ > 0)
> +		goto out;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
> +	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
> +
> +	usleep_range(100, 200);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
> +	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN_EARLY;
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
> +
> +	usleep_range(100, 200);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
> +	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
> +
> +out:
> +	mutex_unlock(&padctl->lock);
> +	return 0;
> +}
> +
> +static int tegra124_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
> +{
> +	u32 value;
> +
> +	mutex_lock(&padctl->lock);
> +
> +	if (WARN_ON(padctl->enable =3D=3D 0))
> +		goto out;
> +
> +	if (--padctl->enable > 0)
> +		goto out;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
> +	value |=3D XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
> +
> +	usleep_range(100, 200);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
> +	value |=3D XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN_EARLY;
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
> +
> +	usleep_range(100, 200);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
> +	value |=3D XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
> +
> +out:
> +	mutex_unlock(&padctl->lock);
> +	return 0;
> +}
> +
> +static int tegra124_usb3_save_context(struct tegra_xusb_padctl *padctl,
> +				      unsigned int index)
> +{
> +	struct tegra_xusb_usb3_port *port;
> +	struct tegra_xusb_lane *lane;
> +	u32 value, offset;
> +
> +	port =3D tegra_xusb_find_usb3_port(padctl, index);
> +	if (!port)
> +		return -ENODEV;
> +
> +	port->context_saved =3D true;
> +	lane =3D port->base.lane;
> +
> +	if (lane->pad =3D=3D padctl->pcie)
> +		offset =3D XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL6(lane->index);
> +	else
> +		offset =3D XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL6;
> +
> +	value =3D padctl_readl(padctl, offset);
> +	value &=3D ~(XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_MASK <<
> +		   XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_SHIFT);
> +	value |=3D XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_TAP <<
> +		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_SHIFT;
> +	padctl_writel(padctl, value, offset);
> +
> +	value =3D padctl_readl(padctl, offset) >>
> +		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SHIFT;
> +	port->tap1 =3D value & XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_TAP_MAS=
K;
> +
> +	value =3D padctl_readl(padctl, offset);
> +	value &=3D ~(XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_MASK <<
> +		   XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_SHIFT);
> +	value |=3D XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_AMP <<
> +		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_SHIFT;
> +	padctl_writel(padctl, value, offset);
> +
> +	value =3D padctl_readl(padctl, offset) >>
> +		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SHIFT;
> +	port->amp =3D value & XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_AMP_MASK;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_USB3_PADX_CTL4(index));
> +	value &=3D ~((XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_MASK <<
> +		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_SHIFT) |
> +		   (XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_MASK <<
> +		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_SHIFT));
> +	value |=3D (port->tap1 <<
> +		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_SHIFT) |
> +		 (port->amp <<
> +		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_SHIFT);
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_USB3_PADX_CTL4(index));
> +
> +	value =3D padctl_readl(padctl, offset);
> +	value &=3D ~(XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_MASK <<
> +		   XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_SHIFT);
> +	value |=3D XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_LATCH_G_Z <<
> +		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_SHIFT;
> +	padctl_writel(padctl, value, offset);
> +
> +	value =3D padctl_readl(padctl, offset);
> +	value &=3D ~(XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_MASK <<
> +		   XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_SHIFT);
> +	value |=3D XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_G_Z <<
> +		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_SHIFT;
> +	padctl_writel(padctl, value, offset);
> +
> +	value =3D padctl_readl(padctl, offset) >>
> +		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SHIFT;
> +	port->ctle_g =3D value &
> +		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_G_Z_MASK;
> +
> +	value =3D padctl_readl(padctl, offset);
> +	value &=3D ~(XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_MASK <<
> +		   XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_SHIFT);
> +	value |=3D XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_CTLE_Z <<
> +		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_SHIFT;
> +	padctl_writel(padctl, value, offset);
> +
> +	value =3D padctl_readl(padctl, offset) >>
> +		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SHIFT;
> +	port->ctle_z =3D value &
> +		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_G_Z_MASK;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_USB3_PADX_CTL2(index));
> +	value &=3D ~((XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_MASK <<
> +		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_SHIFT) |
> +		   (XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_MASK <<
> +		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_SHIFT));
> +	value |=3D (port->ctle_g <<
> +		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_SHIFT) |
> +		 (port->ctle_z <<
> +		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_SHIFT);
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_USB3_PADX_CTL2(index));
> +
> +	return 0;
> +}
> +
> +static int tegra124_hsic_set_idle(struct tegra_xusb_padctl *padctl,
> +				  unsigned int index, bool idle)
> +{
> +	u32 value;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_HSIC_PADX_CTL1(index));
> +
> +	if (idle)
> +		value |=3D XUSB_PADCTL_HSIC_PAD_CTL1_RPD_DATA |
> +			 XUSB_PADCTL_HSIC_PAD_CTL1_RPU_STROBE;
> +	else
> +		value &=3D ~(XUSB_PADCTL_HSIC_PAD_CTL1_RPD_DATA |
> +			   XUSB_PADCTL_HSIC_PAD_CTL1_RPU_STROBE);
> +
> +	padctl_writel(padctl, value, XUSB_PADCTL_HSIC_PADX_CTL1(index));
> +
> +	return 0;
> +}
> +
> +#define TEGRA124_LANE(_name, _offset, _shift, _mask, _type)		\
> +	{								\
> +		.name =3D _name,						\
> +		.offset =3D _offset,					\
> +		.shift =3D _shift,					\
> +		.mask =3D _mask,						\
> +		.num_funcs =3D ARRAY_SIZE(tegra124_##_type##_functions),	\
> +		.funcs =3D tegra124_##_type##_functions,			\
> +	}
> +
> +static const char * const tegra124_usb2_functions[] =3D {
> +	"snps",
> +	"xusb",
> +	"uart",
> +};
> +
> +static const struct tegra_xusb_lane_soc tegra124_usb2_lanes[] =3D {
> +	TEGRA124_LANE("usb2-0", 0x004,  0, 0x3, usb2),
> +	TEGRA124_LANE("usb2-1", 0x004,  2, 0x3, usb2),
> +	TEGRA124_LANE("usb2-2", 0x004,  4, 0x3, usb2),
> +};
> +
> +static struct tegra_xusb_lane *
> +tegra124_usb2_lane_probe(struct tegra_xusb_pad *pad, struct device_node =
*np,
> +			 unsigned int index)
> +{
> +	struct tegra_xusb_usb2_lane *usb2;
> +	int err;
> +
> +	usb2 =3D kzalloc(sizeof(*usb2), GFP_KERNEL);
> +	if (!usb2)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&usb2->base.list);
> +	usb2->base.soc =3D &pad->soc->lanes[index];
> +	usb2->base.index =3D index;
> +	usb2->base.pad =3D pad;
> +	usb2->base.np =3D np;
> +
> +	err =3D tegra_xusb_lane_parse_dt(&usb2->base, np);
> +	if (err < 0) {
> +		kfree(usb2);
> +		return ERR_PTR(err);
> +	}
> +
> +	return &usb2->base;
> +}
> +
> +static void tegra124_usb2_lane_remove(struct tegra_xusb_lane *lane)
> +{
> +	struct tegra_xusb_usb2_lane *usb2 =3D to_usb2_lane(lane);
> +
> +	kfree(usb2);
> +}
> +
> +static const struct tegra_xusb_lane_ops tegra124_usb2_lane_ops =3D {
> +	.probe =3D tegra124_usb2_lane_probe,
> +	.remove =3D tegra124_usb2_lane_remove,
> +};
> +
> +static int tegra124_usb2_phy_init(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +
> +	return tegra124_xusb_padctl_enable(lane->pad->padctl);
> +}
> +
> +static int tegra124_usb2_phy_exit(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +
> +	return tegra124_xusb_padctl_disable(lane->pad->padctl);
> +}
> +
> +static int tegra124_usb2_phy_power_on(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +	struct tegra_xusb_usb2_lane *usb2 =3D to_usb2_lane(lane);
> +	struct tegra_xusb_usb2_pad *pad =3D to_usb2_pad(lane->pad);
> +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +	struct tegra124_xusb_padctl *priv;
> +	struct tegra_xusb_usb2_port *port;
> +	unsigned int index =3D lane->index;
> +	u32 value;
> +	int err;
> +
> +	port =3D tegra_xusb_find_usb2_port(padctl, index);
> +	if (!port) {
> +		dev_err(&phy->dev, "no port found for USB2 lane %u\n", index);
> +		return -ENODEV;
> +	}
> +
> +	priv =3D to_tegra124_xusb_padctl(padctl);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
> +	value &=3D ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_MASK <<
> +		    XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_SHIFT) |
> +		   (XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_DISCON_LEVEL_MASK <<
> +		    XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_DISCON_LEVEL_SHIFT));
> +	value |=3D (priv->fuse.hs_squelch_level <<
> +		  XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_SHIFT) |
> +		 (XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_DISCON_LEVEL_VAL <<
> +		  XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_DISCON_LEVEL_SHIFT);
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_PORT_CAP);
> +	value &=3D ~(XUSB_PADCTL_USB2_PORT_CAP_PORT_CAP_MASK <<
> +		   XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_SHIFT(index));
> +	value |=3D XUSB_PADCTL_USB2_PORT_CAP_HOST <<
> +		XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_SHIFT(index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_PORT_CAP);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
> +	value &=3D ~((XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_CURR_LEVEL_MASK <<
> +		    XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_CURR_LEVEL_SHIFT) |
> +		   (XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_SLEW_MASK <<
> +		    XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_SLEW_SHIFT) |
> +		   (XUSB_PADCTL_USB2_OTG_PAD_CTL0_LS_RSLEW_MASK <<
> +		    XUSB_PADCTL_USB2_OTG_PAD_CTL0_LS_RSLEW_SHIFT) |
> +		   XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD |
> +		   XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD2 |
> +		   XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD_ZI);
> +	value |=3D (priv->fuse.hs_curr_level[index] +
> +		  usb2->hs_curr_level_offset) <<
> +		XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_CURR_LEVEL_SHIFT;
> +	value |=3D XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_SLEW_VAL <<
> +		XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_SLEW_SHIFT;
> +	value |=3D XUSB_PADCTL_USB2_OTG_PAD_CTL0_LS_RSLEW_VAL(index) <<
> +		XUSB_PADCTL_USB2_OTG_PAD_CTL0_LS_RSLEW_SHIFT;
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
> +	value &=3D ~((XUSB_PADCTL_USB2_OTG_PAD_CTL1_TERM_RANGE_ADJ_MASK <<
> +		    XUSB_PADCTL_USB2_OTG_PAD_CTL1_TERM_RANGE_ADJ_SHIFT) |
> +		   (XUSB_PADCTL_USB2_OTG_PAD_CTL1_HS_IREF_CAP_MASK <<
> +		    XUSB_PADCTL_USB2_OTG_PAD_CTL1_HS_IREF_CAP_SHIFT) |
> +		   XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_DR |
> +		   XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_CHRP_FORCE_POWERUP |
> +		   XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_DISC_FORCE_POWERUP);
> +	value |=3D (priv->fuse.hs_term_range_adj <<
> +		  XUSB_PADCTL_USB2_OTG_PAD_CTL1_TERM_RANGE_ADJ_SHIFT) |
> +		 (priv->fuse.hs_iref_cap <<
> +		  XUSB_PADCTL_USB2_OTG_PAD_CTL1_HS_IREF_CAP_SHIFT);
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
> +
> +	err =3D regulator_enable(port->supply);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&pad->lock);
> +
> +	if (pad->enable++ > 0)
> +		goto out;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
> +	value &=3D ~XUSB_PADCTL_USB2_BIAS_PAD_CTL0_PD;
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
> +
> +out:
> +	mutex_unlock(&pad->lock);
> +	return 0;
> +}
> +
> +static int tegra124_usb2_phy_power_off(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +	struct tegra_xusb_usb2_pad *pad =3D to_usb2_pad(lane->pad);
> +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +	struct tegra_xusb_usb2_port *port;
> +	u32 value;
> +
> +	port =3D tegra_xusb_find_usb2_port(padctl, lane->index);
> +	if (!port) {
> +		dev_err(&phy->dev, "no port found for USB2 lane %u\n",
> +			lane->index);
> +		return -ENODEV;
> +	}
> +
> +	mutex_lock(&pad->lock);
> +
> +	if (WARN_ON(pad->enable =3D=3D 0))
> +		goto out;
> +
> +	if (--pad->enable > 0)
> +		goto out;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
> +	value |=3D XUSB_PADCTL_USB2_BIAS_PAD_CTL0_PD;
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
> +
> +out:
> +	regulator_disable(port->supply);
> +	mutex_unlock(&pad->lock);
> +	return 0;
> +}
> +
> +static const struct phy_ops tegra124_usb2_phy_ops =3D {
> +	.init =3D tegra124_usb2_phy_init,
> +	.exit =3D tegra124_usb2_phy_exit,
> +	.power_on =3D tegra124_usb2_phy_power_on,
> +	.power_off =3D tegra124_usb2_phy_power_off,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static struct tegra_xusb_pad *
> +tegra124_usb2_pad_probe(struct tegra_xusb_padctl *padctl,
> +			const struct tegra_xusb_pad_soc *soc,
> +			struct device_node *np)
> +{
> +	struct tegra_xusb_usb2_pad *usb2;
> +	struct tegra_xusb_pad *pad;
> +	int err;
> +
> +	usb2 =3D kzalloc(sizeof(*usb2), GFP_KERNEL);
> +	if (!usb2)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mutex_init(&usb2->lock);
> +
> +	pad =3D &usb2->base;
> +	pad->ops =3D &tegra124_usb2_lane_ops;
> +	pad->soc =3D soc;
> +
> +	err =3D tegra_xusb_pad_init(pad, padctl, np);
> +	if (err < 0)
> +		goto free;
> +
> +	err =3D tegra_xusb_pad_register(pad, &tegra124_usb2_phy_ops);
> +	if (err < 0)
> +		goto unregister;
> +
> +	dev_set_drvdata(&pad->dev, pad);
> +
> +	return pad;
> +
> +unregister:
> +	device_unregister(&pad->dev);
> +free:
> +	kfree(usb2);
> +	return ERR_PTR(err);
> +}
> +
> +static void tegra124_usb2_pad_remove(struct tegra_xusb_pad *pad)
> +{
> +	struct tegra_xusb_usb2_pad *usb2 =3D to_usb2_pad(pad);
> +
> +	kfree(usb2);
> +}
> +
> +static const struct tegra_xusb_pad_ops tegra124_usb2_ops =3D {
> +	.probe =3D tegra124_usb2_pad_probe,
> +	.remove =3D tegra124_usb2_pad_remove,
> +};
> +
> +static const struct tegra_xusb_pad_soc tegra124_usb2_pad =3D {
> +	.name =3D "usb2",
> +	.num_lanes =3D ARRAY_SIZE(tegra124_usb2_lanes),
> +	.lanes =3D tegra124_usb2_lanes,
> +	.ops =3D &tegra124_usb2_ops,
> +};
> +
> +static const char * const tegra124_ulpi_functions[] =3D {
> +	"snps",
> +	"xusb",
> +};
> +
> +static const struct tegra_xusb_lane_soc tegra124_ulpi_lanes[] =3D {
> +	TEGRA124_LANE("ulpi-0", 0x004, 12, 0x1, ulpi),
> +};
> +
> +static struct tegra_xusb_lane *
> +tegra124_ulpi_lane_probe(struct tegra_xusb_pad *pad, struct device_node =
*np,
> +			 unsigned int index)
> +{
> +	struct tegra_xusb_ulpi_lane *ulpi;
> +	int err;
> +
> +	ulpi =3D kzalloc(sizeof(*ulpi), GFP_KERNEL);
> +	if (!ulpi)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&ulpi->base.list);
> +	ulpi->base.soc =3D &pad->soc->lanes[index];
> +	ulpi->base.index =3D index;
> +	ulpi->base.pad =3D pad;
> +	ulpi->base.np =3D np;
> +
> +	err =3D tegra_xusb_lane_parse_dt(&ulpi->base, np);
> +	if (err < 0) {
> +		kfree(ulpi);
> +		return ERR_PTR(err);
> +	}
> +
> +	return &ulpi->base;
> +}
> +
> +static void tegra124_ulpi_lane_remove(struct tegra_xusb_lane *lane)
> +{
> +	struct tegra_xusb_ulpi_lane *ulpi =3D to_ulpi_lane(lane);
> +
> +	kfree(ulpi);
> +}
> +
> +static const struct tegra_xusb_lane_ops tegra124_ulpi_lane_ops =3D {
> +	.probe =3D tegra124_ulpi_lane_probe,
> +	.remove =3D tegra124_ulpi_lane_remove,
> +};
> +
> +static int tegra124_ulpi_phy_init(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +
> +	return tegra124_xusb_padctl_enable(lane->pad->padctl);
> +}
> +
> +static int tegra124_ulpi_phy_exit(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +
> +	return tegra124_xusb_padctl_disable(lane->pad->padctl);
> +}
> +
> +static int tegra124_ulpi_phy_power_on(struct phy *phy)
> +{
> +	return 0;
> +}
> +
> +static int tegra124_ulpi_phy_power_off(struct phy *phy)
> +{
> +	return 0;
> +}
> +
> +static const struct phy_ops tegra124_ulpi_phy_ops =3D {
> +	.init =3D tegra124_ulpi_phy_init,
> +	.exit =3D tegra124_ulpi_phy_exit,
> +	.power_on =3D tegra124_ulpi_phy_power_on,
> +	.power_off =3D tegra124_ulpi_phy_power_off,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static struct tegra_xusb_pad *
> +tegra124_ulpi_pad_probe(struct tegra_xusb_padctl *padctl,
> +			const struct tegra_xusb_pad_soc *soc,
> +			struct device_node *np)
> +{
> +	struct tegra_xusb_ulpi_pad *ulpi;
> +	struct tegra_xusb_pad *pad;
> +	int err;
> +
> +	ulpi =3D kzalloc(sizeof(*ulpi), GFP_KERNEL);
> +	if (!ulpi)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pad =3D &ulpi->base;
> +	pad->ops =3D &tegra124_ulpi_lane_ops;
> +	pad->soc =3D soc;
> +
> +	err =3D tegra_xusb_pad_init(pad, padctl, np);
> +	if (err < 0)
> +		goto free;
> +
> +	err =3D tegra_xusb_pad_register(pad, &tegra124_ulpi_phy_ops);
> +	if (err < 0)
> +		goto unregister;
> +
> +	dev_set_drvdata(&pad->dev, pad);
> +
> +	return pad;
> +
> +unregister:
> +	device_unregister(&pad->dev);
> +free:
> +	kfree(ulpi);
> +	return ERR_PTR(err);
> +}
> +
> +static void tegra124_ulpi_pad_remove(struct tegra_xusb_pad *pad)
> +{
> +	struct tegra_xusb_ulpi_pad *ulpi =3D to_ulpi_pad(pad);
> +
> +	kfree(ulpi);
> +}
> +
> +static const struct tegra_xusb_pad_ops tegra124_ulpi_ops =3D {
> +	.probe =3D tegra124_ulpi_pad_probe,
> +	.remove =3D tegra124_ulpi_pad_remove,
> +};
> +
> +static const struct tegra_xusb_pad_soc tegra124_ulpi_pad =3D {
> +	.name =3D "ulpi",
> +	.num_lanes =3D ARRAY_SIZE(tegra124_ulpi_lanes),
> +	.lanes =3D tegra124_ulpi_lanes,
> +	.ops =3D &tegra124_ulpi_ops,
> +};
> +
> +static const char * const tegra124_hsic_functions[] =3D {
> +	"snps",
> +	"xusb",
> +};
> +
> +static const struct tegra_xusb_lane_soc tegra124_hsic_lanes[] =3D {
> +	TEGRA124_LANE("hsic-0", 0x004, 14, 0x1, hsic),
> +	TEGRA124_LANE("hsic-1", 0x004, 15, 0x1, hsic),
> +};
> +
> +static struct tegra_xusb_lane *
> +tegra124_hsic_lane_probe(struct tegra_xusb_pad *pad, struct device_node =
*np,
> +			 unsigned int index)
> +{
> +	struct tegra_xusb_hsic_lane *hsic;
> +	int err;
> +
> +	hsic =3D kzalloc(sizeof(*hsic), GFP_KERNEL);
> +	if (!hsic)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&hsic->base.list);
> +	hsic->base.soc =3D &pad->soc->lanes[index];
> +	hsic->base.index =3D index;
> +	hsic->base.pad =3D pad;
> +	hsic->base.np =3D np;
> +
> +	err =3D tegra_xusb_lane_parse_dt(&hsic->base, np);
> +	if (err < 0) {
> +		kfree(hsic);
> +		return ERR_PTR(err);
> +	}
> +
> +	return &hsic->base;
> +}
> +
> +static void tegra124_hsic_lane_remove(struct tegra_xusb_lane *lane)
> +{
> +	struct tegra_xusb_hsic_lane *hsic =3D to_hsic_lane(lane);
> +
> +	kfree(hsic);
> +}
> +
> +static const struct tegra_xusb_lane_ops tegra124_hsic_lane_ops =3D {
> +	.probe =3D tegra124_hsic_lane_probe,
> +	.remove =3D tegra124_hsic_lane_remove,
> +};
> +
> +static int tegra124_hsic_phy_init(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +
> +	return tegra124_xusb_padctl_enable(lane->pad->padctl);
> +}
> +
> +static int tegra124_hsic_phy_exit(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +
> +	return tegra124_xusb_padctl_disable(lane->pad->padctl);
> +}
> +
> +static int tegra124_hsic_phy_power_on(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +	struct tegra_xusb_hsic_lane *hsic =3D to_hsic_lane(lane);
> +	struct tegra_xusb_hsic_pad *pad =3D to_hsic_pad(lane->pad);
> +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +	unsigned int index =3D lane->index;
> +	u32 value;
> +	int err;
> +
> +	err =3D regulator_enable(pad->supply);
> +	if (err)
> +		return err;
> +
> +	padctl_writel(padctl, hsic->strobe_trim,
> +		      XUSB_PADCTL_HSIC_STRB_TRIM_CONTROL);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_HSIC_PADX_CTL1(index));
> +
> +	if (hsic->auto_term)
> +		value |=3D XUSB_PADCTL_HSIC_PAD_CTL1_AUTO_TERM_EN;
> +	else
> +		value &=3D ~XUSB_PADCTL_HSIC_PAD_CTL1_AUTO_TERM_EN;
> +
> +	padctl_writel(padctl, value, XUSB_PADCTL_HSIC_PADX_CTL1(index));
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_HSIC_PADX_CTL0(index));
> +	value &=3D ~((XUSB_PADCTL_HSIC_PAD_CTL0_TX_RTUNEN_MASK <<
> +		    XUSB_PADCTL_HSIC_PAD_CTL0_TX_RTUNEN_SHIFT) |
> +		   (XUSB_PADCTL_HSIC_PAD_CTL0_TX_RTUNEP_MASK <<
> +		    XUSB_PADCTL_HSIC_PAD_CTL0_TX_RTUNEP_SHIFT) |
> +		   (XUSB_PADCTL_HSIC_PAD_CTL0_TX_RSLEWN_MASK <<
> +		    XUSB_PADCTL_HSIC_PAD_CTL0_TX_RSLEWN_SHIFT) |
> +		   (XUSB_PADCTL_HSIC_PAD_CTL0_TX_RSLEWP_MASK <<
> +		    XUSB_PADCTL_HSIC_PAD_CTL0_TX_RSLEWP_SHIFT));
> +	value |=3D (hsic->tx_rtune_n <<
> +		  XUSB_PADCTL_HSIC_PAD_CTL0_TX_RTUNEN_SHIFT) |
> +		(hsic->tx_rtune_p <<
> +		  XUSB_PADCTL_HSIC_PAD_CTL0_TX_RTUNEP_SHIFT) |
> +		(hsic->tx_rslew_n <<
> +		 XUSB_PADCTL_HSIC_PAD_CTL0_TX_RSLEWN_SHIFT) |
> +		(hsic->tx_rslew_p <<
> +		 XUSB_PADCTL_HSIC_PAD_CTL0_TX_RSLEWP_SHIFT);
> +	padctl_writel(padctl, value, XUSB_PADCTL_HSIC_PADX_CTL0(index));
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_HSIC_PADX_CTL2(index));
> +	value &=3D ~((XUSB_PADCTL_HSIC_PAD_CTL2_RX_STROBE_TRIM_MASK <<
> +		    XUSB_PADCTL_HSIC_PAD_CTL2_RX_STROBE_TRIM_SHIFT) |
> +		   (XUSB_PADCTL_HSIC_PAD_CTL2_RX_DATA_TRIM_MASK <<
> +		    XUSB_PADCTL_HSIC_PAD_CTL2_RX_DATA_TRIM_SHIFT));
> +	value |=3D (hsic->rx_strobe_trim <<
> +		  XUSB_PADCTL_HSIC_PAD_CTL2_RX_STROBE_TRIM_SHIFT) |
> +		(hsic->rx_data_trim <<
> +		 XUSB_PADCTL_HSIC_PAD_CTL2_RX_DATA_TRIM_SHIFT);
> +	padctl_writel(padctl, value, XUSB_PADCTL_HSIC_PADX_CTL2(index));
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_HSIC_PADX_CTL1(index));
> +	value &=3D ~(XUSB_PADCTL_HSIC_PAD_CTL1_RPD_STROBE |
> +		   XUSB_PADCTL_HSIC_PAD_CTL1_RPU_DATA |
> +		   XUSB_PADCTL_HSIC_PAD_CTL1_PD_RX |
> +		   XUSB_PADCTL_HSIC_PAD_CTL1_PD_ZI |
> +		   XUSB_PADCTL_HSIC_PAD_CTL1_PD_TRX |
> +		   XUSB_PADCTL_HSIC_PAD_CTL1_PD_TX);
> +	value |=3D XUSB_PADCTL_HSIC_PAD_CTL1_RPD_DATA |
> +		 XUSB_PADCTL_HSIC_PAD_CTL1_RPU_STROBE;
> +	padctl_writel(padctl, value, XUSB_PADCTL_HSIC_PADX_CTL1(index));
> +
> +	return 0;
> +}
> +
> +static int tegra124_hsic_phy_power_off(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +	struct tegra_xusb_hsic_pad *pad =3D to_hsic_pad(lane->pad);
> +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +	unsigned int index =3D lane->index;
> +	u32 value;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_HSIC_PADX_CTL1(index));
> +	value |=3D XUSB_PADCTL_HSIC_PAD_CTL1_PD_RX |
> +		 XUSB_PADCTL_HSIC_PAD_CTL1_PD_ZI |
> +		 XUSB_PADCTL_HSIC_PAD_CTL1_PD_TRX |
> +		 XUSB_PADCTL_HSIC_PAD_CTL1_PD_TX;
> +	padctl_writel(padctl, value, XUSB_PADCTL_HSIC_PADX_CTL1(index));
> +
> +	regulator_disable(pad->supply);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops tegra124_hsic_phy_ops =3D {
> +	.init =3D tegra124_hsic_phy_init,
> +	.exit =3D tegra124_hsic_phy_exit,
> +	.power_on =3D tegra124_hsic_phy_power_on,
> +	.power_off =3D tegra124_hsic_phy_power_off,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static struct tegra_xusb_pad *
> +tegra124_hsic_pad_probe(struct tegra_xusb_padctl *padctl,
> +			const struct tegra_xusb_pad_soc *soc,
> +			struct device_node *np)
> +{
> +	struct tegra_xusb_hsic_pad *hsic;
> +	struct tegra_xusb_pad *pad;
> +	int err;
> +
> +	hsic =3D kzalloc(sizeof(*hsic), GFP_KERNEL);
> +	if (!hsic)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pad =3D &hsic->base;
> +	pad->ops =3D &tegra124_hsic_lane_ops;
> +	pad->soc =3D soc;
> +
> +	err =3D tegra_xusb_pad_init(pad, padctl, np);
> +	if (err < 0)
> +		goto free;
> +
> +	err =3D tegra_xusb_pad_register(pad, &tegra124_hsic_phy_ops);
> +	if (err < 0)
> +		goto unregister;
> +
> +	dev_set_drvdata(&pad->dev, pad);
> +
> +	return pad;
> +
> +unregister:
> +	device_unregister(&pad->dev);
> +free:
> +	kfree(hsic);
> +	return ERR_PTR(err);
> +}
> +
> +static void tegra124_hsic_pad_remove(struct tegra_xusb_pad *pad)
> +{
> +	struct tegra_xusb_hsic_pad *hsic =3D to_hsic_pad(pad);
> +
> +	kfree(hsic);
> +}
> +
> +static const struct tegra_xusb_pad_ops tegra124_hsic_ops =3D {
> +	.probe =3D tegra124_hsic_pad_probe,
> +	.remove =3D tegra124_hsic_pad_remove,
> +};
> +
> +static const struct tegra_xusb_pad_soc tegra124_hsic_pad =3D {
> +	.name =3D "hsic",
> +	.num_lanes =3D ARRAY_SIZE(tegra124_hsic_lanes),
> +	.lanes =3D tegra124_hsic_lanes,
> +	.ops =3D &tegra124_hsic_ops,
> +};
> +
> +static const char * const tegra124_pcie_functions[] =3D {
> +	"pcie",
> +	"usb3-ss",
> +	"sata",
> +};
> +
> +static const struct tegra_xusb_lane_soc tegra124_pcie_lanes[] =3D {
> +	TEGRA124_LANE("pcie-0", 0x134, 16, 0x3, pcie),
> +	TEGRA124_LANE("pcie-1", 0x134, 18, 0x3, pcie),
> +	TEGRA124_LANE("pcie-2", 0x134, 20, 0x3, pcie),
> +	TEGRA124_LANE("pcie-3", 0x134, 22, 0x3, pcie),
> +	TEGRA124_LANE("pcie-4", 0x134, 24, 0x3, pcie),
> +};
> +
> +static struct tegra_xusb_lane *
> +tegra124_pcie_lane_probe(struct tegra_xusb_pad *pad, struct device_node =
*np,
> +			 unsigned int index)
> +{
> +	struct tegra_xusb_pcie_lane *pcie;
> +	int err;
> +
> +	pcie =3D kzalloc(sizeof(*pcie), GFP_KERNEL);
> +	if (!pcie)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&pcie->base.list);
> +	pcie->base.soc =3D &pad->soc->lanes[index];
> +	pcie->base.index =3D index;
> +	pcie->base.pad =3D pad;
> +	pcie->base.np =3D np;
> +
> +	err =3D tegra_xusb_lane_parse_dt(&pcie->base, np);
> +	if (err < 0) {
> +		kfree(pcie);
> +		return ERR_PTR(err);
> +	}
> +
> +	return &pcie->base;
> +}
> +
> +static void tegra124_pcie_lane_remove(struct tegra_xusb_lane *lane)
> +{
> +	struct tegra_xusb_pcie_lane *pcie =3D to_pcie_lane(lane);
> +
> +	kfree(pcie);
> +}
> +
> +static const struct tegra_xusb_lane_ops tegra124_pcie_lane_ops =3D {
> +	.probe =3D tegra124_pcie_lane_probe,
> +	.remove =3D tegra124_pcie_lane_remove,
> +};
> +
> +static int tegra124_pcie_phy_init(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +
> +	return tegra124_xusb_padctl_enable(lane->pad->padctl);
> +}
> +
> +static int tegra124_pcie_phy_exit(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +
> +	return tegra124_xusb_padctl_disable(lane->pad->padctl);
> +}
> +
> +static int tegra124_pcie_phy_power_on(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +	unsigned long timeout;
> +	int err =3D -ETIMEDOUT;
> +	u32 value;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_P0_CTL1);
> +	value &=3D ~XUSB_PADCTL_IOPHY_PLL_P0_CTL1_REFCLK_SEL_MASK;
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_P0_CTL1);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_P0_CTL2);
> +	value |=3D XUSB_PADCTL_IOPHY_PLL_P0_CTL2_REFCLKBUF_EN |
> +		 XUSB_PADCTL_IOPHY_PLL_P0_CTL2_TXCLKREF_EN |
> +		 XUSB_PADCTL_IOPHY_PLL_P0_CTL2_TXCLKREF_SEL;
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_P0_CTL2);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_P0_CTL1);
> +	value |=3D XUSB_PADCTL_IOPHY_PLL_P0_CTL1_PLL_RST;
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_P0_CTL1);
> +
> +	timeout =3D jiffies + msecs_to_jiffies(50);
> +
> +	while (time_before(jiffies, timeout)) {
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_P0_CTL1);
> +		if (value & XUSB_PADCTL_IOPHY_PLL_P0_CTL1_PLL0_LOCKDET) {
> +			err =3D 0;
> +			break;
> +		}
> +
> +		usleep_range(100, 200);
> +	}
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
> +	value |=3D XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(lane->index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
> +
> +	return err;
> +}
> +
> +static int tegra124_pcie_phy_power_off(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +	u32 value;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
> +	value &=3D ~XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(lane->index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_P0_CTL1);
> +	value &=3D ~XUSB_PADCTL_IOPHY_PLL_P0_CTL1_PLL_RST;
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_P0_CTL1);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops tegra124_pcie_phy_ops =3D {
> +	.init =3D tegra124_pcie_phy_init,
> +	.exit =3D tegra124_pcie_phy_exit,
> +	.power_on =3D tegra124_pcie_phy_power_on,
> +	.power_off =3D tegra124_pcie_phy_power_off,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static struct tegra_xusb_pad *
> +tegra124_pcie_pad_probe(struct tegra_xusb_padctl *padctl,
> +			const struct tegra_xusb_pad_soc *soc,
> +			struct device_node *np)
> +{
> +	struct tegra_xusb_pcie_pad *pcie;
> +	struct tegra_xusb_pad *pad;
> +	int err;
> +
> +	pcie =3D kzalloc(sizeof(*pcie), GFP_KERNEL);
> +	if (!pcie)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pad =3D &pcie->base;
> +	pad->ops =3D &tegra124_pcie_lane_ops;
> +	pad->soc =3D soc;
> +
> +	err =3D tegra_xusb_pad_init(pad, padctl, np);
> +	if (err < 0)
> +		goto free;
> +
> +	err =3D tegra_xusb_pad_register(pad, &tegra124_pcie_phy_ops);
> +	if (err < 0)
> +		goto unregister;
> +
> +	dev_set_drvdata(&pad->dev, pad);
> +
> +	return pad;
> +
> +unregister:
> +	device_unregister(&pad->dev);
> +free:
> +	kfree(pcie);
> +	return ERR_PTR(err);
> +}
> +
> +static void tegra124_pcie_pad_remove(struct tegra_xusb_pad *pad)
> +{
> +	struct tegra_xusb_pcie_pad *pcie =3D to_pcie_pad(pad);
> +
> +	kfree(pcie);
> +}
> +
> +static const struct tegra_xusb_pad_ops tegra124_pcie_ops =3D {
> +	.probe =3D tegra124_pcie_pad_probe,
> +	.remove =3D tegra124_pcie_pad_remove,
> +};
> +
> +static const struct tegra_xusb_pad_soc tegra124_pcie_pad =3D {
> +	.name =3D "pcie",
> +	.num_lanes =3D ARRAY_SIZE(tegra124_pcie_lanes),
> +	.lanes =3D tegra124_pcie_lanes,
> +	.ops =3D &tegra124_pcie_ops,
> +};
> +
> +static const struct tegra_xusb_lane_soc tegra124_sata_lanes[] =3D {
> +	TEGRA124_LANE("sata-0", 0x134, 26, 0x3, pcie),
> +};
> +
> +static struct tegra_xusb_lane *
> +tegra124_sata_lane_probe(struct tegra_xusb_pad *pad, struct device_node =
*np,
> +			 unsigned int index)
> +{
> +	struct tegra_xusb_sata_lane *sata;
> +	int err;
> +
> +	sata =3D kzalloc(sizeof(*sata), GFP_KERNEL);
> +	if (!sata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&sata->base.list);
> +	sata->base.soc =3D &pad->soc->lanes[index];
> +	sata->base.index =3D index;
> +	sata->base.pad =3D pad;
> +	sata->base.np =3D np;
> +
> +	err =3D tegra_xusb_lane_parse_dt(&sata->base, np);
> +	if (err < 0) {
> +		kfree(sata);
> +		return ERR_PTR(err);
> +	}
> +
> +	return &sata->base;
> +}
> +
> +static void tegra124_sata_lane_remove(struct tegra_xusb_lane *lane)
> +{
> +	struct tegra_xusb_sata_lane *sata =3D to_sata_lane(lane);
> +
> +	kfree(sata);
> +}
> +
> +static const struct tegra_xusb_lane_ops tegra124_sata_lane_ops =3D {
> +	.probe =3D tegra124_sata_lane_probe,
> +	.remove =3D tegra124_sata_lane_remove,
> +};
> +
> +static int tegra124_sata_phy_init(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +
> +	return tegra124_xusb_padctl_enable(lane->pad->padctl);
> +}
> +
> +static int tegra124_sata_phy_exit(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +
> +	return tegra124_xusb_padctl_disable(lane->pad->padctl);
> +}
> +
> +static int tegra124_sata_phy_power_on(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +	unsigned long timeout;
> +	int err =3D -ETIMEDOUT;
> +	u32 value;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL1);
> +	value &=3D ~XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL1_IDDQ_OVRD;
> +	value &=3D ~XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL1_IDDQ;
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL1);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +	value &=3D ~XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL_PWR_OVRD;
> +	value &=3D ~XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL_IDDQ;
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +	value |=3D XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL1_MODE;
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +	value |=3D XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL_RST;
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +
> +	timeout =3D jiffies + msecs_to_jiffies(50);
> +
> +	while (time_before(jiffies, timeout)) {
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +		if (value & XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL1_LOCKDET) {
> +			err =3D 0;
> +			break;
> +		}
> +
> +		usleep_range(100, 200);
> +	}
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
> +	value |=3D XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(lane->index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
> +
> +	return err;
> +}
> +
> +static int tegra124_sata_phy_power_off(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +	u32 value;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
> +	value &=3D ~XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(lane->index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +	value &=3D ~XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL_RST;
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +	value &=3D ~XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL1_MODE;
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +	value |=3D XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL_PWR_OVRD;
> +	value |=3D XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL_IDDQ;
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL1);
> +	value |=3D ~XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL1_IDDQ_OVRD;
> +	value |=3D ~XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL1_IDDQ;
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL1);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops tegra124_sata_phy_ops =3D {
> +	.init =3D tegra124_sata_phy_init,
> +	.exit =3D tegra124_sata_phy_exit,
> +	.power_on =3D tegra124_sata_phy_power_on,
> +	.power_off =3D tegra124_sata_phy_power_off,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static struct tegra_xusb_pad *
> +tegra124_sata_pad_probe(struct tegra_xusb_padctl *padctl,
> +			const struct tegra_xusb_pad_soc *soc,
> +			struct device_node *np)
> +{
> +	struct tegra_xusb_sata_pad *sata;
> +	struct tegra_xusb_pad *pad;
> +	int err;
> +
> +	sata =3D kzalloc(sizeof(*sata), GFP_KERNEL);
> +	if (!sata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pad =3D &sata->base;
> +	pad->ops =3D &tegra124_sata_lane_ops;
> +	pad->soc =3D soc;
> +
> +	err =3D tegra_xusb_pad_init(pad, padctl, np);
> +	if (err < 0)
> +		goto free;
> +
> +	err =3D tegra_xusb_pad_register(pad, &tegra124_sata_phy_ops);
> +	if (err < 0)
> +		goto unregister;
> +
> +	dev_set_drvdata(&pad->dev, pad);
> +
> +	return pad;
> +
> +unregister:
> +	device_unregister(&pad->dev);
> +free:
> +	kfree(sata);
> +	return ERR_PTR(err);
> +}
> +
> +static void tegra124_sata_pad_remove(struct tegra_xusb_pad *pad)
> +{
> +	struct tegra_xusb_sata_pad *sata =3D to_sata_pad(pad);
> +
> +	kfree(sata);
> +}
> +
> +static const struct tegra_xusb_pad_ops tegra124_sata_ops =3D {
> +	.probe =3D tegra124_sata_pad_probe,
> +	.remove =3D tegra124_sata_pad_remove,
> +};
> +
> +static const struct tegra_xusb_pad_soc tegra124_sata_pad =3D {
> +	.name =3D "sata",
> +	.num_lanes =3D ARRAY_SIZE(tegra124_sata_lanes),
> +	.lanes =3D tegra124_sata_lanes,
> +	.ops =3D &tegra124_sata_ops,
> +};
> +
> +static const struct tegra_xusb_pad_soc *tegra124_pads[] =3D {
> +	&tegra124_usb2_pad,
> +	&tegra124_ulpi_pad,
> +	&tegra124_hsic_pad,
> +	&tegra124_pcie_pad,
> +	&tegra124_sata_pad,
> +};
> +
> +static int tegra124_usb2_port_enable(struct tegra_xusb_port *port)
> +{
> +	return 0;
> +}
> +
> +static void tegra124_usb2_port_disable(struct tegra_xusb_port *port)
> +{
> +}
> +
> +static struct tegra_xusb_lane *
> +tegra124_usb2_port_map(struct tegra_xusb_port *port)
> +{
> +	return tegra_xusb_find_lane(port->padctl, "usb2", port->index);
> +}
> +
> +static const struct tegra_xusb_port_ops tegra124_usb2_port_ops =3D {
> +	.enable =3D tegra124_usb2_port_enable,
> +	.disable =3D tegra124_usb2_port_disable,
> +	.map =3D tegra124_usb2_port_map,
> +};
> +
> +static int tegra124_ulpi_port_enable(struct tegra_xusb_port *port)
> +{
> +	return 0;
> +}
> +
> +static void tegra124_ulpi_port_disable(struct tegra_xusb_port *port)
> +{
> +}
> +
> +static struct tegra_xusb_lane *
> +tegra124_ulpi_port_map(struct tegra_xusb_port *port)
> +{
> +	return tegra_xusb_find_lane(port->padctl, "ulpi", port->index);
> +}
> +
> +static const struct tegra_xusb_port_ops tegra124_ulpi_port_ops =3D {
> +	.enable =3D tegra124_ulpi_port_enable,
> +	.disable =3D tegra124_ulpi_port_disable,
> +	.map =3D tegra124_ulpi_port_map,
> +};
> +
> +static int tegra124_hsic_port_enable(struct tegra_xusb_port *port)
> +{
> +	return 0;
> +}
> +
> +static void tegra124_hsic_port_disable(struct tegra_xusb_port *port)
> +{
> +}
> +
> +static struct tegra_xusb_lane *
> +tegra124_hsic_port_map(struct tegra_xusb_port *port)
> +{
> +	return tegra_xusb_find_lane(port->padctl, "hsic", port->index);
> +}
> +
> +static const struct tegra_xusb_port_ops tegra124_hsic_port_ops =3D {
> +	.enable =3D tegra124_hsic_port_enable,
> +	.disable =3D tegra124_hsic_port_disable,
> +	.map =3D tegra124_hsic_port_map,
> +};
> +
> +static int tegra124_usb3_port_enable(struct tegra_xusb_port *port)
> +{
> +	struct tegra_xusb_usb3_port *usb3 =3D to_usb3_port(port);
> +	struct tegra_xusb_padctl *padctl =3D port->padctl;
> +	struct tegra_xusb_lane *lane =3D usb3->base.lane;
> +	unsigned int index =3D port->index, offset;
> +	int ret =3D 0;
> +	u32 value;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> +
> +	if (!usb3->internal)
> +		value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
> +	else
> +		value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
> +
> +	value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(index);
> +	value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(index, usb3->port);
> +	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
> +
> +	/*
> +	 * TODO: move this code into the PCIe/SATA PHY ->power_on() callbacks
> +	 * and conditionalize based on mux function? This seems to work, but
> +	 * might not be the exact proper sequence.
> +	 */
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_USB3_PADX_CTL2(index));
> +	value &=3D ~((XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_WANDER_MASK <<
> +		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_WANDER_SHIFT) |
> +		   (XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_MASK <<
> +		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_SHIFT) |
> +		   (XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_CDR_CNTL_MASK <<
> +		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_CDR_CNTL_SHIFT));
> +	value |=3D (XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_WANDER_VAL <<
> +		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_WANDER_SHIFT) |
> +		 (XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_CDR_CNTL_VAL <<
> +		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_CDR_CNTL_SHIFT) |
> +		 (XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_VAL <<
> +		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_SHIFT);
> +
> +	if (usb3->context_saved) {
> +		value &=3D ~((XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_MASK <<
> +			    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_SHIFT) |
> +			   (XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_MASK <<
> +			    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_SHIFT));
> +		value |=3D (usb3->ctle_g <<
> +			  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_SHIFT) |
> +			 (usb3->ctle_z <<
> +			  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_SHIFT);
> +	}
> +
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_USB3_PADX_CTL2(index));
> +
> +	value =3D XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_VAL;
> +
> +	if (usb3->context_saved) {
> +		value &=3D ~((XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_MASK <<
> +			    XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_SHIFT) |
> +			   (XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_MASK <<
> +			    XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_SHIFT));
> +		value |=3D (usb3->tap1 <<
> +			  XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_SHIFT) |
> +			 (usb3->amp <<
> +			  XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_SHIFT);
> +	}
> +
> +	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_USB3_PADX_CTL4(index));
> +
> +	if (lane->pad =3D=3D padctl->pcie)
> +		offset =3D XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL2(lane->index);
> +	else
> +		offset =3D XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL2;
> +
> +	value =3D padctl_readl(padctl, offset);
> +	value &=3D ~(XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_MASK <<
> +		   XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_SHIFT);
> +	value |=3D XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_VAL <<
> +		XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_SHIFT;
> +	padctl_writel(padctl, value, offset);
> +
> +	if (lane->pad =3D=3D padctl->pcie)
> +		offset =3D XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL5(lane->index);
> +	else
> +		offset =3D XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL5;
> +
> +	value =3D padctl_readl(padctl, offset);
> +	value |=3D XUSB_PADCTL_IOPHY_MISC_PAD_CTL5_RX_QEYE_EN;
> +	padctl_writel(padctl, value, offset);
> +
> +	/* Enable SATA PHY when SATA lane is used */
> +	if (lane->pad =3D=3D padctl->sata) {
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +		value &=3D ~(XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL0_REFCLK_NDIV_MASK <<
> +			   XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL0_REFCLK_NDIV_SHIFT);
> +		value |=3D 0x2 <<
> +			XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL0_REFCLK_NDIV_SHIFT;
> +		padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_S0_CTL2);
> +		value &=3D ~((XUSB_PADCTL_IOPHY_PLL_S0_CTL2_XDIGCLK_SEL_MASK <<
> +			    XUSB_PADCTL_IOPHY_PLL_S0_CTL2_XDIGCLK_SEL_SHIFT) |
> +			   (XUSB_PADCTL_IOPHY_PLL_S0_CTL2_PLL1_CP_CNTL_MASK <<
> +			    XUSB_PADCTL_IOPHY_PLL_S0_CTL2_PLL1_CP_CNTL_SHIFT) |
> +			   (XUSB_PADCTL_IOPHY_PLL_S0_CTL2_PLL0_CP_CNTL_MASK <<
> +			    XUSB_PADCTL_IOPHY_PLL_S0_CTL2_PLL0_CP_CNTL_SHIFT) |
> +			   XUSB_PADCTL_IOPHY_PLL_S0_CTL2_TCLKOUT_EN);
> +		value |=3D (0x7 <<
> +			  XUSB_PADCTL_IOPHY_PLL_S0_CTL2_XDIGCLK_SEL_SHIFT) |
> +			 (0x8 <<
> +			  XUSB_PADCTL_IOPHY_PLL_S0_CTL2_PLL1_CP_CNTL_SHIFT) |
> +			 (0x8 <<
> +			  XUSB_PADCTL_IOPHY_PLL_S0_CTL2_PLL0_CP_CNTL_SHIFT) |
> +			 XUSB_PADCTL_IOPHY_PLL_S0_CTL2_TXCLKREF_SEL;
> +		padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_S0_CTL2);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_S0_CTL3);
> +		value &=3D ~XUSB_PADCTL_IOPHY_PLL_S0_CTL3_RCAL_BYPASS;
> +		padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_PLL_S0_CTL3);
> +	}
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
> +	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_VCORE_DOWN(index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
> +
> +	usleep_range(100, 200);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
> +	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN_EARLY(index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
> +
> +	usleep_range(100, 200);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
> +	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN(index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
> +
> +	return ret;
> +}
> +
> +static void tegra124_usb3_port_disable(struct tegra_xusb_port *port)
> +{
> +	struct tegra_xusb_padctl *padctl =3D port->padctl;
> +	u32 value;
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
> +	value |=3D XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN_EARLY(port->inde=
x);
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
> +
> +	usleep_range(100, 200);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
> +	value |=3D XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN(port->index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
> +
> +	usleep_range(250, 350);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
> +	value |=3D XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_VCORE_DOWN(port->index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> +	value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(port->index);
> +	value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(port->index, 0x7);
> +	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
> +}
> +
> +static const struct tegra_xusb_lane_map tegra124_usb3_map[] =3D {
> +	{ 0, "pcie", 0 },
> +	{ 1, "pcie", 1 },
> +	{ 1, "sata", 0 },
> +	{ 0, NULL,   0 },
> +};
> +
> +static struct tegra_xusb_lane *
> +tegra124_usb3_port_map(struct tegra_xusb_port *port)
> +{
> +	return tegra_xusb_port_find_lane(port, tegra124_usb3_map, "usb3-ss");
> +}
> +
> +static const struct tegra_xusb_port_ops tegra124_usb3_port_ops =3D {
> +	.enable =3D tegra124_usb3_port_enable,
> +	.disable =3D tegra124_usb3_port_disable,
> +	.map =3D tegra124_usb3_port_map,
> +};
> +
> +static int
> +tegra124_xusb_read_fuse_calibration(struct tegra124_xusb_fuse_calibratio=
n *fuse)
> +{
> +	unsigned int i;
> +	int err;
> +	u32 value;
> +
> +	err =3D tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
> +	if (err < 0)
> +		return err;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(fuse->hs_curr_level); i++) {
> +		fuse->hs_curr_level[i] =3D
> +			(value >> FUSE_SKU_CALIB_HS_CURR_LEVEL_PADX_SHIFT(i)) &
> +			FUSE_SKU_CALIB_HS_CURR_LEVEL_PAD_MASK;
> +	}
> +	fuse->hs_iref_cap =3D
> +		(value >> FUSE_SKU_CALIB_HS_IREF_CAP_SHIFT) &
> +		FUSE_SKU_CALIB_HS_IREF_CAP_MASK;
> +	fuse->hs_term_range_adj =3D
> +		(value >> FUSE_SKU_CALIB_HS_TERM_RANGE_ADJ_SHIFT) &
> +		FUSE_SKU_CALIB_HS_TERM_RANGE_ADJ_MASK;
> +	fuse->hs_squelch_level =3D
> +		(value >> FUSE_SKU_CALIB_HS_SQUELCH_LEVEL_SHIFT) &
> +		FUSE_SKU_CALIB_HS_SQUELCH_LEVEL_MASK;
> +
> +	return 0;
> +}
> +
> +static struct tegra_xusb_padctl *
> +tegra124_xusb_padctl_probe(struct device *dev,
> +			   const struct tegra_xusb_padctl_soc *soc)
> +{
> +	struct tegra124_xusb_padctl *padctl;
> +	int err;
> +
> +	padctl =3D devm_kzalloc(dev, sizeof(*padctl), GFP_KERNEL);
> +	if (!padctl)
> +		return ERR_PTR(-ENOMEM);
> +
> +	padctl->base.dev =3D dev;
> +	padctl->base.soc =3D soc;
> +
> +	err =3D tegra124_xusb_read_fuse_calibration(&padctl->fuse);
> +	if (err < 0)
> +		return ERR_PTR(err);
> +
> +	return &padctl->base;
> +}
> +
> +static void tegra124_xusb_padctl_remove(struct tegra_xusb_padctl *padctl)
> +{
> +}
> +
> +static const struct tegra_xusb_padctl_ops tegra124_xusb_padctl_ops =3D {
> +	.probe =3D tegra124_xusb_padctl_probe,
> +	.remove =3D tegra124_xusb_padctl_remove,
> +	.usb3_save_context =3D tegra124_usb3_save_context,
> +	.hsic_set_idle =3D tegra124_hsic_set_idle,
> +};
> +
> +const struct tegra_xusb_padctl_soc tegra124_xusb_padctl_soc =3D {
> +	.num_pads =3D ARRAY_SIZE(tegra124_pads),
> +	.pads =3D tegra124_pads,
> +	.ports =3D {
> +		.usb2 =3D {
> +			.ops =3D &tegra124_usb2_port_ops,
> +			.count =3D 3,
> +		},
> +		.ulpi =3D {
> +			.ops =3D &tegra124_ulpi_port_ops,
> +			.count =3D 1,
> +		},
> +		.hsic =3D {
> +			.ops =3D &tegra124_hsic_port_ops,
> +			.count =3D 2,
> +		},
> +		.usb3 =3D {
> +			.ops =3D &tegra124_usb3_port_ops,
> +			.count =3D 2,
> +		},
> +	},
> +	.ops =3D &tegra124_xusb_padctl_ops,
> +};
> +EXPORT_SYMBOL_GPL(tegra124_xusb_padctl_soc);
> +
> +MODULE_AUTHOR("Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
> +MODULE_DESCRIPTION("NVIDIA Tegra 124 XUSB Pad Controller driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> new file mode 100644
> index 000000000000..809998f6ce85
> --- /dev/null
> +++ b/drivers/phy/tegra/xusb.c
> @@ -0,0 +1,1017 @@
> +/*
> + * Copyright (c) 2014-2015, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +#include <linux/workqueue.h>
> +
> +#include <soc/tegra/fuse.h>
> +
> +#include "xusb.h"
> +
> +static struct phy *tegra_xusb_pad_of_xlate(struct device *dev,
> +					   struct of_phandle_args *args)
> +{
> +	struct tegra_xusb_pad *pad =3D dev_get_drvdata(dev);
> +	struct phy *phy =3D NULL;
> +	unsigned int i;
> +
> +	if (args->args_count !=3D 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	for (i =3D 0; i < pad->soc->num_lanes; i++) {
> +		if (!pad->lanes[i])
> +			continue;
> +
> +		if (pad->lanes[i]->dev.of_node =3D=3D args->np) {
> +			phy =3D pad->lanes[i];
> +			break;
> +		}
> +	}
> +
> +	if (phy =3D=3D NULL)
> +		phy =3D ERR_PTR(-ENODEV);
> +
> +	return phy;
> +}
> +
> +static const struct of_device_id tegra_xusb_padctl_of_match[] =3D {
> +#if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_=
SOC)
> +	{
> +		.compatible =3D "nvidia,tegra124-xusb-padctl",
> +		.data =3D &tegra124_xusb_padctl_soc,
> +	},
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_210_SOC)
> +	{
> +		.compatible =3D "nvidia,tegra210-xusb-padctl",
> +		.data =3D &tegra210_xusb_padctl_soc,
> +	},
> +#endif
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tegra_xusb_padctl_of_match);
> +
> +static struct device_node *
> +tegra_xusb_find_pad_node(struct tegra_xusb_padctl *padctl, const char *n=
ame)
> +{
> +	/*
> +	 * of_find_node_by_name() drops a reference, so make sure to grab one.
> +	 */
> +	struct device_node *np =3D of_node_get(padctl->dev->of_node);
> +
> +	np =3D of_find_node_by_name(np, "pads");
> +	if (np)
> +		np =3D of_find_node_by_name(np, name);
> +
> +	return np;
> +}
> +
> +static struct device_node *
> +tegra_xusb_pad_find_phy_node(struct tegra_xusb_pad *pad, unsigned int in=
dex)
> +{
> +	/*
> +	 * of_find_node_by_name() drops a reference, so make sure to grab one.
> +	 */
> +	struct device_node *np =3D of_node_get(pad->dev.of_node);
> +	char *name;
> +
> +	name =3D kasprintf(GFP_KERNEL, "%s-%u", np->name, index);
> +	if (!name) {
> +		of_node_put(np);
> +		return NULL;
> +	}
> +
> +	np =3D of_find_node_by_name(np, name);
> +
> +	kfree(name);
> +
> +	return np;
> +}
> +
> +int tegra_xusb_lane_lookup_function(struct tegra_xusb_lane *lane,
> +				    const char *function)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < lane->soc->num_funcs; i++)
> +		if (strcmp(function, lane->soc->funcs[i]) =3D=3D 0)
> +			return i;
> +
> +	return -EINVAL;
> +}
> +
> +int tegra_xusb_lane_parse_dt(struct tegra_xusb_lane *lane,
> +			     struct device_node *np)
> +{
> +	struct device *dev =3D &lane->pad->dev;
> +	const char *function;
> +	int err;
> +
> +	err =3D of_property_read_string(np, "nvidia,function", &function);
> +	if (err < 0)
> +		return err;
> +
> +	err =3D tegra_xusb_lane_lookup_function(lane, function);
> +	if (err < 0) {
> +		dev_err(dev, "invalid function \"%s\" for lane \"%s\"\n",
> +			function, np->name);
> +		return err;
> +	}
> +
> +	lane->function =3D err;
> +
> +	return 0;
> +}
> +
> +static void tegra_xusb_lane_destroy(struct phy *phy)
> +{
> +	if (phy) {
> +		struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +
> +		lane->pad->ops->remove(lane);
> +		phy_destroy(phy);
> +	}
> +}
> +
> +static void tegra_xusb_pad_release(struct device *dev)
> +{
> +	struct tegra_xusb_pad *pad =3D to_tegra_xusb_pad(dev);
> +
> +	pad->soc->ops->remove(pad);
> +}
> +
> +static struct device_type tegra_xusb_pad_type =3D {
> +	.release =3D tegra_xusb_pad_release,
> +};
> +
> +int tegra_xusb_pad_init(struct tegra_xusb_pad *pad,
> +			struct tegra_xusb_padctl *padctl,
> +			struct device_node *np)
> +{
> +	int err;
> +
> +	device_initialize(&pad->dev);
> +	INIT_LIST_HEAD(&pad->list);
> +	pad->dev.parent =3D padctl->dev;
> +	pad->dev.type =3D &tegra_xusb_pad_type;
> +	pad->dev.of_node =3D np;
> +	pad->padctl =3D padctl;
> +
> +	err =3D dev_set_name(&pad->dev, "%s", pad->soc->name);
> +	if (err < 0)
> +		goto unregister;
> +
> +	err =3D device_add(&pad->dev);
> +	if (err < 0)
> +		goto unregister;
> +
> +	return 0;
> +
> +unregister:
> +	device_unregister(&pad->dev);
> +	return err;
> +}
> +
> +int tegra_xusb_pad_register(struct tegra_xusb_pad *pad,
> +			    const struct phy_ops *ops)
> +{
> +	struct phy *lane;
> +	unsigned int i;
> +	int err;
> +
> +	pad->lanes =3D devm_kcalloc(&pad->dev, pad->soc->num_lanes, sizeof(lane=
),
> +				  GFP_KERNEL);
> +	if (!pad->lanes)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < pad->soc->num_lanes; i++) {
> +		struct device_node *np =3D tegra_xusb_pad_find_phy_node(pad, i);
> +		struct tegra_xusb_lane *lane;
> +
> +		/* skip disabled lanes */
> +		if (!np || !of_device_is_available(np))
> +			continue;
> +
> +		pad->lanes[i] =3D phy_create(&pad->dev, np, ops);
> +		if (IS_ERR(pad->lanes[i])) {
> +			err =3D PTR_ERR(pad->lanes[i]);
> +			goto remove;
> +		}
> +
> +		lane =3D pad->ops->probe(pad, np, i);
> +		if (IS_ERR(lane)) {
> +			phy_destroy(pad->lanes[i]);
> +			err =3D PTR_ERR(lane);
> +			goto remove;
> +		}
> +
> +		list_add_tail(&lane->list, &pad->padctl->lanes);
> +		phy_set_drvdata(pad->lanes[i], lane);
> +	}
> +
> +	pad->provider =3D of_phy_provider_register(&pad->dev,
> +						 tegra_xusb_pad_of_xlate);
> +	if (IS_ERR(pad->provider)) {
> +		err =3D PTR_ERR(pad->provider);
> +		goto remove;
> +	}
> +
> +	return 0;
> +
> +remove:
> +	while (i--)
> +		tegra_xusb_lane_destroy(pad->lanes[i]);
> +
> +	return err;
> +}
> +
> +void tegra_xusb_pad_unregister(struct tegra_xusb_pad *pad)
> +{
> +	unsigned int i =3D pad->soc->num_lanes;
> +
> +	of_phy_provider_unregister(pad->provider);
> +
> +	while (i--)
> +		tegra_xusb_lane_destroy(pad->lanes[i]);
> +
> +	device_unregister(&pad->dev);
> +}
> +
> +static struct tegra_xusb_pad *
> +tegra_xusb_pad_create(struct tegra_xusb_padctl *padctl,
> +		      const struct tegra_xusb_pad_soc *soc)
> +{
> +	struct tegra_xusb_pad *pad;
> +	struct device_node *np;
> +	int err;
> +
> +	np =3D tegra_xusb_find_pad_node(padctl, soc->name);
> +	if (!np || !of_device_is_available(np))
> +		return NULL;
> +
> +	pad =3D soc->ops->probe(padctl, soc, np);
> +	if (IS_ERR(pad)) {
> +		err =3D PTR_ERR(pad);
> +		dev_err(padctl->dev, "failed to create pad %s: %d\n",
> +			soc->name, err);
> +		return ERR_PTR(err);
> +	}
> +
> +	/* XXX move this into ->probe() to avoid string comparison */
> +	if (strcmp(soc->name, "pcie") =3D=3D 0)
> +		padctl->pcie =3D pad;
> +
> +	if (strcmp(soc->name, "sata") =3D=3D 0)
> +		padctl->sata =3D pad;
> +
> +	if (strcmp(soc->name, "usb2") =3D=3D 0)
> +		padctl->usb2 =3D pad;
> +
> +	if (strcmp(soc->name, "ulpi") =3D=3D 0)
> +		padctl->ulpi =3D pad;
> +
> +	if (strcmp(soc->name, "hsic") =3D=3D 0)
> +		padctl->hsic =3D pad;
> +
> +	return pad;
> +}
> +
> +static void __tegra_xusb_remove_pads(struct tegra_xusb_padctl *padctl)
> +{
> +	struct tegra_xusb_pad *pad, *tmp;
> +
> +	list_for_each_entry_safe_reverse(pad, tmp, &padctl->pads, list) {
> +		list_del(&pad->list);
> +		tegra_xusb_pad_unregister(pad);
> +	}
> +}
> +
> +static void tegra_xusb_remove_pads(struct tegra_xusb_padctl *padctl)
> +{
> +	mutex_lock(&padctl->lock);
> +	__tegra_xusb_remove_pads(padctl);
> +	mutex_unlock(&padctl->lock);
> +}
> +
> +static void tegra_xusb_lane_program(struct tegra_xusb_lane *lane)
> +{
> +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +	const struct tegra_xusb_lane_soc *soc =3D lane->soc;
> +	u32 value;
> +
> +	/* choose function */
> +	value =3D padctl_readl(padctl, soc->offset);
> +	value &=3D ~(soc->mask << soc->shift);
> +	value |=3D lane->function << soc->shift;
> +	padctl_writel(padctl, value, soc->offset);
> +}
> +
> +static void tegra_xusb_pad_program(struct tegra_xusb_pad *pad)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < pad->soc->num_lanes; i++) {
> +		struct tegra_xusb_lane *lane;
> +
> +		if (pad->lanes[i]) {
> +			lane =3D phy_get_drvdata(pad->lanes[i]);
> +			tegra_xusb_lane_program(lane);
> +		}
> +	}
> +}
> +
> +static int tegra_xusb_setup_pads(struct tegra_xusb_padctl *padctl)
> +{
> +	struct tegra_xusb_pad *pad;
> +	unsigned int i;
> +
> +	mutex_lock(&padctl->lock);
> +
> +	for (i =3D 0; i < padctl->soc->num_pads; i++) {
> +		const struct tegra_xusb_pad_soc *soc =3D padctl->soc->pads[i];
> +		int err;
> +
> +		pad =3D tegra_xusb_pad_create(padctl, soc);
> +		if (IS_ERR(pad)) {
> +			err =3D PTR_ERR(pad);
> +			dev_err(padctl->dev, "failed to create pad %s: %d\n",
> +				soc->name, err);
> +			__tegra_xusb_remove_pads(padctl);
> +			mutex_unlock(&padctl->lock);
> +			return err;
> +		}
> +
> +		if (!pad)
> +			continue;
> +
> +		list_add_tail(&pad->list, &padctl->pads);
> +	}
> +
> +	list_for_each_entry(pad, &padctl->pads, list)
> +		tegra_xusb_pad_program(pad);
> +
> +	mutex_unlock(&padctl->lock);
> +	return 0;
> +}
> +
> +static bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane,
> +				  const char *function)
> +{
> +	if (lane) {
> +		const char *func =3D lane->soc->funcs[lane->function];
> +
> +		return strcmp(function, func) =3D=3D 0;
> +	}
> +
> +	return false;
> +}
> +
> +struct tegra_xusb_lane *tegra_xusb_find_lane(struct tegra_xusb_padctl *p=
adctl,
> +					     const char *type,
> +					     unsigned int index)
> +{
> +	struct tegra_xusb_lane *lane, *hit =3D NULL;
> +	char *name;
> +
> +	name =3D kasprintf(GFP_KERNEL, "%s-%u", type, index);
> +	if (!name)
> +		return NULL;
> +
> +	list_for_each_entry(lane, &padctl->lanes, list) {
> +		if (strcmp(lane->soc->name, name) =3D=3D 0) {
> +			hit =3D lane;
> +			break;
> +		}
> +	}
> +
> +	kfree(name);
> +	return hit;
> +}
> +
> +struct tegra_xusb_lane *
> +tegra_xusb_port_find_lane(struct tegra_xusb_port *port,
> +			  const struct tegra_xusb_lane_map *map,
> +			  const char *function)
> +{
> +	struct tegra_xusb_lane *lane, *match =3D NULL;
> +
> +	for (map =3D map; map->type; map++) {
> +		if (port->index !=3D map->port)
> +			continue;
> +
> +		lane =3D tegra_xusb_find_lane(port->padctl, map->type,
> +					    map->index);
> +		if (!tegra_xusb_lane_check(lane, function))
> +			continue;
> +
> +		if (match)
> +			dev_err(&port->dev, "conflicting match: %s-%u / %s\n",
> +				map->type, map->index, match->soc->name);
> +		else
> +			match =3D lane;
> +	}
> +
> +	return match;
> +}
> +
> +static struct device_node *
> +tegra_xusb_find_port_node(struct tegra_xusb_padctl *padctl, const char *=
type,
> +			  unsigned int index)
> +{
> +	/*
> +	 * of_find_node_by_name() drops a reference, so make sure to grab one.
> +	 */
> +	struct device_node *np =3D of_node_get(padctl->dev->of_node);
> +
> +	np =3D of_find_node_by_name(np, "ports");
> +	if (np) {
> +		char *name;
> +
> +		name =3D kasprintf(GFP_KERNEL, "%s-%u", type, index);
> +		np =3D of_find_node_by_name(np, name);
> +		kfree(name);
> +	}
> +
> +	return np;
> +}
> +
> +struct tegra_xusb_port *
> +tegra_xusb_find_port(struct tegra_xusb_padctl *padctl, const char *type,
> +		     unsigned int index)
> +{
> +	struct tegra_xusb_port *port;
> +	struct device_node *np;
> +
> +	np =3D tegra_xusb_find_port_node(padctl, type, index);
> +	if (!np)
> +		return NULL;
> +
> +	list_for_each_entry(port, &padctl->ports, list) {
> +		if (np =3D=3D port->dev.of_node) {
> +			of_node_put(np);
> +			return port;
> +		}
> +	}
> +
> +	of_node_put(np);
> +
> +	return NULL;
> +}
> +
> +struct tegra_xusb_usb2_port *
> +tegra_xusb_find_usb2_port(struct tegra_xusb_padctl *padctl, unsigned int=
 index)
> +{
> +	struct tegra_xusb_port *port;
> +
> +	port =3D tegra_xusb_find_port(padctl, "usb2", index);
> +	if (port)
> +		return to_usb2_port(port);
> +
> +	return NULL;
> +}
> +
> +struct tegra_xusb_usb3_port *
> +tegra_xusb_find_usb3_port(struct tegra_xusb_padctl *padctl, unsigned int=
 index)
> +{
> +	struct tegra_xusb_port *port;
> +
> +	port =3D tegra_xusb_find_port(padctl, "usb3", index);
> +	if (port)
> +		return to_usb3_port(port);
> +
> +	return NULL;
> +}
> +
> +static void tegra_xusb_port_release(struct device *dev)
> +{
> +}
> +
> +static struct device_type tegra_xusb_port_type =3D {
> +	.release =3D tegra_xusb_port_release,
> +};
> +
> +static int tegra_xusb_port_init(struct tegra_xusb_port *port,
> +				struct tegra_xusb_padctl *padctl,
> +				struct device_node *np,
> +				const char *name,
> +				unsigned int index)
> +{
> +	int err;
> +
> +	INIT_LIST_HEAD(&port->list);
> +	port->padctl =3D padctl;
> +	port->index =3D index;
> +
> +	device_initialize(&port->dev);
> +	port->dev.type =3D &tegra_xusb_port_type;
> +	port->dev.of_node =3D of_node_get(np);
> +	port->dev.parent =3D padctl->dev;
> +
> +	err =3D dev_set_name(&port->dev, "%s-%u", name, index);
> +	if (err < 0)
> +		goto unregister;
> +
> +	err =3D device_add(&port->dev);
> +	if (err < 0)
> +		goto unregister;
> +
> +	return 0;
> +
> +unregister:
> +	device_unregister(&port->dev);
> +	return err;
> +}
> +
> +static void tegra_xusb_port_unregister(struct tegra_xusb_port *port)
> +{
> +	device_unregister(&port->dev);
> +}
> +
> +static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *us=
b2)
> +{
> +	struct tegra_xusb_port *port =3D &usb2->base;
> +	struct device_node *np =3D port->dev.of_node;
> +
> +	usb2->internal =3D of_property_read_bool(np, "nvidia,internal");
> +
> +	usb2->supply =3D devm_regulator_get(&port->dev, "vbus");
> +	if (IS_ERR(usb2->supply))
> +		return PTR_ERR(usb2->supply);
> +
> +	return 0;
> +}
> +
> +static int tegra_xusb_add_usb2_port(struct tegra_xusb_padctl *padctl,
> +				    unsigned int index)
> +{
> +	struct tegra_xusb_usb2_port *usb2;
> +	struct device_node *np;
> +	int err =3D 0;
> +
> +	/*
> +	 * USB2 ports don't require additional properties, but if the port is
> +	 * marked as disabled there is no reason to register it.
> +	 */
> +	np =3D tegra_xusb_find_port_node(padctl, "usb2", index);
> +	if (!np || !of_device_is_available(np))
> +		goto out;
> +
> +	usb2 =3D devm_kzalloc(padctl->dev, sizeof(*usb2), GFP_KERNEL);
> +	if (!usb2) {
> +		err =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	err =3D tegra_xusb_port_init(&usb2->base, padctl, np, "usb2", index);
> +	if (err < 0)
> +		goto out;
> +
> +	usb2->base.ops =3D padctl->soc->ports.usb2.ops;
> +
> +	usb2->base.lane =3D usb2->base.ops->map(&usb2->base);
> +	if (IS_ERR(usb2->base.lane)) {
> +		err =3D PTR_ERR(usb2->base.lane);
> +		goto out;
> +	}
> +
> +	err =3D tegra_xusb_usb2_port_parse_dt(usb2);
> +	if (err < 0) {
> +		tegra_xusb_port_unregister(&usb2->base);
> +		goto out;
> +	}
> +
> +	list_add_tail(&usb2->base.list, &padctl->ports);
> +
> +out:
> +	of_node_put(np);
> +	return err;
> +}
> +
> +static int tegra_xusb_ulpi_port_parse_dt(struct tegra_xusb_ulpi_port *ul=
pi)
> +{
> +	struct tegra_xusb_port *port =3D &ulpi->base;
> +	struct device_node *np =3D port->dev.of_node;
> +
> +	ulpi->internal =3D of_property_read_bool(np, "nvidia,internal");
> +
> +	return 0;
> +}
> +
> +static int tegra_xusb_add_ulpi_port(struct tegra_xusb_padctl *padctl,
> +				    unsigned int index)
> +{
> +	struct tegra_xusb_ulpi_port *ulpi;
> +	struct device_node *np;
> +	int err =3D 0;
> +
> +	np =3D tegra_xusb_find_port_node(padctl, "ulpi", index);
> +	if (!np || !of_device_is_available(np))
> +		goto out;
> +
> +	ulpi =3D devm_kzalloc(padctl->dev, sizeof(*ulpi), GFP_KERNEL);
> +	if (!ulpi) {
> +		err =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	err =3D tegra_xusb_port_init(&ulpi->base, padctl, np, "ulpi", index);
> +	if (err < 0)
> +		goto out;
> +
> +	ulpi->base.ops =3D padctl->soc->ports.ulpi.ops;
> +
> +	ulpi->base.lane =3D ulpi->base.ops->map(&ulpi->base);
> +	if (IS_ERR(ulpi->base.lane)) {
> +		err =3D PTR_ERR(ulpi->base.lane);
> +		goto out;
> +	}
> +
> +	err =3D tegra_xusb_ulpi_port_parse_dt(ulpi);
> +	if (err < 0) {
> +		tegra_xusb_port_unregister(&ulpi->base);
> +		goto out;
> +	}
> +
> +	list_add_tail(&ulpi->base.list, &padctl->ports);
> +
> +out:
> +	of_node_put(np);
> +	return err;
> +}
> +
> +static int tegra_xusb_hsic_port_parse_dt(struct tegra_xusb_hsic_port *hs=
ic)
> +{
> +	/* XXX */
> +	return 0;
> +}
> +
> +static int tegra_xusb_add_hsic_port(struct tegra_xusb_padctl *padctl,
> +				    unsigned int index)
> +{
> +	struct tegra_xusb_hsic_port *hsic;
> +	struct device_node *np;
> +	int err =3D 0;
> +
> +	np =3D tegra_xusb_find_port_node(padctl, "hsic", index);
> +	if (!np || !of_device_is_available(np))
> +		goto out;
> +
> +	hsic =3D devm_kzalloc(padctl->dev, sizeof(*hsic), GFP_KERNEL);
> +	if (!hsic) {
> +		err =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	err =3D tegra_xusb_port_init(&hsic->base, padctl, np, "hsic", index);
> +	if (err < 0)
> +		goto out;
> +
> +	hsic->base.ops =3D padctl->soc->ports.hsic.ops;
> +
> +	hsic->base.lane =3D hsic->base.ops->map(&hsic->base);
> +	if (IS_ERR(hsic->base.lane)) {
> +		err =3D PTR_ERR(hsic->base.lane);
> +		goto out;
> +	}
> +
> +	err =3D tegra_xusb_hsic_port_parse_dt(hsic);
> +	if (err < 0) {
> +		tegra_xusb_port_unregister(&hsic->base);
> +		goto out;
> +	}
> +
> +	list_add_tail(&hsic->base.list, &padctl->ports);
> +
> +out:
> +	of_node_put(np);
> +	return err;
> +}
> +
> +static int tegra_xusb_usb3_port_parse_dt(struct tegra_xusb_usb3_port *us=
b3)
> +{
> +	struct tegra_xusb_port *port =3D &usb3->base;
> +	struct device_node *np =3D port->dev.of_node;
> +	u32 value;
> +	int err;
> +
> +	err =3D of_property_read_u32(np, "nvidia,usb2-companion", &value);
> +	if (err < 0) {
> +		dev_err(&port->dev, "failed to read port: %d\n", err);
> +		return err;
> +	}
> +
> +	usb3->port =3D value;
> +
> +	usb3->internal =3D of_property_read_bool(np, "nvidia,internal");
> +
> +	usb3->supply =3D devm_regulator_get(&port->dev, "vbus");
> +	if (IS_ERR(usb3->supply))
> +		return PTR_ERR(usb3->supply);
> +
> +	return 0;
> +}
> +
> +static int tegra_xusb_add_usb3_port(struct tegra_xusb_padctl *padctl,
> +				    unsigned int index)
> +{
> +	struct tegra_xusb_usb3_port *usb3;
> +	struct device_node *np;
> +	int err =3D 0;
> +
> +	/*
> +	 * If there is no supplemental configuration in the device tree the
> +	 * port is unusable. But it is valid to configure only a single port,
> +	 * hence return 0 instead of an error to allow ports to be optional.
> +	 */
> +	np =3D tegra_xusb_find_port_node(padctl, "usb3", index);
> +	if (!np || !of_device_is_available(np))
> +		goto out;
> +
> +	usb3 =3D devm_kzalloc(padctl->dev, sizeof(*usb3), GFP_KERNEL);
> +	if (!usb3) {
> +		err =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	err =3D tegra_xusb_port_init(&usb3->base, padctl, np, "usb3", index);
> +	if (err < 0)
> +		goto out;
> +
> +	usb3->base.ops =3D padctl->soc->ports.usb3.ops;
> +
> +	usb3->base.lane =3D usb3->base.ops->map(&usb3->base);
> +	if (IS_ERR(usb3->base.lane)) {
> +		err =3D PTR_ERR(usb3->base.lane);
> +		goto out;
> +	}
> +
> +	err =3D tegra_xusb_usb3_port_parse_dt(usb3);
> +	if (err < 0) {
> +		tegra_xusb_port_unregister(&usb3->base);
> +		goto out;
> +	}
> +
> +	list_add_tail(&usb3->base.list, &padctl->ports);
> +
> +out:
> +	of_node_put(np);
> +	return err;
> +}
> +
> +static void __tegra_xusb_remove_ports(struct tegra_xusb_padctl *padctl)
> +{
> +	struct tegra_xusb_port *port, *tmp;
> +
> +	list_for_each_entry_safe_reverse(port, tmp, &padctl->ports, list) {
> +		list_del(&port->list);
> +		tegra_xusb_port_unregister(port);
> +	}
> +}
> +
> +static int tegra_xusb_setup_ports(struct tegra_xusb_padctl *padctl)
> +{
> +	struct tegra_xusb_port *port;
> +	unsigned int i;
> +	int err =3D 0;
> +
> +	mutex_lock(&padctl->lock);
> +
> +	for (i =3D 0; i < padctl->soc->ports.usb2.count; i++) {
> +		err =3D tegra_xusb_add_usb2_port(padctl, i);
> +		if (err < 0)
> +			goto remove_ports;
> +	}
> +
> +	for (i =3D 0; i < padctl->soc->ports.ulpi.count; i++) {
> +		err =3D tegra_xusb_add_ulpi_port(padctl, i);
> +		if (err < 0)
> +			goto remove_ports;
> +	}
> +
> +	for (i =3D 0; i < padctl->soc->ports.hsic.count; i++) {
> +		err =3D tegra_xusb_add_hsic_port(padctl, i);
> +		if (err < 0)
> +			goto remove_ports;
> +	}
> +
> +	for (i =3D 0; i < padctl->soc->ports.usb3.count; i++) {
> +		err =3D tegra_xusb_add_usb3_port(padctl, i);
> +		if (err < 0)
> +			goto remove_ports;
> +	}
> +
> +	list_for_each_entry(port, &padctl->ports, list) {
> +		err =3D port->ops->enable(port);
> +		if (err < 0)
> +			dev_err(padctl->dev, "failed to enable port %s: %d\n",
> +				dev_name(&port->dev), err);
> +	}
> +
> +	goto unlock;
> +
> +remove_ports:
> +	__tegra_xusb_remove_ports(padctl);
> +unlock:
> +	mutex_unlock(&padctl->lock);
> +	return err;
> +}
> +
> +static void tegra_xusb_remove_ports(struct tegra_xusb_padctl *padctl)
> +{
> +	mutex_lock(&padctl->lock);
> +	__tegra_xusb_remove_ports(padctl);
> +	mutex_unlock(&padctl->lock);
> +}
> +
> +static int tegra_xusb_padctl_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D of_node_get(pdev->dev.of_node);
> +	const struct tegra_xusb_padctl_soc *soc;
> +	struct tegra_xusb_padctl *padctl;
> +	const struct of_device_id *match;
> +	struct resource *res;
> +	int err;
> +
> +	/* for backwards compatibility with old device trees */
> +	np =3D of_find_node_by_name(np, "pads");
> +	if (!np) {
> +		dev_warn(&pdev->dev, "deprecated DT, using legacy driver\n");
> +		return tegra_xusb_padctl_legacy_probe(pdev);
> +	}
> +
> +	of_node_put(np);
> +
> +	match =3D of_match_node(tegra_xusb_padctl_of_match, pdev->dev.of_node);
> +	soc =3D match->data;
> +
> +	padctl =3D soc->ops->probe(&pdev->dev, soc);
> +	if (IS_ERR(padctl))
> +		return PTR_ERR(padctl);
> +
> +	platform_set_drvdata(pdev, padctl);
> +	INIT_LIST_HEAD(&padctl->ports);
> +	INIT_LIST_HEAD(&padctl->lanes);
> +	INIT_LIST_HEAD(&padctl->pads);
> +	mutex_init(&padctl->lock);
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	padctl->regs =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(padctl->regs)) {
> +		err =3D PTR_ERR(padctl->regs);
> +		goto remove;
> +	}
> +
> +	padctl->rst =3D devm_reset_control_get(&pdev->dev, NULL);
> +	if (IS_ERR(padctl->rst)) {
> +		err =3D PTR_ERR(padctl->rst);
> +		goto remove;
> +	}
> +
> +	err =3D reset_control_deassert(padctl->rst);
> +	if (err < 0)
> +		goto remove;
> +
> +	err =3D tegra_xusb_setup_pads(padctl);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to setup pads: %d\n", err);
> +		goto reset;
> +	}
> +
> +	err =3D tegra_xusb_setup_ports(padctl);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to setup XUSB ports: %d\n", err);
> +		goto remove_pads;
> +	}
> +
> +	return 0;
> +
> +remove_pads:
> +	tegra_xusb_remove_pads(padctl);
> +reset:
> +	reset_control_assert(padctl->rst);
> +remove:
> +	soc->ops->remove(padctl);
> +	return err;
> +}
> +
> +static int tegra_xusb_padctl_remove(struct platform_device *pdev)
> +{
> +	struct tegra_xusb_padctl *padctl =3D platform_get_drvdata(pdev);
> +	int err;
> +
> +	tegra_xusb_remove_ports(padctl);
> +	tegra_xusb_remove_pads(padctl);
> +
> +	err =3D reset_control_assert(padctl->rst);
> +	if (err < 0)
> +		dev_err(&pdev->dev, "failed to assert reset: %d\n", err);
> +
> +	padctl->soc->ops->remove(padctl);
> +
> +	return err;
> +}
> +
> +static struct platform_driver tegra_xusb_padctl_driver =3D {
> +	.driver =3D {
> +		.name =3D "tegra-xusb-padctl",
> +		.of_match_table =3D tegra_xusb_padctl_of_match,
> +	},
> +	.probe =3D tegra_xusb_padctl_probe,
> +	.remove =3D tegra_xusb_padctl_remove,
> +};
> +module_platform_driver(tegra_xusb_padctl_driver);
> +
> +struct tegra_xusb_padctl *tegra_xusb_padctl_get(struct device *dev)
> +{
> +	struct tegra_xusb_padctl *padctl;
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +
> +	np =3D of_parse_phandle(dev->of_node, "nvidia,xusb-padctl", 0);
> +	if (!np)
> +		return ERR_PTR(-EINVAL);
> +
> +	/*
> +	 * This is slightly ugly. A better implementation would be to keep a
> +	 * registry of pad controllers, but since there will almost certainly
> +	 * only ever be one per SoC that would be a little overkill.
> +	 */
> +	pdev =3D of_find_device_by_node(np);
> +	if (!pdev) {
> +		of_node_put(np);
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	of_node_put(np);
> +
> +	padctl =3D platform_get_drvdata(pdev);
> +	if (!padctl) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	return padctl;
> +}
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_get);
> +
> +void tegra_xusb_padctl_put(struct tegra_xusb_padctl *padctl)
> +{
> +	if (padctl)
> +		put_device(padctl->dev);
> +}
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_put);
> +
> +int tegra_xusb_padctl_usb3_save_context(struct tegra_xusb_padctl *padctl,
> +					unsigned int port)
> +{
> +	if (padctl->soc->ops->usb3_save_context)
> +		return padctl->soc->ops->usb3_save_context(padctl, port);
> +
> +	return -ENOSYS;
> +}
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_usb3_save_context);
> +
> +int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_padctl *padctl,
> +				    unsigned int port, bool idle)
> +{
> +	if (padctl->soc->ops->hsic_set_idle)
> +		return padctl->soc->ops->hsic_set_idle(padctl, port, idle);
> +
> +	return -ENOSYS;
> +}
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_hsic_set_idle);
> +
> +int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *pad=
ctl,
> +					   unsigned int port, bool enable)
> +{
> +	if (padctl->soc->ops->usb3_set_lfps_detect)
> +		return padctl->soc->ops->usb3_set_lfps_detect(padctl, port,
> +							      enable);
> +
> +	return -ENOSYS;
> +}
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_usb3_set_lfps_detect);
> +
> +MODULE_AUTHOR("Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
> +MODULE_DESCRIPTION("Tegra XUSB Pad Controller driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> new file mode 100644
> index 000000000000..b49dbc36efa3
> --- /dev/null
> +++ b/drivers/phy/tegra/xusb.h
> @@ -0,0 +1,421 @@
> +/*
> + * Copyright (c) 2014-2015, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2015, Google Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + */
> +
> +#ifndef __PHY_TEGRA_XUSB_H
> +#define __PHY_TEGRA_XUSB_H
> +
> +#include <linux/io.h>
> +#include <linux/mutex.h>
> +#include <linux/workqueue.h>
> +
> +/* legacy entry points for backwards-compatibility */
> +int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev);
> +int tegra_xusb_padctl_legacy_remove(struct platform_device *pdev);
> +
> +struct phy;
> +struct phy_provider;
> +struct platform_device;
> +struct regulator;
> +
> +/*
> + * lanes
> + */
> +struct tegra_xusb_lane_soc {
> +	const char *name;
> +
> +	unsigned int offset;
> +	unsigned int shift;
> +	unsigned int mask;
> +
> +	const char * const *funcs;
> +	unsigned int num_funcs;
> +};
> +
> +struct tegra_xusb_lane {
> +	const struct tegra_xusb_lane_soc *soc;
> +	struct tegra_xusb_pad *pad;
> +	struct device_node *np;
> +	struct list_head list;
> +	unsigned int function;
> +	unsigned int index;
> +};
> +
> +int tegra_xusb_lane_parse_dt(struct tegra_xusb_lane *lane,
> +			     struct device_node *np);
> +
> +struct tegra_xusb_usb2_lane {
> +	struct tegra_xusb_lane base;
> +
> +	u32 hs_curr_level_offset;
> +};
> +
> +static inline struct tegra_xusb_usb2_lane *
> +to_usb2_lane(struct tegra_xusb_lane *lane)
> +{
> +	return container_of(lane, struct tegra_xusb_usb2_lane, base);
> +}
> +
> +struct tegra_xusb_ulpi_lane {
> +	struct tegra_xusb_lane base;
> +};
> +
> +static inline struct tegra_xusb_ulpi_lane *
> +to_ulpi_lane(struct tegra_xusb_lane *lane)
> +{
> +	return container_of(lane, struct tegra_xusb_ulpi_lane, base);
> +}
> +
> +struct tegra_xusb_hsic_lane {
> +	struct tegra_xusb_lane base;
> +
> +	u32 strobe_trim;
> +	u32 rx_strobe_trim;
> +	u32 rx_data_trim;
> +	u32 tx_rtune_n;
> +	u32 tx_rtune_p;
> +	u32 tx_rslew_n;
> +	u32 tx_rslew_p;
> +	bool auto_term;
> +};
> +
> +static inline struct tegra_xusb_hsic_lane *
> +to_hsic_lane(struct tegra_xusb_lane *lane)
> +{
> +	return container_of(lane, struct tegra_xusb_hsic_lane, base);
> +}
> +
> +struct tegra_xusb_pcie_lane {
> +	struct tegra_xusb_lane base;
> +};
> +
> +static inline struct tegra_xusb_pcie_lane *
> +to_pcie_lane(struct tegra_xusb_lane *lane)
> +{
> +	return container_of(lane, struct tegra_xusb_pcie_lane, base);
> +}
> +
> +struct tegra_xusb_sata_lane {
> +	struct tegra_xusb_lane base;
> +};
> +
> +static inline struct tegra_xusb_sata_lane *
> +to_sata_lane(struct tegra_xusb_lane *lane)
> +{
> +	return container_of(lane, struct tegra_xusb_sata_lane, base);
> +}
> +
> +struct tegra_xusb_lane_ops {
> +	struct tegra_xusb_lane *(*probe)(struct tegra_xusb_pad *pad,
> +					 struct device_node *np,
> +					 unsigned int index);
> +	void (*remove)(struct tegra_xusb_lane *lane);
> +};
> +
> +/*
> + * pads
> + */
> +struct tegra_xusb_pad_soc;
> +struct tegra_xusb_padctl;
> +
> +struct tegra_xusb_pad_ops {
> +	struct tegra_xusb_pad *(*probe)(struct tegra_xusb_padctl *padctl,
> +					const struct tegra_xusb_pad_soc *soc,
> +					struct device_node *np);
> +	void (*remove)(struct tegra_xusb_pad *pad);
> +};
> +
> +struct tegra_xusb_pad_soc {
> +	const char *name;
> +
> +	const struct tegra_xusb_lane_soc *lanes;
> +	unsigned int num_lanes;
> +
> +	const struct tegra_xusb_pad_ops *ops;
> +};
> +
> +struct tegra_xusb_pad {
> +	const struct tegra_xusb_pad_soc *soc;
> +	struct tegra_xusb_padctl *padctl;
> +	struct phy_provider *provider;
> +	struct phy **lanes;
> +	struct device dev;
> +
> +	const struct tegra_xusb_lane_ops *ops;
> +
> +	struct list_head list;
> +};
> +
> +static inline struct tegra_xusb_pad *to_tegra_xusb_pad(struct device *de=
v)
> +{
> +	return container_of(dev, struct tegra_xusb_pad, dev);
> +}
> +
> +int tegra_xusb_pad_init(struct tegra_xusb_pad *pad,
> +			struct tegra_xusb_padctl *padctl,
> +			struct device_node *np);
> +int tegra_xusb_pad_register(struct tegra_xusb_pad *pad,
> +			    const struct phy_ops *ops);
> +void tegra_xusb_pad_unregister(struct tegra_xusb_pad *pad);
> +
> +struct tegra_xusb_usb2_pad {
> +	struct tegra_xusb_pad base;
> +
> +	struct clk *clk;
> +	unsigned int enable;
> +	struct mutex lock;
> +};
> +
> +static inline struct tegra_xusb_usb2_pad *
> +to_usb2_pad(struct tegra_xusb_pad *pad)
> +{
> +	return container_of(pad, struct tegra_xusb_usb2_pad, base);
> +}
> +
> +struct tegra_xusb_ulpi_pad {
> +	struct tegra_xusb_pad base;
> +};
> +
> +static inline struct tegra_xusb_ulpi_pad *
> +to_ulpi_pad(struct tegra_xusb_pad *pad)
> +{
> +	return container_of(pad, struct tegra_xusb_ulpi_pad, base);
> +}
> +
> +struct tegra_xusb_hsic_pad {
> +	struct tegra_xusb_pad base;
> +
> +	struct regulator *supply;
> +	struct clk *clk;
> +};
> +
> +static inline struct tegra_xusb_hsic_pad *
> +to_hsic_pad(struct tegra_xusb_pad *pad)
> +{
> +	return container_of(pad, struct tegra_xusb_hsic_pad, base);
> +}
> +
> +struct tegra_xusb_pcie_pad {
> +	struct tegra_xusb_pad base;
> +
> +	struct reset_control *rst;
> +	struct clk *pll;
> +
> +	unsigned int enable;
> +};
> +
> +static inline struct tegra_xusb_pcie_pad *
> +to_pcie_pad(struct tegra_xusb_pad *pad)
> +{
> +	return container_of(pad, struct tegra_xusb_pcie_pad, base);
> +}
> +
> +struct tegra_xusb_sata_pad {
> +	struct tegra_xusb_pad base;
> +
> +	struct reset_control *rst;
> +	struct clk *pll;
> +
> +	unsigned int enable;
> +};
> +
> +static inline struct tegra_xusb_sata_pad *
> +to_sata_pad(struct tegra_xusb_pad *pad)
> +{
> +	return container_of(pad, struct tegra_xusb_sata_pad, base);
> +}
> +
> +/*
> + * ports
> + */
> +struct tegra_xusb_port_ops;
> +
> +struct tegra_xusb_port {
> +	struct tegra_xusb_padctl *padctl;
> +	struct tegra_xusb_lane *lane;
> +	unsigned int index;
> +
> +	struct list_head list;
> +	struct device dev;
> +
> +	const struct tegra_xusb_port_ops *ops;
> +};
> +
> +struct tegra_xusb_lane_map {
> +	unsigned int port;
> +	const char *type;
> +	unsigned int index;
> +	const char *func;
> +};
> +
> +struct tegra_xusb_lane *
> +tegra_xusb_port_find_lane(struct tegra_xusb_port *port,
> +			  const struct tegra_xusb_lane_map *map,
> +			  const char *function);
> +
> +struct tegra_xusb_port *
> +tegra_xusb_find_port(struct tegra_xusb_padctl *padctl, const char *type,
> +		     unsigned int index);
> +
> +struct tegra_xusb_usb2_port {
> +	struct tegra_xusb_port base;
> +
> +	struct regulator *supply;
> +	bool internal;
> +};
> +
> +static inline struct tegra_xusb_usb2_port *
> +to_usb2_port(struct tegra_xusb_port *port)
> +{
> +	return container_of(port, struct tegra_xusb_usb2_port, base);
> +}
> +
> +struct tegra_xusb_usb2_port *
> +tegra_xusb_find_usb2_port(struct tegra_xusb_padctl *padctl,
> +			  unsigned int index);
> +
> +struct tegra_xusb_ulpi_port {
> +	struct tegra_xusb_port base;
> +
> +	struct regulator *supply;
> +	bool internal;
> +};
> +
> +static inline struct tegra_xusb_ulpi_port *
> +to_ulpi_port(struct tegra_xusb_port *port)
> +{
> +	return container_of(port, struct tegra_xusb_ulpi_port, base);
> +}
> +
> +struct tegra_xusb_hsic_port {
> +	struct tegra_xusb_port base;
> +};
> +
> +static inline struct tegra_xusb_hsic_port *
> +to_hsic_port(struct tegra_xusb_port *port)
> +{
> +	return container_of(port, struct tegra_xusb_hsic_port, base);
> +}
> +
> +struct tegra_xusb_usb3_port {
> +	struct tegra_xusb_port base;
> +	struct regulator *supply;
> +	bool context_saved;
> +	unsigned int port;
> +	bool internal;
> +
> +	u32 tap1;
> +	u32 amp;
> +	u32 ctle_z;
> +	u32 ctle_g;
> +};
> +
> +static inline struct tegra_xusb_usb3_port *
> +to_usb3_port(struct tegra_xusb_port *port)
> +{
> +	return container_of(port, struct tegra_xusb_usb3_port, base);
> +}
> +
> +struct tegra_xusb_usb3_port *
> +tegra_xusb_find_usb3_port(struct tegra_xusb_padctl *padctl,
> +			  unsigned int index);
> +
> +struct tegra_xusb_port_ops {
> +	int (*enable)(struct tegra_xusb_port *port);
> +	void (*disable)(struct tegra_xusb_port *port);
> +	struct tegra_xusb_lane *(*map)(struct tegra_xusb_port *port);
> +};
> +
> +/*
> + * pad controller
> + */
> +struct tegra_xusb_padctl_soc;
> +
> +struct tegra_xusb_padctl_ops {
> +	struct tegra_xusb_padctl *
> +		(*probe)(struct device *dev,
> +			 const struct tegra_xusb_padctl_soc *soc);
> +	void (*remove)(struct tegra_xusb_padctl *padctl);
> +
> +	int (*usb3_save_context)(struct tegra_xusb_padctl *padctl,
> +				 unsigned int index);
> +	int (*hsic_set_idle)(struct tegra_xusb_padctl *padctl,
> +			     unsigned int index, bool idle);
> +	int (*usb3_set_lfps_detect)(struct tegra_xusb_padctl *padctl,
> +				    unsigned int index, bool enable);
> +};
> +
> +struct tegra_xusb_padctl_soc {
> +	const struct tegra_xusb_pad_soc * const *pads;
> +	unsigned int num_pads;
> +
> +	struct {
> +		struct {
> +			const struct tegra_xusb_port_ops *ops;
> +			unsigned int count;
> +		} usb2, ulpi, hsic, usb3;
> +	} ports;
> +
> +	const struct tegra_xusb_padctl_ops *ops;
> +};
> +
> +struct tegra_xusb_padctl {
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct mutex lock;
> +	struct reset_control *rst;
> +
> +	const struct tegra_xusb_padctl_soc *soc;
> +
> +	struct tegra_xusb_pad *pcie;
> +	struct tegra_xusb_pad *sata;
> +	struct tegra_xusb_pad *ulpi;
> +	struct tegra_xusb_pad *usb2;
> +	struct tegra_xusb_pad *hsic;
> +
> +	struct list_head ports;
> +	struct list_head lanes;
> +	struct list_head pads;
> +
> +	unsigned int enable;
> +
> +	struct clk *clk;
> +};
> +
> +static inline void padctl_writel(struct tegra_xusb_padctl *padctl, u32 v=
alue,
> +				 unsigned long offset)
> +{
> +	dev_dbg(padctl->dev, "%08lx < %08x\n", offset, value);
> +	writel(value, padctl->regs + offset);
> +}
> +
> +static inline u32 padctl_readl(struct tegra_xusb_padctl *padctl,
> +			       unsigned long offset)
> +{
> +	u32 value =3D readl(padctl->regs + offset);
> +	dev_dbg(padctl->dev, "%08lx > %08x\n", offset, value);
> +	return value;
> +}
> +
> +struct tegra_xusb_lane *tegra_xusb_find_lane(struct tegra_xusb_padctl *p=
adctl,
> +					     const char *name,
> +					     unsigned int index);
> +
> +#if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_=
SOC)
> +extern const struct tegra_xusb_padctl_soc tegra124_xusb_padctl_soc;
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_210_SOC)
> +extern const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc;
> +#endif
> +
> +#endif /* __PHY_TEGRA_XUSB_H */
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl=
/tegra/pinctrl-tegra-xusb.c
> index 2f06029c9405..946cda3fee35 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> @@ -873,7 +873,7 @@ static const struct of_device_id tegra_xusb_padctl_of=
_match[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, tegra_xusb_padctl_of_match);
> =20
> -static int tegra_xusb_padctl_probe(struct platform_device *pdev)
> +int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev)
>  {
>  	struct tegra_xusb_padctl *padctl;
>  	const struct of_device_id *match;
> @@ -955,8 +955,9 @@ reset:
>  	reset_control_assert(padctl->rst);
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_legacy_probe);
> =20
> -static int tegra_xusb_padctl_remove(struct platform_device *pdev)
> +int tegra_xusb_padctl_legacy_remove(struct platform_device *pdev)
>  {
>  	struct tegra_xusb_padctl *padctl =3D platform_get_drvdata(pdev);
>  	int err;
> @@ -969,17 +970,4 @@ static int tegra_xusb_padctl_remove(struct platform_=
device *pdev)
> =20
>  	return err;
>  }
> -
> -static struct platform_driver tegra_xusb_padctl_driver =3D {
> -	.driver =3D {
> -		.name =3D "tegra-xusb-padctl",
> -		.of_match_table =3D tegra_xusb_padctl_of_match,
> -	},
> -	.probe =3D tegra_xusb_padctl_probe,
> -	.remove =3D tegra_xusb_padctl_remove,
> -};
> -module_platform_driver(tegra_xusb_padctl_driver);
> -
> -MODULE_AUTHOR("Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
> -MODULE_DESCRIPTION("Tegra 124 XUSB Pad Control driver");
> -MODULE_LICENSE("GPL v2");
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_legacy_remove);
> diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xus=
b.h
> new file mode 100644
> index 000000000000..8e1a57a78d9f
> --- /dev/null
> +++ b/include/linux/phy/tegra/xusb.h
> @@ -0,0 +1,30 @@
> +/*
> + * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + */
> +
> +#ifndef PHY_TEGRA_XUSB_H
> +#define PHY_TEGRA_XUSB_H
> +
> +struct tegra_xusb_padctl;
> +struct device;
> +
> +struct tegra_xusb_padctl *tegra_xusb_padctl_get(struct device *dev);
> +void tegra_xusb_padctl_put(struct tegra_xusb_padctl *padctl);
> +
> +int tegra_xusb_padctl_usb3_save_context(struct tegra_xusb_padctl *padctl,
> +					unsigned int port);
> +int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_padctl *padctl,
> +				    unsigned int port, bool idle);
> +int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *pad=
ctl,
> +					   unsigned int port, bool enable);
> +
> +#endif /* PHY_TEGRA_XUSB_H */
> --=20
> 2.7.1
>=20

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXA7qRAAoJEN0jrNd/PrOhIjoQAKLgGEi0e8OtCpZbCNzRhtj9
W9uH15U7NSHCq8DgDHd5aQlrS8iJ+oBxPWcP4Zi/N/0RCoeu4IXe84R8JenQ9bfJ
uW3hsev2rg0rI9Hlhw0Vwuuul1mFk7UubheLUw5cGR3mDN27kp2gxRxv3YPZ7tmx
VQHuc5/Z0XLt8T6XfndVCN3y1+IltTgMD9u3mmk6vwzOAtEYL7swiegV8KP/4v3q
v1aw1U4ijfUwW6nrg6pZ8nLaiUzlWbwu82pZVayaKvLc5esyHo6Zwb8CXxZGI+X0
rWEaMZf9Y8lYNdsChYF5s+FYSKRv69E1e6vGo5kX5Qgt7DPErKWVDjGkWS+b67R9
JG1zI+RnK7dRwsNQwpiPhjkvlJ/XwKJiXCEaN3rB/OWQ+snEyIepjflS3ldeIOma
Y8Pnsp3bROHQN1/HSjMrOmlvz77D2eTPEjnVRBVJQsA+gDorOwBsT6GQdGxTBUDr
7ciH6xdfOu9vX/klHgPnY+62qhH0Ugns3z62zJ/A+rVx0WVm9m4pw8cSJ8ZftgnR
p+Sn8tqloQt/GysbsYfWcY4UjLGRbxEqesZ76W+rLZekRMz1PL7O38Vo1Am0ixZK
XDsTQEsgxI2ct6Q1IWsiOYEh+3p+13cgx8SK6ri7tZJxz4OX6DrkbBKMbPI2UUo5
smSwue0H1wWyLXFLcAFd
=3EBk
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
