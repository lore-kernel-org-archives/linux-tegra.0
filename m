From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V6 2/7] clocksource: tegra: add Tegra210 timer support
Date: Mon, 18 Feb 2019 10:39:22 +0100
Message-ID: <d2aff40c-5ec5-ad66-0d69-a76cdd6c0e9c@linaro.org>
References: <20190201161654.18315-1-josephl@nvidia.com>
 <20190201161654.18315-3-josephl@nvidia.com>
 <3849a41f-ab36-d7e0-b2ce-1aa5c4e34aec@linaro.org>
 <87731d61-10f6-0842-a90f-0c78ffba9ef7@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87731d61-10f6-0842-a90f-0c78ffba9ef7@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 18/02/2019 10:01, Joseph Lo wrote:
> On 2/15/19 11:14 PM, Daniel Lezcano wrote:
>> On 01/02/2019 17:16, Joseph Lo wrote:
>>> Add support for the Tegra210 timer that runs at oscillator clock
>>> (TMR10-TMR13). We need these timers to work as clock event device and to
>>> replace the ARMv8 architected timer due to it can't survive across the
>>> power cycle of the CPU core or CPUPORESET signal. So it can't be a
>>> wake-up
>>> source when CPU suspends in power down state.
>>>
>>> Also convert the original driver to use timer-of API.
>>>
>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>> Cc: linux-kernel@vger.kernel.org
>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>> v6:
>>>   * refine the timer defines
>>>   * add ack tag from Jon.
>>> v5:
>>>   * add ack tag from Thierry
>>> v4:
>>>   * merge timer-tegra210.c in previous version into timer-tegra20.c
>>> v3:
>>>   * use timer-of API
>>> v2:
>>>   * add error clean-up code
>>> ---
>>>   drivers/clocksource/Kconfig         |   2 +-
>>>   drivers/clocksource/timer-tegra20.c | 371 ++++++++++++++++++++--------
>>>   include/linux/cpuhotplug.h          |   1 +
>>>   3 files changed, 270 insertions(+), 104 deletions(-)
>>>
>>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>>> index a9e26f6a81a1..6af78534a285 100644
>>> --- a/drivers/clocksource/Kconfig
>>> +++ b/drivers/clocksource/Kconfig
>>> @@ -131,7 +131,7 @@ config SUN5I_HSTIMER
>>>   config TEGRA_TIMER
>>>       bool "Tegra timer driver" if COMPILE_TEST
>>>       select CLKSRC_MMIO
>>> -    depends on ARM
>>
>> This will break because the delay functions are defined in
>> arch/arm/include/asm/delay.h and the 01.org will try to compile the
>> driver on x86.
>>
>> You may want to add 'depends on ARM && ARM64'
>>
> 
> OK, I think it's 'depends on ARM || ARM64'.

Ah, yes right.

> Will fix.
> 
>>> +    select TIMER_OF
>>>       help
>>>         Enables support for the Tegra driver.
>>>   
> [snip]
>>> -
>>>   static struct timespec64 persistent_ts;
>>>   static u64 persistent_ms, last_persistent_ms;
>>
>> Did you check the above changes are still relevant after commit
>> 39232ed5a1793f67 and after doing a change similar to
>> commit 1569557549697207e523 ?
>>
> 
> Yes, just check both commits. I think it's okay to use the same. But
> need another patch to do that, this patch only adds new support for
> Tegra210. Doesn't touch the original code.

Ok, let's do the change later.

>>>   static struct delay_timer tegra_delay_timer;
> [snip]
>>> +#ifdef CONFIG_ARM64
>>> +static DEFINE_PER_CPU(struct timer_of, tegra_to) = {
>>> +    .flags = TIMER_OF_CLOCK | TIMER_OF_BASE,
>>> +
>>> +    .clkevt = {
>>> +        .name = "tegra_timer",
>>> +        .rating = 460,
>>> +        .features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
>>
>>             CLOCK_EVT_FEAT_DYNIRQ ?
> Yes, good catch.
>>
>>> +        .set_next_event = tegra_timer_set_next_event,
>>> +        .set_state_shutdown = tegra_timer_shutdown,
>>> +        .set_state_periodic = tegra_timer_set_periodic,
>>> +        .set_state_oneshot = tegra_timer_shutdown,
>>> +        .tick_resume = tegra_timer_shutdown,
>>> +    },
>>> +};
> [snip]
>>> -static unsigned long tegra_delay_timer_read_counter_long(void)
>>> +static int tegra_timer_suspend(void)
>>>   {
>>> -    return readl(timer_reg_base + TIMERUS_CNTR_1US);
>>> +#ifdef CONFIG_ARM64
>>
>> Please do not add those #ifdef but function stubs.
>>
>>> +    int cpu;
>>> +
>>> +    for_each_possible_cpu(cpu) {
>>> +        struct timer_of *to = per_cpu_ptr(&tegra_to, cpu);
>>> +        void __iomem *reg_base = timer_of_base(to);
>>> +
>>> +        writel(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
>>> +    }
>>> +#else
>>> +    void __iomem *reg_base = timer_of_base(&tegra_to);
>>> +
>>> +    writel(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
>>> +#endif
>>> +
>>> +    return 0;
>>>   }
>>>   -static irqreturn_t tegra_timer_interrupt(int irq, void *dev_id)
>>> +static void tegra_timer_resume(void)
>>>   {
>>> -    struct clock_event_device *evt = (struct clock_event_device
>>> *)dev_id;
>>> -    timer_writel(1<<30, TIMER3_BASE + TIMER_PCR);
>>> -    evt->event_handler(evt);
>>> -    return IRQ_HANDLED;
>>> +    writel(usec_config, timer_reg_base + TIMERUS_USEC_CFG);
>>>   }
>>>   -static struct irqaction tegra_timer_irq = {
>>> -    .name        = "timer0",
>>> -    .flags        = IRQF_TIMER | IRQF_TRIGGER_HIGH,
>>> -    .handler    = tegra_timer_interrupt,
>>> -    .dev_id        = &tegra_clockevent,
>>> +static struct syscore_ops tegra_timer_syscore_ops = {
>>> +    .suspend = tegra_timer_suspend,
>>> +    .resume = tegra_timer_resume,
>>>   };
>>
>> It will be nicer to use the suspend/resume callbacks defined in the
>> clockevent structure, so you can use generic as there are multiple
>> clockevents defined for the tegra210, thus multiple timer-of
>> encapsulating them. When the suspend/resume callbacks are called, they
>> have the clock_event pointer and you can use it to retrieve the timer-of
>> and then the base address. At the end, the callbacks will end up the
>> same for tegra20 and tegra210.
>>
> 
> Very good suggestion, will follow up.
> 
>>> -static int __init tegra20_init_timer(struct device_node *np)
>>> +static int tegra_timer_init(struct device_node *np, struct timer_of
>>> *to)
> [snip]
>>> +    for_each_possible_cpu(cpu) {
>>> +        struct timer_of *cpu_to;
>>> +
>>> +        cpu_to = per_cpu_ptr(&tegra_to, cpu);
>>> +        cpu_to->of_base.base = timer_reg_base +
>>> TIMER_BASE_FOR_CPU(cpu);
>>> +        cpu_to->of_clk.rate = timer_of_rate(to);
>>> +        cpu_to->clkevt.cpumask = cpumask_of(cpu);
>>> +
>>> +        cpu_to->clkevt.irq =
>>> +            irq_of_parse_and_map(np, IRQ_IDX_FOR_CPU(cpu));
>>> +        if (!cpu_to->clkevt.irq) {
>>> +            pr_err("%s: can't map IRQ for CPU%d\n",
>>> +                   __func__, cpu);
>>> +            ret = -EINVAL;
>>> +            goto out;
>>> +        }
>>> +
>>> +        irq_set_status_flags(cpu_to->clkevt.irq, IRQ_NOAUTOEN);
>>> +        ret = request_irq(cpu_to->clkevt.irq, tegra_timer_isr,
>>> +                  IRQF_TIMER | IRQF_NOBALANCING,
>>> +                  cpu_to->clkevt.name, &cpu_to->clkevt);
>>> +        if (ret) {
>>> +            pr_err("%s: cannot setup irq %d for CPU%d\n",
>>> +                __func__, cpu_to->clkevt.irq, cpu);
>>> +            ret = -EINVAL;
>>> +            goto out_irq;
>>> +        }
>>> +    }
>>
>> You should configure the timer in the tegra_timer_setup() function
>> instead of using this cpu loop.
>>
> 
> I think I still need to leave 'irq_of_parse_and_map' and 'request_irq'
> here. Is that ok?

Perhaps you can store the np pointer in the private data structure of
timer-of and let the timer_of API to retrieve the irq in the cpuhp
callbacks.

irq_of_parse_and_map will be called by timer-of.

I'm not sure irq_set_status_flags really operates on the irq because it
is called after request_irq.

>>> +
>>> +    cpuhp_setup_state(CPUHP_AP_TEGRA_TIMER_STARTING,
>>> +              "AP_TEGRA_TIMER_STARTING", tegra_timer_setup,
>>> +              tegra_timer_stop);
>>> +
>>> +    return ret;
>>> +
>>> +out_irq:
>>> +    for_each_possible_cpu(cpu) {
>>> +        struct timer_of *cpu_to;
>>> +
>>> +        cpu_to = per_cpu_ptr(&tegra_to, cpu);
>>> +        if (cpu_to->clkevt.irq) {
>>> +            free_irq(cpu_to->clkevt.irq, &cpu_to->clkevt);
>>> +            irq_dispose_mapping(cpu_to->clkevt.irq);
>>> +        }
>>>       }
>>> +out:
>>> +    timer_of_cleanup(to);
>>> +    return ret;
>>> +}
>>> +TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer",
>>> tegra210_timer_init);
>>> +#else /* CONFIG_ARM */
>>
>> Don't use the macro to select one or another. Just define the functions
>> and let the init postcalls to free the memory.
>>
> 
> Okay, I think I can move 'TIMER_OF_DECLARE' out of the ifdef. They will
> be something like below. And change tegraxxx_init_timer to
> tegra_init_timer.
> 
> TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer",
> tegra_timer_init);
> TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra_timer_init);
> 
> Is that ok?


Yes, it is fine.

Thanks
  -- Daniel



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
