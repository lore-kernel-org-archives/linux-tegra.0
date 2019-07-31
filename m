From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 11/20] cpufreq: tegra124: Add suspend and resume
 support
Date: Wed, 31 Jul 2019 14:14:37 +0300
Message-ID: <505bbdc0-c48a-8583-3838-ec5c128f375f@gmail.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-12-git-send-email-skomatineni@nvidia.com>
 <98aae4b7-d95a-90ba-0d55-7512b3712f54@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <98aae4b7-d95a-90ba-0d55-7512b3712f54@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

31.07.2019 13:23, Dmitry Osipenko пишет:
> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>> This patch adds suspend and resume pm ops for cpufreq driver.
>>
>> PLLP is the safe clock source for CPU during system suspend and
>> resume as PLLP rate is below the CPU Fmax at Vmin.
>>
>> CPUFreq driver suspend switches the CPU clock source to PLLP and
>> disables the DFLL clock.
>>
>> During system resume, warmboot code powers up the CPU with PLLP
>> clock source. So CPUFreq driver resume enabled DFLL clock and
>> switches CPU back to DFLL clock source.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/cpufreq/tegra124-cpufreq.c | 60 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 60 insertions(+)
>>
>> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
>> index 4f0c637b3b49..e979a3370988 100644
>> --- a/drivers/cpufreq/tegra124-cpufreq.c
>> +++ b/drivers/cpufreq/tegra124-cpufreq.c
>> @@ -6,6 +6,7 @@
>>  #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
>>  
>>  #include <linux/clk.h>
>> +#include <linux/cpufreq.h>
>>  #include <linux/err.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>> @@ -128,8 +129,67 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
>>  	return ret;
>>  }
>>  
>> +static int __maybe_unused tegra124_cpufreq_suspend(struct device *dev)
>> +{
>> +	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(dev);
>> +	int err;
>> +
>> +	/*
>> +	 * PLLP rate 408Mhz is below the CPU Fmax at Vmin and is safe to
>> +	 * use during suspend and resume. So, switch the CPU clock source
>> +	 * to PLLP and disable DFLL.
>> +	 */
>> +	err = clk_set_parent(priv->cpu_clk, priv->pllp_clk);
>> +	if (err < 0) {
>> +		dev_err(dev, "failed to reparent to PLLP: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	/* disable DFLL clock */
>> +	clk_disable_unprepare(priv->dfll_clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused tegra124_cpufreq_resume(struct device *dev)
>> +{
>> +	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(dev);
>> +	int err;
>> +
>> +	/*
>> +	 * Warmboot code powers up the CPU with PLLP clock source.
>> +	 * Enable DFLL clock and switch CPU clock source back to DFLL.
>> +	 */
>> +	err = clk_prepare_enable(priv->dfll_clk);
>> +	if (err < 0) {
>> +		dev_err(dev, "failed to enable DFLL clock for CPU: %d\n", err);
>> +		goto disable_cpufreq;
>> +	}
>> +
>> +	err = clk_set_parent(priv->cpu_clk, priv->dfll_clk);
>> +	if (err < 0) {
>> +		dev_err(dev, "failed to reparent to DFLL clock: %d\n", err);
>> +		goto disable_dfll;
>> +	}
>> +
>> +	return 0;
>> +
>> +disable_dfll:
>> +	clk_disable_unprepare(priv->dfll_clk);
>> +disable_cpufreq:
>> +	disable_cpufreq();
>> +
>> +	return err;
>> +}
>> +
>> +static const struct dev_pm_ops tegra124_cpufreq_pm_ops = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(tegra124_cpufreq_suspend,
>> +				tegra124_cpufreq_resume)
>> +};
>> +
>>  static struct platform_driver tegra124_cpufreq_platdrv = {
>>  	.driver.name	= "cpufreq-tegra124",
>> +	.driver.pm	= &tegra124_cpufreq_pm_ops,
>>  	.probe		= tegra124_cpufreq_probe,
>>  };
>>  
>>
> 
> Looks good,
> 
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> 

BTW, you should also CC the CPUFreq maintainers because this patch can't
be applied without theirs ACK.
