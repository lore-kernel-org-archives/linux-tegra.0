From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V6 2/7] clocksource: tegra: add Tegra210 timer support
Date: Tue, 19 Feb 2019 17:00:55 +0800
Message-ID: <a9b6e870-258d-492f-1f1d-5d6ceea24795@nvidia.com>
References: <20190201161654.18315-1-josephl@nvidia.com>
 <20190201161654.18315-3-josephl@nvidia.com>
 <3849a41f-ab36-d7e0-b2ce-1aa5c4e34aec@linaro.org>
 <87731d61-10f6-0842-a90f-0c78ffba9ef7@nvidia.com>
 <d2aff40c-5ec5-ad66-0d69-a76cdd6c0e9c@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d2aff40c-5ec5-ad66-0d69-a76cdd6c0e9c@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 2/18/19 5:39 PM, Daniel Lezcano wrote:
> On 18/02/2019 10:01, Joseph Lo wrote:
>> On 2/15/19 11:14 PM, Daniel Lezcano wrote:
>>> On 01/02/2019 17:16, Joseph Lo wrote:
>>>> Add support for the Tegra210 timer that runs at oscillator clock
>>>> (TMR10-TMR13). We need these timers to work as clock event device and =
to
>>>> replace the ARMv8 architected timer due to it can't survive across the
>>>> power cycle of the CPU core or CPUPORESET signal. So it can't be a
>>>> wake-up
>>>> source when CPU suspends in power down state.
>>>>
>>>> Also convert the original driver to use timer-of API.
>>>>
>>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>>>> ---
>>>> v6:
>>>>  =C2=A0 * refine the timer defines
>>>>  =C2=A0 * add ack tag from Jon.
>>>> v5:
>>>>  =C2=A0 * add ack tag from Thierry
>>>> v4:
>>>>  =C2=A0 * merge timer-tegra210.c in previous version into timer-tegra2=
0.c
>>>> v3:
>>>>  =C2=A0 * use timer-of API
>>>> v2:
>>>>  =C2=A0 * add error clean-up code
>>>> ---
[snip]
>>>> +=C2=A0=C2=A0=C2=A0 for_each_possible_cpu(cpu) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct timer_of *cpu_to;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_to =3D per_cpu_ptr(&te=
gra_to, cpu);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_to->of_base.base =3D t=
imer_reg_base +
>>>> TIMER_BASE_FOR_CPU(cpu);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_to->of_clk.rate =3D ti=
mer_of_rate(to);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_to->clkevt.cpumask =3D=
 cpumask_of(cpu);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_to->clkevt.irq =3D
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ir=
q_of_parse_and_map(np, IRQ_IDX_FOR_CPU(cpu));
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!cpu_to->clkevt.irq) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
_err("%s: can't map IRQ for CPU%d\n",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __func__, cpu);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D -EINVAL;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to out;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_set_status_flags(cpu_t=
o->clkevt.irq, IRQ_NOAUTOEN);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D request_irq(cpu_to=
->clkevt.irq, tegra_timer_isr,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_TIMER | IRQF_NOBALANCING,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_to->clkevt.name, &cpu_to->clkevt);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
_err("%s: cannot setup irq %d for CPU%d\n",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 __func__, cpu_to->clkevt.irq, cpu);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D -EINVAL;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 go=
to out_irq;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>
>>> You should configure the timer in the tegra_timer_setup() function
>>> instead of using this cpu loop.
>>>
>>
>> I think I still need to leave 'irq_of_parse_and_map' and 'request_irq'
>> here. Is that ok?
>=20
> Perhaps you can store the np pointer in the private data structure of
> timer-of and let the timer_of API to retrieve the irq in the cpuhp
> callbacks.
>=20
> irq_of_parse_and_map will be called by timer-of.
>=20
> I'm not sure irq_set_status_flags really operates on the irq because it
> is called after request_irq.
>=20

I did some experiments today. The 'irq_of_parse_and_map', 'request_irq'=20
and 'setup_irq' are not able to run in the atomic section that=20
tegra_timer_setup would be triggered in.

So I think I still need to leave the IRQ configuration code here in the=20
loop. Should I move others to 'tegra_timer_setup' or just keep as the=20
same in this patch?

Thanks,
Joseph
