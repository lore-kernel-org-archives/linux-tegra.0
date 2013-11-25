From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 12/31] dma: tegra: use reset framework
Date: Mon, 25 Nov 2013 15:11:20 -0700
Message-ID: <5293CB08.5010509@wwwdotorg.org>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org> <1384548866-13141-13-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384548866-13141-13-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/15/2013 01:54 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Tegra's clock driver now provides an implementation of the common
> reset API (include/linux/reset.h). Use this instead of the old Tegra-
> specific API; that will soon be removed.

Dan, Vinod,

It looks like I'm waiting for an ack on this patch. (although I forgot
to Cc Vinod when I first sent it, so adding him now, and hence quoting
the entire patch).

> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This patch is part of a series with strong internal depdendencies. I'm
> looking for an ack so that I can take the entire series through the Tegra
> and arm-soc trees. The series will be part of a stable branch that can be
> merged into other subsystems if needed to avoid/resolve dependencies.
> ---
>  drivers/dma/tegra20-apb-dma.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 73654e33f13b..afa5844c9346 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -32,8 +32,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
> -#include <linux/clk/tegra.h>
>  
>  #include "dmaengine.h"
>  
> @@ -208,6 +208,7 @@ struct tegra_dma {
>  	struct dma_device		dma_dev;
>  	struct device			*dev;
>  	struct clk			*dma_clk;
> +	struct reset_control		*rst;
>  	spinlock_t			global_lock;
>  	void __iomem			*base_addr;
>  	const struct tegra_dma_chip_data *chip_data;
> @@ -1282,6 +1283,12 @@ static int tegra_dma_probe(struct platform_device *pdev)
>  		return PTR_ERR(tdma->dma_clk);
>  	}
>  
> +	tdma->rst = devm_reset_control_get(&pdev->dev, "dma");
> +	if (IS_ERR(tdma->rst)) {
> +		dev_err(&pdev->dev, "Error: Missing reset\n");
> +		return PTR_ERR(tdma->rst);
> +	}
> +
>  	spin_lock_init(&tdma->global_lock);
>  
>  	pm_runtime_enable(&pdev->dev);
> @@ -1302,9 +1309,9 @@ static int tegra_dma_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Reset DMA controller */
> -	tegra_periph_reset_assert(tdma->dma_clk);
> +	reset_control_assert(tdma->rst);
>  	udelay(2);
> -	tegra_periph_reset_deassert(tdma->dma_clk);
> +	reset_control_deassert(tdma->rst);
>  
>  	/* Enable global DMA registers */
>  	tdma_write(tdma, TEGRA_APBDMA_GENERAL, TEGRA_APBDMA_GENERAL_ENABLE);
> 
