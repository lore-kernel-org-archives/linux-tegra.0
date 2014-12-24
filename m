From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/11] ARM: tegra: add function to control the GPU rail
 clamp
Date: Wed, 24 Dec 2014 14:16:30 +0100
Message-ID: <1419426990.2179.7.camel@lynxeye.de>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
	 <1419331204-26679-2-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419331204-26679-2-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org, samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 23.12.2014, 18:39 +0800 schrieb Vince Hsu:
> The Tegra124 and later Tegra SoCs have a sepatate rail gating register
> to enable/disable the clamp. The original function
> tegra_powergate_remove_clamping() is not sufficient for the enable
> function. So add a new function which is dedicated to the GPU rail
> gating. Also don't refer to the powergate ID since the GPU ID makes no
> sense here.
> 
> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

To be honest I don't see the point of this patch.
You are bloating the PMC interface by introducing another exported
function that does nothing different than what the current function
already does.

If you need a way to assert the clamp I would have expected you to
introduce a common function to do this for all power partitions.

Other comments inline.

Regards,
Lucas

> ---
>  drivers/soc/tegra/pmc.c | 34 +++++++++++++++++++++++-----------
>  include/soc/tegra/pmc.h |  2 ++
>  2 files changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index a2c0ceb95f8f..7798c530ead1 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -225,17 +225,6 @@ int tegra_powergate_remove_clamping(int id)
>  		return -EINVAL;
>  
>  	/*
> -	 * The Tegra124 GPU has a separate register (with different semantics)
> -	 * to remove clamps.
> -	 */
> -	if (tegra_get_chip_id() == TEGRA124) {
> -		if (id == TEGRA_POWERGATE_3D) {
> -			tegra_pmc_writel(0, GPU_RG_CNTRL);
> -			return 0;
> -		}
> -	}
> -
> -	/*
>  	 * Tegra 2 has a bug where PCIE and VDE clamping masks are
>  	 * swapped relatively to the partition ids
>  	 */
> @@ -253,6 +242,29 @@ int tegra_powergate_remove_clamping(int id)
>  EXPORT_SYMBOL(tegra_powergate_remove_clamping);
>  
>  /**
> + * tegra_powergate_gpu_set_clamping - control GPU-SOC clamps
> + *
> + * The post-Tegra114 chips have a separate rail gating register to configure
> + * clamps.
> + *
> + * @assert: true to assert clamp, and false to remove
> + */
> +int tegra_powergate_gpu_set_clamping(bool assert)

Those functions with a bool parameter to set/unset something are really
annoying. Please avoid this pattern. The naming of the original function
is much more intuitive.

> +{
> +	if (!pmc->soc)
> +		return -EINVAL;
> +
> +	if (tegra_get_chip_id() == TEGRA124) {
> +		tegra_pmc_writel(assert ? 1 : 0, GPU_RG_CNTRL);
> +		tegra_pmc_readl(GPU_RG_CNTRL);

You are reading the register back here, which to me seems like you are
trying to make sure that the write is flushed. Why is this needed?
I also observed the need to do this while working on Tegra124 PCIe in
Barebox, otherwise the partition wouldn't power up. I didn't have time
to follow up on this yet, so it would be nice if you could explain why
this is needed, or if you don't know ask HW about it.

> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL(tegra_powergate_gpu_set_clamping);
> +
> +/**
>   * tegra_powergate_sequence_power_up() - power up partition
>   * @id: partition ID
>   * @clk: clock for partition
> diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
> index 65a93273e72f..53d620525a9e 100644
> --- a/include/soc/tegra/pmc.h
> +++ b/include/soc/tegra/pmc.h
> @@ -109,6 +109,8 @@ int tegra_powergate_is_powered(int id);
>  int tegra_powergate_power_on(int id);
>  int tegra_powergate_power_off(int id);
>  int tegra_powergate_remove_clamping(int id);
> +/* Only for Tegra124 and later */
> +int tegra_powergate_gpu_set_clamping(bool assert);
>  
>  /* Must be called with clk disabled, and returns with clk enabled */
>  int tegra_powergate_sequence_power_up(int id, struct clk *clk,
