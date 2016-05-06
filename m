From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 2/3] soc/tegra: pmc: Correct type of variable for
 tegra_pmc_readl()
Date: Fri, 6 May 2016 15:15:32 +0100
Message-ID: <572CA704.2060405@nvidia.com>
References: <1462531548-12914-1-git-send-email-ldewangan@nvidia.com>
 <1462531548-12914-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462531548-12914-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 06/05/16 11:45, Laxman Dewangan wrote:
> The function tegra_pmc_readl() returns the u32 type data and hence
> change the data type of variable where this data is stored to u32
> type.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> ---
> Changes from V1:
> -This is new in series as per discussion on V1 series to use u32 for
> tegra_pmc_readl.
> 
> Changes from V2:
> - Make unsigned long to u32 for some missed variable from V1.
> 
> Changes from V3:
> - Revert back the value to ulong where time calcualtion is done.
> ---
>  drivers/soc/tegra/pmc.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 2c3f1f9..09c2b97 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -875,10 +875,10 @@ static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
>  	return 0;
>  }
>  
> -static int tegra_io_rail_poll(unsigned long offset, unsigned long mask,
> -			      unsigned long val, unsigned long timeout)
> +static int tegra_io_rail_poll(unsigned long offset, u32 mask,
> +			      u32 val, unsigned long timeout)
>  {
> -	unsigned long value;
> +	u32 value;
>  
>  	timeout = jiffies + msecs_to_jiffies(timeout);
>  
> @@ -900,8 +900,9 @@ static void tegra_io_rail_unprepare(void)
>  
>  int tegra_io_rail_power_on(unsigned int id)
>  {
> -	unsigned long request, status, value;
> -	unsigned int bit, mask;
> +	unsigned long request, status;
> +	unsigned int bit;
> +	u32 value, mask;
>  	int err;
>  
>  	mutex_lock(&pmc->powergates_lock);
> @@ -935,8 +936,9 @@ EXPORT_SYMBOL(tegra_io_rail_power_on);
>  
>  int tegra_io_rail_power_off(unsigned int id)
>  {
> -	unsigned long request, status, value;
> -	unsigned int bit, mask;
> +	unsigned long request, status;
> +	unsigned int bit;
> +	u32 value, mask;
>  	int err;
>  
>  	mutex_lock(&pmc->powergates_lock);
> 

Reviewed-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon
