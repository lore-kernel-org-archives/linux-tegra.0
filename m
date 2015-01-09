From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clocksource: tegra: wrap arch/arm-specific sections in
 CONFIG_ARM
Date: Fri, 09 Jan 2015 14:24:24 +0100
Message-ID: <54AFD688.5000304@linaro.org>
References: <alpine.DEB.2.02.1412092201200.31750@utopia.booyaka.com> <54AEB719.5060103@linaro.org> <alpine.DEB.2.02.1501090135280.28771@utopia.booyaka.com> <54AF91CC.2090007@linaro.org> <20150109122120.GJ16465@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150109122120.GJ16465@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/09/2015 01:21 PM, Thierry Reding wrote:
> On Fri, Jan 09, 2015 at 09:31:08AM +0100, Daniel Lezcano wrote:
>> On 01/09/2015 03:09 AM, Paul Walmsley wrote:
>>> Hello Daniel
>>>
>>> On Thu, 8 Jan 2015, Daniel Lezcano wrote:
>>>
>>>> On 12/09/2014 11:07 PM, Paul Walmsley wrote:
>>>>>
>>>>> Like several of the other files in drivers/clocksource,
>>>>> tegra20_timer.c contains code that can only compile when CONFIG_A=
RM is
>>>>> enabled.  This causes obvious problems when trying to compile thi=
s
>>>>> code for NVIDIA ARM64-based SoCs, such as Tegra132.  The same tim=
er IP
>>>>> blocks exist, so it seems appropriate to provide support for them=
=2E
>>>>>
>>>>> So until we figure out a better way to partition this code, wrap =
the
>>>>> delay_timer and persistent_clock support code with preprocessor t=
ests
>>>>> for CONFIG_ARM.
>>>>>
>>>>>   (The delay_timer code should not be needed at all on
>>>>> ARM64 due to the presence of the ARMv8 architected timer.  The
>>>>> persistent_clock support code could become important once power
>>>>> management modes are implemented that turn off the CPU complex.)
>>>>
>>>> IIUC, the cpuidle driver is not yet ready, right ?
>>>>
>>>> If it is the case, this driver is not needed yet, no ?
>>>
>>> The point of the patch is to allow the hardware drivers selected by
>>> CONFIG_ARCH_TEGRA to build for an arm64 kernel, just as they build =
for
>>> 32-bit ARM.
>>>
>>> There's nothing CPUIdle-specific about the patch - that is, this ti=
mer can
>>> be selected as a clockevent and clocksource provider without the us=
e of
>>> CPUIdle - although low-power PM idle is likely to be a primary use-=
case.
>>
>> What I meant is this timer is not needed for the moment.
>>
>>>> Perhaps you can rework a bit this driver in the meantime to have a=
 better fix
>>>> than disabling the code with macros ?
>>>
>>> I'm happy to do that, but it would be nice to get the driver compil=
ing
>>> first for ARM64 :-)
>>>
>>>> Otherwise, please try at least to group the code into a minimal se=
t of macros.
>>>
>>> So, would it be accurate to say that you would prefer a patch that =
changes
>>> more lines of code, but minimizes preprocessor directives, to the c=
urrent
>>> patch?
>>
>> Yes at least an attempt to factor out a bit the driver. Those #ifdef=
 are
>> like #if 0, which is a quick fix. I am not strongly against this pat=
ch, but
>> it would be nice to take the opportunity to reorganize it a bit.
>
> How about we do something like the attached patch instead for now. Th=
at
> avoids any #ifdef'ery and still we don't attempt (and fail) to build =
the
> driver on 64-bit ARM.
>
> With that applied we can incrementally make the changes to untangle t=
he
> ARM-specific parts and when the driver can build on 64-bit ARM we sim=
ply
> select TEGRA_TIMER via Kconfig.

Yes, that is exactly what I was thinking about after sending the=20
previous email. And by this way, you also fixed the Kconfig option=20
selection logic.


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
