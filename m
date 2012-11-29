From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: remove unused functions in mach/clk.h
Date: Thu, 29 Nov 2012 11:50:29 +0530
Message-ID: <50B6FEAD.9070401@nvidia.com>
References: <1353999553-5196-1-git-send-email-sivaramn@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353999553-5196-1-git-send-email-sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 27 November 2012 12:29 PM, Sivaram Nair wrote:
> This is a cleaning up patch that removes couple of functions in
> mach/clk.h that are no longer used and does not have any body.
>
> Signed-off-by: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   arch/arm/mach-tegra/include/mach/clk.h |    5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/include/mach/clk.h b/arch/arm/mach-tegra/include/mach/clk.h
> index 95f3a54..64d2657 100644
> --- a/arch/arm/mach-tegra/include/mach/clk.h
> +++ b/arch/arm/mach-tegra/include/mach/clk.h
> @@ -34,11 +34,6 @@ enum tegra_clk_ex_param {
>   void tegra_periph_reset_deassert(struct clk *c);
>   void tegra_periph_reset_assert(struct clk *c);
>   
> -#ifndef CONFIG_COMMON_CLK
> -unsigned long clk_get_rate_all_locked(struct clk *c);
> -#endif
> -
> -void tegra2_sdmmc_tap_delay(struct clk *c, int delay);
>   int tegra_clk_cfg_ex(struct clk *c, enum tegra_clk_ex_param p, u32 setting);
>   
>   #endif

Reviewed-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
