From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 5/5] phy: tegra: xusb: Add Tegra186 support
Date: Thu, 7 Feb 2019 17:17:59 +0530
Message-ID: <f6f3415c-56a7-e361-e9b3-8d86fab3a211@ti.com>
References: <20190125112525.10697-1-thierry.reding@gmail.com>
 <20190125112525.10697-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125112525.10697-5-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On 25/01/19 4:55 PM, Thierry Reding wrote:
> From: JC Kuo <jckuo@nvidia.com>
> 
> Add support for the XUSB pad controller found on Tegra186 SoCs. It is
> mostly similar to the same IP found on earlier chips, but the number of
> pads exposed differs, as do the programming sequences.
> 
> Note that the DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL power
> supplies of the XUSB pad controller require strict power sequencing and
> are therefore controlled by the PMIC on Tegra186.
> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  MAINTAINERS                       |   5 +
>  drivers/phy/tegra/Makefile        |   1 +
>  drivers/phy/tegra/xusb-tegra186.c | 908 ++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.c          |   6 +
>  drivers/phy/tegra/xusb.h          |  27 +
>  5 files changed, 947 insertions(+)
>  create mode 100644 drivers/phy/tegra/xusb-tegra186.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ddcdc29dfe1f..754f7e757361 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15099,6 +15099,11 @@ M:	Laxman Dewangan <ldewangan@nvidia.com>
>  S:	Supported
>  F:	drivers/spi/spi-tegra*
>  
> +TEGRA XUSB PADCTL DRIVER
> +M:	JC Kuo <jckuo@nvidia.com>
> +S:	Supported
> +F:	drivers/phy/tegra/xusb*
> +
>  TEHUTI ETHERNET DRIVER
>  M:	Andy Gospodarek <andy@greyhouse.net>
>  L:	netdev@vger.kernel.org
> diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
> index 898589238fd9..a93cd9a499b2 100644
> --- a/drivers/phy/tegra/Makefile
> +++ b/drivers/phy/tegra/Makefile
> @@ -4,3 +4,4 @@ phy-tegra-xusb-y += xusb.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_124_SOC) += xusb-tegra124.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) += xusb-tegra124.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
> +phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
> new file mode 100644
> index 000000000000..0dbcaddade90
> --- /dev/null
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -0,0 +1,908 @@
> +/*
> + * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
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

please use SPDX license format.
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/slab.h>
> +
> +#include <soc/tegra/fuse.h>
> +
> +#include "xusb.h"
> +
> +/* FUSE USB_CALIB registers */
> +#define HS_CURR_LEVEL_PADX_SHIFT(x)	((x) ? (11 + (x - 1) * 6) : 0)
> +#define HS_CURR_LEVEL_PAD_MASK		0x3f
> +#define HS_TERM_RANGE_ADJ_SHIFT		7
> +#define HS_TERM_RANGE_ADJ_MASK		0xf
> +#define HS_SQUELCH_SHIFT		29
> +#define HS_SQUELCH_MASK			0x7
> +
> +#define RPD_CTRL_SHIFT			0
> +#define RPD_CTRL_MASK			0x1f
> +
> +/* XUSB PADCTL registers */
> +#define XUSB_PADCTL_USB2_PAD_MUX	0x4
> +#define  USB2_PORT_SHIFT(x)		((x) * 2)
> +#define  USB2_PORT_MASK			0x3
> +#define   PORT_XUSB			1
> +#define  HSIC_PORT_SHIFT(x)		((x) + 20)
> +#define  HSIC_PORT_MASK			0x1
> +#define   PORT_HSIC			0
> +
> +#define XUSB_PADCTL_USB2_PORT_CAP	0x8
> +#define XUSB_PADCTL_SS_PORT_CAP		0xc
> +#define  PORTX_CAP_SHIFT(x)		((x) * 4)
> +#define  PORT_CAP_MASK			0x3
> +#define   PORT_CAP_DISABLED		0x0
> +#define   PORT_CAP_HOST			0x1
> +#define   PORT_CAP_DEVICE		0x2
> +#define   PORT_CAP_OTG			0x3
> +
> +#define XUSB_PADCTL_ELPG_PROGRAM		0x20
> +#define  USB2_PORT_WAKE_INTERRUPT_ENABLE(x)		(1 << (x))

Use BIT() macros here and below
> +#define  USB2_PORT_WAKEUP_EVENT(x)		(	1 << ((x) + 7))
> +#define  SS_PORT_WAKE_INTERRUPT_ENABLE(x)		(1 << ((x) + 14))
> +#define  SS_PORT_WAKEUP_EVENT(x)			(1 << ((x) + 21))
> +#define  USB2_HSIC_PORT_WAKE_INTERRUPT_ENABLE(x)	(1 << ((x) + 28))
> +#define  USB2_HSIC_PORT_WAKEUP_EVENT(x)			(1 << ((x) + 30))
> +#define  ALL_WAKE_EVENTS						\
> +	(USB2_PORT_WAKEUP_EVENT(0) | USB2_PORT_WAKEUP_EVENT(1) |	\
> +	USB2_PORT_WAKEUP_EVENT(2) | SS_PORT_WAKEUP_EVENT(0) |		\
> +	SS_PORT_WAKEUP_EVENT(1) | SS_PORT_WAKEUP_EVENT(2) |		\
> +	USB2_HSIC_PORT_WAKEUP_EVENT(0))
> +
> +#define XUSB_PADCTL_ELPG_PROGRAM_1		0x24
> +#define  SSPX_ELPG_CLAMP_EN(x)			(1 << (0 + (x) * 3))
> +#define  SSPX_ELPG_CLAMP_EN_EARLY(x)		(1 << (1 + (x) * 3))
> +#define  SSPX_ELPG_VCORE_DOWN(x)		(1 << (2 + (x) * 3))
> +
> +#define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x)	(0x88 + (x) * 0x40)
> +#define  HS_CURR_LEVEL(x)			((x) & 0x3f)
> +#define  TERM_SEL				(1 << 25)
> +#define  USB2_OTG_PD				(1 << 26)
> +#define  USB2_OTG_PD2				(1 << 27)
> +#define  USB2_OTG_PD2_OVRD_EN			(1 << 28)
> +#define  USB2_OTG_PD_ZI				(1 << 29)
> +
> +#define XUSB_PADCTL_USB2_OTG_PADX_CTL1(x)	(0x8c + (x) * 0x40)
> +#define  USB2_OTG_PD_DR				(1 << 2)
> +#define  TERM_RANGE_ADJ(x)			(((x) & 0xf) << 3)
> +#define  RPD_CTRL(x)				(((x) & 0x1f) << 26)
> +
> +#define XUSB_PADCTL_USB2_BIAS_PAD_CTL0		0x284
> +#define  BIAS_PAD_PD				(1 << 11)
> +#define  HS_SQUELCH_LEVEL(x)			(((x) & 0x7) << 0)
> +
> +#define XUSB_PADCTL_USB2_BIAS_PAD_CTL1		0x288
> +#define  USB2_TRK_START_TIMER(x)		(((x) & 0x7f) << 12)
> +#define  USB2_TRK_DONE_RESET_TIMER(x)		(((x) & 0x7f) << 19)
> +#define  USB2_PD_TRK				(1 << 26)
> +
> +#define XUSB_PADCTL_HSIC_PADX_CTL0(x)		(0x300 + (x) * 0x20)
> +#define  HSIC_PD_TX_DATA0			(1 << 1)
> +#define  HSIC_PD_TX_STROBE			(1 << 3)
> +#define  HSIC_PD_RX_DATA0			(1 << 4)
> +#define  HSIC_PD_RX_STROBE			(1 << 6)
> +#define  HSIC_PD_ZI_DATA0			(1 << 7)
> +#define  HSIC_PD_ZI_STROBE			(1 << 9)
> +#define  HSIC_RPD_DATA0				(1 << 13)
> +#define  HSIC_RPD_STROBE			(1 << 15)
> +#define  HSIC_RPU_DATA0				(1 << 16)
> +#define  HSIC_RPU_STROBE			(1 << 18)
> +
> +#define XUSB_PADCTL_HSIC_PAD_TRK_CTL0		(0x340)

unnecessary ().
> +#define  HSIC_TRK_START_TIMER(x)		(((x) & 0x7f) << 5)
> +#define  HSIC_TRK_DONE_RESET_TIMER(x)		(((x) & 0x7f) << 12)
> +#define  HSIC_PD_TRK				(1 << 19)
> +
> +#define USB2_VBUS_ID				(0x360)

here too..
> +#define  VBUS_OVERRIDE				(1 << 14)
> +#define  ID_OVERRIDE(x)			(((x) & 0xf) << 18)
> +#define  ID_OVERRIDE_FLOATING			ID_OVERRIDE(8)
> +#define  ID_OVERRIDE_GROUNDED			ID_OVERRIDE(0)
> +
> +#define TEGRA186_LANE(_name, _offset, _shift, _mask, _type)		\
> +	{								\
> +		.name = _name,						\
> +		.offset = _offset,					\
> +		.shift = _shift,					\
> +		.mask = _mask,						\
> +		.num_funcs = ARRAY_SIZE(tegra186_##_type##_functions),	\
> +		.funcs = tegra186_##_type##_functions,			\
> +	}
> +
> +struct tegra_xusb_fuse_calibration {
> +	u32 *hs_curr_level;
> +	u32 hs_squelch;
> +	u32 hs_term_range_adj;
> +	u32 rpd_ctrl;
> +};
> +
> +struct tegra186_xusb_padctl {
> +	struct tegra_xusb_padctl base;
> +
> +	struct tegra_xusb_fuse_calibration calib;
> +
> +	/* UTMI bias and tracking */
> +	struct clk *usb2_trk_clk;
> +	unsigned int bias_pad_enable;
> +};
> +
> +static inline struct tegra186_xusb_padctl *
> +to_tegra186_xusb_padctl(struct tegra_xusb_padctl *padctl)
> +{
> +	return container_of(padctl, struct tegra186_xusb_padctl, base);
> +}
> +
> +/* USB 2.0 UTMI PHY support */
> +static struct tegra_xusb_lane *
> +tegra186_usb2_lane_probe(struct tegra_xusb_pad *pad, struct device_node *np,
> +			 unsigned int index)
> +{
> +	struct tegra_xusb_usb2_lane *usb2;
> +	int err;
> +
> +	usb2 = kzalloc(sizeof(*usb2), GFP_KERNEL);
> +	if (!usb2)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&usb2->base.list);
> +	usb2->base.soc = &pad->soc->lanes[index];
> +	usb2->base.index = index;
> +	usb2->base.pad = pad;
> +	usb2->base.np = np;
> +
> +	err = tegra_xusb_lane_parse_dt(&usb2->base, np);
> +	if (err < 0) {
> +		kfree(usb2);
> +		return ERR_PTR(err);
> +	}
> +
> +	return &usb2->base;
> +}
> +
> +static void tegra186_usb2_lane_remove(struct tegra_xusb_lane *lane)
> +{
> +	struct tegra_xusb_usb2_lane *usb2 = to_usb2_lane(lane);
> +
> +	kfree(usb2);
> +}
> +
> +static const struct tegra_xusb_lane_ops tegra186_usb2_lane_ops = {
> +	.probe = tegra186_usb2_lane_probe,
> +	.remove = tegra186_usb2_lane_remove,
> +};
> +
> +static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
> +{
> +	struct tegra186_xusb_padctl *priv = to_tegra186_xusb_padctl(padctl);
> +	struct device *dev = padctl->dev;
> +	u32 value;
> +	int err;
> +
> +	mutex_lock(&padctl->lock);
> +
> +	if (priv->bias_pad_enable++ > 0) {
> +		mutex_unlock(&padctl->lock);
> +		return;
> +	}
> +
> +	err = clk_prepare_enable(priv->usb2_trk_clk);
> +	if (err < 0)
> +		dev_warn(dev, "failed to enable USB2 trk clock: %d\n", err);
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> +	value &= ~USB2_TRK_START_TIMER(~0);
> +	value |= USB2_TRK_START_TIMER(0x1e);
> +	value &= ~USB2_TRK_DONE_RESET_TIMER(~0);
> +	value |= USB2_TRK_DONE_RESET_TIMER(0xa);
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
> +	value &= ~BIAS_PAD_PD;
> +	value &= ~HS_SQUELCH_LEVEL(~0);
> +	value |= HS_SQUELCH_LEVEL(priv->calib.hs_squelch);
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
> +
> +	udelay(1);
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> +	value &= ~USB2_PD_TRK;
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> +
> +	mutex_unlock(&padctl->lock);
> +}
> +
> +static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
> +{
> +	struct tegra186_xusb_padctl *priv = to_tegra186_xusb_padctl(padctl);
> +	u32 value;
> +
> +	mutex_lock(&padctl->lock);
> +
> +	if (WARN_ON(priv->bias_pad_enable == 0)) {
> +		mutex_unlock(&padctl->lock);
> +		return;
> +	}
> +
> +	if (--priv->bias_pad_enable > 0) {
> +		mutex_unlock(&padctl->lock);
> +		return;
> +	}
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> +	value |= USB2_PD_TRK;
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> +
> +	clk_disable_unprepare(priv->usb2_trk_clk);
> +
> +	mutex_unlock(&padctl->lock);
> +}
> +
> +void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> +	struct tegra_xusb_usb2_port *port;
> +	struct device *dev = padctl->dev;
> +	unsigned int index = lane->index;
> +	u32 value;
> +
> +	if (!phy)
> +		return;
> +
> +	port = tegra_xusb_find_usb2_port(padctl, index);
> +	if (!port) {
> +		dev_err(dev, "no port found for USB2 lane %u\n", index);
> +		return;
> +	}
> +
> +	tegra186_utmi_bias_pad_power_on(padctl);
> +
> +	udelay(2);
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
> +	value &= ~USB2_OTG_PD;
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
> +	value &= ~USB2_OTG_PD_DR;
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
> +}
> +
> +void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> +	unsigned int index = lane->index;
> +	u32 value;
> +
> +	if (!phy)
> +		return;
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
> +	value |= USB2_OTG_PD;
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
> +	value |= USB2_OTG_PD_DR;
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
> +
> +	udelay(2);
> +
> +	tegra186_utmi_bias_pad_power_off(padctl);
> +}
> +
> +static int tegra186_utmi_phy_power_on(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
> +	struct tegra_xusb_usb2_lane *usb2 = to_usb2_lane(lane);
> +	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> +	struct tegra186_xusb_padctl *priv = to_tegra186_xusb_padctl(padctl);
> +	struct tegra_xusb_usb2_port *port;
> +	unsigned int index = lane->index;
> +	struct device *dev = padctl->dev;
> +	u32 value;
> +
> +	port = tegra_xusb_find_usb2_port(padctl, index);
> +	if (!port) {
> +		dev_err(dev, "no port found for USB2 lane %u\n", index);
> +		return -ENODEV;
> +	}
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_PAD_MUX);
> +	value &= ~(USB2_PORT_MASK << USB2_PORT_SHIFT(index));
> +	value |= (PORT_XUSB << USB2_PORT_SHIFT(index));
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_PAD_MUX);
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_PORT_CAP);
> +	value &= ~(PORT_CAP_MASK << PORTX_CAP_SHIFT(index));
> +
> +	if (port->mode == USB_DR_MODE_UNKNOWN)
> +		value |= (PORT_CAP_DISABLED << PORTX_CAP_SHIFT(index));
> +	else if (port->mode == USB_DR_MODE_PERIPHERAL)
> +		value |= (PORT_CAP_DEVICE << PORTX_CAP_SHIFT(index));
> +	else if (port->mode == USB_DR_MODE_HOST)
> +		value |= (PORT_CAP_HOST << PORTX_CAP_SHIFT(index));
> +	else if (port->mode == USB_DR_MODE_OTG)
> +		value |= (PORT_CAP_OTG << PORTX_CAP_SHIFT(index));
> +
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_PORT_CAP);
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
> +	value &= ~USB2_OTG_PD_ZI;
> +	value |= TERM_SEL;
> +	value &= ~HS_CURR_LEVEL(~0);
> +
> +	/* TODO hs_curr_level_offset support */

What is TODO here?
> +	if (usb2->hs_curr_level_offset) {
> +		int hs_current_level;
> +
> +		hs_current_level = (int)priv->calib.hs_curr_level[index] +
> +						usb2->hs_curr_level_offset;
> +
> +		if (hs_current_level < 0)
> +			hs_current_level = 0;
> +		if (hs_current_level > 0x3f)
> +			hs_current_level = 0x3f;
> +
> +		value |= HS_CURR_LEVEL(hs_current_level);
> +	} else {
> +		value |= HS_CURR_LEVEL(priv->calib.hs_curr_level[index]);
> +	}
> +
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
> +	value &= ~TERM_RANGE_ADJ(~0);
> +	value |= TERM_RANGE_ADJ(priv->calib.hs_term_range_adj);
> +	value &= ~RPD_CTRL(~0);
> +	value |= RPD_CTRL(priv->calib.rpd_ctrl);
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
> +
> +	/* TODO: pad power saving */
> +	tegra_phy_xusb_utmi_pad_power_on(phy);
> +	return 0;
> +}
> +
> +static int tegra186_utmi_phy_power_off(struct phy *phy)
> +{
> +	/* TODO: pad power saving */
> +	tegra_phy_xusb_utmi_pad_power_down(phy);
> +
> +	return 0;
> +}
> +
> +static int tegra186_utmi_phy_init(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> +	struct tegra_xusb_usb2_port *port;
> +	unsigned int index = lane->index;
> +	struct device *dev = padctl->dev;
> +	int err;
> +
> +	port = tegra_xusb_find_usb2_port(padctl, index);

I would prefer if this entire driver is rewritten without using xusb library.
Ideally you shouldn't have to traverse a list to configure the PHY. phy_get
already does that for you. It should be straight forward to get "port" from "phy".

I think xusb is making it more complicated than it has to be.

Thanks
Kishon
