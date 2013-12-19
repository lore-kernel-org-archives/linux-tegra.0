From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: tegra: fuse: add functions to read speedo ID
 and process ID
Date: Thu, 19 Dec 2013 16:09:09 -0700
Message-ID: <52B37C95.6030904@wwwdotorg.org>
References: <20131219122857.3226.42830.stgit@tamien> <20131219123639.3226.75285.stgit@tamien>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131219123639.3226.75285.stgit@tamien>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/19/2013 05:36 AM, Paul Walmsley wrote:
> From: Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add functions to read the speedo and process id of both the CPU and the SoC.
> There might be some drivers need the information as well.

> diff --git a/arch/arm/mach-tegra/fuse.c b/arch/arm/mach-tegra/fuse.c

> +int tegra_get_cpu_process_id(void)
> +{
> +	return tegra_cpu_process_id;
> +}
> +EXPORT_SYMBOL(tegra_get_cpu_process_id);
> +
> +int tegra_get_cpu_speedo_id(void)
> +{
> +	if (tegra_chip_id == TEGRA20)
> +		return -EINVAL;
> +
> +	return tegra_cpu_speedo_id;
> +}

Olof specifically went through the code and removed such functions in
the past. He argued that consumers of this data should just read those
tegra_cpu_process_id/... variables directly instead.
