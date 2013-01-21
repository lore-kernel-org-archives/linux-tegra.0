From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [v3 3/9] ARM: tegra: Use DT /cpu node to detect number of CPU
 core
Date: Mon, 21 Jan 2013 12:35:58 +0000
Message-ID: <20130121123558.GA27211@e102568-lin.cambridge.arm.com>
References: <1358237598-32413-1-git-send-email-hdoyu@nvidia.com>
 <1358237598-32413-4-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358237598-32413-4-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 15, 2013 at 08:13:12AM +0000, Hiroshi Doyu wrote:
> SCU based detection only works with Cortex-A9 MP and it doesn't
> support ones with multiple clusters. The only way to detect number of
> CPU core correctly is with DT /cpu node.
> 
> Tegra SoCs decided to use DT detection as the only way and to not use
> SCU based detection at all. Even if DT /cpu node based detection
> fails, it continues with a single core

Please add missing punctuation, reword the commit log to make it clearer.
> 
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Based on the discussion:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/140608.html
> 
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/platsmp.c |   15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/platsmp.c
> index 6867030..689ee4b 100644
> --- a/arch/arm/mach-tegra/platsmp.c
> +++ b/arch/arm/mach-tegra/platsmp.c
> @@ -177,23 +177,8 @@ done:
>  	return status;
>  }
>  
> -/*
> - * Initialise the CPU possible map early - this describes the CPUs
> - * which may be present or become present in the system.
> - */
>  static void __init tegra_smp_init_cpus(void)
>  {
> -	unsigned int i, ncores = scu_get_core_count(scu_base);
> -
> -	if (ncores > nr_cpu_ids) {
> -		pr_warn("SMP: %u cores greater than maximum (%u), clipping\n",
> -			ncores, nr_cpu_ids);
> -		ncores = nr_cpu_ids;
> -	}
> -
> -	for (i = 0; i < ncores; i++)
> -		set_cpu_possible(i, true);
> -
>  	set_smp_cross_call(gic_raise_softirq);
>  }
>  

As discussed,

Reviewed-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
