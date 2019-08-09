From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 18/21] soc/tegra: pmc: Configure core power request
 polarity
Date: Fri, 9 Aug 2019 16:13:20 +0300
Message-ID: <29842147-a5f8-d51d-c594-b93b20b2e20f@gmail.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-19-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565308020-31952-19-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

09.08.2019 2:46, Sowjanya Komatineni пишет:
> This patch configures polarity of the core power request signal
> in PMC control register based on the device tree property.
> 
> PMC asserts and de-asserts power request signal based on it polarity
> when it need to power-up and power-down the core rail during SC7.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 3aa71c28a10a..e013ada7e4e9 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -56,6 +56,7 @@
>  #define  PMC_CNTRL_SIDE_EFFECT_LP0	BIT(14) /* LP0 when CPU pwr gated */
>  #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>  #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
> +#define  PMC_CNTRL_PWRREQ_POLARITY	BIT(8)
>  #define  PMC_CNTRL_MAIN_RST		BIT(4)
>  
>  #define PMC_WAKE_MASK			0x0c
> @@ -2290,6 +2291,11 @@ static void tegra20_pmc_init(struct tegra_pmc *pmc)
>  	else
>  		value |= PMC_CNTRL_SYSCLK_POLARITY;
>  
> +	if (pmc->corereq_high)
> +		value &= ~PMC_CNTRL_PWRREQ_POLARITY;
> +	else
> +		value |= PMC_CNTRL_PWRREQ_POLARITY;
> +
>  	/* configure the output polarity while the request is tristated */
>  	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>  
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
