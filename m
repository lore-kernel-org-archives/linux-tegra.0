From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/9] clocksource: tegra: Enable ARM arch_timer with TSC
Date: Thu, 20 Dec 2012 11:01:15 +0000
Message-ID: <50D2EFFB.8030702@arm.com>
References: <1355996654-6579-1-git-send-email-hdoyu@nvidia.com> <1355996654-6579-6-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355996654-6579-6-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 20/12/12 09:44, Hiroshi Doyu wrote:
> Add platform enabler for ARM arch_timer(TSC). TSC is more fine grained
> timer than TMR0. If it's available, it will be used for clock source
> and sched_clock. Otherwise, TMR0 is used. In any case TMR0 is
> necessary for clock event.
> 
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/arm/tegra/nvidia,tegra114-tsc.txt     |   11 ++++
>  drivers/clocksource/tegra20_timer.c                |   64 +++++++++++++++++++-
>  2 files changed, 74 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra114-tsc.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra114-tsc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra114-tsc.txt
> new file mode 100644
> index 0000000..9de936a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra114-tsc.txt
> @@ -0,0 +1,11 @@
> +NVIDIA Tegra Timer Stamp Counter(TSC)
> +
> +Required properties:
> +- compatible : "nvidia,tegra114-tsc
> +- reg : Should contain 1 register ranges(address and length)
> +
> +Example:
> +	tsc {
> +		compatible = "nvidia,tegra114-tsc";
> +		reg = <0x700f0000 0x20000>;
> +	};
> diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
> index 1d25de8..285a6f1 100644
> --- a/drivers/clocksource/tegra20_timer.c
> +++ b/drivers/clocksource/tegra20_timer.c
> @@ -30,6 +30,7 @@
>  #include <asm/mach/time.h>
>  #include <asm/smp_twd.h>
>  #include <asm/sched_clock.h>
> +#include <asm/arch_timer.h>
>  
>  #define RTC_SECONDS            0x08
>  #define RTC_SHADOW_SECONDS     0x0c
> @@ -271,10 +272,71 @@ static void __init tegra20_init_tmr(void)
>  	clockevents_register_device(&tegra_clockevent);
>  }
>  
> +#define TSC_CNTCR		0		/* TSC control registers */
> +#define TSC_CNTCR_ENABLE	(1 << 0)	/* Enable */
> +#define TSC_CNTCR_HDBG		(1 << 1)	/* Halt on debug */
> +
> +#define TSC_CNTCV0		0x8		/* TSC counter (LSW) */
> +#define TSC_CNTCV1		0xc		/* TSC counter (MSW) */
> +#define TSC_CNTFID0		0x20		/* TSC freq id 0 */
> +
> +static const struct of_device_id tegra_tsc_match[] __initconst = {
> +	{ .compatible = "nvidia,tegra114-tsc" },
> +	{}
> +};
> +
> +static int tegra_arch_timer_init(void)
> +{
> +	int err;
> +	struct device_node *np;
> +	struct clk *clk;
> +	void __iomem *tsc_base;
> +	u32 freq, val;
> +
> +	np = of_find_matching_node(NULL, tegra_tsc_match);
> +	if (!np)
> +		return -ENODEV;
> +
> +	tsc_base = of_iomap(np, 0);
> +	if (!tsc_base)
> +		return -ENODEV;
> +
> +	clk = clk_get_sys("clk_m", NULL);
> +	if (IS_ERR(clk)) {
> +		freq = 12000000;
> +		pr_warn("Unable to get timer clock. Assuming 12Mhz input clock.\n");
> +	} else {
> +		freq = clk_get_rate(clk);
> +		clk_put(clk);
> +	}
> +	writel_relaxed(freq, tsc_base + TSC_CNTFID0);
> +
> +	/* CNTFRQ */
> +	asm("mcr p15, 0, %0, c14, c0, 0\n" : : "r" (freq));
> +	asm("mrc p15, 0, %0, c14, c0, 0\n" : "=r" (val));
> +	BUG_ON(val != freq);

This is scary. CNTFRQ is only writable from secure mode, and will
explode in any other situation.

Also, writing to CNTFRQ doesn't change the timer frequency! This is just
a way for secure mode to tell the rest of the world the frequency the
timer is ticking at. Unless you've wired the input clock to be able to
change the frequency?

	M.
-- 
Jazz is not dead. It just smells funny...
