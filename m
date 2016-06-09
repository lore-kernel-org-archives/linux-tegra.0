From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: pmc: Use register definitions instead of magic
 values
Date: Thu, 9 Jun 2016 09:20:42 +0100
Message-ID: <575926DA.50904@nvidia.com>
References: <20160608171530.19396-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160608171530.19396-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 08/06/16 18:15, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Use register definitions for the main SoC reset operation instead of
> hard-coding magic values. Note that the PMC_RST_STATUS register isn't
> actually accessed, but since it is mentioned in a comment the
> definitions are added for completeness.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/pmc.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 852f8470d6e7..70acad7ceca0 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -51,6 +51,7 @@
>  #define  PMC_CNTRL_CPU_PWRREQ_POLARITY	(1 << 15)  /* CPU pwr req polarity */
>  #define  PMC_CNTRL_CPU_PWRREQ_OE	(1 << 16)  /* CPU pwr req enable */
>  #define  PMC_CNTRL_INTR_POLARITY	(1 << 17)  /* inverts INTR polarity */
> +#define  PMC_CNTRL_MAIN_RST		(1 <<  4)
>  
>  #define DPD_SAMPLE			0x020
>  #define  DPD_SAMPLE_ENABLE		(1 << 0)
> @@ -80,6 +81,14 @@
>  #define PMC_SENSOR_CTRL_SCRATCH_WRITE	(1 << 2)
>  #define PMC_SENSOR_CTRL_ENABLE_RST	(1 << 1)
>  
> +#define PMC_RST_STATUS			0x1b4
> +#define  PMC_RST_STATUS_AOTAG		(1 << 5)
> +#define  PMC_RST_STATUS_LP0		(1 << 4)
> +#define  PMC_RST_STATUS_SW_MAIN		(1 << 3)
> +#define  PMC_RST_STATUS_SENSOR		(1 << 2)
> +#define  PMC_RST_STATUS_WATCHDOG	(1 << 1)
> +#define  PMC_RST_STATUS_POR		(1 << 0)

Looking at the TRM, the PMC_RST_STATUS register only has one field
called "RST_SOURCE" and the above are possible values for this field.
However, these are integer values and not actual bits (as it is a 3-bit
field). I believe that they should just be ...

#define PMC_RST_STATUS			0x1b4
#define  PMC_RST_STATUS_AOTAG		5
#define  PMC_RST_STATUS_LP0		4
#define  PMC_RST_STATUS_SW_MAIN		3
#define  PMC_RST_STATUS_SENSOR		2
#define  PMC_RST_STATUS_WATCHDOG	1
#define  PMC_RST_STATUS_POR		0

>  #define IO_DPD_REQ			0x1b8
>  #define  IO_DPD_REQ_CODE_IDLE		(0 << 30)
>  #define  IO_DPD_REQ_CODE_OFF		(1 << 30)
> @@ -638,9 +647,10 @@ static int tegra_pmc_restart_notify(struct notifier_block *this,
>  
>  	tegra_pmc_writel(value, PMC_SCRATCH0);
>  
> -	value = tegra_pmc_readl(0);
> -	value |= 0x10;
> -	tegra_pmc_writel(value, 0);
> +	/* reset everything but PMC_SCRATCH0 and PMC_RST_STATUS */

Not sure I understand the comment about PMC_RST_STATUS because this is
just a status register and it will log source of the reset. The TRM does
show that it is a R/W register. Are you just saying that source of the
reset will be preserved by the PMC_RST_STATUS register?

> +	value = tegra_pmc_readl(PMC_CNTRL);
> +	value |= PMC_CNTRL_MAIN_RST;
> +	tegra_pmc_writel(value, PMC_CNTRL);
>  
>  	return NOTIFY_DONE;
>  }

Otherwise ...

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
