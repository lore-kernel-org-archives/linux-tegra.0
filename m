From: Prashant G <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: tegra: Port tegra to generic clock framework
Date: Thu, 28 Jun 2012 22:59:49 +0530
Message-ID: <4FEC948D.9080606@nvidia.com>
References: <1340879846-12900-1-git-send-email-pgaikwad@nvidia.com> <1340879846-12900-6-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340879846-12900-6-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "mturquette-l0cyMroinI0@public.gmane.org" <mturquette-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch is not delivered to all mailing lists reason being the 
message body too big.
It can be viewed at https://lkml.org/lkml/2012/6/28/158

Thanks & Regards,
Prashant G

On Thursday 28 June 2012 04:07 PM, Prashant Gaikwad wrote:
> This patch converts tegra clock code to generic clock framework in following way:
>   - Implement clk_ops as required by generic clk framework. (tegraXX_clocks.c)
>   - Use platform specific struct clk_tegra in clk_ops implementation instead of struct clk.
>   - Initialize all clock data statically. (tegraXX_clocks_data.c)
>
> Legacy framework did not have recalc_rate and is_enabled functions. Implemented these functions.
> Removed init function. It's functionality is splitted into recalc_rate and is_enabled.
>
> Static initialization is used since slab is not up in .init_early and clock
> is needed to be initialized before clockevent/clocksource initialization.
> Macros redefined for clk_tegra.
>
> Also, single struct clk_tegra is used for all type of clocks (PLL, peripheral etc.). This
> is to move quickly to generic common clock framework so that other dependent features will
> not be blocked (such as DT binding).
>
> Enabling COMMON_CLOCK config moved to ARCH_TEGRA since it is enabled for both Tegra20
> and Tegra30.
>
> Signed-off-by: Prashant Gaikwad<pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   arch/arm/Kconfig                          |    1 +
>   arch/arm/mach-tegra/clock.h               |    1 +
>   arch/arm/mach-tegra/tegra20_clocks.c      |  986 +++++++++--------
>   arch/arm/mach-tegra/tegra20_clocks.h      |    4 +
>   arch/arm/mach-tegra/tegra20_clocks_data.c | 1318 +++++++++++++----------
>   arch/arm/mach-tegra/tegra30_clocks.c      | 1331 +++++++++++++----------
>   arch/arm/mach-tegra/tegra30_clocks.h      |   14 +-
>   arch/arm/mach-tegra/tegra30_clocks_data.c | 1688 ++++++++++++++++-------------
>   8 files changed, 3029 insertions(+), 2314 deletions(-)
>
>
