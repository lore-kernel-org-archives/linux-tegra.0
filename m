Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4243EBF2F;
	Tue, 17 Feb 2026 07:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771312905; cv=none; b=kl+N3qi1RV5ZyJ0mNLY6JeqT0kxMKpkv0IzXxn0iwtV/P0vTKSu3mwYzd5pL5gtM9qYImjKa1h3Vq3LHtUMu9v4QCtwIHKUcY3cTqk6qqt3xvOHnbX7dWebWWAv0xY0QnbFvOnMikBoxlcrO4IlL+ISg+9KEbpgCtCNhOLLQxOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771312905; c=relaxed/simple;
	bh=NScBpNFfPiW86nEc+8FBb87NJSa6r5SP797BXMmILYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqyrmevCl/Til1SdO6UxoKuuP6kxpVQFeFb1VriqidaRRceCftmjAIKn+Tez9Qo7CePg/2CvmR/A7TBMVENxldrx/C7OLF4CsK5GpjKIDBvlt9TJ98wHj5uNg7jD/iQGIOc26B8BSVatw7qTXwx4q8bgu5bKAHuIMrhTtkFuFaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRep5pqp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRep5pqp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A87BC4CEF7;
	Tue, 17 Feb 2026 07:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771312904;
	bh=NScBpNFfPiW86nEc+8FBb87NJSa6r5SP797BXMmILYU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NRep5pqpGu9w73Nu2Ea/vtb83y9+Odrqd65zIoNu1HlxVTGJv+nVTVnTnwNRLi5X+
	 KFG/z7x548kOmQiFqZCq+PuilrQE7kk5cuvLr5Fu69hgaK3z+A9WW2/+Vhd0zXY7Oj
	 1xWHJd59+KHKLvyEzq/1IEBgb8bZLXly+3dT/mO2eonWG/T6m9xjqP6Tmozpdqyi3b
	 r+Ckmah6bcUfS86DuM3qd/ussLvCPUeLehGITy0eJ5ZmQCzHZk0M/Nbqk09l7pqCo3
	 txzKsZtQDsesKpR1lT6uJXM7at/I9nCSSNcc1CdCkg3kNhd8QYCyEgOgHUerPnn3v2
	 wysk/0eG8+IdQ==
Message-ID: <6f143fdd-1e2d-428d-9b05-cf1124b179e8@kernel.org>
Date: Tue, 17 Feb 2026 08:21:40 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] memory: tegra: Add Tegra114 EMC driver
To: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260126190755.78475-1-clamor95@gmail.com>
 <20260126190755.78475-6-clamor95@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260126190755.78475-6-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/01/2026 20:07, Svyatoslav Ryhel wrote:
> Introduce driver for the External Memory Controller (EMC) found in
> Tegra114 SoC. It controls the external DRAM on the board. The purpose of
> this driver is to program memory timing for external memory on the EMC
> clock rate change.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/memory/tegra/Kconfig        |   12 +
>  drivers/memory/tegra/Makefile       |    1 +
>  drivers/memory/tegra/tegra114-emc.c | 1463 +++++++++++++++++++++++++++

Please rebase on top of Mikko's patch removing duplicated code.

>  3 files changed, 1476 insertions(+)
>  create mode 100644 drivers/memory/tegra/tegra114-emc.c
> 
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index fc5a27791826..11e7cc357d39 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -35,6 +35,18 @@ config TEGRA30_EMC
>  	  This driver is required to change memory timings / clock rate for
>  	  external memory.
>  
> +config TEGRA114_EMC
> +	tristate "NVIDIA Tegra114 External Memory Controller driver"
> +	default y
> +	depends on ARCH_TEGRA_114_SOC || COMPILE_TEST
> +	select TEGRA124_CLK_EMC if ARCH_TEGRA
> +	select PM_OPP
> +	help
> +	  This driver is for the External Memory Controller (EMC) found on
> +	  Tegra114 chips. The EMC controls the external DRAM on the board.
> +	  This driver is required to change memory timings / clock rate for
> +	  external memory.
> +
>  config TEGRA124_EMC
>  	tristate "NVIDIA Tegra124 External Memory Controller driver"
>  	default ARCH_TEGRA_124_SOC
> diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
> index 6334601e6120..6b9156de4b66 100644
> --- a/drivers/memory/tegra/Makefile
> +++ b/drivers/memory/tegra/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
>  
>  obj-$(CONFIG_TEGRA20_EMC)  += tegra20-emc.o
>  obj-$(CONFIG_TEGRA30_EMC)  += tegra30-emc.o
> +obj-$(CONFIG_TEGRA114_EMC) += tegra114-emc.o
>  obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o
>  obj-$(CONFIG_TEGRA210_EMC_TABLE) += tegra210-emc-table.o
>  obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o
> diff --git a/drivers/memory/tegra/tegra114-emc.c b/drivers/memory/tegra/tegra114-emc.c
> new file mode 100644
> index 000000000000..789b8e959a68
> --- /dev/null
> +++ b/drivers/memory/tegra/tegra114-emc.c
> @@ -0,0 +1,1463 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Tegra114 External Memory Controller driver
> + *
> + * Based on downstream driver from NVIDIA and tegra124-emc.c
> + * Copyright (C) 2011-2014 NVIDIA Corporation
> + *
> + * Copyright (C) 2024 Svyatoslav Ryhel <clamor95@gmail.com>
> + */
> +
> +#include <linux/clk-provider.h>

Where is it used?

> +#include <linux/clk.h>
> +#include <linux/clkdev.h>

Where is it used?

> +#include <linux/clk/tegra.h>

Where is it used?

> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/interconnect-provider.h>

Where is it used?

> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>

I don't see these used. OTOH, I see you use other of_ which needs their
header.

> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +#include <linux/sort.h>
> +#include <linux/string.h>
> +
> +#include <soc/tegra/common.h>
> +#include <soc/tegra/fuse.h>
> +#include <soc/tegra/mc.h>
> +
> +#include "mc.h"
> +
> +#define EMC_INTSTATUS				0x0
> +#define EMC_INTSTATUS_REFRESH_OVERFLOW		BIT(3)
> +#define EMC_INTSTATUS_CLKCHANGE_COMPLETE	BIT(4)
> +
> +#define EMC_INTMASK				0x4
> +
> +#define EMC_DBG					0x8
> +#define EMC_DBG_READ_MUX_ASSEMBLY		BIT(0)
> +#define EMC_DBG_WRITE_MUX_ACTIVE		BIT(1)
> +#define EMC_DBG_FORCE_UPDATE			BIT(2)
> +#define EMC_DBG_CFG_PRIORITY			BIT(24)
> +

...

> +
> +static int tegra_emc_debug_available_rates_show(struct seq_file *s,
> +						void *data)
> +{
> +	struct tegra_emc *emc = s->private;
> +	const char *prefix = "";
> +	unsigned int i;
> +
> +	for (i = 0; i < emc->num_timings; i++) {
> +		seq_printf(s, "%s%lu", prefix, emc->timings[i].rate);
> +		prefix = " ";
> +	}
> +
> +	seq_puts(s, "\n");
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(tegra_emc_debug_available_rates);

Where is the ABI documented for all these?

> +
> +static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
> +{
> +	struct tegra_emc *emc = data;
> +
> +	*rate = emc->debugfs.min_rate;
> +
> +	return 0;
> +}
> +
> +static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
> +{
> +	struct tegra_emc *emc = data;
> +	int err;
> +
> +	if (!tegra_emc_validate_rate(emc, rate))
> +		return -EINVAL;
> +
> +	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
> +	if (err < 0)
> +		return err;
> +
> +	emc->debugfs.min_rate = rate;
> +
> +	return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
> +			 tegra_emc_debug_min_rate_get,
> +			 tegra_emc_debug_min_rate_set, "%llu\n");
> +

...

> +
> +static int tegra_emc_probe(struct platform_device *pdev)
> +{
> +	struct tegra_core_opp_params opp_params = {};
> +	struct device_node *np;
> +	struct tegra_emc *emc;
> +	u32 ram_code;
> +	int err;
> +
> +	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
> +	if (!emc)
> +		return -ENOMEM;
> +
> +	mutex_init(&emc->rate_lock);
> +	emc->dev = &pdev->dev;
> +
> +	emc->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(emc->regs))
> +		return PTR_ERR(emc->regs);
> +
> +	emc->mc = devm_tegra_memory_controller_get(&pdev->dev);
> +	if (IS_ERR(emc->mc))
> +		return PTR_ERR(emc->mc);
> +
> +	ram_code = tegra_read_ram_code();
> +
> +	np = tegra_emc_find_node_by_ram_code(pdev->dev.of_node, ram_code);
> +	if (np) {
> +		err = tegra_emc_load_timings_from_dt(emc, np);
> +		of_node_put(np);
> +		if (err)
> +			return err;
> +	} else {
> +		dev_info_once(&pdev->dev,
> +			      "no memory timings for RAM code %u found in DT\n",
> +			      ram_code);
> +	}
> +
> +	err = emc_init(emc);
> +	if (err) {
> +		dev_err(&pdev->dev, "EMC initialization failed: %d\n", err);
> +		return err;
> +	}
> +
> +	platform_set_drvdata(pdev, emc);
> +
> +	tegra124_clk_set_emc_callbacks(tegra_emc_prepare_timing_change,
> +				       tegra_emc_complete_timing_change);
> +
> +	err = devm_add_action_or_reset(&pdev->dev, devm_tegra_emc_unset_callback,
> +				       NULL);
> +	if (err)
> +		return err;
> +
> +	err = platform_get_irq(pdev, 0);
> +	if (err < 0)
> +		return err;
> +
> +	emc->irq = err;
> +
> +	err = devm_request_irq(&pdev->dev, emc->irq, tegra_emc_isr, 0,
> +			       dev_name(&pdev->dev), emc);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to request irq: %d\n", err);
> +		return err;
> +	}
> +
> +	emc->clk = devm_clk_get(&pdev->dev, "emc");
> +	if (IS_ERR(emc->clk)) {
> +		err = PTR_ERR(emc->clk);
> +		dev_err(&pdev->dev, "failed to get EMC clock: %d\n", err);

Syntax is return dev_err_probe. Since some years and all the existing
code was already fixed, no?

> +		return err;
> +	}
> +
> +	opp_params.init_state = true;
> +
> +	err = devm_tegra_core_dev_init_opp_table(&pdev->dev, &opp_params);
> +	if (err)
> +		return err;
> +
> +	tegra_emc_rate_requests_init(emc);
> +
> +	if (IS_ENABLED(CONFIG_DEBUG_FS))
> +		emc_debugfs_init(&pdev->dev, emc);
> +
> +	tegra_emc_interconnect_init(emc);
> +
> +	/*
> +	 * Don't allow the kernel module to be unloaded. Unloading adds some
> +	 * extra complexity which doesn't really worth the effort in a case of
> +	 * this driver.
> +	 */
> +	try_module_get(THIS_MODULE);
> +
> +	return 0;
> +};
> +
> +static const struct of_device_id tegra_emc_of_match[] = {
> +	{ .compatible = "nvidia,tegra114-emc" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tegra_emc_of_match);
> +
> +static struct platform_driver tegra_emc_driver = {
> +	.probe = tegra_emc_probe,
> +	.driver = {
> +		.name = "tegra114-emc",
> +		.of_match_table = tegra_emc_of_match,
> +		.suppress_bind_attrs = true,
> +		.sync_state = icc_sync_state,
> +	},
> +};
> +module_platform_driver(tegra_emc_driver);
> +
> +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> +MODULE_DESCRIPTION("NVIDIA Tegra114 EMC driver");
> +MODULE_LICENSE("GPL");


Best regards,
Krzysztof
