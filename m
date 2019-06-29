From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
Date: Sat, 29 Jun 2019 18:46:07 +0300
Message-ID: <a262cbb3-845c-3ad1-16cc-375a24b9f7e9@gmail.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> This patch adds support for Tegra pinctrl driver suspend and resume.
> 
> During suspend, context of all pinctrl registers are stored and
> on resume they are all restored to have all the pinmux and pad
> configuration for normal operation.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 52 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
>  drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
>  3 files changed, 56 insertions(+)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index 34596b246578..e7c0a1011cba 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -621,6 +621,43 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>  	}
>  }
>  
> +static int tegra_pinctrl_suspend(struct device *dev)
> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];
> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			*backup_regs++ = readl(regs++);
> +	}
> +
> +	return pinctrl_force_sleep(pmx->pctl);
> +}
> +
> +static int tegra_pinctrl_resume(struct device *dev)
> +{
> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];
> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			writel(*backup_regs++, regs++);
> +	}
> +
> +	return 0;
> +}
> +
> +const struct dev_pm_ops tegra_pinctrl_pm = {
> +	.suspend = &tegra_pinctrl_suspend,
> +	.resume = &tegra_pinctrl_resume
> +};

Hm, so this are the generic platform-driver suspend-resume OPS here, which is very
nice! But.. shouldn't pinctrl be resumed before the CLK driver (which is syscore_ops
in this version of the series)? .. Given that "clock" function may need to be
selected for some of the pins.
