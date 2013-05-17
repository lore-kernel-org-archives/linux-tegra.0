From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Use common of_clk_init() function
Date: Fri, 17 May 2013 16:54:49 -0600
Message-ID: <5196B539.4040708@wwwdotorg.org>
References: <1365066351-2395-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365066351-2395-1-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/04/2013 03:05 AM, Prashant Gaikwad wrote:
> Use common of_clk_init() function for clocks initialization.

Prashant, can you please resend this to Mike for inclusion in 3.11; now
that we have moved the Tegra clock driver out of arch/arm/mach-tegra, we
should send all clock driver changes through Mike if possible. Thanks.

Just one question though:

> diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c

> -#include <linux/clk/tegra.h>
> +#include <linux/clk-provider.h>

Is clk-provider.h the right header? This code isn't a clock provider?
