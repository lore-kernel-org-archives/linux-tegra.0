From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V2 2/6] clocksource: tegra: add Tegra210 timer driver
Date: Tue, 29 Jan 2019 11:35:13 +0800
Message-ID: <3607f32b-c20a-e00f-3dc1-630169342392@nvidia.com>
References: <20190128091815.7040-1-josephl@nvidia.com>
 <20190128091815.7040-3-josephl@nvidia.com> <20190128150908.GB31317@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128150908.GB31317@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 1/28/19 11:09 PM, Thierry Reding wrote:
> On Mon, Jan 28, 2019 at 05:18:11PM +0800, Joseph Lo wrote:
>> Add support for the Tegra210 timer that runs at oscillator clock
>> (TMR10-TMR13). We need these timers to work as clock event device and to
>> replace the ARMv8 architected timer due to it can't survive across the
>> power cycle of the CPU core or CPUPORESET signal. So it can't be a wake-up
>> source when CPU suspends in power down state.
>>
>> Based on the work of Antti P Miettinen <amiettinen@nvidia.com>
>>
>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>> v2:
>>   * add error clean-up code
>> ---
>>   drivers/clocksource/Kconfig          |   3 +
>>   drivers/clocksource/Makefile         |   1 +
>>   drivers/clocksource/timer-tegra210.c | 268 +++++++++++++++++++++++++++
>>   include/linux/cpuhotplug.h           |   1 +
>>   4 files changed, 273 insertions(+)
>>   create mode 100644 drivers/clocksource/timer-tegra210.c
>>
>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>> index a9e26f6a81a1..e6e3e64b6320 100644
>> --- a/drivers/clocksource/Kconfig
>> +++ b/drivers/clocksource/Kconfig
>> @@ -135,6 +135,9 @@ config TEGRA_TIMER
>>   	help
>>   	  Enables support for the Tegra driver.
>>   
>> +config TEGRA210_TIMER
>> +	def_bool ARCH_TEGRA_210_SOC
>> +
>>   config VT8500_TIMER
>>   	bool "VT8500 timer driver" if COMPILE_TEST
>>   	depends on HAS_IOMEM
>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
>> index cdd210ff89ea..95de59c8a47b 100644
>> --- a/drivers/clocksource/Makefile
>> +++ b/drivers/clocksource/Makefile
>> @@ -36,6 +36,7 @@ obj-$(CONFIG_SUN4I_TIMER)	+= timer-sun4i.o
>>   obj-$(CONFIG_SUN5I_HSTIMER)	+= timer-sun5i.o
>>   obj-$(CONFIG_MESON6_TIMER)	+= timer-meson6.o
>>   obj-$(CONFIG_TEGRA_TIMER)	+= timer-tegra20.o
>> +obj-$(CONFIG_TEGRA210_TIMER)	+= timer-tegra210.o
>>   obj-$(CONFIG_VT8500_TIMER)	+= timer-vt8500.o
>>   obj-$(CONFIG_NSPIRE_TIMER)	+= timer-zevio.o
>>   obj-$(CONFIG_BCM_KONA_TIMER)	+= bcm_kona_timer.o
>> diff --git a/drivers/clocksource/timer-tegra210.c b/drivers/clocksource/timer-tegra210.c
>> new file mode 100644
>> index 000000000000..477b164e540b
>> --- /dev/null
>> +++ b/drivers/clocksource/timer-tegra210.c
>> @@ -0,0 +1,268 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2014-2019, NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clockchips.h>
>> +#include <linux/cpu.h>
>> +#include <linux/cpumask.h>
>> +#include <linux/err.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/percpu.h>
>> +#include <linux/syscore_ops.h>
>> +
>> +static u32 tegra210_timer_freq;
>> +static void __iomem *tegra210_timer_reg_base;
>> +static u32 usec_config;
>> +
>> +#define TIMER_PTV		0x0
>> +#define TIMER_PTV_EN		BIT(31)
>> +#define TIMER_PTV_PER		BIT(30)
>> +#define TIMER_PCR		0x4
>> +#define TIMER_PCR_INTR_CLR	BIT(30)
>> +#define TIMERUS_CNTR_1US	0x10
>> +#define TIMERUS_USEC_CFG	0x14
>> +
>> +#define TIMER10_OFFSET		0x90
>> +#define TIMER10_IRQ_IDX		10
>> +
>> +#define TIMER_FOR_CPU(cpu) (TIMER10_OFFSET + (cpu) * 8)
>> +#define IRQ_IDX_FOR_CPU(cpu)	(TIMER10_IRQ_IDX + cpu)
>> +
>> +struct tegra210_clockevent {
>> +	struct clock_event_device evt;
>> +	char name[20];
>> +	void __iomem *reg_base;
>> +};
>> +#define to_tegra_cevt(p) (container_of(p, struct tegra210_clockevent, evt))
>> +
>> +static struct tegra210_clockevent __percpu *tegra210_evt;
>> +
>> +static int tegra210_timer_set_next_event(unsigned long cycles,
>> +					 struct clock_event_device *evt)
>> +{
>> +	struct tegra210_clockevent *tevt;
>> +
>> +	tevt = to_tegra_cevt(evt);
>> +	writel(TIMER_PTV_EN |
>> +	       ((cycles > 1) ? (cycles - 1) : 0), /* n+1 scheme */
>> +	       tevt->reg_base + TIMER_PTV);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline void timer_shutdown(struct tegra210_clockevent *tevt)
>> +{
>> +	writel(0, tevt->reg_base + TIMER_PTV);
>> +}
>> +
>> +static int tegra210_timer_shutdown(struct clock_event_device *evt)
>> +{
>> +	struct tegra210_clockevent *tevt;
>> +
>> +	tevt = to_tegra_cevt(evt);
>> +	timer_shutdown(tevt);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra210_timer_set_periodic(struct clock_event_device *evt)
>> +{
>> +	struct tegra210_clockevent *tevt;
>> +
>> +	tevt = to_tegra_cevt(evt);
>> +	writel(TIMER_PTV_EN | TIMER_PTV_PER | ((tegra210_timer_freq / HZ) - 1),
>> +	       tevt->reg_base + TIMER_PTV);
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t tegra210_timer_isr(int irq, void *dev_id)
>> +{
>> +	struct tegra210_clockevent *tevt;
>> +
>> +	tevt = dev_id;
>> +	writel(TIMER_PCR_INTR_CLR, tevt->reg_base + TIMER_PCR);
>> +	tevt->evt.event_handler(&tevt->evt);
>> +
>> +	return IRQ_HANDLED;
>> +}
> 
> Up to here this is a duplicate of timer-tegra20.c. And a lot of
> tegra210_timer_init() is the same as tegra20_timer_init() as well. Can't
> we unify the two drivers instead?

I still prefer to remove the timer-tegra20 driver, because it didn't 
been used for Tegra 32 bit chips for quite a long time. So currently it 
just compiles OK, I also doubt the functionality still can achieve the 
same what I want to do for Tegra210.

My personal opinion is to remove the old and unused driver and enhance 
the new one.

> 
> The power cycle restrictions of the architected timer, do they not apply
> to chips earlier than Tegra210 either? So don't we need all of these
> additional features on the timer-tegra20.c driver as well? If so that
> would increase the code duplication even more. I think we should avoid
> that, unless there are any strong arguments that would justify it.
> 

As far as I know, this was a issue on some specific version of Cortex-a57.
For timer-tegra20, which was designed for the very early stage that TWD 
driver was not ready yet for Tegra 32 bit chips (Tegra20/30). Currently, 
it has been replaced by ARM TWD and V7 timer driver. It didn't been used 
and maintained for quite a long time.

BTW, we had very similar issue with idle power-down state with Tegra 
32bit chips. But it's related to GIC not timer. See below two changes 
for reference.

For Tegra20,
d4b92fb2535a ARM: tegra: add pending SGI checking API

For Tegra114/124,
7e8b15dbc392 ARM: tegra114: Reprogram GIC CPU interface to bypass IRQ on 
CPU PM entry

Thanks,
Joseph
