From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V6 12/21] cpufreq: tegra124: Add suspend and resume
 support
Date: Mon, 22 Jul 2019 00:04:45 +0300
Message-ID: <6cb1c860-fdf3-e648-e920-50d4e8b9b0cf@gmail.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-13-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563738060-30213-13-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
> This patch adds suspend and resume pm ops for cpufreq driver.
> 
> PLLP is the safe clock source for CPU during system suspend and
> resume as PLLP rate is below the CPU Fmax at Vmin.
> 
> CPUFreq driver suspend switches the CPU clock source to PLLP and
> disables the DFLL clock.
> 
> During system resume, warmboot code powers up the CPU with PLLP
> clock source. So CPUFreq driver resume enabled DFLL clock and
> switches CPU back to DFLL clock source.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/cpufreq/tegra124-cpufreq.c | 46 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
> index 4f0c637b3b49..4eff63379b0f 100644
> --- a/drivers/cpufreq/tegra124-cpufreq.c
> +++ b/drivers/cpufreq/tegra124-cpufreq.c
> @@ -6,6 +6,7 @@
>  #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
>  
>  #include <linux/clk.h>
> +#include <linux/cpufreq.h>>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> @@ -128,8 +129,53 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static int tegra124_cpufreq_suspend(struct device *dev)

__maybe_unused

> +{
> +	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(dev);
> +
> +	/*
> +	 * PLLP rate 408Mhz is below the CPU Fmax at Vmin and is safe to
> +	 * use during suspend and resume. So, switch the CPU clock source
> +	 * to PLLP and disable DFLL.
> +	 */
> +	clk_set_parent(priv->cpu_clk, priv->pllp_clk);

Error check?

> +
> +	/* disable DFLL clock */
> +	clk_disable_unprepare(priv->dfll_clk);
> +
> +	return 0;
> +}
> +
> +static int tegra124_cpufreq_resume(struct device *dev)

__maybe_unused

> +{
> +	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	/*
> +	 * Warmboot code powers up the CPU with PLLP clock source.
> +	 * Enable DFLL clock and switch CPU clock source back to DFLL.
> +	 */
> +	ret = clk_prepare_enable(priv->dfll_clk);
> +	if (ret) {
> +		dev_warn(dev, "failed to enable DFLL clock for CPU\n");

dev_err("..: %d\n", err);

> +		clk_set_parent(priv->cpu_clk, priv->pllp_clk);

This is not needed because CPU is already on PLLP.

> +		disable_cpufreq();
> +		return ret;
> +	}
> +
> +	clk_set_parent(priv->cpu_clk, priv->dfll_clk);

Error check?

> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops tegra124_cpufreq_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra124_cpufreq_suspend,
> +				tegra124_cpufreq_resume)
> +};
> +
>  static struct platform_driver tegra124_cpufreq_platdrv = {
>  	.driver.name	= "cpufreq-tegra124",
> +	.driver.pm	= &tegra124_cpufreq_pm_ops,
>  	.probe		= tegra124_cpufreq_probe,
>  };
>  
> 
