From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 8/8] ARM: tegra: Add firmware calls required for
 suspend-resume
Date: Fri, 22 Feb 2019 21:26:22 +0300
Message-ID: <1b58a7f4-8ad0-9b5a-4ca7-b01b3c47425f@gmail.com>
References: <20190222175926.23366-1-digetx@gmail.com>
 <20190222175926.23366-9-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222175926.23366-9-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robert Yang <decatf@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

22.02.2019 20:59, Dmitry Osipenko пишет:
> In order to resume CPU from suspend via trusted Foundations firmware,
> the LP1/LP2 boot vectors and CPU caches need to be set up using the
> firmware calls.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/mach-tegra/pm.c            | 53 ++++++++++++++++++-----------
>  arch/arm/mach-tegra/reset-handler.S | 26 ++++++++++++++
>  arch/arm/mach-tegra/sleep.S         |  3 +-
>  3 files changed, 61 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
> index 66c8cd63dd86..f209f59e0daf 100644
> --- a/arch/arm/mach-tegra/pm.c
> +++ b/arch/arm/mach-tegra/pm.c
> @@ -33,6 +33,7 @@
>  #include <soc/tegra/pmc.h>
>  
>  #include <asm/cacheflush.h>
> +#include <asm/firmware.h>
>  #include <asm/idmap.h>
>  #include <asm/proc-fns.h>
>  #include <asm/smp_plat.h>
> @@ -160,6 +161,28 @@ int tegra_cpu_do_idle(void)
>  
>  static int tegra_sleep_cpu(unsigned long v2p)
>  {
> +	/*
> +	 * L2 cache disabling using kernel API only allowed when all
> +	 * secondary CPU's are offline. Cache have to be disabled with
> +	 * MMU-on if cache maintenance is done via Trusted Foundations
> +	 * firmware. Note that CPUIDLE won't ever enter powergate on Tegra30
> +	 * if any of secondary CPU's is online and this is the LP2-idle
> +	 * code-path only for Tegra20/30.
> +	 */
> +	if (trusted_foundations_registered())
> +		outer_disable();
> +
> +	/*
> +	 * Note that besides of setting up CPU reset vector this firmware
> +	 * call may also do the following, depending on the FW version:
> +	 * 	1) Disable L2. But this doesn't matter since we already
> +	 * 	   disabled the L2.
> +	 *	2) Disable D-cache. This need to be taken into account in
> +	 *	   particular by the tegra_disable_clean_inv_dcache() which
> +	 *	   shall avoid the re-disable.
> +	 */
> +	call_firmware_op(prepare_idle, TF_PM_MODE_LP2);
> +
>  	setup_mm_for_reboot();
>  	tegra_sleep_cpu_finish(v2p);
>  
> @@ -196,24 +219,13 @@ void tegra_idle_lp2_last(void)
>  	cpu_cluster_pm_enter();
>  	suspend_cpu_complex();
>  
> -	/*
> -	 * L2 cache disabling using kernel API only allowed when all
> -	 * secondary CPU's are offline. Cache have to be disabled early
> -	 * if cache maintenance is done via Trusted Foundations firmware.
> -	 * Note that CPUIDLE won't ever enter powergate on Tegra30 if any
> -	 * of secondary CPU's is online and this is the LP2 codepath only
> -	 * for Tegra20/30.
> -	 */
> -	if (trusted_foundations_registered())
> -		outer_disable();
> -
>  	cpu_suspend(PHYS_OFFSET - PAGE_OFFSET, &tegra_sleep_cpu);
>  
>  	/*
>  	 * Resume L2 cache if it wasn't re-enabled early during resume,
>  	 * which is the case for Tegra30 that has to re-enable the cache
>  	 * via firmware call. In other cases cache is already enabled and
> -	 * hence re-enabling is a no-op.
> +	 * hence re-enabling is a no-op. This is always a no-op on Tegra114+.
>  	 */
>  	outer_resume();
>  
> @@ -235,6 +247,15 @@ enum tegra_suspend_mode tegra_pm_validate_suspend_mode(
>  
>  static int tegra_sleep_core(unsigned long v2p)
>  {
> +	/*
> +	 * Cache have to be disabled with MMU-on if cache maintenance is done
> +	 * via Trusted Foundations firmware. This is a no-op on Tegra114+.
> +	 */
> +	if (trusted_foundations_registered())
> +		outer_disable();
> +
> +	call_firmware_op(prepare_idle, TF_PM_MODE_LP1);
> +
>  	setup_mm_for_reboot();
>  	tegra_sleep_core_finish(v2p);
>  
> @@ -360,14 +381,6 @@ static int tegra_suspend_enter(suspend_state_t state)
>  		break;
>  	}
>  
> -	/*
> -	 * Cache have to be disabled early if cache maintenance is done
> -	 * via Trusted Foundations firmware. Otherwise this is a no-op,
> -	 * like on Tegra114+.
> -	 */
> -	if (trusted_foundations_registered())
> -		outer_disable();
> -
>  	cpu_suspend(PHYS_OFFSET - PAGE_OFFSET, tegra_sleep_func);

Seems I messed up the rebasing a tad. Will send another version.
