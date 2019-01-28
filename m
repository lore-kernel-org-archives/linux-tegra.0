From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V2 2/6] clocksource: tegra: add Tegra210 timer driver
Date: Mon, 28 Jan 2019 14:00:01 +0100
Message-ID: <fa03140e-4f7f-ac9a-bb54-26b1efe2dc3d@linaro.org>
References: <20190128091815.7040-1-josephl@nvidia.com>
 <20190128091815.7040-3-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128091815.7040-3-josephl@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 28/01/2019 10:18, Joseph Lo wrote:
> Add support for the Tegra210 timer that runs at oscillator clock
> (TMR10-TMR13). We need these timers to work as clock event device and to
> replace the ARMv8 architected timer due to it can't survive across the
> power cycle of the CPU core or CPUPORESET signal. So it can't be a wake-up
> source when CPU suspends in power down state.
> 
> Based on the work of Antti P Miettinen <amiettinen@nvidia.com>
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v2:
>  * add error clean-up code
> ---
>  drivers/clocksource/Kconfig          |   3 +
>  drivers/clocksource/Makefile         |   1 +
>  drivers/clocksource/timer-tegra210.c | 268 +++++++++++++++++++++++++++
>  include/linux/cpuhotplug.h           |   1 +
>  4 files changed, 273 insertions(+)
>  create mode 100644 drivers/clocksource/timer-tegra210.c
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index a9e26f6a81a1..e6e3e64b6320 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -135,6 +135,9 @@ config TEGRA_TIMER
>  	help
>  	  Enables support for the Tegra driver.
>  
> +config TEGRA210_TIMER
> +	def_bool ARCH_TEGRA_210_SOC
> +

Please make the option consistent with the option below (VT8500_TIMER or
similar).

>  config VT8500_TIMER
>  	bool "VT8500 timer driver" if COMPILE_TEST
>  	depends on HAS_IOMEM
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index cdd210ff89ea..95de59c8a47b 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_SUN4I_TIMER)	+= timer-sun4i.o
>  obj-$(CONFIG_SUN5I_HSTIMER)	+= timer-sun5i.o
>  obj-$(CONFIG_MESON6_TIMER)	+= timer-meson6.o
>  obj-$(CONFIG_TEGRA_TIMER)	+= timer-tegra20.o
> +obj-$(CONFIG_TEGRA210_TIMER)	+= timer-tegra210.o
>  obj-$(CONFIG_VT8500_TIMER)	+= timer-vt8500.o
>  obj-$(CONFIG_NSPIRE_TIMER)	+= timer-zevio.o
>  obj-$(CONFIG_BCM_KONA_TIMER)	+= bcm_kona_timer.o
> diff --git a/drivers/clocksource/timer-tegra210.c b/drivers/clocksource/timer-tegra210.c
> new file mode 100644
> index 000000000000..477b164e540b
> --- /dev/null
> +++ b/drivers/clocksource/timer-tegra210.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2014-2019, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/percpu.h>
> +#include <linux/syscore_ops.h>
> +
> +static u32 tegra210_timer_freq;
> +static void __iomem *tegra210_timer_reg_base;
> +static u32 usec_config;
> +
> +#define TIMER_PTV		0x0
> +#define TIMER_PTV_EN		BIT(31)
> +#define TIMER_PTV_PER		BIT(30)
> +#define TIMER_PCR		0x4
> +#define TIMER_PCR_INTR_CLR	BIT(30)
> +#define TIMERUS_CNTR_1US	0x10
> +#define TIMERUS_USEC_CFG	0x14
> +
> +#define TIMER10_OFFSET		0x90
> +#define TIMER10_IRQ_IDX		10
> +
> +#define TIMER_FOR_CPU(cpu) (TIMER10_OFFSET + (cpu) * 8)
> +#define IRQ_IDX_FOR_CPU(cpu)	(TIMER10_IRQ_IDX + cpu)
> +
> +struct tegra210_clockevent {
> +	struct clock_event_device evt;
> +	char name[20];
> +	void __iomem *reg_base;
> +};
> +#define to_tegra_cevt(p) (container_of(p, struct tegra210_clockevent, evt))
> +
> +static struct tegra210_clockevent __percpu *tegra210_evt;
> +
> +static int tegra210_timer_set_next_event(unsigned long cycles,
> +					 struct clock_event_device *evt)
> +{
> +	struct tegra210_clockevent *tevt;
> +
> +	tevt = to_tegra_cevt(evt);
> +	writel(TIMER_PTV_EN |
> +	       ((cycles > 1) ? (cycles - 1) : 0), /* n+1 scheme */
> +	       tevt->reg_base + TIMER_PTV);
> +
> +	return 0;
> +}
> +
> +static inline void timer_shutdown(struct tegra210_clockevent *tevt)
> +{
> +	writel(0, tevt->reg_base + TIMER_PTV);
> +}
> +
> +static int tegra210_timer_shutdown(struct clock_event_device *evt)
> +{
> +	struct tegra210_clockevent *tevt;
> +
> +	tevt = to_tegra_cevt(evt);
> +	timer_shutdown(tevt);
> +
> +	return 0;
> +}
> +
> +static int tegra210_timer_set_periodic(struct clock_event_device *evt)
> +{
> +	struct tegra210_clockevent *tevt;
> +
> +	tevt = to_tegra_cevt(evt);
> +	writel(TIMER_PTV_EN | TIMER_PTV_PER | ((tegra210_timer_freq / HZ) - 1),
> +	       tevt->reg_base + TIMER_PTV);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t tegra210_timer_isr(int irq, void *dev_id)
> +{
> +	struct tegra210_clockevent *tevt;
> +
> +	tevt = dev_id;
> +	writel(TIMER_PCR_INTR_CLR, tevt->reg_base + TIMER_PCR);
> +	tevt->evt.event_handler(&tevt->evt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int tegra210_timer_setup(unsigned int cpu)
> +{
> +	struct tegra210_clockevent *tevt = per_cpu_ptr(tegra210_evt, cpu);
> +
> +	irq_force_affinity(tevt->evt.irq, cpumask_of(cpu));
> +	enable_irq(tevt->evt.irq);
> +
> +	clockevents_config_and_register(&tevt->evt, tegra210_timer_freq,
> +					1, /* min */
> +					0x1fffffff); /* 29 bits */
> +
> +	return 0;
> +}
> +
> +static int tegra210_timer_stop(unsigned int cpu)
> +{
> +	struct tegra210_clockevent *tevt = per_cpu_ptr(tegra210_evt, cpu);
> +
> +	tevt->evt.set_state_shutdown(&tevt->evt);
> +	disable_irq_nosync(tevt->evt.irq);
> +
> +	return 0;
> +}
> +
> +static int tegra_timer_suspend(void)
> +{
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		void __iomem *reg_base = tegra210_timer_reg_base +
> +					 TIMER_FOR_CPU(cpu);
> +		writel(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
> +	}
> +
> +	return 0;
> +}
> +
> +static void tegra_timer_resume(void)
> +{
> +	writel(usec_config, tegra210_timer_reg_base + TIMERUS_USEC_CFG);
> +}
> +
> +static struct syscore_ops tegra_timer_syscore_ops = {
> +	.suspend = tegra_timer_suspend,
> +	.resume = tegra_timer_resume,
> +};
> +
> +static int __init tegra210_timer_init(struct device_node *np)
> +{
> +	int cpu, ret = 0;
> +	struct tegra210_clockevent *tevt;
> +	struct clk *clk;
> +
> +	tegra210_evt = alloc_percpu(struct tegra210_clockevent);
> +	if (!tegra210_evt) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	tegra210_timer_reg_base = of_iomap(np, 0);
> +	if (!tegra210_timer_reg_base) {
> +		ret = -ENXIO;
> +		goto out_free_mem;
> +	}
> +
> +	clk = of_clk_get(np, 0);
> +	if (IS_ERR(clk)) {
> +		ret = -EINVAL;
> +		goto out_iounmap;
> +	}
> +
> +	clk_prepare_enable(clk);
> +	tegra210_timer_freq = clk_get_rate(clk);


Use the timer-of API for each CPU.

> +	for_each_possible_cpu(cpu) {


No cpu loop for the initialization, use the tegra210_timer_setup for
this (cf. armada 370 timer).

> +		tevt = per_cpu_ptr(tegra210_evt, cpu);
> +		tevt->reg_base = tegra210_timer_reg_base + TIMER_FOR_CPU(cpu);
> +		tevt->evt.irq = irq_of_parse_and_map(np, IRQ_IDX_FOR_CPU(cpu));
> +		if (!tevt->evt.irq) {
> +			pr_err("%s: can't map IRQ for CPU%d\n",
> +			       __func__, cpu);
> +			ret = -EINVAL;
> +			goto out_clk;
> +		}
> +
> +		snprintf(tevt->name, ARRAY_SIZE(tevt->name),
> +			 "tegra210_timer%d", cpu);
> +		tevt->evt.name = tevt->name;
> +		tevt->evt.cpumask = cpumask_of(cpu);
> +		tevt->evt.set_next_event = tegra210_timer_set_next_event;
> +		tevt->evt.set_state_shutdown = tegra210_timer_shutdown;
> +		tevt->evt.set_state_periodic = tegra210_timer_set_periodic;
> +		tevt->evt.set_state_oneshot = tegra210_timer_shutdown;
> +		tevt->evt.tick_resume = tegra210_timer_shutdown;
> +		tevt->evt.features = CLOCK_EVT_FEAT_PERIODIC |
> +			CLOCK_EVT_FEAT_ONESHOT;
> +		tevt->evt.rating = 460;
> +		irq_set_status_flags(tevt->evt.irq, IRQ_NOAUTOEN);

Why do you need to prevent the interrupt to be enabled ? If the timer is
stopped and cleared, no spurious interrupt will occur no ?

> +		ret = request_irq(tevt->evt.irq, tegra210_timer_isr,
> +				  IRQF_TIMER | IRQF_NOBALANCING,
> +				  tevt->name, tevt);
> +		if (ret) {
> +			pr_err("%s: cannot setup irq %d for CPU%d\n",
> +				__func__, tevt->evt.irq, cpu);
> +			ret = -EINVAL;
> +			goto out_irq;
> +		}
> +	}
> +
> +	/*
> +	 * Configure microsecond timers to have 1MHz clock
> +	 * Config register is 0xqqww, where qq is "dividend", ww is "divisor"

Did you mean 0xwwqq ?

> +	 * Uses n+1 scheme
> +	 */
> +	switch (tegra210_timer_freq) {
> +	case 12000000:
> +		usec_config = 0x000b; /* (11+1)/(0+1) */
> +		break;
> +	case 12800000:
> +		usec_config = 0x043f; /* (63+1)/(4+1) */
> +		break;
> +	case 13000000:
> +		usec_config = 0x000c; /* (12+1)/(0+1) */
> +		break;
> +	case 16800000:
> +		usec_config = 0x0453; /* (83+1)/(4+1) */
> +		break;
> +	case 19200000:
> +		usec_config = 0x045f; /* (95+1)/(4+1) */
> +		break;
> +	case 26000000:
> +		usec_config = 0x0019; /* (25+1)/(0+1) */
> +		break;
> +	case 38400000:
> +		usec_config = 0x04bf; /* (191+1)/(4+1) */
> +		break;
> +	case 48000000:
> +		usec_config = 0x002f; /* (47+1)/(0+1) */
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		goto out_irq;
> +	}
> +
> +	writel(usec_config, tegra210_timer_reg_base + TIMERUS_USEC_CFG);
> +
> +	cpuhp_setup_state(CPUHP_AP_TEGRA_TIMER_STARTING,
> +			  "AP_TEGRA_TIMER_STARTING", tegra210_timer_setup,
> +			  tegra210_timer_stop);
> +
> +	register_syscore_ops(&tegra_timer_syscore_ops);
> +
> +	return ret;
> +
> +out_irq:
> +	for_each_possible_cpu(cpu) {
> +		tevt = per_cpu_ptr(tegra210_evt, cpu);
> +		if (tevt->evt.irq) {
> +			free_irq(tevt->evt.irq, tevt);
> +			irq_dispose_mapping(tevt->evt.irq);
> +		}
> +	}
> +out_clk:
> +	clk_put(clk);
> +out_iounmap:
> +	iounmap(tegra210_timer_reg_base);
> +out_free_mem:
> +	free_percpu(tegra210_evt);
> +out:
> +	return ret;
> +}
> +
> +TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer", tegra210_timer_init);
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
