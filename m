From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: tegra: set up wlan clocks for tegra dt
Date: Wed, 04 Jul 2012 12:43:50 +0200
Message-ID: <6135516.CD1aogiCta@fb07-iapwap2>
References: <1341394488-13169-1-git-send-email-wni@nvidia.com> <1341394488-13169-2-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1341394488-13169-2-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, 4. Juli 2012, 17:34:44 schrieb Wei Ni:
> Set up the wlan clock tree for Tegra20 and Tegra30.
> 
> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/board-dt-tegra20.c |    1 +
>  arch/arm/mach-tegra/board-dt-tegra30.c |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c
> b/arch/arm/mach-tegra/board-dt-tegra20.c index 70a19a9..fbcc7d9 100644
> --- a/arch/arm/mach-tegra/board-dt-tegra20.c
> +++ b/arch/arm/mach-tegra/board-dt-tegra20.c
> @@ -78,6 +78,7 @@ static __initdata struct tegra_clk_init_table
> tegra_dt_clk_init_table[] = { { "pll_a",      "pll_p_out1",   56448000,    
>   true },
>  	{ "pll_a_out0", "pll_a",        11289600,       true },
>  	{ "cdev1",      NULL,           0,              true },
> +	{ "blink",      "clk_32k",      32768,          true },

what's the reason to enable this on all boards? Would it make sense to set 
this to "false" instead?

Marc


>  	{ "i2s1",       "pll_a_out0",   11289600,       false},
>  	{ "i2s2",       "pll_a_out0",   11289600,       false},
>  	{ NULL,		NULL,		0,		0},
> diff --git a/arch/arm/mach-tegra/board-dt-tegra30.c
> b/arch/arm/mach-tegra/board-dt-tegra30.c index 53bf60f..2d73c61 100644
> --- a/arch/arm/mach-tegra/board-dt-tegra30.c
> +++ b/arch/arm/mach-tegra/board-dt-tegra30.c
> @@ -61,6 +61,7 @@ static __initdata struct tegra_clk_init_table
> tegra_dt_clk_init_table[] = { { "pll_a_out0",	"pll_a",	11289600,	true },
>  	{ "extern1",	"pll_a_out0",	0,		true },
>  	{ "clk_out_1",	"extern1",	0,		true },
> +	{ "blink",	"clk_32k",	32768,		true },
>  	{ "i2s0",	"pll_a_out0",	11289600,	false},
>  	{ "i2s1",	"pll_a_out0",	11289600,	false},
>  	{ "i2s2",	"pll_a_out0",	11289600,	false},
