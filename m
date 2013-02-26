From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: pmc: add specific compatible DT string
 for Tegra30 and Tegra114
Date: Tue, 26 Feb 2013 09:29:26 -0700
Message-ID: <512CE2E6.5020904@wwwdotorg.org>
References: <1361872727-4388-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361872727-4388-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/26/2013 02:58 AM, Joseph Lo wrote:
> The PMC HW dose not 100% compatible across all Tegra series. We need to
> specify each of them in the DT match table.

> diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c

>  static const struct of_device_id matches[] __initconst = {
>  	{ .compatible = "nvidia,tegra20-pmc" },
> +	{ .compatible = "nvidia,tegra30-pmc" },
> +	{ .compatible = "nvidia,tegra114-pmc" },
>  	{ }
>  };

Those should be listed in order of most recent device through least
recent device, i.e. in the opposite order.
