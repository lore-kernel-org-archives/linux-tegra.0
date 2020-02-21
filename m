From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 04/17] ARM: tegra: Change tegra_set_cpu_in_lp2() type
 to void
Date: Fri, 21 Feb 2020 16:04:50 +0100
Message-ID: <20200221150450.GI10516@linaro.org>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200212235134.12638-5-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 13, 2020 at 02:51:21AM +0300, Dmitry Osipenko wrote:
> The Tegra30 CPUIDLE driver has intention to check whether primary CPU was
> the last CPU that entered LP2 (CC6) idle-state, but that functionality
> never got utilized because driver never supported the CC6 state for the
> case where any secondary CPU is online. The new cpuidle driver will
> properly support CC6 on Tegra30, including the case where secondary CPUs
> are online, and that knowledge about what CPUs entered into CC6 won't be
> needed at all because new driver will use different approach by making use
> of the coupled idle-state and explicitly parking secondary CPUs before
> entering into CC6. Thus this patch is just a minor cleanup change.
> 
> Acked-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: David Heidelberg <david-W22tF5X+A20@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mach-tegra/cpuidle-tegra30.c | 14 ++++----------

Mind to move to drivers/cpuidle ?

Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>  arch/arm/mach-tegra/pm.c              |  8 +-------
>  arch/arm/mach-tegra/pm.h              |  2 +-
>  3 files changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/cpuidle-tegra30.c b/arch/arm/mach-tegra/cpuidle-tegra30.c
> index c6128526877d..a3ce8dabfe18 100644
> --- a/arch/arm/mach-tegra/cpuidle-tegra30.c
> +++ b/arch/arm/mach-tegra/cpuidle-tegra30.c
> @@ -98,22 +98,16 @@ static int tegra30_idle_lp2(struct cpuidle_device *dev,
>  			    int index)
>  {
>  	bool entered_lp2 = false;
> -	bool last_cpu;
>  
>  	local_fiq_disable();
>  
> -	last_cpu = tegra_set_cpu_in_lp2();
> +	tegra_set_cpu_in_lp2();
>  	cpu_pm_enter();
>  
> -	if (dev->cpu == 0) {
> -		if (last_cpu)
> -			entered_lp2 = tegra30_cpu_cluster_power_down(dev, drv,
> -								     index);
> -		else
> -			cpu_do_idle();
> -	} else {
> +	if (dev->cpu == 0)
> +		entered_lp2 = tegra30_cpu_cluster_power_down(dev, drv, index);
> +	else
>  		entered_lp2 = tegra30_cpu_core_power_down(dev, drv, index);
> -	}
>  
>  	cpu_pm_exit();
>  	tegra_clear_cpu_in_lp2();
> diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
> index 1ff499068bb1..a72f9a2d3cb7 100644
> --- a/arch/arm/mach-tegra/pm.c
> +++ b/arch/arm/mach-tegra/pm.c
> @@ -123,11 +123,9 @@ void tegra_clear_cpu_in_lp2(void)
>  	spin_unlock(&tegra_lp2_lock);
>  }
>  
> -bool tegra_set_cpu_in_lp2(void)
> +void tegra_set_cpu_in_lp2(void)
>  {
>  	int phy_cpu_id = cpu_logical_map(smp_processor_id());
> -	bool last_cpu = false;
> -	cpumask_t *cpu_lp2_mask = tegra_cpu_lp2_mask;
>  	u32 *cpu_in_lp2 = tegra_cpu_lp2_mask;
>  
>  	spin_lock(&tegra_lp2_lock);
> @@ -135,11 +133,7 @@ bool tegra_set_cpu_in_lp2(void)
>  	BUG_ON((*cpu_in_lp2 & BIT(phy_cpu_id)));
>  	*cpu_in_lp2 |= BIT(phy_cpu_id);
>  
> -	if ((phy_cpu_id == 0) && cpumask_equal(cpu_lp2_mask, cpu_online_mask))
> -		last_cpu = true;
> -
>  	spin_unlock(&tegra_lp2_lock);
> -	return last_cpu;
>  }
>  
>  static int tegra_sleep_cpu(unsigned long v2p)
> diff --git a/arch/arm/mach-tegra/pm.h b/arch/arm/mach-tegra/pm.h
> index b9cc12222bb1..2c294f6365c0 100644
> --- a/arch/arm/mach-tegra/pm.h
> +++ b/arch/arm/mach-tegra/pm.h
> @@ -24,7 +24,7 @@ void tegra30_lp1_iram_hook(void);
>  void tegra30_sleep_core_init(void);
>  
>  void tegra_clear_cpu_in_lp2(void);
> -bool tegra_set_cpu_in_lp2(void);
> +void tegra_set_cpu_in_lp2(void);
>  void tegra_idle_lp2_last(void);
>  extern void (*tegra_tear_down_cpu)(void);
>  
> -- 
> 2.24.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
