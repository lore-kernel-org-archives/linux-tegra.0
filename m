From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 08/10] phy: tegra: Add PCIe PIPE2UPHY support
Date: Wed, 3 Apr 2019 13:35:21 +0530
Message-ID: <ee9bba31-c9ac-9275-6f55-f71fea1a33a0@ti.com>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
 <1553613207-3988-9-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1553613207-3988-9-git-send-email-vidyas@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vidya Sagar <vidyas@nvidia.com>, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, tiwai@suse.de, spujar@nvidia.com, skomatineni@nvidia.com, liviu.dudau@arm.com, krzk@kernel.org, heiko@sntech.de, horms+renesas@verge.net.au, olof@lixom.net, maxime.ripard@bootlin.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, ezequiel@collabora.com, stefan.wahren@i2se.com, marc.w.gonzalez@free.fr, l.stach@pengutronix.de, tpiepho@impinj.com, hayashi.kunihiko@socionext.com, yue.wang@amlogic.com, shawn.lin@rock-chips.com, xiaowei.bao@nxp.com
Cc: devicetree@vger.kernel.org, mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On 26/03/19 8:43 PM, Vidya Sagar wrote:
> Synopsys DesignWare core based PCIe controllers in Tegra 194 SoC interface
> with Universal PHY (UPHY) module through a PIPE2UPHY (P2U) module.
> For each PCIe lane of a controller, there is a P2U unit instantiated at
> hardware level. This driver provides support for the programming required
> for each P2U that is going to be used for a PCIe controller.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  drivers/phy/tegra/Kconfig             |   7 ++
>  drivers/phy/tegra/Makefile            |   1 +
>  drivers/phy/tegra/pcie-p2u-tegra194.c | 138 ++++++++++++++++++++++++++++++++++
>  3 files changed, 146 insertions(+)
>  create mode 100644 drivers/phy/tegra/pcie-p2u-tegra194.c
> 
> diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
> index a3b1de953fb7..1460c060fa70 100644
> --- a/drivers/phy/tegra/Kconfig
> +++ b/drivers/phy/tegra/Kconfig
> @@ -6,3 +6,10 @@ config PHY_TEGRA_XUSB
>  
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called phy-tegra-xusb.
> +
> +config PHY_TEGRA194_PCIE_P2U
> +        tristate "NVIDIA Tegra P2U PHY Driver"
> +        depends on ARCH_TEGRA

COMPILE_TEST
> +        select GENERIC_PHY
> +        help
> +          Enable this to support the P2U (PIPE to UPHY) that is part of Tegra 19x SOCs.
> diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
> index 898589238fd9..f85b2c86643d 100644
> --- a/drivers/phy/tegra/Makefile
> +++ b/drivers/phy/tegra/Makefile
> @@ -4,3 +4,4 @@ phy-tegra-xusb-y += xusb.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_124_SOC) += xusb-tegra124.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) += xusb-tegra124.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
> +obj-$(CONFIG_PHY_TEGRA194_PCIE_P2U) += pcie-p2u-tegra194.o
> diff --git a/drivers/phy/tegra/pcie-p2u-tegra194.c b/drivers/phy/tegra/pcie-p2u-tegra194.c
> new file mode 100644
> index 000000000000..bb2412ec4765
> --- /dev/null
> +++ b/drivers/phy/tegra/pcie-p2u-tegra194.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * P2U (PIPE to UPHY) driver for Tegra T194 SoC
> + *
> + * Copyright (C) 2018 NVIDIA Corporation.

2019
> + *
> + * Author: Vidya Sagar <vidyas@nvidia.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/of.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/delay.h>
> +#include <linux/of_platform.h>
> +#include <soc/tegra/bpmp-abi.h>
> +
> +#define P2U_PERIODIC_EQ_CTRL_GEN3	0xc0
> +#define P2U_PERIODIC_EQ_CTRL_GEN3_PERIODIC_EQ_EN		BIT(0)
> +#define P2U_PERIODIC_EQ_CTRL_GEN3_INIT_PRESET_EQ_TRAIN_EN	BIT(1)
> +#define P2U_PERIODIC_EQ_CTRL_GEN4	0xc4
> +#define P2U_PERIODIC_EQ_CTRL_GEN4_INIT_PRESET_EQ_TRAIN_EN	BIT(1)
> +
> +#define P2U_RX_DEBOUNCE_TIME				0xa4
> +#define P2U_RX_DEBOUNCE_TIME_DEBOUNCE_TIMER_MASK	0xFFFF
> +#define P2U_RX_DEBOUNCE_TIME_DEBOUNCE_TIMER_VAL		160
> +
> +struct tegra_p2u {
> +	void __iomem		*base;
> +};
> +
> +static int tegra_p2u_power_off(struct phy *x)
> +{
> +	return 0;

Empty phy_ops are not required.
> +}
> +
> +static int tegra_p2u_power_on(struct phy *x)
> +{
> +	u32 val;
> +	struct tegra_p2u *phy = phy_get_drvdata(x);
> +
> +	val = readl(phy->base + P2U_PERIODIC_EQ_CTRL_GEN3);
> +	val &= ~P2U_PERIODIC_EQ_CTRL_GEN3_PERIODIC_EQ_EN;
> +	val |= P2U_PERIODIC_EQ_CTRL_GEN3_INIT_PRESET_EQ_TRAIN_EN;
> +	writel(val, phy->base + P2U_PERIODIC_EQ_CTRL_GEN3);
> +
> +	val = readl(phy->base + P2U_PERIODIC_EQ_CTRL_GEN4);
> +	val |= P2U_PERIODIC_EQ_CTRL_GEN4_INIT_PRESET_EQ_TRAIN_EN;
> +	writel(val, phy->base + P2U_PERIODIC_EQ_CTRL_GEN4);
> +
> +	val = readl(phy->base + P2U_RX_DEBOUNCE_TIME);
> +	val &= ~P2U_RX_DEBOUNCE_TIME_DEBOUNCE_TIMER_MASK;
> +	val |= P2U_RX_DEBOUNCE_TIME_DEBOUNCE_TIMER_VAL;
> +	writel(val, phy->base + P2U_RX_DEBOUNCE_TIME);

This looks more like a init configuration rather than power on.
> +
> +	return 0;
> +}
> +
> +static int tegra_p2u_init(struct phy *x)
> +{
> +	return 0;
> +}
> +
> +static int tegra_p2u_exit(struct phy *x)
> +{
> +	return 0;
> +}

Empty functions are not required.
> +
> +static const struct phy_ops ops = {
> +	.init		= tegra_p2u_init,
> +	.exit		= tegra_p2u_exit,
> +	.power_on	= tegra_p2u_power_on,
> +	.power_off	= tegra_p2u_power_off,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int tegra_p2u_probe(struct platform_device *pdev)
> +{
> +	struct tegra_p2u *phy;
> +	struct phy *generic_phy;
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "base");
> +	phy->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(phy->base))
> +		return PTR_ERR(phy->base);
> +
> +	platform_set_drvdata(pdev, phy);
> +
> +	generic_phy = devm_phy_create(dev, NULL, &ops);
> +	if (IS_ERR(generic_phy))
> +		return PTR_ERR(generic_phy);
> +
> +	phy_set_drvdata(generic_phy, phy);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(phy_provider))
> +		return PTR_ERR(phy_provider);
> +

return PTR_ERR_OR_ZERO(phy_provider);
> +	return 0;
> +}
> +
> +static int tegra_p2u_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

not required.

Thanks
Kishon
