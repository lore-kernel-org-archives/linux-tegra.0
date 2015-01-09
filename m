From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource: tegra: wrap arch/arm-specific sections in
 CONFIG_ARM
Date: Fri, 09 Jan 2015 09:31:08 +0100
Message-ID: <54AF91CC.2090007@linaro.org>
References: <alpine.DEB.2.02.1412092201200.31750@utopia.booyaka.com> <54AEB719.5060103@linaro.org> <alpine.DEB.2.02.1501090135280.28771@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1501090135280.28771@utopia.booyaka.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul@pwsan.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, Allen Martin <amartin@nvidia.com>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, pwalmsley@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 01/09/2015 03:09 AM, Paul Walmsley wrote:
> Hello Daniel
>
> On Thu, 8 Jan 2015, Daniel Lezcano wrote:
>
>> On 12/09/2014 11:07 PM, Paul Walmsley wrote:
>>>
>>> Like several of the other files in drivers/clocksource,
>>> tegra20_timer.c contains code that can only compile when CONFIG_ARM=
 is
>>> enabled.  This causes obvious problems when trying to compile this
>>> code for NVIDIA ARM64-based SoCs, such as Tegra132.  The same timer=
 IP
>>> blocks exist, so it seems appropriate to provide support for them.
>>>
>>> So until we figure out a better way to partition this code, wrap th=
e
>>> delay_timer and persistent_clock support code with preprocessor tes=
ts
>>> for CONFIG_ARM.
>>>
>>>   (The delay_timer code should not be needed at all on
>>> ARM64 due to the presence of the ARMv8 architected timer.  The
>>> persistent_clock support code could become important once power
>>> management modes are implemented that turn off the CPU complex.)
>>
>> IIUC, the cpuidle driver is not yet ready, right ?
>>
>> If it is the case, this driver is not needed yet, no ?
>
> The point of the patch is to allow the hardware drivers selected by
> CONFIG_ARCH_TEGRA to build for an arm64 kernel, just as they build fo=
r
> 32-bit ARM.
>
> There's nothing CPUIdle-specific about the patch - that is, this time=
r can
> be selected as a clockevent and clocksource provider without the use =
of
> CPUIdle - although low-power PM idle is likely to be a primary use-ca=
se.

What I meant is this timer is not needed for the moment.

>> Perhaps you can rework a bit this driver in the meantime to have a b=
etter fix
>> than disabling the code with macros ?
>
> I'm happy to do that, but it would be nice to get the driver compilin=
g
> first for ARM64 :-)
>
>> Otherwise, please try at least to group the code into a minimal set =
of macros.
>
> So, would it be accurate to say that you would prefer a patch that ch=
anges
> more lines of code, but minimizes preprocessor directives, to the cur=
rent
> patch?

Yes at least an attempt to factor out a bit the driver. Those #ifdef ar=
e=20
like #if 0, which is a quick fix. I am not strongly against this patch,=
=20
but it would be nice to take the opportunity to reorganize it a bit.

>> One comment below.
>
>>> diff --git a/drivers/clocksource/tegra20_timer.c
>>> b/drivers/clocksource/tegra20_timer.c
>>> index d2616ef16770..83a8f5c9e139 100644
>>> --- a/drivers/clocksource/tegra20_timer.c
>>> +++ b/drivers/clocksource/tegra20_timer.c
>>> @@ -29,8 +29,10 @@
>>>    #include <linux/sched_clock.h>
>>>    #include <linux/delay.h>
>>>
>>> +#ifdef CONFIG_ARM
>>>    #include <asm/mach/time.h>
>>>    #include <asm/smp_twd.h>
>>
>> Is smp_twd.h really needed ?
>>
>>> +#endif
>
> No, it can be removed.
>
> Would you be willing to ack or merge a revision of this patch with
>
> 1. the #include <asm/smp_twd.h> removed
>
> 2. a larger number of changed lines, in order to minimize the number =
of
> new #ifdefs?

Yes.

Thanks

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
