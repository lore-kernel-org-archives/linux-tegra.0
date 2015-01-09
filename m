From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource: tegra: wrap arch/arm-specific sections in
 CONFIG_ARM
Date: Fri, 09 Jan 2015 14:38:39 +0100
Message-ID: <54AFD9DF.9090205@linaro.org>
References: <alpine.DEB.2.02.1412092201200.31750@utopia.booyaka.com> <54AEB719.5060103@linaro.org> <alpine.DEB.2.02.1501090135280.28771@utopia.booyaka.com> <54AF91CC.2090007@linaro.org> <20150109122120.GJ16465@ulmo> <54AFD688.5000304@linaro.org> <20150109133349.GA27876@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150109133349.GA27876@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, Allen Martin <amartin@nvidia.com>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <treding@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, pwalmsley@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 01/09/2015 02:33 PM, Thierry Reding wrote:
> On Fri, Jan 09, 2015 at 02:24:24PM +0100, Daniel Lezcano wrote:
>> On 01/09/2015 01:21 PM, Thierry Reding wrote:
>>> On Fri, Jan 09, 2015 at 09:31:08AM +0100, Daniel Lezcano wrote:
>>>> On 01/09/2015 03:09 AM, Paul Walmsley wrote:
>>>>> Hello Daniel
>>>>>
>>>>> On Thu, 8 Jan 2015, Daniel Lezcano wrote:
>>>>>
>>>>>> On 12/09/2014 11:07 PM, Paul Walmsley wrote:
>>>>>>>
>>>>>>> Like several of the other files in drivers/clocksource,
>>>>>>> tegra20_timer.c contains code that can only compile when CONFIG=
_ARM is
>>>>>>> enabled.  This causes obvious problems when trying to compile t=
his
>>>>>>> code for NVIDIA ARM64-based SoCs, such as Tegra132.  The same t=
imer IP
>>>>>>> blocks exist, so it seems appropriate to provide support for th=
em.
>>>>>>>
>>>>>>> So until we figure out a better way to partition this code, wra=
p the
>>>>>>> delay_timer and persistent_clock support code with preprocessor=
 tests
>>>>>>> for CONFIG_ARM.
>>>>>>>
>>>>>>>   (The delay_timer code should not be needed at all on
>>>>>>> ARM64 due to the presence of the ARMv8 architected timer.  The
>>>>>>> persistent_clock support code could become important once power
>>>>>>> management modes are implemented that turn off the CPU complex.=
)
>>>>>>
>>>>>> IIUC, the cpuidle driver is not yet ready, right ?
>>>>>>
>>>>>> If it is the case, this driver is not needed yet, no ?
>>>>>
>>>>> The point of the patch is to allow the hardware drivers selected =
by
>>>>> CONFIG_ARCH_TEGRA to build for an arm64 kernel, just as they buil=
d for
>>>>> 32-bit ARM.
>>>>>
>>>>> There's nothing CPUIdle-specific about the patch - that is, this =
timer can
>>>>> be selected as a clockevent and clocksource provider without the =
use of
>>>>> CPUIdle - although low-power PM idle is likely to be a primary us=
e-case.
>>>>
>>>> What I meant is this timer is not needed for the moment.
>>>>
>>>>>> Perhaps you can rework a bit this driver in the meantime to have=
 a better fix
>>>>>> than disabling the code with macros ?
>>>>>
>>>>> I'm happy to do that, but it would be nice to get the driver comp=
iling
>>>>> first for ARM64 :-)
>>>>>
>>>>>> Otherwise, please try at least to group the code into a minimal =
set of macros.
>>>>>
>>>>> So, would it be accurate to say that you would prefer a patch tha=
t changes
>>>>> more lines of code, but minimizes preprocessor directives, to the=
 current
>>>>> patch?
>>>>
>>>> Yes at least an attempt to factor out a bit the driver. Those #ifd=
ef are
>>>> like #if 0, which is a quick fix. I am not strongly against this p=
atch, but
>>>> it would be nice to take the opportunity to reorganize it a bit.
>>>
>>> How about we do something like the attached patch instead for now. =
That
>>> avoids any #ifdef'ery and still we don't attempt (and fail) to buil=
d the
>>> driver on 64-bit ARM.
>>>
>>> With that applied we can incrementally make the changes to untangle=
 the
>>> ARM-specific parts and when the driver can build on 64-bit ARM we s=
imply
>>> select TEGRA_TIMER via Kconfig.
>>
>> Yes, that is exactly what I was thinking about after sending the pre=
vious
>> email. And by this way, you also fixed the Kconfig option selection =
logic.
>
> Great. Will you give your Acked-by so that I can take that patch thro=
ugh
> the Tegra tree to resolve the build dependency?

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
