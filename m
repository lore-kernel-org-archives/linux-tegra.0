From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [TEGRA194_CPUFREQ Patch 2/3] cpufreq: Add Tegra194 cpufreq driver
Date: Thu, 5 Dec 2019 17:15:15 +0300
Message-ID: <9b9eb84d-2d9a-8dbd-cbe6-1595ed1e7f4e@gmail.com>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <1575394348-17649-2-git-send-email-sumitg@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1575394348-17649-2-git-send-email-sumitg@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sumit Gupta <sumitg@nvidia.com>, rjw@rjwysocki.net, viresh.kumar@linaro.org, catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: bbasu@nvidia.com, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org

03.12.2019 20:32, Sumit Gupta пишет:
> Add support for CPU frequency scaling on Tegra194. The frequency
> of each core can be adjusted by writing a clock divisor value to
> an MSR on the core. The range of valid divisors is queried from
> the BPMP.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  drivers/cpufreq/Kconfig.arm        |   6 +
>  drivers/cpufreq/Makefile           |   1 +
>  drivers/cpufreq/tegra194-cpufreq.c | 423 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 430 insertions(+)
>  create mode 100644 drivers/cpufreq/tegra194-cpufreq.c
> 
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index a905796..4bcd47c 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -320,6 +320,12 @@ config ARM_TEGRA186_CPUFREQ
>  	help
>  	  This adds the CPUFreq driver support for Tegra186 SOCs.
>  
> +config ARM_TEGRA194_CPUFREQ
> +	tristate "Tegra194 CPUFreq support"
> +	depends on ARCH_TEGRA && TEGRA_BPMP
> +	help
> +	  This adds CPU frequency driver support for Tegra194 SOCs.
> +
>  config ARM_TI_CPUFREQ
>  	bool "Texas Instruments CPUFreq support"
>  	depends on ARCH_OMAP2PLUS
> diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
> index 9a9f5cc..433d492 100644
> --- a/drivers/cpufreq/Makefile
> +++ b/drivers/cpufreq/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_ARM_TANGO_CPUFREQ)		+= tango-cpufreq.o
>  obj-$(CONFIG_ARM_TEGRA20_CPUFREQ)	+= tegra20-cpufreq.o
>  obj-$(CONFIG_ARM_TEGRA124_CPUFREQ)	+= tegra124-cpufreq.o
>  obj-$(CONFIG_ARM_TEGRA186_CPUFREQ)	+= tegra186-cpufreq.o
> +obj-$(CONFIG_ARM_TEGRA194_CPUFREQ)	+= tegra194-cpufreq.o
>  obj-$(CONFIG_ARM_TI_CPUFREQ)		+= ti-cpufreq.o
>  obj-$(CONFIG_ARM_VEXPRESS_SPC_CPUFREQ)	+= vexpress-spc-cpufreq.o
>  
> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> new file mode 100644
> index 0000000..9df12f4
> --- /dev/null
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
> @@ -0,0 +1,423 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved
> + */
> +
> +#include <linux/cpu.h>
> +#include <linux/cpufreq.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include <asm/smp_plat.h>
> +
> +#include <soc/tegra/bpmp.h>
> +#include <soc/tegra/bpmp-abi.h>
> +
> +#define KHZ                     1000
> +#define REF_CLK_MHZ             408 /* 408 MHz */
> +#define US_DELAY                2000
> +#define US_DELAY_MIN            2
> +#define CPUFREQ_TBL_STEP_HZ     (50 * KHZ * KHZ)
> +#define MAX_CNT                 ~0U
> +
> +/* cpufreq transisition latency */
> +#define TEGRA_CPUFREQ_TRANSITION_LATENCY (300 * 1000) /* unit in nanoseconds */
> +
> +enum cluster {
> +	CLUSTER0,
> +	CLUSTER1,
> +	CLUSTER2,
> +	CLUSTER3,
> +	MAX_CLUSTERS,
> +};
> +
> +struct tegra194_cpufreq_data {
> +	void __iomem *regs;
> +	size_t num_clusters;
> +	struct cpufreq_frequency_table **tables;
> +};
> +
> +static DEFINE_MUTEX(cpufreq_lock);
> +
> +struct tegra_cpu_ctr {
> +	u32 cpu;
> +	u32 delay;
> +	u32 coreclk_cnt, last_coreclk_cnt;
> +	u32 refclk_cnt, last_refclk_cnt;
> +};
> +
> +static struct workqueue_struct *read_counters_wq;
> +struct read_counters_work {
> +	struct work_struct work;
> +	struct tegra_cpu_ctr c;
> +};
> +
> +static enum cluster get_cpu_cluster(u8 cpu)
> +{
> +	return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 1);
> +}
> +
> +/*
> + * Read per-core Read-only system register NVFREQ_FEEDBACK_EL1.
> + * The register provides frequency feedback information to
> + * determine the average actual frequency a core has run at over
> + * a period of time.
> + *	[31:0] PLLP counter: Counts at fixed frequency (408 MHz)
> + *	[63:32] Core clock counter: counts on every core clock cycle
> + *			where the core is architecturally clocking
> + */
> +static u64 read_freq_feedback(void)
> +{
> +	u64 val = 0;
> +
> +	asm volatile("mrs %0, s3_0_c15_c0_5" : "=r" (val) : );
> +
> +	return val;
> +}
> +
> +u16 map_freq_to_ndiv(struct mrq_cpu_ndiv_limits_response *nltbl, u32 freq)
> +{
> +	return DIV_ROUND_UP(freq * nltbl->pdiv * nltbl->mdiv,
> +			    nltbl->ref_clk_hz / KHZ);
> +}
> +
> +static inline u32 map_ndiv_to_freq(struct mrq_cpu_ndiv_limits_response
> +				   *nltbl, u16 ndiv)
> +{
> +	return nltbl->ref_clk_hz / KHZ * ndiv / (nltbl->pdiv * nltbl->mdiv);
> +}
> +
> +static void tegra_read_counters(struct work_struct *work)
> +{
> +	struct read_counters_work *read_counters_work;
> +	struct tegra_cpu_ctr *c;
> +	u64 val;
> +
> +	/*
> +	 * ref_clk_counter(32 bit counter) runs on constant clk,
> +	 * pll_p(408MHz).
> +	 * It will take = 2 ^ 32 / 408 MHz to overflow ref clk counter
> +	 *              = 10526880 usec = 10.527 sec to overflow
> +	 *
> +	 * Like wise core_clk_counter(32 bit counter) runs on core clock.
> +	 * It's synchronized to crab_clk (cpu_crab_clk) which runs at
> +	 * freq of cluster. Assuming max cluster clock ~2000MHz,
> +	 * It will take = 2 ^ 32 / 2000 MHz to overflow core clk counter
> +	 *              = ~2.147 sec to overflow
> +	 */
> +	read_counters_work = container_of(work, struct read_counters_work,
> +					  work);
> +	c = &read_counters_work->c;
> +
> +	val = read_freq_feedback();
> +	c->last_refclk_cnt = lower_32_bits(val);
> +	c->last_coreclk_cnt = upper_32_bits(val);
> +	udelay(c->delay);
> +	val = read_freq_feedback();
> +	c->refclk_cnt = lower_32_bits(val);
> +	c->coreclk_cnt = upper_32_bits(val);
> +}
> +
> +/*
> + * Return instantaneous cpu speed
> + * Instantaneous freq is calculated as -
> + * -Takes sample on every query of getting the freq.
> + *	- Read core and ref clock counters;
> + *	- Delay for X us
> + *	- Read above cycle counters again
> + *	- Calculates freq by subtracting current and previous counters
> + *	  divided by the delay time or eqv. of ref_clk_counter in delta time
> + *	- Return Kcycles/second, freq in KHz
> + *
> + *	delta time period = x sec
> + *			  = delta ref_clk_counter / (408 * 10^6) sec
> + *	freq in Hz = cycles/sec
> + *		   = (delta cycles / x sec
> + *		   = (delta cycles * 408 * 10^6) / delta ref_clk_counter
> + *	in KHz	   = (delta cycles * 408 * 10^3) / delta ref_clk_counter
> + *
> + * @cpu - logical cpu whose freq to be updated
> + * Returns freq in KHz on success, 0 if cpu is offline
> + */
> +static unsigned int tegra194_get_speed_common(u32 cpu, u32 delay)
> +{
> +	struct read_counters_work read_counters_work;
> +	struct tegra_cpu_ctr c;
> +	u32 delta_refcnt;
> +	u32 delta_ccnt;
> +	u32 rate_mhz;
> +
> +	read_counters_work.c.cpu = cpu;
> +	read_counters_work.c.delay = delay;
> +	INIT_WORK_ONSTACK(&read_counters_work.work, tegra_read_counters);
> +	queue_work_on(cpu, read_counters_wq, &read_counters_work.work);
> +	flush_work(&read_counters_work.work);

What will happen if CPU is offline?
