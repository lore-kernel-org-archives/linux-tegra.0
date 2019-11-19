From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 23/29] memory: tegra124-emc: Register as interconnect
 provider
Date: Tue, 19 Nov 2019 19:57:50 +0300
Message-ID: <4ad5dca2-12c9-8e96-c68c-0dcdb9860fd9@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-24-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-24-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

18.11.2019 23:02, Dmitry Osipenko пишет:
> EMC now provides MC with memory bandwidth using interconnect API.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra124-emc.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
> index 2c73260654ba..c9478dcbeece 100644
> --- a/drivers/memory/tegra/tegra124-emc.c
> +++ b/drivers/memory/tegra/tegra124-emc.c
> @@ -25,6 +25,7 @@
>  #define EMC_FBIO_CFG5				0x104
>  #define	EMC_FBIO_CFG5_DRAM_TYPE_MASK		0x3
>  #define	EMC_FBIO_CFG5_DRAM_TYPE_SHIFT		0
> +#define EMC_FBIO_CFG5_DRAM_WIDTH_X64		BIT(4)
>  
>  #define EMC_INTSTATUS				0x0
>  #define EMC_INTSTATUS_CLKCHANGE_COMPLETE	BIT(4)
> @@ -1080,11 +1081,28 @@ static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
>  		dev_err(dev, "failed to create debugfs entry\n");
>  }
>  
> +static unsigned int emc_dram_data_bus_width_bytes(struct tegra_emc *emc)
> +{
> +	unsigned int bus_width;
> +	u32 emc_cfg;
> +
> +	emc_cfg = readl_relaxed(emc->regs + EMC_FBIO_CFG5);
> +	if (emc_cfg & EMC_FBIO_CFG5_DRAM_WIDTH_X64)
> +		bus_width = 64;
> +	else
> +		bus_width = 32;

Looks like I got a bit confused while was looking at TRMs before, seems
this width is unrelated to the EMC channel at all. I'll try to revisit
this again.

> +	dev_info(emc->dev, "DRAM data-bus width: %ubit\n", bus_width);
> +
> +	return bus_width / 8;
> +}
> +
>  static int tegra_emc_probe(struct platform_device *pdev)
>  {
>  	struct platform_device *mc;
>  	struct device_node *np;
>  	struct tegra_emc *emc;
> +	unsigned int bus_width;
>  	u32 ram_code;
>  	int err;
>  
> @@ -1146,6 +1164,12 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  	if (IS_ENABLED(CONFIG_DEBUG_FS))
>  		emc_debugfs_init(&pdev->dev, emc);
>  
> +	bus_width = emc_dram_data_bus_width_bytes(emc);
> +
> +	err = tegra_icc_emc_setup_interconnect(&pdev->dev, bus_width);
> +	if (err)
> +		dev_err(&pdev->dev, "failed to initialize ICC: %d\n", err);
> +
>  	return 0;
>  };
>  
> 
