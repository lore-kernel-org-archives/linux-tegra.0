From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] gpu: host1x: Fix bitshift/mask multipliers
Date: Wed, 2 Aug 2017 14:06:17 +0300
Message-ID: <f2b4348b-7856-aaec-a85b-1f8dae2445c7@gmail.com>
References: <20170802095505.27250-1-mperttunen@nvidia.com>
 <20170802095505.27250-2-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170802095505.27250-2-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02.08.2017 12:55, Mikko Perttunen wrote:
> Some parts of Host1x uses BIT_WORD/BIT_MASK/BITS_PER_LONG to calculate
> register or field offsets. This worked fine on ARMv7, but now that
> BITS_PER_LONG is 64 but our registers are still 32-bit things are
> broken.
> 
> Fix by replacing..
> - BIT_WORD with (x / 32)
> - BIT_MASK with BIT(x % 32)
> - BITS_PER_LONG with 32
> 
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/hw/intr_hw.c   | 24 ++++++++++++------------
>  drivers/gpu/host1x/hw/syncpt_hw.c |  2 +-
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
> index dacb8009a605..37ebb51703fa 100644
> --- a/drivers/gpu/host1x/hw/intr_hw.c
> +++ b/drivers/gpu/host1x/hw/intr_hw.c
> @@ -33,10 +33,10 @@ static void host1x_intr_syncpt_handle(struct host1x_syncpt *syncpt)
>  	unsigned int id = syncpt->id;
>  	struct host1x *host = syncpt->host;
>  
> -	host1x_sync_writel(host, BIT_MASK(id),
> -		HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(BIT_WORD(id)));
> -	host1x_sync_writel(host, BIT_MASK(id),
> -		HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(BIT_WORD(id)));
> +	host1x_sync_writel(host, BIT(id % 32),
> +		HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(id / 32));
> +	host1x_sync_writel(host, BIT(id % 32),
> +		HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(id / 32));
>  
>  	schedule_work(&syncpt->intr.work);
>  }
> @@ -50,9 +50,9 @@ static irqreturn_t syncpt_thresh_isr(int irq, void *dev_id)
>  	for (i = 0; i < DIV_ROUND_UP(host->info->nb_pts, 32); i++) {
>  		reg = host1x_sync_readl(host,
>  			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i));
> -		for_each_set_bit(id, &reg, BITS_PER_LONG) {
> +		for_each_set_bit(id, &reg, 32) {
>  			struct host1x_syncpt *syncpt =
> -				host->syncpt + (i * BITS_PER_LONG + id);
> +				host->syncpt + (i * 32 + id);
>  			host1x_intr_syncpt_handle(syncpt);
>  		}
>  	}
> @@ -117,17 +117,17 @@ static void _host1x_intr_set_syncpt_threshold(struct host1x *host,
>  static void _host1x_intr_enable_syncpt_intr(struct host1x *host,
>  					    unsigned int id)
>  {
> -	host1x_sync_writel(host, BIT_MASK(id),
> -		HOST1X_SYNC_SYNCPT_THRESH_INT_ENABLE_CPU0(BIT_WORD(id)));
> +	host1x_sync_writel(host, BIT(id % 32),
> +		HOST1X_SYNC_SYNCPT_THRESH_INT_ENABLE_CPU0(id / 32));
>  }
>  
>  static void _host1x_intr_disable_syncpt_intr(struct host1x *host,
>  					     unsigned int id)
>  {
> -	host1x_sync_writel(host, BIT_MASK(id),
> -		HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(BIT_WORD(id)));
> -	host1x_sync_writel(host, BIT_MASK(id),
> -		HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(BIT_WORD(id)));
> +	host1x_sync_writel(host, BIT(id % 32),
> +		HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(id / 32));
> +	host1x_sync_writel(host, BIT(id % 32),
> +		HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(id / 32));
>  }
>  
>  static int _host1x_free_syncpt_irq(struct host1x *host)
> diff --git a/drivers/gpu/host1x/hw/syncpt_hw.c b/drivers/gpu/host1x/hw/syncpt_hw.c
> index c93f74fcce72..7b0270d60742 100644
> --- a/drivers/gpu/host1x/hw/syncpt_hw.c
> +++ b/drivers/gpu/host1x/hw/syncpt_hw.c
> @@ -89,7 +89,7 @@ static int syncpt_cpu_incr(struct host1x_syncpt *sp)
>  	    host1x_syncpt_idle(sp))
>  		return -EINVAL;
>  
> -	host1x_sync_writel(host, BIT_MASK(sp->id),
> +	host1x_sync_writel(host, BIT(sp->id % 32),
>  			   HOST1X_SYNC_SYNCPT_CPU_INCR(reg_offset));
>  	wmb();
>  
> 

Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

-- 
Dmitry
