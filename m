From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/6] soc/tegra: pmc: Fix early initialisation of PMC
Date: Wed, 29 Jun 2016 17:17:09 +0100
Message-ID: <5773F485.8090504@nvidia.com>
References: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
 <1467110308-22126-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467110308-22126-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 28/06/16 11:38, Jon Hunter wrote:
> During early initialisation, the available power partitions for a given
> device is configured as well as the polarity of the PMC interrupt. Both
> of which should only be configured if there is a valid device node for
> the PMC device. This is because the soc data used for configuring the
> power partitions is only available if a device node for the PMC is found
> and the code to configure the interrupt polarity uses the device node
> pointer directly.
> 
> Some early device-tree images may not have this device node and so fix
> this by ensuring the device node pointer is valid when configuring these
> items.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/pmc.c | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 52a9e9703668..2e031c4ad547 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -1550,27 +1550,29 @@ static int __init tegra_pmc_early_init(void)
>  		return -ENXIO;
>  	}
>  
> -	/* Create a bit-map of the available and valid partitions */
> -	for (i = 0; i < pmc->soc->num_powergates; i++)
> -		if (pmc->soc->powergates[i])
> -			set_bit(i, pmc->powergates_available);
> -
>  	mutex_init(&pmc->powergates_lock);
>  
> -	/*
> -	 * Invert the interrupt polarity if a PMC device tree node exists and
> -	 * contains the nvidia,invert-interrupt property.
> -	 */
> -	invert = of_property_read_bool(np, "nvidia,invert-interrupt");
> +	if (np) {
> +		/* Create a bit-map of the available and valid partitions */
> +		for (i = 0; i < pmc->soc->num_powergates; i++)
> +			if (pmc->soc->powergates[i])
> +				set_bit(i, pmc->powergates_available);
>  
> -	value = tegra_pmc_readl(PMC_CNTRL);
> +		/*
> +		 * Invert the interrupt polarity if a PMC device tree node
> +		 * exists and contains the nvidia,invert-interrupt property.
> +		 */
> +		invert = of_property_read_bool(np, "nvidia,invert-interrupt");
>  
> -	if (invert)
> -		value |= PMC_CNTRL_INTR_POLARITY;
> -	else
> -		value &= ~PMC_CNTRL_INTR_POLARITY;
> +		value = tegra_pmc_readl(PMC_CNTRL);
>  
> -	tegra_pmc_writel(value, PMC_CNTRL);
> +		if (invert)
> +			value |= PMC_CNTRL_INTR_POLARITY;
> +		else
> +			value &= ~PMC_CNTRL_INTR_POLARITY;
> +
> +		tegra_pmc_writel(value, PMC_CNTRL);
> +	}
>  
>  	return 0;
>  }

By the way, the more I think about this, if there is no valid 'pmc'
node in the device-tree blob, then I wonder if we should even bother
mapping the pmc address space at all? The reason being, if there is
no 'pmc' node then we cannot look-up the SoC data and so all the
public PMC APIs are pretty useless AFAICT. I wonder if we should do
something like ...

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e09c7ed385f6..34d1385d7ef0 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1510,7 +1510,6 @@ static int __init tegra_pmc_early_init(void)
 {
        const struct of_device_id *match;
        struct device_node *np;
-       struct resource regs;
        unsigned int i;
        bool invert;
        u32 value;
@@ -1520,73 +1519,47 @@ static int __init tegra_pmc_early_init(void)
        np = of_find_matching_node_and_match(NULL, tegra_pmc_match, &match);
        if (!np) {
                /*
-                * Fall back to legacy initialization for 32-bit ARM only. All
-                * 64-bit ARM device tree files for Tegra are required to have
-                * a PMC node.
-                *
-                * This is for backwards-compatibility with old device trees
-                * that didn't contain a PMC node. Note that in this case the
-                * SoC data can't be matched and therefore powergating is
-                * disabled.
+                * All 64-bit ARM device tree files for Tegra are required to
+                * have a PMC node. For old 32-bit Tegra device trees that
+                * don't contain a PMC node, the SoC data can't be matched
+                * and therefore powergating is disabled.
                 */
-               if (IS_ENABLED(CONFIG_ARM) && soc_is_tegra()) {
+               if (IS_ENABLED(CONFIG_ARM) && soc_is_tegra())
                        pr_warn("DT node not found, powergating disabled\n");
 
-                       regs.start = 0x7000e400;
-                       regs.end = 0x7000e7ff;
-                       regs.flags = IORESOURCE_MEM;
-
-                       pr_warn("Using memory region %pR\n", &regs);
-               } else {
-                       /*
-                        * At this point we're not running on Tegra, so play
-                        * nice with multi-platform kernels.
-                        */
-                       return 0;
-               }
-       } else {
-               /*
-                * Extract information from the device tree if we've found a
-                * matching node.
-                */
-               if (of_address_to_resource(np, 0, &regs) < 0) {
-                       pr_err("failed to get PMC registers\n");
-                       return -ENXIO;
-               }
+               return 0;
        }
 
-       pmc->base = ioremap_nocache(regs.start, resource_size(&regs));
+       pmc->base = of_iomap(np, 0);
        if (!pmc->base) {
                pr_err("failed to map PMC registers\n");
                of_node_put(np);
                return -ENXIO;
        }

Cheers
Jon
 

-- 
nvpublic
