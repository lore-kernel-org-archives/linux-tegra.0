From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 3/3] ARM: tegra: moving the CPU power timer function
 to PMC driver
Date: Tue, 02 Apr 2013 13:37:58 -0600
Message-ID: <515B3396.4080206@wwwdotorg.org>
References: <1364901583-24867-1-git-send-email-josephl@nvidia.com> <1364901583-24867-4-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364901583-24867-4-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/02/2013 05:19 AM, Joseph Lo wrote:
> The CPU power timer set up fucntion was related to PMC register. Now moving
> it to PMC driver. And it also help to clean up the PM related code later.

> diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c

> +void set_power_timers(unsigned long us_on, unsigned long us_off)

> +	rate = clk_get_rate(tegra_pclk);
> +
> +	if (WARN_ON_ONCE(rate <= 0))

Nit: Since you need to repost the series anyway, I'd prefer to remove
that extra blank line between the assignment to rate, and the if statement.
