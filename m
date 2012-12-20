From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 5/5] ARM: tegra20: cpuidle: apply coupled cpuidle for
 powered-down mode
Date: Thu, 20 Dec 2012 10:54:09 -0700
Message-ID: <50D350C1.6070400@wwwdotorg.org>
References: <1355797861-12759-1-git-send-email-josephl@nvidia.com> <1355797861-12759-6-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355797861-12759-6-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/17/2012 07:31 PM, Joseph Lo wrote:
> The "powered-down" cpuidle mode of Tegra20 needs the CPU0 be the last one
> core to go into this mode before other core. The coupled cpuidle framework
> can help to sync the MPCore to coupled state then go into "powered-down"
> idle mode together. The driver can just assume the MPCore come into
> "powered-down" mode at the same time. No need to take care if the CPU_0
> goes into this mode along and only can put it into safe idle mode (WFI).
> 
> The powered-down state of Tegra20 requires power gating both CPU cores.
> When the secondary CPU requests to enter powered-down state, it saves
> its own contexts and then enters WFI for waiting CPU0 in the same state.
> When the CPU0 requests powered-down state, it attempts to put the secondary
> CPU into reset to prevent it from waking up. Then power down both CPUs
> together and power off the cpu rail.
> 
> Be aware of that, you may see the legacy power state "LP2" in the code
> which is exactly the same meaning of "CPU power down".

> diff --git a/arch/arm/mach-tegra/cpuidle-tegra20.c b/arch/arm/mach-tegra/cpuidle-tegra20.c

> +static void tegra20_wake_reset_cpu_1(void)

Nit/bikeshe: I think tegra20_wake_from_reset_cpu_1() might be a slightly
more descriptive name? I assume the function works on CPU1, which is
assumed to be in reset, and removes reset from the CPU so it boots.

> @@ -137,6 +241,9 @@ int __init tegra20_cpuidle_init(void)
>  	for_each_possible_cpu(cpu) {
>  		dev = &per_cpu(tegra_idle_device, cpu);
>  		dev->cpu = cpu;
> +#ifdef CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED
> +		dev->coupled_cpus = *cpu_online_mask;
> +#endif

That CONFIG option is selected by ARCH_TEGRA_2x_SOC, which must be
enabled for this file to be compiled. So, you can drop the ifdef, and
make the code uncondtional.
