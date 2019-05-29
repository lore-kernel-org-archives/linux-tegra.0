From: JC Kuo <jckuo@nvidia.com>
Subject: Re: [PATCH V2 09/12] soc/tegra: pmc: add pmc wake support for
 tegra210
Date: Wed, 29 May 2019 13:42:35 +0800
Message-ID: <ddf07eae-a933-9d2e-94f9-3893b4e09db0@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-10-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559084936-4610-10-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Sowjanya,

usleep_range() in tegra210_pmc_irq_set_wake() should be replaced with 
udelay() because caller irq_set_irq_wake() acquired spinlock and made 
this context atomic.

Thanks,

JC

On 5/29/19 7:08 AM, Sowjanya Komatineni wrote:
> This patch implements PMC wakeup sequence for Tegra210 and defines
> common used wake events of RTC alarm and power key.
>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>   drivers/soc/tegra/pmc.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 113 insertions(+)
>
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 974b4c9f6ada..54dc8409e353 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -57,6 +57,7 @@
>   #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>   #include <dt-bindings/gpio/tegra186-gpio.h>
>   #include <dt-bindings/gpio/tegra194-gpio.h>
> +#include <dt-bindings/gpio/tegra-gpio.h>
>   
>   #define PMC_CNTRL			0x0
>   #define  PMC_CNTRL_INTR_POLARITY	BIT(17) /* inverts INTR polarity */
> @@ -66,6 +67,12 @@
>   #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>   #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
>   #define  PMC_CNTRL_MAIN_RST		BIT(4)
> +#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
> +
> +#define PMC_WAKE_MASK			0x0c
> +#define PMC_WAKE_LEVEL			0x10
> +#define PMC_WAKE_STATUS			0x14
> +#define PMC_SW_WAKE_STATUS		0x18
>   
>   #define DPD_SAMPLE			0x020
>   #define  DPD_SAMPLE_ENABLE		BIT(0)
> @@ -96,6 +103,11 @@
>   
>   #define PMC_SCRATCH41			0x140
>   
> +#define PMC_WAKE2_MASK			0x160
> +#define PMC_WAKE2_LEVEL			0x164
> +#define PMC_WAKE2_STATUS		0x168
> +#define PMC_SW_WAKE2_STATUS		0x16c
> +
>   #define PMC_SENSOR_CTRL			0x1b0
>   #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>   #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
> @@ -245,6 +257,7 @@ struct tegra_pmc_soc {
>   
>   	const struct tegra_wake_event *wake_events;
>   	unsigned int num_wake_events;
> +	unsigned int max_supported_wake_events;
>   };
>   
>   static const char * const tegra186_reset_sources[] = {
> @@ -1917,6 +1930,54 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
>   	.alloc = tegra_pmc_irq_alloc,
>   };
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
> +	value = tegra_pmc_readl(pmc, PMC_CNTRL);
> +	value |= PMC_CNTRL_LATCH_WAKEUPS;
> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
> +	usleep_range(110, 120);
> +
> +	value &= ~PMC_CNTRL_LATCH_WAKEUPS;
> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
> +	usleep_range(110, 120);
> +
> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
> +	if (pmc->soc->max_supported_wake_events > 32)
> +		tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
> +
> +	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
> +	if (pmc->soc->max_supported_wake_events > 32)
> +		tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
> +
> +	/* enable PMC wake */
> +	if (data->hwirq >= 32)
> +		offset = PMC_WAKE2_MASK;
> +	else
> +		offset = PMC_WAKE_MASK;
> +	value = tegra_pmc_readl(pmc, offset);
> +	if (on)
> +		value |= 1 << bit;
> +	else
> +		value &= ~(1 << bit);
> +	tegra_pmc_writel(pmc, value, offset);
> +
> +	return 0;
> +}
> +
>   static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>   {
>   	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
> @@ -1948,6 +2009,48 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>   	return 0;
>   }
>   
> +static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
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
> +	if (data->hwirq >= 32)
> +		offset = PMC_WAKE2_LEVEL;
> +	else
> +		offset = PMC_WAKE_LEVEL;
> +	value = tegra_pmc_readl(pmc, offset);
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		value |= 1 << bit;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_FALLING:
> +	case IRQ_TYPE_LEVEL_LOW:
> +		value &= ~(1 << bit);
> +		break;
> +
> +	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
> +		value ^= 1 << bit;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	tegra_pmc_writel(pmc, value, offset);
> +
> +	return 0;
> +}
> +
>   static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>   {
>   	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
> @@ -2535,6 +2638,11 @@ static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
>   	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
>   };
>   
> +static const struct tegra_wake_event tegra210_wake_events[] = {
> +	TEGRA_WAKE_GPIO("power", 24, 0, 189),
> +	TEGRA_WAKE_IRQ("rtc", 16, 2),
> +};
> +
>   static const struct tegra_pmc_soc tegra210_pmc_soc = {
>   	.num_powergates = ARRAY_SIZE(tegra210_powergates),
>   	.powergates = tegra210_powergates,
> @@ -2552,10 +2660,15 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
>   	.regs = &tegra20_pmc_regs,
>   	.init = tegra20_pmc_init,
>   	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
> +	.irq_set_wake = tegra210_pmc_irq_set_wake,
> +	.irq_set_type = tegra210_pmc_irq_set_type,
>   	.reset_sources = tegra210_reset_sources,
>   	.num_reset_sources = ARRAY_SIZE(tegra210_reset_sources),
>   	.reset_levels = NULL,
>   	.num_reset_levels = 0,
> +	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
> +	.wake_events = tegra210_wake_events,
> +	.max_supported_wake_events = 64,
>   };
>   
>   #define TEGRA186_IO_PAD_TABLE(_pad)					     \
