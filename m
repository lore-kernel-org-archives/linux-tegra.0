Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53AAC6FA92
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Sep 2022 09:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbiI0J3p (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Sep 2022 05:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbiI0J3m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Sep 2022 05:29:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8096515FD2
        for <linux-tegra@vger.kernel.org>; Tue, 27 Sep 2022 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664270979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BHLT5W+e1RRU6xSZ1OvpcmbecKDz87raalwlp5wzFWE=;
        b=KYpu6sN3OU0fUBKyNSgrZ0wqGxp747AarvusuRLZvctmHqR/eH2TI4BFyDE8jWdW0zOd4v
        Eiwg123bNwVMqS5zmremSDvPOJiNAXhhTf3RYnAYIgon7cPZ9MEtKu2c0TWDUeZxwRJXhK
        lfdDacPBo2X9DzrDGvsEGYTenw8je/g=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-139-qrBnPDFRPCia7SVr8xtPBg-1; Tue, 27 Sep 2022 05:29:38 -0400
X-MC-Unique: qrBnPDFRPCia7SVr8xtPBg-1
Received: by mail-qt1-f199.google.com with SMTP id ay22-20020a05622a229600b0035bbb349e79so6423648qtb.13
        for <linux-tegra@vger.kernel.org>; Tue, 27 Sep 2022 02:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=BHLT5W+e1RRU6xSZ1OvpcmbecKDz87raalwlp5wzFWE=;
        b=XEoOnUhf64xWu4teBdYoTGzzhqnqfkvEsQMsABttF0FqUPy7l6fyqesKQD9D2oQCig
         8MTSpbO7BMH/c+aew1/nXpiVxNNV7r674N5+bUciygmHp7VvC8LkJOF58+U1OIjTR/VT
         k8Vlxhu7mQzL99ck7H7FELXBZnwzzRdCQ8EuxI3FHoznpbhHugoBqUv2xn0qVIdsgdcC
         u+7KjVt/cw1juBWZnJ4nUvNo0xT7NugNukPBO3JmbqvOt6ufufIAfkfsFv1FVf4mH6g3
         EJgAgwj0g2nITfmkiMdSapwomNx/BhHGeo5UXKTzBi+EMK78mzGeAIUgSeJxxhTFJs0B
         NmoQ==
X-Gm-Message-State: ACrzQf0Y59EPd572i7/Jq4/DsklZoNs1XucppXsiJpRU35JE7/8oxaOA
        2c+DiF1QjDzUUxVkxBPviptPgd2DGa4Mbui82yPdVoDQ9ksZZj5ZH9Ap1aiIQi/HK/I7u/rKC4K
        1l/kILHsIysJEOdg8UwAHgtU=
X-Received: by 2002:a05:620a:490a:b0:6ce:d88f:30fe with SMTP id ed10-20020a05620a490a00b006ced88f30femr16978600qkb.534.1664270976520;
        Tue, 27 Sep 2022 02:29:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7g6CpweUyEv2L0tGyo9eqMU5sPVvSToEdl7zQagUQLEcB/vv79cKAS22KPdPCiiro6fOvvSQ==
X-Received: by 2002:a05:620a:490a:b0:6ce:d88f:30fe with SMTP id ed10-20020a05620a490a00b006ced88f30femr16978592qkb.534.1664270976176;
        Tue, 27 Sep 2022 02:29:36 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-96.dyn.eolo.it. [146.241.97.96])
        by smtp.gmail.com with ESMTPSA id h7-20020a05620a400700b006ce515196a7sm700493qko.8.2022.09.27.02.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 02:29:35 -0700 (PDT)
Message-ID: <b9c159dea84b98acc5d5078338723f7f1585e39e.camel@redhat.com>
Subject: Re: [PATCH net-next v4 RESEND] stmmac: tegra: Add MGBE support
From:   Paolo Abeni <pabeni@redhat.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Bhadram Varka <vbhadram@nvidia.com>,
        linux-tegra@vger.kernel.org, netdev@vger.kernel.org
Date:   Tue, 27 Sep 2022 11:29:32 +0200
In-Reply-To: <20220923114922.864552-1-thierry.reding@gmail.com>
References: <20220923114922.864552-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 2022-09-23 at 13:49 +0200, Thierry Reding wrote:
> From: Bhadram Varka <vbhadram@nvidia.com>
> 
> Add support for the Multi-Gigabit Ethernet (MGBE/XPCS) IP found on
> NVIDIA Tegra234 SoCs.
> 
> Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |   6 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-tegra.c | 290 ++++++++++++++++++
>  3 files changed, 297 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 31ff35174034..e9f61bdaf7c4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -235,6 +235,12 @@ config DWMAC_INTEL_PLAT
>  	  the stmmac device driver. This driver is used for the Intel Keem Bay
>  	  SoC.
>  
> +config DWMAC_TEGRA
> +	tristate "NVIDIA Tegra MGBE support"
> +	depends on ARCH_TEGRA || COMPILE_TEST
> +	help
> +	  Support for the MGBE controller found on Tegra SoCs.
> +
>  config DWMAC_VISCONTI
>  	tristate "Toshiba Visconti DWMAC support"
>  	default ARCH_VISCONTI
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index d4e12e9ace4f..057e4bab5c08 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
>  obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
>  obj-$(CONFIG_DWMAC_GENERIC)	+= dwmac-generic.o
>  obj-$(CONFIG_DWMAC_IMX8)	+= dwmac-imx.o
> +obj-$(CONFIG_DWMAC_TEGRA)	+= dwmac-tegra.o
>  obj-$(CONFIG_DWMAC_VISCONTI)	+= dwmac-visconti.o
>  stmmac-platform-objs:= stmmac_platform.o
>  dwmac-altr-socfpga-objs := altr_tse_pcs.o dwmac-socfpga.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> new file mode 100644
> index 000000000000..bb4b540820fa
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> @@ -0,0 +1,290 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/platform_device.h>
> +#include <linux/of_device.h>
> +#include <linux/module.h>
> +#include <linux/stmmac.h>
> +#include <linux/clk.h>
> +
> +#include "stmmac_platform.h"
> +
> +static const char *const mgbe_clks[] = {
> +	"rx-pcs", "tx", "tx-pcs", "mac-divider", "mac", "mgbe", "ptp-ref", "mac"
> +};
> +
> +struct tegra_mgbe {
> +	struct device *dev;
> +
> +	struct clk_bulk_data *clks;
> +
> +	struct reset_control *rst_mac;
> +	struct reset_control *rst_pcs;
> +
> +	void __iomem *hv;
> +	void __iomem *regs;
> +	void __iomem *xpcs;
> +
> +	struct mii_bus *mii;
> +};
> +
> +#define XPCS_WRAP_UPHY_RX_CONTROL 0x801c
> +#define XPCS_WRAP_UPHY_RX_CONTROL_RX_SW_OVRD BIT(31)
> +#define XPCS_WRAP_UPHY_RX_CONTROL_RX_PCS_PHY_RDY BIT(10)
> +#define XPCS_WRAP_UPHY_RX_CONTROL_RX_CDR_RESET BIT(9)
> +#define XPCS_WRAP_UPHY_RX_CONTROL_RX_CAL_EN BIT(8)
> +#define XPCS_WRAP_UPHY_RX_CONTROL_RX_SLEEP (BIT(7) | BIT(6))
> +#define XPCS_WRAP_UPHY_RX_CONTROL_AUX_RX_IDDQ BIT(5)
> +#define XPCS_WRAP_UPHY_RX_CONTROL_RX_IDDQ BIT(4)
> +#define XPCS_WRAP_UPHY_RX_CONTROL_RX_DATA_EN BIT(0)
> +#define XPCS_WRAP_UPHY_HW_INIT_CTRL 0x8020
> +#define XPCS_WRAP_UPHY_HW_INIT_CTRL_TX_EN BIT(0)
> +#define XPCS_WRAP_UPHY_HW_INIT_CTRL_RX_EN BIT(2)
> +#define XPCS_WRAP_UPHY_STATUS 0x8044
> +#define XPCS_WRAP_UPHY_STATUS_TX_P_UP BIT(0)
> +#define XPCS_WRAP_IRQ_STATUS 0x8050
> +#define XPCS_WRAP_IRQ_STATUS_PCS_LINK_STS BIT(6)
> +
> +#define XPCS_REG_ADDR_SHIFT 10
> +#define XPCS_REG_ADDR_MASK 0x1fff
> +#define XPCS_ADDR 0x3fc
> +
> +#define MGBE_WRAP_COMMON_INTR_ENABLE	0x8704
> +#define MAC_SBD_INTR			BIT(2)
> +#define MGBE_WRAP_AXI_ASID0_CTRL	0x8400
> +#define MGBE_SID			0x6
> +
> +static void mgbe_uphy_lane_bringup(struct tegra_mgbe *mgbe)
> +{
> +	unsigned int retry = 300;
> +	u32 value;
> +	int err;
> +
> +	value = readl(mgbe->xpcs + XPCS_WRAP_UPHY_STATUS);
> +	if ((value & XPCS_WRAP_UPHY_STATUS_TX_P_UP) == 0) {
> +		value = readl(mgbe->xpcs + XPCS_WRAP_UPHY_HW_INIT_CTRL);
> +		value |= XPCS_WRAP_UPHY_HW_INIT_CTRL_TX_EN;
> +		writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_HW_INIT_CTRL);
> +	}
> +
> +	err = readl_poll_timeout(mgbe->xpcs + XPCS_WRAP_UPHY_HW_INIT_CTRL, value,
> +				 (value & XPCS_WRAP_UPHY_HW_INIT_CTRL_TX_EN) == 0,
> +				 500, 500 * 2000);
> +	if (err < 0)
> +		dev_err(mgbe->dev, "timeout waiting for TX lane to become enabled\n");

Why you don't need to propagate this error to the caller?

Same question for more error cases below.

> +
> +	usleep_range(10000, 20000);
> +
> +	value = readl(mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +	value |= XPCS_WRAP_UPHY_RX_CONTROL_RX_SW_OVRD;
> +	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +
> +	value = readl(mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +	value &= ~XPCS_WRAP_UPHY_RX_CONTROL_RX_IDDQ;
> +	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +
> +	value = readl(mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +	value &= ~XPCS_WRAP_UPHY_RX_CONTROL_AUX_RX_IDDQ;
> +	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +
> +	value = readl(mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +	value &= ~XPCS_WRAP_UPHY_RX_CONTROL_RX_SLEEP;
> +	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +
> +	value = readl(mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +	value |= XPCS_WRAP_UPHY_RX_CONTROL_RX_CAL_EN;
> +	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +
> +	err = readl_poll_timeout(mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL, value,
> +				 (value & XPCS_WRAP_UPHY_RX_CONTROL_RX_CAL_EN) == 0,
> +				 1000, 1000 * 2000);
> +	if (err < 0)
> +		dev_err(mgbe->dev, "timeout waiting for RX calibration to become enabled\n");
> +
> +	value = readl(mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +	value |= XPCS_WRAP_UPHY_RX_CONTROL_RX_DATA_EN;
> +	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +
> +	value = readl(mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +	value |= XPCS_WRAP_UPHY_RX_CONTROL_RX_CDR_RESET;
> +	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +
> +	value = readl(mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +	value &= ~XPCS_WRAP_UPHY_RX_CONTROL_RX_CDR_RESET;
> +	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +
> +	value = readl(mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +	value |= XPCS_WRAP_UPHY_RX_CONTROL_RX_PCS_PHY_RDY;
> +	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> +
> +	while (--retry) {
> +		err = readl_poll_timeout(mgbe->xpcs + XPCS_WRAP_IRQ_STATUS, value,
> +					 value & XPCS_WRAP_IRQ_STATUS_PCS_LINK_STS,
> +					 500, 500 * 2000);
> +		if (err < 0) {
> +			dev_err(mgbe->dev, "timeout waiting for link to become ready\n");
> +			usleep_range(10000, 20000);
> +			continue;
> +		}
> +		break;
> +	}

It looks like the above loop can take up to 150 seconds (300
iterations, 500000usec each), can it be shortned?

> +
> +	/* clear status */
> +	writel(value, mgbe->xpcs + XPCS_WRAP_IRQ_STATUS);
> +}
> +
> +static int tegra_mgbe_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat;
> +	struct stmmac_resources res;
> +	struct tegra_mgbe *mgbe;
> +	int irq, err, i;
> +
> +	mgbe = devm_kzalloc(&pdev->dev, sizeof(*mgbe), GFP_KERNEL);
> +	if (!mgbe)
> +		return -ENOMEM;
> +
> +	mgbe->dev = &pdev->dev;
> +
> +	memset(&res, 0, sizeof(res));
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	mgbe->hv = devm_platform_ioremap_resource_byname(pdev, "hypervisor");
> +	if (IS_ERR(mgbe->hv))
> +		return PTR_ERR(mgbe->hv);
> +
> +	mgbe->regs = devm_platform_ioremap_resource_byname(pdev, "mac");
> +	if (IS_ERR(mgbe->regs))
> +		return PTR_ERR(mgbe->regs);
> +
> +	mgbe->xpcs = devm_platform_ioremap_resource_byname(pdev, "xpcs");
> +	if (IS_ERR(mgbe->xpcs))
> +		return PTR_ERR(mgbe->xpcs);
> +
> +	res.addr = mgbe->regs;
> +	res.irq = irq;
> +
> +	mgbe->clks = devm_kzalloc(&pdev->dev, sizeof(*mgbe->clks), GFP_KERNEL);
> +	if (!mgbe->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i <  ARRAY_SIZE(mgbe_clks); i++)
> +		mgbe->clks[i].id = mgbe_clks[i];
> +
> +	err = devm_clk_bulk_get(mgbe->dev, ARRAY_SIZE(mgbe_clks), mgbe->clks);
> +	if (err < 0)
> +		return err;
> +
> +	err = clk_bulk_prepare_enable(ARRAY_SIZE(mgbe_clks), mgbe->clks);
> +	if (err < 0)
> +		return err;
> +
> +	/* Perform MAC reset */
> +	mgbe->rst_mac = devm_reset_control_get(&pdev->dev, "mac");
> +	if (IS_ERR(mgbe->rst_mac))
> +		return PTR_ERR(mgbe->rst_mac);
> +
> +	err = reset_control_assert(mgbe->rst_mac);
> +	if (err < 0)
> +		return err;
> +
> +	usleep_range(2000, 4000);
> +
> +	err = reset_control_deassert(mgbe->rst_mac);
> +	if (err < 0)
> +		return err;
> +
> +	/* Perform PCS reset */
> +	mgbe->rst_pcs = devm_reset_control_get(&pdev->dev, "pcs");
> +	if (IS_ERR(mgbe->rst_pcs))
> +		return PTR_ERR(mgbe->rst_pcs);
> +
> +	err = reset_control_assert(mgbe->rst_pcs);
> +	if (err < 0)
> +		return err;
> +
> +	usleep_range(2000, 4000);
> +
> +	err = reset_control_deassert(mgbe->rst_pcs);
> +	if (err < 0)
> +		return err;
> +
> +	plat = stmmac_probe_config_dt(pdev, res.mac);
> +	if (IS_ERR(plat))
> +		return PTR_ERR(plat);
> +
> +	plat->has_xgmac = 1;
> +	plat->tso_en = 1;
> +	plat->pmt = 1;
> +	plat->bsp_priv = mgbe;
> +
> +	if (!plat->mdio_node)
> +		plat->mdio_node = of_get_child_by_name(pdev->dev.of_node, "mdio");
> +
> +	if (!plat->mdio_bus_data) {
> +		plat->mdio_bus_data = devm_kzalloc(&pdev->dev, sizeof(*plat->mdio_bus_data),
> +						   GFP_KERNEL);
> +		if (!plat->mdio_bus_data) {
> +			err = -ENOMEM;
> +			goto remove;
> +		}
> +	}
> +
> +	plat->mdio_bus_data->needs_reset = true;
> +
> +	mgbe_uphy_lane_bringup(mgbe);
> +
> +	/* Tx FIFO Size - 128KB */
> +	plat->tx_fifo_size = 131072;
> +	/* Rx FIFO Size - 192KB */
> +	plat->rx_fifo_size = 196608;
> +
> +	/* Enable common interrupt at wrapper level */
> +	writel(MAC_SBD_INTR, mgbe->regs + MGBE_WRAP_COMMON_INTR_ENABLE);
> +
> +	/* Program SID */
> +	writel(MGBE_SID, mgbe->hv + MGBE_WRAP_AXI_ASID0_CTRL);
> +
> +	err = stmmac_dvr_probe(&pdev->dev, plat, &res);
> +	if (err < 0)
> +		goto remove;
> +
> +	return 0;
> +
> +remove:
> +	stmmac_remove_config_dt(pdev, plat);
> +	return err;
> +}
> +
> +static int tegra_mgbe_remove(struct platform_device *pdev)
> +{
> +	struct tegra_mgbe *mgbe = get_stmmac_bsp_priv(&pdev->dev);
> +
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(mgbe_clks), mgbe->clks);
> +
> +	stmmac_pltfr_remove(pdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tegra_mgbe_match[] = {
> +	{ .compatible = "nvidia,tegra234-mgbe", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tegra_mgbe_match);

The DT bindings will land in 6.1, right?

Thanks!

Paolo

