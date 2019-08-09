From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v8 19/21] soc/tegra: pmc: Configure deep sleep control
 settings
Date: Fri, 9 Aug 2019 09:23:20 -0700
Message-ID: <275f3685-bc53-38ff-c778-cf2ea588e5a5@nvidia.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-20-git-send-email-skomatineni@nvidia.com>
 <57ed54cd-bf57-cab1-eb63-8548761640de@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57ed54cd-bf57-cab1-eb63-8548761640de@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 8/9/19 6:23 AM, Dmitry Osipenko wrote:
> 09.08.2019 2:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Tegra210 and prior Tegra chips have deep sleep entry and wakeup related
>> timings which are platform specific that should be configured before
>> entering into deep sleep.
>>
>> Below are the timing specific configurations for deep sleep entry and
>> wakeup.
>> - Core rail power-on stabilization timer
>> - OSC clock stabilization timer after SOC rail power is stabilized.
>> - Core power off time is the minimum wake delay to keep the system
>>    in deep sleep state irrespective of any quick wake event.
>>
>> These values depends on the discharge time of regulators and turn OFF
>> time of the PMIC to allow the complete system to finish entering into
>> deep sleep state.
>>
>> These values vary based on the platform design and are specified
>> through the device tree.
>>
>> This patch has implementation to configure these timings which are must
>> to have for proper deep sleep and wakeup operations.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/soc/tegra/pmc.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index e013ada7e4e9..9a78d8417367 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -88,6 +88,8 @@
>>  =20
>>   #define PMC_CPUPWRGOOD_TIMER		0xc8
>>   #define PMC_CPUPWROFF_TIMER		0xcc
>> +#define PMC_COREPWRGOOD_TIMER		0x3c
>> +#define PMC_COREPWROFF_TIMER		0xe0
>>  =20
>>   #define PMC_PWR_DET_VALUE		0xe4
>>  =20
>> @@ -2277,7 +2279,7 @@ static const struct tegra_pmc_regs tegra20_pmc_reg=
s =3D {
>>  =20
>>   static void tegra20_pmc_init(struct tegra_pmc *pmc)
>>   {
>> -	u32 value;
>> +	u32 value, osc, pmu, off;
>>  =20
>>   	/* Always enable CPU power request */
>>   	value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
>> @@ -2303,6 +2305,15 @@ static void tegra20_pmc_init(struct tegra_pmc *pm=
c)
>>   	value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
>>   	value |=3D PMC_CNTRL_SYSCLK_OE;
>>   	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>> +
>> +	osc =3D DIV_ROUND_UP(pmc->core_osc_time * 8192, 1000000);
>> +	pmu =3D DIV_ROUND_UP(pmc->core_pmu_time * 32768, 1000000);
>> +	off =3D DIV_ROUND_UP(pmc->core_off_time * 32768, 1000000);
>> +	if (osc && pmu)
>> +		tegra_pmc_writel(pmc, ((osc << 8) & 0xff00) | (pmu & 0xff),
>> +				 PMC_COREPWRGOOD_TIMER);
>> +	if (off)
>> +		tegra_pmc_writel(pmc, off, PMC_COREPWROFF_TIMER);
> The osc/pmu/off values are undefined if they are not defined in device-tr=
ee. I suppose this
> need to be corrected in tegra_pmc_parse_dt() if the values really matter =
even if LP0 suspend
> isn't supported in device-tree.
>
> And I'm also not sure what's wrong with setting 0 for the timers.
>
These settings are for SC7 only and will not have any impact in normal=20
state.
>>   }
>>  =20
>>   static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
>>
