From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V6 2/7] clocksource: tegra: add Tegra210 timer support
Date: Fri, 15 Feb 2019 16:14:10 +0100
Message-ID: <3849a41f-ab36-d7e0-b2ce-1aa5c4e34aec@linaro.org>
References: <20190201161654.18315-1-josephl@nvidia.com>
 <20190201161654.18315-3-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201161654.18315-3-josephl@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 01/02/2019 17:16, Joseph Lo wrote:
> Add support for the Tegra210 timer that runs at oscillator clock
> (TMR10-TMR13). We need these timers to work as clock event device and to
> replace the ARMv8 architected timer due to it can't survive across the
> power cycle of the CPU core or CPUPORESET signal. So it can't be a wake-up
> source when CPU suspends in power down state.
> 
> Also convert the original driver to use timer-of API.
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> v6:
>  * refine the timer defines
>  * add ack tag from Jon.
> v5:
>  * add ack tag from Thierry
> v4:
>  * merge timer-tegra210.c in previous version into timer-tegra20.c
> v3:
>  * use timer-of API
> v2:
>  * add error clean-up code
> ---
>  drivers/clocksource/Kconfig         |   2 +-
>  drivers/clocksource/timer-tegra20.c | 371 ++++++++++++++++++++--------
>  include/linux/cpuhotplug.h          |   1 +
>  3 files changed, 270 insertions(+), 104 deletions(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index a9e26f6a81a1..6af78534a285 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -131,7 +131,7 @@ config SUN5I_HSTIMER
>  config TEGRA_TIMER
>  	bool "Tegra timer driver" if COMPILE_TEST
>  	select CLKSRC_MMIO
> -	depends on ARM

This will break because the delay functions are defined in
arch/arm/include/asm/delay.h and the 01.org will try to compile the
driver on x86.

You may want to add 'depends on ARM && ARM64'

> +	select TIMER_OF
>  	help
>  	  Enables support for the Tegra driver.
>  
> diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra20.c
> index 4293943f4e2b..f66edd63d7f4 100644
> --- a/drivers/clocksource/timer-tegra20.c
> +++ b/drivers/clocksource/timer-tegra20.c
> @@ -15,21 +15,24 @@
>   *
>   */
>  
> -#include <linux/init.h>
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
> -#include <linux/time.h>
>  #include <linux/interrupt.h>
> -#include <linux/irq.h>
> -#include <linux/clockchips.h>
> -#include <linux/clocksource.h>
> -#include <linux/clk.h>
> -#include <linux/io.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> -#include <linux/sched_clock.h>
> -#include <linux/delay.h>
> +#include <linux/percpu.h>
> +#include <linux/syscore_ops.h>
> +#include <linux/time.h>
> +
> +#include "timer-of.h"
>  
> +#ifdef CONFIG_ARM
>  #include <asm/mach/time.h>
> +#endif
>  
>  #define RTC_SECONDS            0x08
>  #define RTC_SHADOW_SECONDS     0x0c
> @@ -39,74 +42,145 @@
>  #define TIMERUS_USEC_CFG 0x14
>  #define TIMERUS_CNTR_FREEZE 0x4c
>  
> -#define TIMER1_BASE 0x0
> -#define TIMER2_BASE 0x8
> -#define TIMER3_BASE 0x50
> -#define TIMER4_BASE 0x58
> -
> -#define TIMER_PTV 0x0
> -#define TIMER_PCR 0x4
> -
> +#define TIMER_PTV		0x0
> +#define TIMER_PTV_EN		BIT(31)
> +#define TIMER_PTV_PER		BIT(30)
> +#define TIMER_PCR		0x4
> +#define TIMER_PCR_INTR_CLR	BIT(30)
> +
> +#ifdef CONFIG_ARM
> +#define TIMER_CPU0		0x50 /* TIMER3 */
> +#else
> +#define TIMER_CPU0		0x90 /* TIMER10 */
> +#define TIMER10_IRQ_IDX		10
> +#define IRQ_IDX_FOR_CPU(cpu)	(TIMER10_IRQ_IDX + cpu)
> +#endif
> +#define TIMER_BASE_FOR_CPU(cpu) (TIMER_CPU0 + (cpu) * 8)
> +
> +static u32 usec_config;
>  static void __iomem *timer_reg_base;
> +#ifdef CONFIG_ARM
>  static void __iomem *rtc_base;
> -
>  static struct timespec64 persistent_ts;
>  static u64 persistent_ms, last_persistent_ms;

Did you check the above changes are still relevant after commit
39232ed5a1793f67 and after doing a change similar to
commit 1569557549697207e523 ?


>  static struct delay_timer tegra_delay_timer;
> -
> -#define timer_writel(value, reg) \
> -	writel_relaxed(value, timer_reg_base + (reg))
> -#define timer_readl(reg) \
> -	readl_relaxed(timer_reg_base + (reg))
> +#endif
>  
>  static int tegra_timer_set_next_event(unsigned long cycles,
>  					 struct clock_event_device *evt)
>  {
> -	u32 reg;
> +	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
>  
> -	reg = 0x80000000 | ((cycles > 1) ? (cycles-1) : 0);
> -	timer_writel(reg, TIMER3_BASE + TIMER_PTV);
> +	writel(TIMER_PTV_EN |
> +	       ((cycles > 1) ? (cycles - 1) : 0), /* n+1 scheme */
> +	       reg_base + TIMER_PTV);
>  
>  	return 0;
>  }
>  
> -static inline void timer_shutdown(struct clock_event_device *evt)
> +static int tegra_timer_shutdown(struct clock_event_device *evt)
>  {
> -	timer_writel(0, TIMER3_BASE + TIMER_PTV);
> +	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
> +
> +	writel(0, reg_base + TIMER_PTV);
> +
> +	return 0;
>  }
>  
> -static int tegra_timer_shutdown(struct clock_event_device *evt)
> +static int tegra_timer_set_periodic(struct clock_event_device *evt)
>  {
> -	timer_shutdown(evt);
> +	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
> +
> +	writel(TIMER_PTV_EN | TIMER_PTV_PER |
> +	       ((timer_of_rate(to_timer_of(evt)) / HZ) - 1),
> +	       reg_base + TIMER_PTV);
> +
>  	return 0;
>  }
>  
> -static int tegra_timer_set_periodic(struct clock_event_device *evt)
> +static irqreturn_t tegra_timer_isr(int irq, void *dev_id)
>  {
> -	u32 reg = 0xC0000000 | ((1000000 / HZ) - 1);
> +	struct clock_event_device *evt = (struct clock_event_device *)dev_id;
> +	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
> +
> +	writel(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
> +	evt->event_handler(evt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +#ifdef CONFIG_ARM64
> +static DEFINE_PER_CPU(struct timer_of, tegra_to) = {
> +	.flags = TIMER_OF_CLOCK | TIMER_OF_BASE,
> +
> +	.clkevt = {
> +		.name = "tegra_timer",
> +		.rating = 460,
> +		.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,

			CLOCK_EVT_FEAT_DYNIRQ ?

> +		.set_next_event = tegra_timer_set_next_event,
> +		.set_state_shutdown = tegra_timer_shutdown,
> +		.set_state_periodic = tegra_timer_set_periodic,
> +		.set_state_oneshot = tegra_timer_shutdown,
> +		.tick_resume = tegra_timer_shutdown,
> +	},
> +};
> +
> +static int tegra_timer_setup(unsigned int cpu)
> +{
> +	struct timer_of *to = per_cpu_ptr(&tegra_to, cpu);
> +
> +	irq_force_affinity(to->clkevt.irq, cpumask_of(cpu));
> +	enable_irq(to->clkevt.irq);
> +
> +	clockevents_config_and_register(&to->clkevt, timer_of_rate(to),
> +					1, /* min */
> +					0x1fffffff); /* 29 bits */
>  
> -	timer_shutdown(evt);
> -	timer_writel(reg, TIMER3_BASE + TIMER_PTV);
>  	return 0;
>  }
>  
> -static struct clock_event_device tegra_clockevent = {
> -	.name			= "timer0",
> -	.rating			= 300,
> -	.features		= CLOCK_EVT_FEAT_ONESHOT |
> -				  CLOCK_EVT_FEAT_PERIODIC |
> -				  CLOCK_EVT_FEAT_DYNIRQ,
> -	.set_next_event		= tegra_timer_set_next_event,
> -	.set_state_shutdown	= tegra_timer_shutdown,
> -	.set_state_periodic	= tegra_timer_set_periodic,
> -	.set_state_oneshot	= tegra_timer_shutdown,
> -	.tick_resume		= tegra_timer_shutdown,
> +static int tegra_timer_stop(unsigned int cpu)
> +{
> +	struct timer_of *to = per_cpu_ptr(&tegra_to, cpu);
> +
> +	to->clkevt.set_state_shutdown(&to->clkevt);
> +	disable_irq_nosync(to->clkevt.irq);
> +
> +	return 0;
> +}
> +#else /* CONFIG_ARM */
> +static struct timer_of tegra_to = {
> +	.flags = TIMER_OF_CLOCK | TIMER_OF_BASE | TIMER_OF_IRQ,
> +
> +	.clkevt = {
> +		.name = "tegra_timer",
> +		.rating	= 300,
> +		.features = CLOCK_EVT_FEAT_ONESHOT |
> +			    CLOCK_EVT_FEAT_PERIODIC |
> +			    CLOCK_EVT_FEAT_DYNIRQ,
> +		.set_next_event	= tegra_timer_set_next_event,
> +		.set_state_shutdown = tegra_timer_shutdown,
> +		.set_state_periodic = tegra_timer_set_periodic,
> +		.set_state_oneshot = tegra_timer_shutdown,
> +		.tick_resume = tegra_timer_shutdown,
> +		.cpumask = cpu_possible_mask,
> +	},
> +
> +	.of_irq = {
> +		.index = 2,
> +		.flags = IRQF_TIMER | IRQF_TRIGGER_HIGH,
> +		.handler = tegra_timer_isr,
> +	},
>  };
>  
>  static u64 notrace tegra_read_sched_clock(void)
>  {
> -	return timer_readl(TIMERUS_CNTR_1US);
> +	return readl(timer_reg_base + TIMERUS_CNTR_1US);
> +}
> +
> +static unsigned long tegra_delay_timer_read_counter_long(void)
> +{
> +	return readl(timer_reg_base + TIMERUS_CNTR_1US);
>  }
>  
>  /*
> @@ -143,98 +217,188 @@ static void tegra_read_persistent_clock64(struct timespec64 *ts)
>  	timespec64_add_ns(&persistent_ts, delta * NSEC_PER_MSEC);
>  	*ts = persistent_ts;
>  }
> +#endif
>  
> -static unsigned long tegra_delay_timer_read_counter_long(void)
> +static int tegra_timer_suspend(void)
>  {
> -	return readl(timer_reg_base + TIMERUS_CNTR_1US);
> +#ifdef CONFIG_ARM64

Please do not add those #ifdef but function stubs.

> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		struct timer_of *to = per_cpu_ptr(&tegra_to, cpu);
> +		void __iomem *reg_base = timer_of_base(to);
> +
> +		writel(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
> +	}
> +#else
> +	void __iomem *reg_base = timer_of_base(&tegra_to);
> +
> +	writel(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
> +#endif
> +
> +	return 0;
>  }
>  
> -static irqreturn_t tegra_timer_interrupt(int irq, void *dev_id)
> +static void tegra_timer_resume(void)
>  {
> -	struct clock_event_device *evt = (struct clock_event_device *)dev_id;
> -	timer_writel(1<<30, TIMER3_BASE + TIMER_PCR);
> -	evt->event_handler(evt);
> -	return IRQ_HANDLED;
> +	writel(usec_config, timer_reg_base + TIMERUS_USEC_CFG);
>  }
>  
> -static struct irqaction tegra_timer_irq = {
> -	.name		= "timer0",
> -	.flags		= IRQF_TIMER | IRQF_TRIGGER_HIGH,
> -	.handler	= tegra_timer_interrupt,
> -	.dev_id		= &tegra_clockevent,
> +static struct syscore_ops tegra_timer_syscore_ops = {
> +	.suspend = tegra_timer_suspend,
> +	.resume = tegra_timer_resume,
>  };

It will be nicer to use the suspend/resume callbacks defined in the
clockevent structure, so you can use generic as there are multiple
clockevents defined for the tegra210, thus multiple timer-of
encapsulating them. When the suspend/resume callbacks are called, they
have the clock_event pointer and you can use it to retrieve the timer-of
and then the base address. At the end, the callbacks will end up the
same for tegra20 and tegra210.

> -static int __init tegra20_init_timer(struct device_node *np)
> +static int tegra_timer_init(struct device_node *np, struct timer_of *to)
>  {
> -	struct clk *clk;
> -	unsigned long rate;
> -	int ret;
> +	int ret = 0;
>  
> -	timer_reg_base = of_iomap(np, 0);
> -	if (!timer_reg_base) {
> -		pr_err("Can't map timer registers\n");
> -		return -ENXIO;
> -	}
> +	ret = timer_of_init(np, to);
> +	if (ret < 0)
> +		goto out;
>  
> -	tegra_timer_irq.irq = irq_of_parse_and_map(np, 2);
> -	if (tegra_timer_irq.irq <= 0) {
> -		pr_err("Failed to map timer IRQ\n");
> -		return -EINVAL;
> -	}
> +	timer_reg_base = timer_of_base(to);
>  
> -	clk = of_clk_get(np, 0);
> -	if (IS_ERR(clk)) {
> -		pr_warn("Unable to get timer clock. Assuming 12Mhz input clock.\n");
> -		rate = 12000000;
> -	} else {
> -		clk_prepare_enable(clk);
> -		rate = clk_get_rate(clk);
> -	}
> -
> -	switch (rate) {
> +	/*
> +	 * Configure microsecond timers to have 1MHz clock
> +	 * Config register is 0xqqww, where qq is "dividend", ww is "divisor"
> +	 * Uses n+1 scheme
> +	 */
> +	switch (timer_of_rate(to)) {
>  	case 12000000:
> -		timer_writel(0x000b, TIMERUS_USEC_CFG);
> +		usec_config = 0x000b; /* (11+1)/(0+1) */
> +		break;
> +	case 12800000:
> +		usec_config = 0x043f; /* (63+1)/(4+1) */
>  		break;
>  	case 13000000:
> -		timer_writel(0x000c, TIMERUS_USEC_CFG);
> +		usec_config = 0x000c; /* (12+1)/(0+1) */
> +		break;
> +	case 16800000:
> +		usec_config = 0x0453; /* (83+1)/(4+1) */
>  		break;
>  	case 19200000:
> -		timer_writel(0x045f, TIMERUS_USEC_CFG);
> +		usec_config = 0x045f; /* (95+1)/(4+1) */
>  		break;
>  	case 26000000:
> -		timer_writel(0x0019, TIMERUS_USEC_CFG);
> +		usec_config = 0x0019; /* (25+1)/(0+1) */
> +		break;
> +	case 38400000:
> +		usec_config = 0x04bf; /* (191+1)/(4+1) */
> +		break;
> +	case 48000000:
> +		usec_config = 0x002f; /* (47+1)/(0+1) */
>  		break;
>  	default:
> -		WARN(1, "Unknown clock rate");
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	writel(usec_config, timer_of_base(to) + TIMERUS_USEC_CFG);
> +
> +	register_syscore_ops(&tegra_timer_syscore_ops);
> +out:
> +	return ret;
> +}
> +
> +#ifdef CONFIG_ARM64
> +static int __init tegra210_timer_init(struct device_node *np)
> +{
> +	int cpu, ret = 0;
> +	struct timer_of *to;
> +
> +	to = this_cpu_ptr(&tegra_to);
> +	ret = tegra_timer_init(np, to);
> +	if (ret < 0)
> +		goto out;
> +
> +	for_each_possible_cpu(cpu) {
> +		struct timer_of *cpu_to;
> +
> +		cpu_to = per_cpu_ptr(&tegra_to, cpu);
> +		cpu_to->of_base.base = timer_reg_base + TIMER_BASE_FOR_CPU(cpu);
> +		cpu_to->of_clk.rate = timer_of_rate(to);
> +		cpu_to->clkevt.cpumask = cpumask_of(cpu);
> +
> +		cpu_to->clkevt.irq =
> +			irq_of_parse_and_map(np, IRQ_IDX_FOR_CPU(cpu));
> +		if (!cpu_to->clkevt.irq) {
> +			pr_err("%s: can't map IRQ for CPU%d\n",
> +			       __func__, cpu);
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		irq_set_status_flags(cpu_to->clkevt.irq, IRQ_NOAUTOEN);
> +		ret = request_irq(cpu_to->clkevt.irq, tegra_timer_isr,
> +				  IRQF_TIMER | IRQF_NOBALANCING,
> +				  cpu_to->clkevt.name, &cpu_to->clkevt);
> +		if (ret) {
> +			pr_err("%s: cannot setup irq %d for CPU%d\n",
> +				__func__, cpu_to->clkevt.irq, cpu);
> +			ret = -EINVAL;
> +			goto out_irq;
> +		}
> +	}

You should configure the timer in the tegra_timer_setup() function
instead of using this cpu loop.

> +
> +	cpuhp_setup_state(CPUHP_AP_TEGRA_TIMER_STARTING,
> +			  "AP_TEGRA_TIMER_STARTING", tegra_timer_setup,
> +			  tegra_timer_stop);
> +
> +	return ret;
> +
> +out_irq:
> +	for_each_possible_cpu(cpu) {
> +		struct timer_of *cpu_to;
> +
> +		cpu_to = per_cpu_ptr(&tegra_to, cpu);
> +		if (cpu_to->clkevt.irq) {
> +			free_irq(cpu_to->clkevt.irq, &cpu_to->clkevt);
> +			irq_dispose_mapping(cpu_to->clkevt.irq);
> +		}
>  	}
> +out:
> +	timer_of_cleanup(to);
> +	return ret;
> +}
> +TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer", tegra210_timer_init);
> +#else /* CONFIG_ARM */

Don't use the macro to select one or another. Just define the functions
and let the init postcalls to free the memory.

> +static int __init tegra20_init_timer(struct device_node *np)
> +{
> +	int ret = 0;
> +
> +	ret = tegra_timer_init(np, &tegra_to);
> +	if (ret < 0)
> +		goto out;
>  
> -	sched_clock_register(tegra_read_sched_clock, 32, 1000000);
> +	tegra_to.of_base.base = timer_reg_base + TIMER_BASE_FOR_CPU(0);
> +	tegra_to.of_clk.rate = 1000000; /* microsecond timer */
>  
> +	sched_clock_register(tegra_read_sched_clock, 32,
> +			     timer_of_rate(&tegra_to));
>  	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
> -				    "timer_us", 1000000, 300, 32,
> -				    clocksource_mmio_readl_up);
> +				    "timer_us", timer_of_rate(&tegra_to),
> +				    300, 32, clocksource_mmio_readl_up);
>  	if (ret) {
>  		pr_err("Failed to register clocksource\n");
> -		return ret;
> +		goto out;
>  	}
>  
>  	tegra_delay_timer.read_current_timer =
>  			tegra_delay_timer_read_counter_long;
> -	tegra_delay_timer.freq = 1000000;
> +	tegra_delay_timer.freq = timer_of_rate(&tegra_to);
>  	register_current_timer_delay(&tegra_delay_timer);
>  
> -	ret = setup_irq(tegra_timer_irq.irq, &tegra_timer_irq);
> -	if (ret) {
> -		pr_err("Failed to register timer IRQ: %d\n", ret);
> -		return ret;
> -	}
> +	clockevents_config_and_register(&tegra_to.clkevt,
> +					timer_of_rate(&tegra_to),
> +					0x1,
> +					0x1fffffff);
>  
> -	tegra_clockevent.cpumask = cpu_possible_mask;
> -	tegra_clockevent.irq = tegra_timer_irq.irq;
> -	clockevents_config_and_register(&tegra_clockevent, 1000000,
> -					0x1, 0x1fffffff);
> +	return ret;
> +out:
> +	timer_of_cleanup(&tegra_to);
>  
> -	return 0;
> +	return ret;
>  }
>  TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
>  
> @@ -261,3 +425,4 @@ static int __init tegra20_init_rtc(struct device_node *np)
>  	return register_persistent_clock(tegra_read_persistent_clock64);
>  }
>  TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
> +#endif
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index fd586d0301e7..e78281d07b70 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -121,6 +121,7 @@ enum cpuhp_state {
>  	CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
>  	CPUHP_AP_ARM_TWD_STARTING,
>  	CPUHP_AP_QCOM_TIMER_STARTING,
> +	CPUHP_AP_TEGRA_TIMER_STARTING,
>  	CPUHP_AP_ARMADA_TIMER_STARTING,
>  	CPUHP_AP_MARCO_TIMER_STARTING,
>  	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
