From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 2/4] ARM: tegra: pmc: add power on function for secondary
 CPUs
Date: Wed, 27 Feb 2013 11:57:26 -0700
Message-ID: <512E5716.1050708@wwwdotorg.org>
References: <1361932087-13372-1-git-send-email-josephl@nvidia.com> <1361932087-13372-3-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361932087-13372-3-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/26/2013 07:28 PM, Joseph Lo wrote:
> Adding the power on function for secondary CPUs in PMC driver, this can
> help us to remove legacy powergate driver and add generic power domain
> support later.
> 
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
> * Don't use ISS_ERR_VALUE for checking error return code
> * the CPU power on function only available for secondary CPU which means
>   we don't care (cpuid <= 0 || cpuid >= num_possible_cpus())

s/don't care/don't support/, I think.

> diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c

> +static int tegra_pmc_powergate_set(int id, bool new_state)

> +	reg = tegra_pmc_readl(PMC_PWRGATE_STATUS);
> +
> +	old_state = (reg >> id) & 1;

You could actually replace those last to lines with:

old_state = tegra_pmc_powergate_is_powered_id();

> +static bool tegra_pmc_powergate_is_powered(int id)
> +{
> +	u32 status;
> +
> +	status = tegra_pmc_readl(PMC_PWRGATE_STATUS) & (1 << id);
> +	return !!status;

That might be simpler as:

return (tegra_pmc_readl(PMC_PWRGATE_STATUS) >> id) & 1;

(i.e. the code that's currently part of tegra_pmc_powergate_set to
calculate old_status)
