From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: tegra: clock: Disable clocks left on by bootloader
Date: Tue, 22 Feb 2011 00:05:03 -0800
Message-ID: <AANLkTi==wykFCCjamRNh2ngEaubgeLqmZ7Mv9OsH=0cL@mail.gmail.com>
References: <1298342392-21236-1-git-send-email-ccross@android.com>
	<1298342392-21236-8-git-send-email-ccross@android.com>
	<AANLkTikNSEyjdL0Lchmm-bFxD00omkGLq6Q6Yyjy51Ov@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikNSEyjdL0Lchmm-bFxD00omkGLq6Q6Yyjy51Ov-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 9:43 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Hi,
>
> On Mon, Feb 21, 2011 at 6:39 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wro=
te:
>> Iterates through all clocks, disabling any for which the
>> refcount is 0 but the clock init detected the bootloader
>> left the clock on. =A0Can be disabled with command line
>> tegra_clock.disable_boot_clocks=3DN
>>
>> Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>> ---
>> =A0arch/arm/mach-tegra/clock.c | =A0 44 ++++++++++++++++++++++++++++=
+++++++++++++++
>> =A01 files changed, 44 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock=
=2Ec
>> index e028320..6d686ff 100644
>> --- a/arch/arm/mach-tegra/clock.c
>> +++ b/arch/arm/mach-tegra/clock.c
>> @@ -33,6 +33,9 @@
>> =A0#include "board.h"
>> =A0#include "clock.h"
>>
>> +#undef MODULE_PARAM_PREFIX
>> +#define MODULE_PARAM_PREFIX "tegra_clock."
>> +
>> =A0/*
>> =A0* Locking:
>> =A0*
>> @@ -416,6 +419,47 @@ void tegra_sdmmc_tap_delay(struct clk *c, int d=
elay)
>> =A0 =A0 =A0 =A0spin_unlock_irqrestore(&c->spinlock, flags);
>> =A0}
>>
>> +static bool tegra_disable_boot_clocks =3D true;
>> +module_param_named(disable_boot_clocks, tegra_disable_boot_clocks, =
bool,
>> + =A0 =A0 =A0 S_IRUGO | S_IWUSR | S_IWGRP);
>
> I suggest doing this as an early_param instead. I know it's not truly
> an early param, but it's the easier way to do non-module bootargs,
> i.e. by not requiring a (fake) module prefix. It'd be a little
> cleaner, in my opinion. The variable name itself is unique enough to
> not need a module prefix for namespace reasons.
It doesn't need to be an early_param, I can make it a __setup.

> Also, Documentation/kernel-parameters.txt should be updated with it.
Is it really worth adding every debug flag on every platform to
kernel-parametes.txt?  I could add the flag to the warning message
instead.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
