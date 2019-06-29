From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V5 08/18] clk: tegra: Add suspend resume support for DFLL
Date: Sun, 30 Jun 2019 00:45:39 +0300
Message-ID: <e641e95e-57e5-4654-c951-a3b63d3b37c4@gmail.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-9-git-send-email-skomatineni@nvidia.com>
 <594adc1e-4345-33ae-c79f-ad6f00964587@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <594adc1e-4345-33ae-c79f-ad6f00964587@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

29.06.2019 16:28, Dmitry Osipenko пишет:
> 28.06.2019 5:12, Sowjanya Komatineni пишет:
>> This patch creates APIs for supporting Tegra210 clock driver to
>> perform DFLL suspend and resume operation.
>>
>> During suspend, DFLL mode is saved and on resume Tegra210 clock driver
>> invokes DFLL resume API to re-initialize DFLL to enable target device
>> clock in open loop mode or closed loop mode.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/clk/tegra/clk-dfll.c | 78 ++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/tegra/clk-dfll.h |  2 ++
>>  2 files changed, 80 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
>> index f8688c2ddf1a..a1f37cf99b00 100644
>> --- a/drivers/clk/tegra/clk-dfll.c
>> +++ b/drivers/clk/tegra/clk-dfll.c
>> @@ -277,6 +277,7 @@ struct tegra_dfll {
>>  	unsigned long			dvco_rate_min;
>>  
>>  	enum dfll_ctrl_mode		mode;
>> +	enum dfll_ctrl_mode		resume_mode;
>>  	enum dfll_tune_range		tune_range;
>>  	struct dentry			*debugfs_dir;
>>  	struct clk_hw			dfll_clk_hw;
>> @@ -1864,6 +1865,83 @@ static int dfll_fetch_common_params(struct tegra_dfll *td)
>>  }
>>  
>>  /*
>> + * tegra_dfll_suspend
>> + * @pdev: DFLL instance
>> + *
>> + * dfll controls clock/voltage to other devices, including CPU. Therefore,
>> + * dfll driver pm suspend callback does not stop cl-dvfs operations.
>> + */
>> +void tegra_dfll_suspend(struct platform_device *pdev)
>> +{
>> +	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
>> +
>> +	if (!td)
>> +		return;
>> +
>> +	if (td->mode <= DFLL_DISABLED)
>> +		return;
>> +
>> +	td->resume_mode = td->mode;
>> +	switch (td->mode) {
>> +	case DFLL_CLOSED_LOOP:
>> +		dfll_set_mode(td, DFLL_CLOSED_LOOP);
>> +		dfll_set_frequency_request(td, &td->last_req);
>> +
>> +		dfll_unlock(td);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +/**
>> + * tegra_dfll_resume - reprogram the DFLL after context-loss
>> + * @pdev: DFLL instance
>> + *
>> + * Re-initialize and enable target device clock in open loop mode. Called
>> + * directly from SoC clock resume syscore operation. Closed loop will be
>> + * re-entered in platform syscore ops as well after CPU clock source is
>> + * switched to DFLL in open loop.
>> + */
>> +void tegra_dfll_resume(struct platform_device *pdev, bool on_dfll)
>> +{
>> +	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
>> +
>> +	if (!td)
>> +		return;
>> +
>> +	if (on_dfll) {
>> +		if (td->resume_mode == DFLL_CLOSED_LOOP)
>> +			dfll_lock(td);
>> +		td->resume_mode = DFLL_DISABLED;
>> +		return;
>> +	}
>> +
>> +	reset_control_deassert(td->dvco_rst);
>> +
>> +	pm_runtime_get(td->dev);
> 
> pm_runtime_get_sync()?
> 
> Otherwise looks like you're risking a lot here because pm_runtime_get() is an
> asynchronous request.

It looks like DFLL driver should be masked as IRQ-safe using pm_runtime_irq_safe()
and then the synchronous resume could be used..
