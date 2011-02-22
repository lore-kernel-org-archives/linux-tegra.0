From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 5/7] ARM: tegra: timer: Enable timer and rtc clocks
Date: Tue, 22 Feb 2011 07:28:29 -0800
Message-ID: <AANLkTi=Z=WRUaYY4H3JXxNtmQYHDu=p+SAU-QNFMbMuf@mail.gmail.com>
References: <1298342392-21236-1-git-send-email-ccross@android.com>
	<1298342392-21236-6-git-send-email-ccross@android.com>
	<AANLkTim=TZaqZFSJwOAN2gntvu=fiHVPQVn12=WyF9Wi@mail.gmail.com>
	<AANLkTi=pJw7oTUY2jmaSB=chds0fXFaA3+jrT=y8Jpzv@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=pJw7oTUY2jmaSB=chds0fXFaA3+jrT=y8Jpzv-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 22, 2011 at 12:00 AM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrot=
e:
> On Mon, Feb 21, 2011 at 9:32 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrot=
e:
>> Hi,
>>
>>
>> On Mon, Feb 21, 2011 at 6:39 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wr=
ote:
>>> Enable the timer and rtc clocks to prevent them being
>>> turned off by the bootloader clock disabling code.
>>>
>>> Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>> =A0arch/arm/mach-tegra/timer.c | =A0 14 ++++++++++++--
>>> =A01 files changed, 12 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-tegra/timer.c b/arch/arm/mach-tegra/time=
r.c
>>> index ffa6a68..31b4f56 100644
>>> --- a/arch/arm/mach-tegra/timer.c
>>> +++ b/arch/arm/mach-tegra/timer.c
>>> @@ -18,6 +18,7 @@
>>> =A0*/
>>>
>>> =A0#include <linux/init.h>
>>> +#include <linux/err.h>
>>> =A0#include <linux/sched.h>
>>> =A0#include <linux/time.h>
>>> =A0#include <linux/interrupt.h>
>>> @@ -193,9 +194,20 @@ static struct irqaction tegra_timer_irq =3D {
>>>
>>> =A0static void __init tegra_init_timer(void)
>>> =A0{
>>> + =A0 =A0 =A0 struct clk *clk;
>>> =A0 =A0 =A0 =A0unsigned long rate =3D clk_measure_input_freq();
>>> =A0 =A0 =A0 =A0int ret;
>>>
>>> + =A0 =A0 =A0 clk =3D clk_get_sys("timer", NULL);
>>> + =A0 =A0 =A0 BUG_ON(IS_ERR(clk));
>>> + =A0 =A0 =A0 clk_enable(clk);
>>> + =A0 =A0 =A0 clk_put(clk);
>>> +
>>> + =A0 =A0 =A0 clk =3D clk_get_sys("rtc-tegra", NULL);
>>> + =A0 =A0 =A0 BUG_ON(IS_ERR(clk));
>>> + =A0 =A0 =A0 clk_enable(clk);
>>> + =A0 =A0 =A0 clk_put(clk);
>>
>> Why initialize the rtc clock here? Not all boards use it and instead
>> use the rtc on the pmic. Seems wasteful to clock it unless the drive=
r
>> for it is probed and configured.
>
> timekeeping_suspend uses read_persistent_clock and not the RTC driver
> to track time in suspend. =A0The Tegra implementation of
> read_persistent_clock reads from the internal RTC registers. =A0Its a=
 32
> kHz clock, so it's power usage is negligible, and it is required on
> all Tegra boards.

Ah, right. A short comment to that effect near the clock enablement
would be useful, but other than that:

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
