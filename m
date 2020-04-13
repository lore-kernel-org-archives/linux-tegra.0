From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 11/22] memory: tegra: Register as interconnect provider
Date: Mon, 13 Apr 2020 15:43:26 +0300
Message-ID: <70f724d6-5cb2-0ebe-ffc1-5dbb77d9dc74@linaro.org>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-12-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200330010904.27643-12-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

Thank you for the patchset!

On 3/30/20 04:08, Dmitry Osipenko wrote:
> Now memory controller is a memory interconnection provider. This allows us
> to use interconnect API in order to change memory configuration.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/memory/tegra/mc.c | 118 ++++++++++++++++++++++++++++++++++++++
>  drivers/memory/tegra/mc.h |   8 +++
>  include/soc/tegra/mc.h    |   3 +
>  3 files changed, 129 insertions(+)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index ec8403557ed4..bcf0478c5f5a 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -591,6 +591,117 @@ static __maybe_unused irqreturn_t tegra20_mc_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int tegra_mc_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	return 0;
> +}
> +
> +static int tegra_mc_icc_aggregate(struct icc_node *node,
> +				  u32 tag, u32 avg_bw, u32 peak_bw,
> +				  u32 *agg_avg, u32 *agg_peak)
> +{
> +	*agg_avg = min((u64)avg_bw + (*agg_avg), (u64)U32_MAX);
> +	*agg_peak = max(*agg_peak, peak_bw);
> +
> +	return 0;
> +}
> +
> +/*
> + * Memory Controller (MC) has few Memory Clients that are issuing memory
> + * bandwidth allocation requests to the MC interconnect provider. The MC
> + * provider aggregates the requests and then sends the aggregated request
> + * up to the External Memory Controller (EMC) interconnect provider which
> + * re-configures hardware interface to External Memory (EMEM) in accordance
> + * to the required bandwidth. Each MC interconnect node represents an
> + * individual Memory Client.
> + *
> + * Memory interconnect topology:
> + *
> + *               +----+
> + * +--------+    |    |
> + * | TEXSRD +--->+    |
> + * +--------+    |    |
> + *               |    |    +-----+    +------+
> + *    ...        | MC +--->+ EMC +--->+ EMEM |
> + *               |    |    +-----+    +------+
> + * +--------+    |    |
> + * | DISP.. +--->+    |
> + * +--------+    |    |
> + *               +----+
> + */
> +static int tegra_mc_interconnect_setup(struct tegra_mc *mc)
> +{
> +	struct icc_onecell_data *data;
> +	struct icc_node *node;
> +	unsigned int num_nodes;
> +	unsigned int i;
> +	int err;
> +
> +	/* older device-trees don't have interconnect properties */
> +	if (!of_find_property(mc->dev->of_node, "#interconnect-cells", NULL))
> +		return 0;
> +
> +	num_nodes = mc->soc->num_clients;
> +
> +	data = devm_kzalloc(mc->dev, struct_size(data, nodes, num_nodes),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	mc->provider.dev = mc->dev;
> +	mc->provider.set = tegra_mc_icc_set;
> +	mc->provider.data = data;
> +	mc->provider.xlate = of_icc_xlate_onecell;
> +	mc->provider.aggregate = tegra_mc_icc_aggregate;
> +
> +	err = icc_provider_add(&mc->provider);
> +	if (err)
> +		return err;
> +
> +	/* create Memory Controller node */
> +	node = icc_node_create(TEGRA_ICC_MC);
> +	err = PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto del_provider;
> +
> +	node->name = "Memory Controller";
> +	icc_node_add(node, &mc->provider);
> +
> +	/* link Memory Controller to External Memory Controller */
> +	err = icc_link_create(node, TEGRA_ICC_EMC);
> +	if (err)
> +		goto remove_nodes;
> +
> +	for (i = 0; i < num_nodes; i++) {
> +		/* create MC client node */
> +		node = icc_node_create(mc->soc->clients[i].id);
> +		err = PTR_ERR_OR_ZERO(node);
> +		if (err)
> +			goto remove_nodes;
> +
> +		node->name = mc->soc->clients[i].name;
> +		icc_node_add(node, &mc->provider);
> +
> +		/* link Memory Client to Memory Controller */
> +		err = icc_link_create(node, TEGRA_ICC_MC);
> +		if (err)
> +			goto remove_nodes;
> +
> +		data->nodes[i] = node;
> +	}
> +	data->num_nodes = num_nodes;
> +
> +	return 0;
> +
> +remove_nodes:
> +	icc_nodes_remove(&mc->provider);
> +
> +del_provider:
> +	icc_provider_del(&mc->provider);
> +
> +	return err;
> +}
> +
>  static int tegra_mc_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> @@ -699,6 +810,13 @@ static int tegra_mc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (IS_ENABLED(CONFIG_INTERCONNECT)) {

The interconnect framework can be also a module and the then the build will fail.

> +		err = tegra_mc_interconnect_setup(mc);

Maybe register the interconnect provider as a platform sub-device instead?

Thanks,
Georgi
