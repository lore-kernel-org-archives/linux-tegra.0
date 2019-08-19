From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v9 20/22] soc/tegra: pmc: Configure deep sleep control
 settings
Date: Mon, 19 Aug 2019 12:07:50 -0700
Message-ID: <a8d65dbc-6924-c972-06e9-5bc47d66e94f@nvidia.com>
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
 <1565984527-5272-21-git-send-email-skomatineni@nvidia.com>
 <bf5541d2-1bad-8a8c-fd9d-821b55861136@gmail.com>
 <2092e557-06cb-4a74-fe40-1d83bf67ccca@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2092e557-06cb-4a74-fe40-1d83bf67ccca@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 8/19/19 11:20 AM, Sowjanya Komatineni wrote:
>
> On 8/19/19 9:48 AM, Dmitry Osipenko wrote:
>> 16.08.2019 22:42, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> Tegra210 and prior Tegra chips have deep sleep entry and wakeup related
>>> timings which are platform specific that should be configured before
>>> entering into deep sleep.
>>>
>>> Below are the timing specific configurations for deep sleep entry and
>>> wakeup.
>>> - Core rail power-on stabilization timer
>>> - OSC clock stabilization timer after SOC rail power is stabilized.
>>> - Core power off time is the minimum wake delay to keep the system
>>> =C2=A0=C2=A0 in deep sleep state irrespective of any quick wake event.
>>>
>>> These values depends on the discharge time of regulators and turn OFF
>>> time of the PMIC to allow the complete system to finish entering into
>>> deep sleep state.
>>>
>>> These values vary based on the platform design and are specified
>>> through the device tree.
>>>
>>> This patch has implementation to configure these timings which are must
>>> to have for proper deep sleep and wakeup operations.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>> =C2=A0 drivers/soc/tegra/pmc.c | 14 +++++++++++++-
>>> =C2=A0 1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>> index 53ed70773872..710969043668 100644
>>> --- a/drivers/soc/tegra/pmc.c
>>> +++ b/drivers/soc/tegra/pmc.c
>>> @@ -88,6 +88,8 @@
>>> =C2=A0 =C2=A0 #define PMC_CPUPWRGOOD_TIMER=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0xc8
>>> =C2=A0 #define PMC_CPUPWROFF_TIMER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0xcc
>>> +#define PMC_COREPWRGOOD_TIMER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x3c
>>> +#define PMC_COREPWROFF_TIMER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0xe0
>>> =C2=A0 =C2=A0 #define PMC_PWR_DET_VALUE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0xe4
>>> =C2=A0 @@ -2277,7 +2279,7 @@ static const struct tegra_pmc_regs=20
>>> tegra20_pmc_regs =3D {
>>> =C2=A0 =C2=A0 static void tegra20_pmc_init(struct tegra_pmc *pmc)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 u32 value;
>>> +=C2=A0=C2=A0=C2=A0 u32 value, osc, pmu, off;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Always enable CPU power reques=
t */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D tegra_pmc_readl(pmc, PMC_CNTRL=
);
>>> @@ -2303,6 +2305,16 @@ static void tegra20_pmc_init(struct tegra_pmc=20
>>> *pmc)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D tegra_pmc_readl(pmc, PMC_CNTRL=
);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D PMC_CNTRL_SYSCLK_OE;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* program core timings which are applicable only f=
or suspend=20
>>> state */
>>> +=C2=A0=C2=A0=C2=A0 if (pmc->suspend_mode !=3D TEGRA_SUSPEND_NONE) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 osc =3D DIV_ROUND_UP(pmc->c=
ore_osc_time * 8192, 1000000);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmu =3D DIV_ROUND_UP(pmc->c=
ore_pmu_time * 32768, 1000000);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 off =3D DIV_ROUND_UP(pmc->c=
ore_off_time * 32768, 1000000);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, ((osc=
 << 8) & 0xff00) | (pmu & 0xff),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 PMC_COREPWRGOOD_TIMER);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, off, =
PMC_COREPWROFF_TIMER);
>>> +=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 }
>>> =C2=A0 =C2=A0 static void tegra20_pmc_setup_irq_polarity(struct tegra_p=
mc *pmc,
>>>
>> In the previous version of this patch there were checks for zero values
>> of the timers with intention to skip programming of the timers if value
>> is zero. I'm a bit puzzled by the new version, given that SUSPEND_NONE
>> means that suspending isn't available at all and thus PMC timers won't
>> be utilized, hence it shouldn't matter what values are programmed for
>> the counters, isn't it?
>
> Yes, as I see in documentation we already specify all these timings=20
> are required properties when suspend mode is used, I updated in this=20
> version to program core timings only when suspend mode is enabled.
>
In other words, core timings are for SC7 entry only. So when SC7/suspend=20
mode is not used, these timings doesn't matter.
