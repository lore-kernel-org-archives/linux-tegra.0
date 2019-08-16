From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v9 17/22] soc/tegra: pmc: Add pmc wake support for tegra210
Date: Fri, 16 Aug 2019 12:42:02 -0700
Message-ID: <1565984527-5272-18-git-send-email-skomatineni@nvidia.com>
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch implements PMC wakeup sequence for Tegra210 and defines
common used RTC alarm wake event.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 98 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 91c84d0e66ae..76e7292ded25 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -58,6 +58,11 @@
 #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
 #define  PMC_CNTRL_MAIN_RST		BIT(4)
 
+#define PMC_WAKE_MASK			0x0c
+#define PMC_WAKE_LEVEL			0x10
+#define PMC_WAKE_STATUS			0x14
+#define PMC_SW_WAKE_STATUS		0x18
+
 #define DPD_SAMPLE			0x020
 #define  DPD_SAMPLE_ENABLE		BIT(0)
 #define  DPD_SAMPLE_DISABLE		(0 << 0)
@@ -87,6 +92,11 @@
 
 #define PMC_SCRATCH41			0x140
 
+#define PMC_WAKE2_MASK			0x160
+#define PMC_WAKE2_LEVEL			0x164
+#define PMC_WAKE2_STATUS		0x168
+#define PMC_SW_WAKE2_STATUS		0x16c
+
 #define PMC_SENSOR_CTRL			0x1b0
 #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
 #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
@@ -1922,6 +1932,43 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
 	.alloc = tegra_pmc_irq_alloc,
 };
 
+static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
+{
+	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
+	unsigned int offset, bit;
+	u32 value;
+
+	if (data->hwirq == ULONG_MAX)
+		return 0;
+
+	offset = data->hwirq / 32;
+	bit = data->hwirq % 32;
+
+	/* clear wake status */
+	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
+	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
+
+	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
+	tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
+
+	/* enable PMC wake */
+	if (data->hwirq >= 32)
+		offset = PMC_WAKE2_MASK;
+	else
+		offset = PMC_WAKE_MASK;
+
+	value = tegra_pmc_readl(pmc, offset);
+
+	if (on)
+		value |= BIT(bit);
+	else
+		value &= ~BIT(bit);
+
+	tegra_pmc_writel(pmc, value, offset);
+
+	return 0;
+}
+
 static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
@@ -1954,6 +2001,49 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
+static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
+	unsigned int offset, bit;
+	u32 value;
+
+	if (data->hwirq == ULONG_MAX)
+		return 0;
+
+	offset = data->hwirq / 32;
+	bit = data->hwirq % 32;
+
+	if (data->hwirq >= 32)
+		offset = PMC_WAKE2_LEVEL;
+	else
+		offset = PMC_WAKE_LEVEL;
+
+	value = tegra_pmc_readl(pmc, offset);
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_LEVEL_HIGH:
+		value |= BIT(bit);
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+	case IRQ_TYPE_LEVEL_LOW:
+		value &= ~BIT(bit);
+		break;
+
+	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
+		value ^= BIT(bit);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	tegra_pmc_writel(pmc, value, offset);
+
+	return 0;
+}
+
 static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
@@ -2540,6 +2630,10 @@ static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
 	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
 };
 
+static const struct tegra_wake_event tegra210_wake_events[] = {
+	TEGRA_WAKE_IRQ("rtc", 16, 2),
+};
+
 static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.num_powergates = ARRAY_SIZE(tegra210_powergates),
 	.powergates = tegra210_powergates,
@@ -2557,10 +2651,14 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.regs = &tegra20_pmc_regs,
 	.init = tegra20_pmc_init,
 	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
+	.irq_set_wake = tegra210_pmc_irq_set_wake,
+	.irq_set_type = tegra210_pmc_irq_set_type,
 	.reset_sources = tegra210_reset_sources,
 	.num_reset_sources = ARRAY_SIZE(tegra210_reset_sources),
 	.reset_levels = NULL,
 	.num_reset_levels = 0,
+	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
+	.wake_events = tegra210_wake_events,
 };
 
 #define TEGRA186_IO_PAD_TABLE(_pad)					     \
-- 
2.7.4
