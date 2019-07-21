From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH V6 11/21] clk: tegra: clk-dfll: Add suspend and resume
 support
Date: Sun, 21 Jul 2019 15:42:12 -0700
Message-ID: <4263286c-7ffc-d636-6297-b4eadbd64c36@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-12-git-send-email-skomatineni@nvidia.com>
 <54e3237d-c6c2-2007-99b2-89c26004da47@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54e3237d-c6c2-2007-99b2-89c26004da47@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 7/21/19 2:32 PM, Dmitry Osipenko wrote:
> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch implements DFLL suspend and resume operation.
>>
>> During system suspend entry, CPU clock will switch CPU to safe
>> clock source of PLLP and disables DFLL clock output.
>>
>> DFLL driver suspend confirms DFLL disable state and errors out on
>> being active.
>>
>> DFLL is re-initialized during the DFLL driver resume as it goes
>> through complete reset during suspend entry.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-dfll.c               | 44 ++++++++++++++++++++++=
++++++++
>>   drivers/clk/tegra/clk-dfll.h               |  2 ++
>>   drivers/clk/tegra/clk-tegra124-dfll-fcpu.c |  1 +
>>   3 files changed, 47 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
>> index f8688c2ddf1a..7dcad4ccd0ae 100644
>> --- a/drivers/clk/tegra/clk-dfll.c
>> +++ b/drivers/clk/tegra/clk-dfll.c
>> @@ -1513,6 +1513,50 @@ static int dfll_init(struct tegra_dfll *td)
>>   	return ret;
>>   }
>>  =20
>> +/**
>> + * tegra_dfll_suspend - check DFLL is disabled
>> + * @dev: DFLL device *
>> + *
>> + * DFLL clock should be disabled by the CPUFreq driver. So, make
>> + * sure it is disabled and disable all clocks needed by the DFLL.
>> + */
>> +int tegra_dfll_suspend(struct device *dev)
>> +{
>> +	struct tegra_dfll *td =3D dev_get_drvdata(dev);
>> +
>> +	if (dfll_is_running(td)) {
>> +		dev_warn(td->dev, "failed disabling the dfll\n");
> Something like "dfll is enabled while shouldn't be\n" will be more
> informative.
>
> This is a error, hence dev_err().
>
>> +		return -EBUSY;
>> +	}
>> +
>> +	pm_runtime_disable(dev);
>> +
>> +	clk_unprepare(td->ref_clk);
>> +	clk_unprepare(td->soc_clk);
>> +	clk_unprepare(td->i2c_clk);
> Please don't do this, DFLL is already disabled if not running.

during resume dfll re-init sequence is same as dfll init so I am using=20
existing dfll_init

which includes runtime_enable and clk_prepare.


Will create separate dfll_reinit then...

>> +	reset_control_assert(td->dvco_rst);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(tegra_dfll_suspend);
>> +
>> +/**
>> + * tegra_dfll_resume - reinitialize DFLL on resume
>> + * @pdev: DFLL instance
>> + *
>> + * Re-initialize DFLL on resume as it gets disabled and reset during
>> + * suspend entry. DFLL clock is enabled in closed loop mode later
>> + * and CPU frequency will be switched to DFLL output.
>> + */
>> +int tegra_dfll_resume(struct device *dev)
>> +{
>> +	struct tegra_dfll *td =3D dev_get_drvdata(dev);
>> +
>> +	return dfll_init(td);
> Just create dfll_reinit() variant.
>
>> +}
>> +EXPORT_SYMBOL(tegra_dfll_resume);
>> +
>>   /*
>>    * DT data fetch
>>    */
>> diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
>> index 1b14ebe7268b..fb209eb5f365 100644
>> --- a/drivers/clk/tegra/clk-dfll.h
>> +++ b/drivers/clk/tegra/clk-dfll.h
>> @@ -42,5 +42,7 @@ int tegra_dfll_register(struct platform_device *pdev,
>>   struct tegra_dfll_soc_data *tegra_dfll_unregister(struct platform_devi=
ce *pdev);
>>   int tegra_dfll_runtime_suspend(struct device *dev);
>>   int tegra_dfll_runtime_resume(struct device *dev);
>> +int tegra_dfll_suspend(struct device *dev);
>> +int tegra_dfll_resume(struct device *dev);
>>  =20
>>   #endif /* __DRIVERS_CLK_TEGRA_CLK_DFLL_H */
>> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/te=
gra/clk-tegra124-dfll-fcpu.c
>> index e84b6d52cbbd..2ac2679d696d 100644
>> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
>> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
>> @@ -631,6 +631,7 @@ static int tegra124_dfll_fcpu_remove(struct platform=
_device *pdev)
>>   static const struct dev_pm_ops tegra124_dfll_pm_ops =3D {
>>   	SET_RUNTIME_PM_OPS(tegra_dfll_runtime_suspend,
>>   			   tegra_dfll_runtime_resume, NULL)
>> +	SET_SYSTEM_SLEEP_PM_OPS(tegra_dfll_suspend, tegra_dfll_resume)
>>   };
>>  =20
>>   static struct platform_driver tegra124_dfll_fcpu_driver =3D {
>>
