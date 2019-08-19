From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v9 20/22] soc/tegra: pmc: Configure deep sleep control
 settings
Date: Mon, 19 Aug 2019 22:33:49 +0300
Message-ID: <8f5630bd-2869-4f5b-c18d-7ee8326432d6@gmail.com>
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
 <1565984527-5272-21-git-send-email-skomatineni@nvidia.com>
 <bf5541d2-1bad-8a8c-fd9d-821b55861136@gmail.com>
 <2092e557-06cb-4a74-fe40-1d83bf67ccca@nvidia.com>
 <a8d65dbc-6924-c972-06e9-5bc47d66e94f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a8d65dbc-6924-c972-06e9-5bc47d66e94f@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.08.2019 22:07, Sowjanya Komatineni пишет:
> 
> On 8/19/19 11:20 AM, Sowjanya Komatineni wrote:
>>
>> On 8/19/19 9:48 AM, Dmitry Osipenko wrote:
>>> 16.08.2019 22:42, Sowjanya Komatineni пишет:
>>>> Tegra210 and prior Tegra chips have deep sleep entry and wakeup related
>>>> timings which are platform specific that should be configured before
>>>> entering into deep sleep.
>>>>
>>>> Below are the timing specific configurations for deep sleep entry and
>>>> wakeup.
>>>> - Core rail power-on stabilization timer
>>>> - OSC clock stabilization timer after SOC rail power is stabilized.
>>>> - Core power off time is the minimum wake delay to keep the system
>>>>    in deep sleep state irrespective of any quick wake event.
>>>>
>>>> These values depends on the discharge time of regulators and turn OFF
>>>> time of the PMIC to allow the complete system to finish entering into
>>>> deep sleep state.
>>>>
>>>> These values vary based on the platform design and are specified
>>>> through the device tree.
>>>>
>>>> This patch has implementation to configure these timings which are must
>>>> to have for proper deep sleep and wakeup operations.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>   drivers/soc/tegra/pmc.c | 14 +++++++++++++-
>>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>> index 53ed70773872..710969043668 100644
>>>> --- a/drivers/soc/tegra/pmc.c
>>>> +++ b/drivers/soc/tegra/pmc.c
>>>> @@ -88,6 +88,8 @@
>>>>     #define PMC_CPUPWRGOOD_TIMER        0xc8
>>>>   #define PMC_CPUPWROFF_TIMER        0xcc
>>>> +#define PMC_COREPWRGOOD_TIMER        0x3c
>>>> +#define PMC_COREPWROFF_TIMER        0xe0
>>>>     #define PMC_PWR_DET_VALUE        0xe4
>>>>   @@ -2277,7 +2279,7 @@ static const struct tegra_pmc_regs
>>>> tegra20_pmc_regs = {
>>>>     static void tegra20_pmc_init(struct tegra_pmc *pmc)
>>>>   {
>>>> -    u32 value;
>>>> +    u32 value, osc, pmu, off;
>>>>         /* Always enable CPU power request */
>>>>       value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>>> @@ -2303,6 +2305,16 @@ static void tegra20_pmc_init(struct tegra_pmc
>>>> *pmc)
>>>>       value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>>>       value |= PMC_CNTRL_SYSCLK_OE;
>>>>       tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>> +
>>>> +    /* program core timings which are applicable only for suspend
>>>> state */
>>>> +    if (pmc->suspend_mode != TEGRA_SUSPEND_NONE) {
>>>> +        osc = DIV_ROUND_UP(pmc->core_osc_time * 8192, 1000000);
>>>> +        pmu = DIV_ROUND_UP(pmc->core_pmu_time * 32768, 1000000);
>>>> +        off = DIV_ROUND_UP(pmc->core_off_time * 32768, 1000000);
>>>> +        tegra_pmc_writel(pmc, ((osc << 8) & 0xff00) | (pmu & 0xff),
>>>> +                 PMC_COREPWRGOOD_TIMER);
>>>> +        tegra_pmc_writel(pmc, off, PMC_COREPWROFF_TIMER);
>>>> +    }
>>>>   }
>>>>     static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
>>>>
>>> In the previous version of this patch there were checks for zero values
>>> of the timers with intention to skip programming of the timers if value
>>> is zero. I'm a bit puzzled by the new version, given that SUSPEND_NONE
>>> means that suspending isn't available at all and thus PMC timers won't
>>> be utilized, hence it shouldn't matter what values are programmed for
>>> the counters, isn't it?
>>
>> Yes, as I see in documentation we already specify all these timings
>> are required properties when suspend mode is used, I updated in this
>> version to program core timings only when suspend mode is enabled.
>>
> In other words, core timings are for SC7 entry only. So when SC7/suspend
> mode is not used, these timings doesn't matter.

In this case, it should be a bit more straightforward to always program
the timers unconditionally. But since device-tree binding requires all
the properties to be specified when suspend mode isn't NONE, then the
new variant also makes sense. Either way is good to me, thanks.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
