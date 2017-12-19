From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/8] clk: tegra: dfll registration for multiple SoCs
Date: Tue, 19 Dec 2017 10:54:12 +0200
Message-ID: <20171219085412.GL29417@tbergstrom-lnx.Nvidia.com>
References: <1510846389-28712-1-git-send-email-pdeschrijver@nvidia.com>
 <1510846389-28712-2-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510846389-28712-2-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


Ping!

Any comments on this?

Peter.

On Thu, Nov 16, 2017 at 05:33:02PM +0200, Peter De Schrijver wrote:
> In a future patch, support for the DFLL in Tegra210 will be introduced.
> This requires support for more than 1 set of CVB and CPU max frequency
> tables.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 43 +++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> index ad1c1cc..1976e96 100644
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
> @@ -144,11 +172,6 @@ static int tegra124_dfll_fcpu_remove(struct platform_device *pdev)
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
> -- 
> 1.9.1
> 
