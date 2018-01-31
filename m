From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 1/6] clk: tegra: dfll registration for multiple SoCs
Date: Wed, 31 Jan 2018 10:13:50 +0000
Message-ID: <954797d1-ff6b-5aab-69cc-65c1a034a571@nvidia.com>
References: <1516797938-32044-1-git-send-email-pdeschrijver@nvidia.com>
 <1516797938-32044-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1516797938-32044-3-git-send-email-pdeschrijver@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org
List-Id: linux-tegra@vger.kernel.org


On 24/01/18 12:45, Peter De Schrijver wrote:
> In a future patch, support for the DFLL in Tegra210 will be introduced.
> This requires support for more than 1 set of CVB and CPU max frequency
> tables.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 43 +++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> index 269d359..440eb8d 100644
> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> @@ -21,6 +21,7 @@
>  #include <linux/err.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <soc/tegra/fuse.h>
>  
> @@ -28,8 +29,15 @@
>  #include "clk-dfll.h"
>  #include "cvb.h"
>  
> +struct dfll_fcpu_data {
> +	const unsigned long *cpu_max_freq_table;
> +	unsigned int cpu_max_freq_table_size;
> +	const struct cvb_table *cpu_cvb_tables;
> +	unsigned int cpu_cvb_tables_size;
> +};
> +
>  /* Maximum CPU frequency, indexed by CPU speedo id */
> -static const unsigned long cpu_max_freq_table[] = {
> +static const unsigned long tegra124_cpu_max_freq_table[] = {
>  	[0] = 2014500000UL,
>  	[1] = 2320500000UL,
>  	[2] = 2116500000UL,
> @@ -82,16 +90,36 @@
>  	},
>  };
>  
> +static const struct dfll_fcpu_data tegra124_dfll_fcpu_data = {
> +	.cpu_max_freq_table = tegra124_cpu_max_freq_table,
> +	.cpu_max_freq_table_size = ARRAY_SIZE(tegra124_cpu_max_freq_table),
> +	.cpu_cvb_tables = tegra124_cpu_cvb_tables,
> +	.cpu_cvb_tables_size = ARRAY_SIZE(tegra124_cpu_cvb_tables)
> +};
> +
> +static const struct of_device_id tegra124_dfll_fcpu_of_match[] = {
> +	{
> +		.compatible = "nvidia,tegra124-dfll",
> +		.data = &tegra124_dfll_fcpu_data,
> +	},
> +	{ },
> +};
> +
>  static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
>  {
>  	int process_id, speedo_id, speedo_value, err;
>  	struct tegra_dfll_soc_data *soc;
> +	const struct of_device_id *of_id;
> +	const struct dfll_fcpu_data *fcpu_data;
> +
> +	of_id = of_match_device(tegra124_dfll_fcpu_of_match, &pdev->dev);
> +	fcpu_data = of_id->data;
>  
>  	process_id = tegra_sku_info.cpu_process_id;
>  	speedo_id = tegra_sku_info.cpu_speedo_id;
>  	speedo_value = tegra_sku_info.cpu_speedo_value;
>  
> -	if (speedo_id >= ARRAY_SIZE(cpu_max_freq_table)) {
> +	if (speedo_id >= fcpu_data->cpu_max_freq_table_size) {
>  		dev_err(&pdev->dev, "unknown max CPU freq for speedo_id=%d\n",
>  			speedo_id);
>  		return -ENODEV;
> @@ -107,10 +135,10 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	soc->max_freq = cpu_max_freq_table[speedo_id];
> +	soc->max_freq = fcpu_data->cpu_max_freq_table[speedo_id];
>  
> -	soc->cvb = tegra_cvb_add_opp_table(soc->dev, tegra124_cpu_cvb_tables,
> -					   ARRAY_SIZE(tegra124_cpu_cvb_tables),
> +	soc->cvb = tegra_cvb_add_opp_table(soc->dev, fcpu_data->cpu_cvb_tables,
> +					   fcpu_data->cpu_cvb_tables_size,
>  					   process_id, speedo_id, speedo_value,
>  					   soc->max_freq);
>  	if (IS_ERR(soc->cvb)) {
> @@ -142,11 +170,6 @@ static int tegra124_dfll_fcpu_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const struct of_device_id tegra124_dfll_fcpu_of_match[] = {
> -	{ .compatible = "nvidia,tegra124-dfll", },
> -	{ },
> -};
> -
>  static const struct dev_pm_ops tegra124_dfll_pm_ops = {
>  	SET_RUNTIME_PM_OPS(tegra_dfll_runtime_suspend,
>  			   tegra_dfll_runtime_resume, NULL)
> 

Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
