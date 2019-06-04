From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH V2 06/12] clk: tegra: add suspend resume support for DFLL
 clock
Date: Tue, 4 Jun 2019 15:41:20 +0300
Message-ID: <20190604124120.GD29894@pdeschrijver-desktop.Nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559084936-4610-7-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, May 28, 2019 at 04:08:50PM -0700, Sowjanya Komatineni wrote:
> This patch adds support for suspend and resume for DFLL clock.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 82 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-dfll.h |  2 ++
>  2 files changed, 84 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index 1fc71baae13b..d92a5a05fbbc 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -286,6 +286,7 @@ struct tegra_dfll {
>  	unsigned long			dvco_rate_min;
>  
>  	enum dfll_ctrl_mode		mode;
> +	enum dfll_ctrl_mode		resume_mode;
>  	enum dfll_tune_range		tune_range;
>  	struct dentry			*debugfs_dir;
>  	struct clk_hw			dfll_clk_hw;
> @@ -1873,6 +1874,87 @@ static int dfll_fetch_common_params(struct tegra_dfll *td)
>  }
>  
>  /*
> + * tegra_dfll_suspend
> + * @pdev: DFLL instance
> + *
> + * dfll controls clock/voltage to other devices, including CPU. Therefore,
> + * dfll driver pm suspend callback does not stop cl-dvfs operations. It is
> + * only used to enforce cold voltage limit, since SoC may cool down during
> + * suspend without waking up. The correct temperature zone after suspend will
> + * be updated via dfll cooling device interface during resume of temperature
> + * sensor.

Temperature dependent cl-dvfs is not yet implemented in upstream, so
leave out the part about cold voltage limits and temperature zones.

Peter.
