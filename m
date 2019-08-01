From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 10/20] clk: tegra: clk-dfll: Add suspend and resume
 support
Date: Thu, 1 Aug 2019 13:37:21 +0300
Message-ID: <501a9d0e-ce78-9b35-642d-dff7f9223926@gmail.com>
References: <1564607463-28802-1-git-send-email-skomatineni@nvidia.com>
 <1564607463-28802-11-git-send-email-skomatineni@nvidia.com>
 <4400ffef-685f-b9e6-3b07-4790f851282c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4400ffef-685f-b9e6-3b07-4790f851282c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

01.08.2019 13:18, Dmitry Osipenko пишет:
> 01.08.2019 0:10, Sowjanya Komatineni пишет:
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
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/clk/tegra/clk-dfll.c               | 56 ++++++++++++++++++++++++++++++
>>  drivers/clk/tegra/clk-dfll.h               |  2 ++
>>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c |  1 +
>>  3 files changed, 59 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
>> index f8688c2ddf1a..9900097ec2aa 100644
>> --- a/drivers/clk/tegra/clk-dfll.c
>> +++ b/drivers/clk/tegra/clk-dfll.c
>> @@ -1513,6 +1513,62 @@ static int dfll_init(struct tegra_dfll *td)
>>  	return ret;
>>  }
>>  
>> +/**
>> + * tegra_dfll_suspend - check DFLL is disabled
>> + * @dev: DFLL device *
>> + *
>> + * DFLL clock should be disabled by the CPUFreq driver. So, make
>> + * sure it is disabled and disable all clocks needed by the DFLL.
>> + */
>> +int tegra_dfll_suspend(struct device *dev)
>> +{
>> +	struct tegra_dfll *td = dev_get_drvdata(dev);
>> +
>> +	if (dfll_is_running(td)) {
>> +		dev_err(td->dev, "dfll is enabled while shouldn't be\n");
>> +		return -EBUSY;
>> +	}
>> +
>> +	reset_control_assert(td->dvco_rst);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(tegra_dfll_suspend);
>> +
>> +/**
>> + * tegra_dfll_resume - reinitialize DFLL on resume
>> + * @dev: DFLL instance
>> + *
>> + * DFLL is disabled and reset during suspend and resume.
>> + * So, reinitialize the DFLL IP block back for use.
>> + * DFLL clock is enabled later in closed loop mode by CPUFreq
>> + * driver before switching its clock source to DFLL output.
>> + */
>> +int tegra_dfll_resume(struct device *dev)
>> +{
>> +	struct tegra_dfll *td = dev_get_drvdata(dev);
>> +
>> +	reset_control_deassert(td->dvco_rst);
>> +
>> +	pm_runtime_irq_safe(td->dev);
> 
> Please see my previous reply.
> 

Also, you should always bump version of the patches no matter what.
otherwise it turns out very confusing.
