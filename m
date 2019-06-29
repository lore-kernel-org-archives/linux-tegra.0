From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V5 13/18] soc/tegra: pmc: Add pmc wake support for
 tegra210
Date: Sat, 29 Jun 2019 16:11:17 +0300
Message-ID: <8e5367fd-81c0-c20b-5566-a11816d8458d@gmail.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-14-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561687972-19319-14-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> This patch implements PMC wakeup sequence for Tegra210 and defines
> common used RTC alarm wake event.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 91c84d0e66ae..194100d77243 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -57,6 +57,12 @@
>  #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>  #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
>  #define  PMC_CNTRL_MAIN_RST		BIT(4)
> +#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
> +
> +#define PMC_WAKE_MASK			0x0c
> +#define PMC_WAKE_LEVEL			0x10
> +#define PMC_WAKE_STATUS			0x14
> +#define PMC_SW_WAKE_STATUS		0x18
>  
>  #define DPD_SAMPLE			0x020
>  #define  DPD_SAMPLE_ENABLE		BIT(0)
> @@ -87,6 +93,11 @@
>  
>  #define PMC_SCRATCH41			0x140
>  
> +#define PMC_WAKE2_MASK			0x160
> +#define PMC_WAKE2_LEVEL			0x164
> +#define PMC_WAKE2_STATUS		0x168
> +#define PMC_SW_WAKE2_STATUS		0x16c
> +
>  #define PMC_SENSOR_CTRL			0x1b0
>  #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>  #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
> @@ -1922,6 +1933,55 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
>  	.alloc = tegra_pmc_irq_alloc,
>  };
>  
> +static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
> +{
> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
> +	unsigned int offset, bit;
> +	u32 value;
> +
> +	if (data->hwirq == ULONG_MAX)
> +		return 0;
> +
> +	offset = data->hwirq / 32;
> +	bit = data->hwirq % 32;
> +
> +	/*
> +	 * latch wakeups to SW_WAKE_STATUS register to capture events
> +	 * that would not make it into wakeup event register during LP0 exit.
> +	 */

Minor nit: start multi-line comments with a capital letter.
