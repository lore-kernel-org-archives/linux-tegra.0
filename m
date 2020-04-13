From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 17/22] memory: tegra30-emc: Register as interconnect
 provider
Date: Mon, 13 Apr 2020 15:44:26 +0300
Message-ID: <d8e39d8b-b3f3-4a30-cb5a-67fcbe18a957@linaro.org>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-18-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200330010904.27643-18-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On 3/30/20 04:08, Dmitry Osipenko wrote:
> Now external memory controller is a memory interconnection provider.
> This allows us to use interconnect API to change memory configuration.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 115 +++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
> 
> diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
> index 69698665d431..5a4106173a75 100644
> --- a/drivers/memory/tegra/tegra30-emc.c
> +++ b/drivers/memory/tegra/tegra30-emc.c
> @@ -14,6 +14,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -327,6 +328,7 @@ struct tegra_emc {
>  	struct device *dev;
>  	struct tegra_mc *mc;
>  	struct notifier_block clk_nb;
> +	struct icc_provider provider;
>  	struct clk *clk;
>  	void __iomem *regs;
>  	unsigned int irq;
> @@ -1264,6 +1266,112 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
>  			    emc, &tegra_emc_debug_max_rate_fops);
>  }
>  
> +static inline struct tegra_emc *
> +to_tegra_emc_provider(struct icc_provider *provider)
> +{
> +	return container_of(provider, struct tegra_emc, provider);
> +}
> +
> +static struct icc_node *
> +emc_of_icc_xlate_onecell(struct of_phandle_args *spec, void *data)
> +{
> +	struct icc_provider *provider = data;
> +	struct icc_node *node;
> +
> +	/* External Memory is the only possible ICC route */
> +	list_for_each_entry(node, &provider->nodes, node_list) {
> +		if (node->id == TEGRA_ICC_EMEM)
> +			return node;
> +	}
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	struct tegra_emc *emc = to_tegra_emc_provider(dst->provider);
> +	unsigned long long rate = icc_units_to_bps(dst->avg_bw);
> +	unsigned int dram_data_bus_width_bytes = 4;
> +	unsigned int ddr = 2;
> +	int err;
> +
> +	do_div(rate, ddr * dram_data_bus_width_bytes);
> +	rate = min_t(u64, rate, U32_MAX);
> +
> +	err = clk_set_min_rate(emc->clk, rate);
> +	if (err)
> +		return err;
> +
> +	err = clk_set_rate(emc->clk, rate);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int emc_icc_aggregate(struct icc_node *node,
> +			     u32 tag, u32 avg_bw, u32 peak_bw,
> +			     u32 *agg_avg, u32 *agg_peak)
> +{
> +	*agg_avg = min((u64)avg_bw + (*agg_avg), (u64)U32_MAX);
> +	*agg_peak = max(*agg_peak, peak_bw);
> +
> +	return 0;
> +}
> +
> +static int tegra_emc_interconnect_init(struct tegra_emc *emc)
> +{
> +	struct icc_node *node;
> +	int err;
> +
> +	/* older device-trees don't have interconnect properties */
> +	if (!of_find_property(emc->dev->of_node, "#interconnect-cells", NULL))
> +		return 0;
> +
> +	emc->provider.dev = emc->dev;
> +	emc->provider.set = emc_icc_set;
> +	emc->provider.data = &emc->provider;
> +	emc->provider.xlate = emc_of_icc_xlate_onecell;
> +	emc->provider.aggregate = emc_icc_aggregate;
> +
> +	err = icc_provider_add(&emc->provider);
> +	if (err)
> +		return err;
> +
> +	/* create External Memory Controller node */
> +	node = icc_node_create(TEGRA_ICC_EMC);
> +	err = PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto del_provider;
> +
> +	node->name = "External Memory Controller";
> +	icc_node_add(node, &emc->provider);
> +
> +	/* link External Memory Controller to External Memory (DRAM) */
> +	err = icc_link_create(node, TEGRA_ICC_EMEM);
> +	if (err)
> +		goto remove_nodes;
> +
> +	/* create External Memory node */
> +	node = icc_node_create(TEGRA_ICC_EMEM);
> +	err = PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto remove_nodes;
> +
> +	node->name = "External Memory (DRAM)";
> +	icc_node_add(node, &emc->provider);
> +
> +	return 0;
> +
> +remove_nodes:
> +	icc_nodes_remove(&emc->provider);
> +
> +del_provider:
> +	icc_provider_del(&emc->provider);
> +
> +	return err;
> +}

All the above seems like a duplicate of what we already have in the previous
patch for tegra20-emc. Can we have a single driver for both? Maybe extract the
above as a separate interconnect provider driver.

> +
>  static int tegra_emc_probe(struct platform_device *pdev)
>  {
>  	struct platform_device *mc;
> @@ -1344,6 +1452,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, emc);
>  	tegra_emc_debugfs_init(emc);
>  
> +	if (IS_ENABLED(CONFIG_INTERCONNECT)) {
> +		err = tegra_emc_interconnect_init(emc);

How about registering a platform device that will use the same driver to handle
the interconnect functionality for both tegra20 and tegra30?

Thanks,
Georgi
