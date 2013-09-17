From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] dma: tegra20-apb-dma: Staticize
 tegra_dma_prep_dma_cyclic
Date: Tue, 17 Sep 2013 10:28:53 +0530
Message-ID: <20130917045853.GP17188@intel.com>
References: <1378467982-30327-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1378467982-30327-1-git-send-email-sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 06, 2013 at 05:16:22PM +0530, Sachin Kamat wrote:
> tegra_dma_prep_dma_cyclic is referenced only in this file.
> Make it static.
Applied, thanks

~Vinod
> 
> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 5d4986e..67a6752 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -1018,7 +1018,7 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
>  	return &dma_desc->txd;
>  }
>  
> -struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
> +static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
>  	struct dma_chan *dc, dma_addr_t buf_addr, size_t buf_len,
>  	size_t period_len, enum dma_transfer_direction direction,
>  	unsigned long flags, void *context)
> -- 
> 1.7.9.5
> 

-- 
