From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add cpu_disable for hotplug
Date: Tue, 21 May 2013 10:15:48 -0600
Message-ID: <519B9DB4.7070106@wwwdotorg.org>
References: <1369131215-2920-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369131215-2920-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/21/2013 04:13 AM, Joseph Lo wrote:
> The Tegra114 could hotplug the CPU0, but the common cpu_disable didn't
> support that. Adding a Tegra specific cpu_disable function for it.
> 
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> diff --git a/arch/arm/mach-tegra/hotplug.c b/arch/arm/mach-tegra/hotplug.c

> +int tegra_cpu_disable(unsigned int cpu)
> +{
> +	switch (tegra_chip_id) {
> +	case TEGRA114:
> +		return 0;
> +	default:
> +		return cpu == 0 ? -EPERM : 0;
> +	}
> +}

Do we expect all/most future chips to support hotplug of CPU0? Or at
least, fewer chips to have the restriction than not? If so, it might be
more forward-looking to write that as:

if (tegra_chip_id == TEGRA30)
    return cpu == 0 ? -EPERM : 0;

return 0;

?
