From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 2/2] rtc: tegra: Implement suspend clock source
Date: Fri, 14 Jun 2019 19:41:54 +0300
Message-ID: <3c6ac621-bc2a-c9c8-64fc-531be7dd323d@gmail.com>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <20190614104747.19712-2-thierry.reding@gmail.com>
 <5a00bccf-6542-51bd-9030-99a59f14f2f9@gmail.com>
 <20190614134110.GF15526@ulmo>
 <d9b65fd9-ecad-b241-a0d6-251a648488aa@gmail.com>
 <20190614141400.GI15526@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614141400.GI15526@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

14.06.2019 17:14, Thierry Reding пишет:
> On Fri, Jun 14, 2019 at 04:49:44PM +0300, Dmitry Osipenko wrote:
>> 14.06.2019 16:41, Thierry Reding пишет:
>>> On Fri, Jun 14, 2019 at 03:01:13PM +0300, Dmitry Osipenko wrote:
>>>> 14.06.2019 13:47, Thierry Reding пишет:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> The suspend clock source for Tegra210 and earlier is currently
>>>>> implemented in the Tegra timer driver. However, the suspend clock source
>>>>> code accesses registers that are part of the RTC hardware block, so both
>>>>> can step on each others' toes. In practice this isn't an issue, but
>>>>> there is no reason why the RTC driver can't implement the clock source,
>>>>> so move the code over to the tegra-rtc driver.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>> ---
>>>>>  drivers/clocksource/timer-tegra.c | 44 -------------------------------
>>>>>  drivers/rtc/rtc-tegra.c           | 42 +++++++++++++++++++++++++++++
>>>>>  2 files changed, 42 insertions(+), 44 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
>>>>> index e6608141cccb..87eac618924d 100644
>>>>> --- a/drivers/clocksource/timer-tegra.c
>>>>> +++ b/drivers/clocksource/timer-tegra.c
>>>>> @@ -21,10 +21,6 @@
>>>>>  
>>>>>  #include "timer-of.h"
>>>>>  
>>>>> -#define RTC_SECONDS		0x08
>>>>> -#define RTC_SHADOW_SECONDS	0x0c
>>>>> -#define RTC_MILLISECONDS	0x10
>>>>> -
>>>>>  #define TIMERUS_CNTR_1US	0x10
>>>>>  #define TIMERUS_USEC_CFG	0x14
>>>>>  #define TIMERUS_CNTR_FREEZE	0x4c
>>>>> @@ -164,34 +160,6 @@ static struct delay_timer tegra_delay_timer = {
>>>>>  };
>>>>>  #endif
>>>>>  
>>>>> -static struct timer_of suspend_rtc_to = {
>>>>> -	.flags = TIMER_OF_BASE | TIMER_OF_CLOCK,
>>>>> -};
>>>>> -
>>>>> -/*
>>>>> - * tegra_rtc_read - Reads the Tegra RTC registers
>>>>> - * Care must be taken that this function is not called while the
>>>>> - * tegra_rtc driver could be executing to avoid race conditions
>>>>> - * on the RTC shadow register
>>>>> - */
>>>>> -static u64 tegra_rtc_read_ms(struct clocksource *cs)
>>>>> -{
>>>>> -	void __iomem *reg_base = timer_of_base(&suspend_rtc_to);
>>>>> -
>>>>> -	u32 ms = readl_relaxed(reg_base + RTC_MILLISECONDS);
>>>>> -	u32 s = readl_relaxed(reg_base + RTC_SHADOW_SECONDS);
>>>>> -
>>>>> -	return (u64)s * MSEC_PER_SEC + ms;
>>>>> -}
>>>>> -
>>>>> -static struct clocksource suspend_rtc_clocksource = {
>>>>> -	.name	= "tegra_suspend_timer",
>>>>> -	.rating	= 200,
>>>>> -	.read	= tegra_rtc_read_ms,
>>>>> -	.mask	= CLOCKSOURCE_MASK(32),
>>>>> -	.flags	= CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
>>>>> -};
>>>>> -
>>>>>  static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20)
>>>>>  {
>>>>>  	if (tegra20) {
>>>>> @@ -385,15 +353,3 @@ static int __init tegra20_init_timer(struct device_node *np)
>>>>>  	return tegra_init_timer(np, true, rating);
>>>>>  }
>>>>>  TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
>>>>> -
>>>>> -static int __init tegra20_init_rtc(struct device_node *np)
>>>>> -{
>>>>> -	int ret;
>>>>> -
>>>>> -	ret = timer_of_init(np, &suspend_rtc_to);
>>>>> -	if (ret)
>>>>> -		return ret;
>>>>> -
>>>>> -	return clocksource_register_hz(&suspend_rtc_clocksource, 1000);
>>>>> -}
>>>>> -TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
>>>>> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
>>>>> index 8fa1b3febf69..6da54264a27a 100644
>>>>> --- a/drivers/rtc/rtc-tegra.c
>>>>> +++ b/drivers/rtc/rtc-tegra.c
>>>>> @@ -6,6 +6,7 @@
>>>>>   */
>>>>>  
>>>>>  #include <linux/clk.h>
>>>>> +#include <linux/clocksource.h>
>>>>>  #include <linux/delay.h>
>>>>>  #include <linux/init.h>
>>>>>  #include <linux/io.h>
>>>>> @@ -52,8 +53,15 @@ struct tegra_rtc_info {
>>>>>  	struct clk *clk;
>>>>>  	int irq; /* alarm and periodic IRQ */
>>>>>  	spinlock_t lock;
>>>>> +
>>>>> +	struct clocksource clksrc;
>>>>>  };
>>>>>  
>>>>> +static struct tegra_rtc_info *to_tegra_rtc(struct clocksource *clksrc)
>>>>> +{
>>>>> +	return container_of(clksrc, struct tegra_rtc_info, clksrc);
>>>>> +}
>>>>> +
>>>>>  /*
>>>>>   * RTC hardware is busy when it is updating its values over AHB once every
>>>>>   * eight 32 kHz clocks (~250 us). Outside of these updates the CPU is free to
>>>>> @@ -268,6 +276,17 @@ static const struct rtc_class_ops tegra_rtc_ops = {
>>>>>  	.alarm_irq_enable = tegra_rtc_alarm_irq_enable,
>>>>>  };
>>>>>  
>>>>> +static u64 tegra_rtc_read_ms(struct clocksource *clksrc)
>>>>> +{
>>>>> +	struct tegra_rtc_info *info = to_tegra_rtc(clksrc);
>>>>> +	u32 ms, s;
>>>>> +
>>>>> +	ms = readl_relaxed(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
>>>>> +	s = readl_relaxed(info->base + TEGRA_RTC_REG_SHADOW_SECONDS);
>>>>> +
>>>>> +	return (u64)s * MSEC_PER_SEC + ms;
>>>>> +}
>>>>> +
>>>>>  static const struct of_device_id tegra_rtc_dt_match[] = {
>>>>>  	{ .compatible = "nvidia,tegra20-rtc", },
>>>>>  	{}
>>>>> @@ -339,6 +358,28 @@ static int tegra_rtc_probe(struct platform_device *pdev)
>>>>>  		goto disable_clk;
>>>>>  	}
>>>>>  
>>>>> +	/*
>>>>> +	 * The Tegra RTC is the only reliable clock source that persists
>>>>> +	 * across an SC7 transition (VDD_CPU and VDD_CORE off) on Tegra210
>>>>> +	 * and earlier. Starting with Tegra186, the ARM v8 architected timer
>>>>> +	 * is in an always on power partition and its reference clock keeps
>>>>> +	 * running during SC7. Therefore, we technically don't need to have
>>>>> +	 * the RTC register as a clock source on Tegra186 and later, but it
>>>>> +	 * doesn't hurt either, so we just register it unconditionally here.
>>>>> +	 */
>>>>> +	info->clksrc.name = "tegra_rtc";
>>>>> +	info->clksrc.rating = 200;
>>>>> +	info->clksrc.read = tegra_rtc_read_ms;
>>>>> +	info->clksrc.mask = CLOCKSOURCE_MASK(32);
>>>>
>>>> Hm.. shouldn't this be CLOCKSOURCE_MASK(52)? Given that there are 32 bits for seconds and
>>>> 10bits for milliseconds.
>>>
>>> Did you mean to say CLOCKSOURCE_MASK(42)? Yeah, that's probably better
>>> here.
>>
>> Yes, 42 :)
> 
> I'm wondering if that could perhaps be a little problematic because
> we're not actually using all of the 10 bits for the milliseconds. So the
> maximum value that we can return is:
> 
> 	4294967296 * 1000 + 999 = 4294967296999
> 
> However, the maximum value for a 42 bit mask is:
> 
> 	2^42 - 1 = 4398046511103
> 
> That mask is only used in order to wrap around in delta computations. So
> I can imagine a situation where we'd end up with a wrong value in the
> delta. I suppose this can only really happen if the two samples are very
> far apart in time, so maybe this isn't worth worrying about.

I'm a bit puzzled now. Looks problematic that wraparound will happen unexpectedly for
the timekeeping. Although please bare in mind that I'm not expert in the area of
timekeeping, actually I know very little about it.

Maybe tegra_rtc_read_ms() should track wraparound case itself and return a
monotonically incrementing value?

static u64 tegra_rtc_read_ms(struct clocksource *clksrc)
{
	struct tegra_rtc_info *info = to_tegra_rtc(clksrc);
	u64 ms, s, now;

	ms = readl_relaxed(info->base + TEGRA_RTC_REG_MILLI_SECONDS);
	s = readl_relaxed(info->base + TEGRA_RTC_REG_SHADOW_SECONDS);

	now = s * MSEC_PER_SEC + ms;

	if (now < info->last)
		info->ms_cnt += 0x3e8000003e8ull - info->last + now;
	else
		info->ms_cnt += now - info->last;

	info->last = now;

	return info->ms_cnt;
}

and then simply CLOCKSOURCE_MASK(64).
