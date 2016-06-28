From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 5/6] soc/tegra: pmc: Add missing of_node_put
Date: Tue, 28 Jun 2016 11:46:10 +0100
Message-ID: <57725572.7090802@nvidia.com>
References: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
 <1467110308-22126-6-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467110308-22126-6-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 28/06/16 11:38, Jon Hunter wrote:
> Add missing of_node_put() in PMC early initialisation function.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 483d54623ec5..e62acaef140a 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -1572,6 +1572,8 @@ static int __init tegra_pmc_early_init(void)
>  			value &= ~PMC_CNTRL_INTR_POLARITY;
>  
>  		tegra_pmc_writel(value, PMC_CNTRL);
> +
> +		of_node_put(np);
>  	}
>  
>  	return 0;

Actually there are a couple other places we should put the node ...

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 483d54623ec5..48e1de2f7aeb 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1540,6 +1540,7 @@ static int __init tegra_pmc_early_init(void)
                 */
                if (of_address_to_resource(np, 0, &regs) < 0) {
                        pr_err("failed to get PMC registers\n");
+                       of_node_put(np);
                        return -ENXIO;
                }
        }
@@ -1547,6 +1548,7 @@ static int __init tegra_pmc_early_init(void)
        pmc->base = ioremap_nocache(regs.start, resource_size(&regs));
        if (!pmc->base) {
                pr_err("failed to map PMC registers\n");
+               of_node_put(np);
                return -ENXIO;
        }

@@ -1572,6 +1574,8 @@ static int __init tegra_pmc_early_init(void)
                        value &= ~PMC_CNTRL_INTR_POLARITY;

                tegra_pmc_writel(value, PMC_CNTRL);
+
+               of_node_put(np);
        }

        return 0;

-- 
nvpublic
