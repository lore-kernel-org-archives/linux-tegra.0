From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V5 2/7] clocksource: tegra: add Tegra210 timer support
Date: Fri, 1 Feb 2019 15:43:50 +0000
Message-ID: <ab418999-a45c-bd9c-b9bd-5c382e86d26c@nvidia.com>
References: <20190201033621.16814-1-josephl@nvidia.com>
 <20190201033621.16814-3-josephl@nvidia.com>
 <5490ad66-7d20-7093-7025-1d0ec8da6dec@nvidia.com>
 <3c9b86ba-32dd-76b2-9a51-6cd86782cadf@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3c9b86ba-32dd-76b2-9a51-6cd86782cadf@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 01/02/2019 14:39, Joseph Lo wrote:
> On 2/1/19 8:44 PM, Jon Hunter wrote:
>>
>> On 01/02/2019 03:36, Joseph Lo wrote:
>>> Add support for the Tegra210 timer that runs at oscillator clock
>>> (TMR10-TMR13). We need these timers to work as clock event device and t=
o
>>> replace the ARMv8 architected timer due to it can't survive across the
>>> power cycle of the CPU core or CPUPORESET signal. So it can't be a
>>> wake-up
>>> source when CPU suspends in power down state.
>>>
>>> Also convert the original driver to use timer-of API.
>>
>> It may have been nice to split this into 2 patches to make it easier to
>> see what is going on but not a big deal.
>>
>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>> Cc: linux-kernel@vger.kernel.org
>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>> v5:
>>> =C2=A0 * add ack tag from Thierry
>>> v4:
>>> =C2=A0 * merge timer-tegra210.c in previous version into timer-tegra20.=
c
>>> v3:
>>> =C2=A0 * use timer-of API
>>> v2:
>>> =C2=A0 * add error clean-up code
>>> ---
>>> =C2=A0 drivers/clocksource/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>> =C2=A0 drivers/clocksource/timer-tegra20.c | 369 ++++++++++++++++++++--=
------
>>> =C2=A0 include/linux/cpuhotplug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0 3 files changed, 272 insertions(+), 100 deletions(-)
>>>
>>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>>> index a9e26f6a81a1..6af78534a285 100644
>>> --- a/drivers/clocksource/Kconfig
>>> +++ b/drivers/clocksource/Kconfig
>>> @@ -131,7 +131,7 @@ config SUN5I_HSTIMER
>>> =C2=A0 config TEGRA_TIMER
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "Tegra timer driver" if COMPILE_TES=
T
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select CLKSRC_MMIO
>>> -=C2=A0=C2=A0=C2=A0 depends on ARM
>>> +=C2=A0=C2=A0=C2=A0 select TIMER_OF
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enables support for the Tegr=
a driver.
>>> =C2=A0 diff --git a/drivers/clocksource/timer-tegra20.c
>>> b/drivers/clocksource/timer-tegra20.c
>>> index 4293943f4e2b..96a809341c9b 100644
>>> --- a/drivers/clocksource/timer-tegra20.c
>>> +++ b/drivers/clocksource/timer-tegra20.c
>>> @@ -15,21 +15,24 @@
>>> =C2=A0=C2=A0 *
>>> =C2=A0=C2=A0 */
>>> =C2=A0 -#include <linux/init.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/clockchips.h>
>>> +#include <linux/cpu.h>
>>> +#include <linux/cpumask.h>
>>> +#include <linux/delay.h>
>>> =C2=A0 #include <linux/err.h>
>>> -#include <linux/time.h>
>>> =C2=A0 #include <linux/interrupt.h>
>>> -#include <linux/irq.h>
>>> -#include <linux/clockchips.h>
>>> -#include <linux/clocksource.h>
>>> -#include <linux/clk.h>
>>> -#include <linux/io.h>
>>> =C2=A0 #include <linux/of_address.h>
>>> =C2=A0 #include <linux/of_irq.h>
>>> -#include <linux/sched_clock.h>
>>> -#include <linux/delay.h>
>>> +#include <linux/percpu.h>
>>> +#include <linux/syscore_ops.h>
>>> +#include <linux/time.h>
>>> +
>>> +#include "timer-of.h"
>>> =C2=A0 +#ifdef CONFIG_ARM
>>> =C2=A0 #include <asm/mach/time.h>
>>> +#endif
>>> =C2=A0 =C2=A0 #define RTC_SECONDS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08
>>> =C2=A0 #define RTC_SHADOW_SECONDS=C2=A0=C2=A0=C2=A0=C2=A0 0x0c
>>> @@ -43,70 +46,147 @@
>>> =C2=A0 #define TIMER2_BASE 0x8
>>> =C2=A0 #define TIMER3_BASE 0x50
>>> =C2=A0 #define TIMER4_BASE 0x58
>>> -
>>> -#define TIMER_PTV 0x0
>>> -#define TIMER_PCR 0x4
>>> -
>>> +#define TIMER10_BASE 0x90
>>> +
>>> +#define TIMER_PTV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0
>>> +#define TIMER_PTV_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(31)
>>> +#define TIMER_PTV_PER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(30=
)
>>> +#define TIMER_PCR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x4
>>> +#define TIMER_PCR_INTR_CLR=C2=A0=C2=A0=C2=A0 BIT(30)
>>> +
>>> +#ifdef CONFIG_ARM
>>> +#define TIMER_BASE TIMER3_BASE
>>> +#else
>>> +#define TIMER_BASE TIMER10_BASE
>>> +#endif
>>> +#define TIMER10_IRQ_IDX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10
>>> +#define TIMER_FOR_CPU(cpu) (TIMER_BASE + (cpu) * 8)
>>> +#define IRQ_IDX_FOR_CPU(cpu)=C2=A0=C2=A0=C2=A0 (TIMER10_IRQ_IDX + cpu)
>>
>> TIMER10_IRQ_IDX and IRQ_IDX_FOR_CPU are only applicable to ARM64 and so
>> we should probably not defined for ARM to avoid any confusion.
> Okay, will do.
>>
>> Furthermore, a lot of these TIMERx_BASE definitions are unused AFAICT.
>> Would be good to get rid of these.
>=20
> Okay.
>>
>> Maybe we could just have ...
>>
>> =C2=A0 +#ifdef CONFIG_ARM
>> =C2=A0 +#define TIMER_CPU0 3
>> =C2=A0 +#else
>> =C2=A0 +#define TIMER_CPU0 10
>> =C2=A0 +#endif
>> =C2=A0 +#define TIMER_BASE_FOR_CPU(cpu) ((TIMER_CPU0 + cpu) * 8)
>> =C2=A0 +#define TIMER_FOR_CPU(cpu) (TIMER_CPU0 + cpu)
>>
> This can't get the timer base address. I think you mean ...
>=20
> +#ifdef CONFIG_ARM
> +#define TIMER_CPU0 0x50 /* TIMER3 */
> +#else
> +#define TIMER_CPU0 0x90 /* TIMER10 */
> +#endif
> +#define TIMER_BASE_FOR_CPU(cpu) (TIMER_CPU0 + (cpu) * 8)

Ah I see.

> This doesn't need.
> +#define TIMER_FOR_CPU(cpu) (TIMER_CPU0 + cpu)
How come? Don't you still need to know the timer index for a given CPU?

Cheers
Jon

--=20
nvpublic
