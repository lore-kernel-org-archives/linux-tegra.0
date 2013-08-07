From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/5] clk: tegra: Add reset only clock node flag and COP
Date: Wed, 07 Aug 2013 10:58:03 -0600
Message-ID: <52027C9B.2030009@wwwdotorg.org>
References: <1375874709-10438-1-git-send-email-markz@nvidia.com> <1375874709-10438-2-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375874709-10438-2-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/07/2013 05:25 AM, Mark Zhang wrote:
> From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> COP is a reset only clock. So this patch adds NO_CLK support
> then adds the COP clock.

Do we actually need this clock upstream yet?

IIRC, Prashant was working on implementing the common reset API, so I'd
prefer not to add any reset-only "clocks" to the clock driver, but
rather to simply make sure that the new reset driver exposes them.

> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c

>  enum tegra114_clk {
> -	rtc = 4, timer = 5, uarta = 6, sdmmc2 = 9, i2s1 = 11, i2c1 = 12,
> +	cop = 1, rtc = 4, timer = 5, uarta = 6, sdmmc2 = 9, i2s1 = 11, i2c1 = 12,

To make this change, you would also need to edit
include/dt-bindings/clock/tegra114-car.h. BTW, why doesn't the Tegra
clock driver include that file rather than defining its own enum?
