From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 8/8] soc: tegra: pmc: Ensure GPU partition can be toggled
 on/off by PMC
Date: Fri, 12 Feb 2016 09:38:46 +0000
Message-ID: <56BDA826.2000304@nvidia.com>
References: <1455213806-21871-1-git-send-email-jonathanh@nvidia.com>
 <1455213806-21871-9-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455213806-21871-9-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 11/02/16 18:03, Jon Hunter wrote:
> For Tegra124 and Tegra210, the GPU partition cannot be toggled on and
> off via the APBDEV_PMC_PWRGATE_TOGGLE_0 register. For these devices, the
> partition is simply powered up and down via an external regulator.
> Describe in the PMC SoC data in which devices the GPU partition can be
> controlled via the APBDEV_PMC_PWRGATE_TOGGLE_0 register and ensure that
> no one can incorrectly try to toggle the GPU partition via the
> APBDEV_PMC_PWRGATE_TOGGLE_0 register.
> 
> Furthermore, because we cannot use the APBDEV_PMC_PWRGATE_STATUS_0
> register to determine if the GPU partition is powered, use the
> APBDEV_PMC_CLAMP_STATUS_0 register to determine if the GPU partition
> is powered. The APBDEV_PMC_CLAMP_STATUS_0 register is bit wise
> compatible with the APBDEV_PMC_PWRGATE_STATUS_0 register and if the
> clamp is disabled (ie. the appropriate bit == 0), then this indicates
> the partition is powered.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/pmc.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 8e358dbffaed..442232269df3 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -52,6 +52,8 @@
>  #define  DPD_SAMPLE_ENABLE		(1 << 0)
>  #define  DPD_SAMPLE_DISABLE		(0 << 0)
>  
> +#define CLAMP_STATUS			0x2c
> +
>  #define PWRGATE_TOGGLE			0x30
>  #define  PWRGATE_TOGGLE_START		(1 << 8)
>  
> @@ -109,6 +111,7 @@ struct tegra_pmc_soc {
>  
>  	bool has_tsense_reset;
>  	bool has_gpu_clamps;
> +	bool has_gpu_toggle;
>  };
>  
>  /**
> @@ -176,7 +179,10 @@ static void tegra_pmc_writel(u32 value, unsigned long offset)
>  
>  static inline bool tegra_powergate_state(int id)
>  {
> -	return (tegra_pmc_readl(PWRGATE_STATUS) & BIT(id)) != 0;
> +	if (id == TEGRA_POWERGATE_3D && !pmc->soc->has_gpu_toggle)
> +		return (tegra_pmc_readl(CLAMP_STATUS) & BIT(id)) == 0;

Well, this is still not right. For devices with
!pmc->soc->has_gpu_toggle, these devices have their own separate
register for removing the clamp and so the APBDEV_PMC_CLAMP_STATUS_0
register will not tell us the status. I need to look at this some more.

Jon
