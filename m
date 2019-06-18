From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 3/6] clocksource/drivers/tegra: Set and use timer's
 period
Date: Tue, 18 Jun 2019 09:40:25 +0100
Message-ID: <b92383e6-31e4-0797-1e7a-76410ebfba6c@nvidia.com>
References: <20190610164400.11830-1-digetx@gmail.com>
 <20190610164400.11830-4-digetx@gmail.com>
 <ac8a1da8-9b82-3d5a-5fa6-0c1cc7f627f1@nvidia.com>
 <3e941c50-ac62-719e-aac1-7072e9a3bcd0@gmail.com>
 <660f3645-3fa6-175c-75a6-3fcc79e972ad@nvidia.com>
 <e0e1b708-7dd4-a58a-7906-05bf3065cbda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e0e1b708-7dd4-a58a-7906-05bf3065cbda@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 17/06/2019 15:04, Dmitry Osipenko wrote:
> 17.06.2019 13:51, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 14/06/2019 17:45, Dmitry Osipenko wrote:
>>> 14.06.2019 18:48, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>
>>>> On 10/06/2019 17:43, Dmitry Osipenko wrote:
>>>>> The of_clk structure has a period field that is set up initially by
>>>>> timer_of_clk_init(), that period value need to be adjusted for a case=
 of
>>>>> TIMER1-9 that are running at a fixed rate that doesn't match the cloc=
k's
>>>>> rate. Note that the period value is currently used only by some of th=
e
>>>>> clocksource drivers internally and hence this is just a minor cleanup
>>>>> change that doesn't fix anything.
>>>>>
>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> ---
>>>>>  drivers/clocksource/timer-tegra.c | 5 +++--
>>>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/=
timer-tegra.c
>>>>> index 810b4e7435cf..646b3530c2d2 100644
>>>>> --- a/drivers/clocksource/timer-tegra.c
>>>>> +++ b/drivers/clocksource/timer-tegra.c
>>>>> @@ -71,9 +71,9 @@ static int tegra_timer_shutdown(struct clock_event_=
device *evt)
>>>>>  static int tegra_timer_set_periodic(struct clock_event_device *evt)
>>>>>  {
>>>>>  	void __iomem *reg_base =3D timer_of_base(to_timer_of(evt));
>>>>> +	unsigned long period =3D timer_of_period(to_timer_of(evt));
>>>>> =20
>>>>> -	writel_relaxed(TIMER_PTV_EN | TIMER_PTV_PER |
>>>>> -		       ((timer_of_rate(to_timer_of(evt)) / HZ) - 1),
>>>>> +	writel_relaxed(TIMER_PTV_EN | TIMER_PTV_PER | (period - 1),
>>>>>  		       reg_base + TIMER_PTV);
>>>>> =20
>>>>>  	return 0;
>>>>> @@ -297,6 +297,7 @@ static int __init tegra_init_timer(struct device_=
node *np, bool tegra20,
>>>>>  		cpu_to->clkevt.rating =3D rating;
>>>>>  		cpu_to->clkevt.cpumask =3D cpumask_of(cpu);
>>>>>  		cpu_to->of_base.base =3D timer_reg_base + base;
>>>>> +		cpu_to->of_clk.period =3D DIV_ROUND_UP(rate, HZ);
>>>>
>>>> Any reason you made this a round-up?
>>>
>>> That's what timer_of_clk_init() does, I assume it should be a more corr=
ect variant.
>>
>> Sounds to me like this should be 2 patches, because you are changing the
>> value. This is not just purely cleanup IMO.
>=20
> Indeed, that could be at least mentioned in the commit message. Probably =
I just
> assumed that this is such a minor change that not worth anything. A hundr=
ed of
> microseconds is hardly noticeable.
>=20
> I'm not really sure if this really worth a re-spin at this point. Jon, ar=
e you insisting?

At a minimum the changelog needs to be udpated to reflect what is going
on here. Yes it may not be a massive difference, but I prefer not to
change things without any rationale.

Cheers
Jon

--=20
nvpublic
