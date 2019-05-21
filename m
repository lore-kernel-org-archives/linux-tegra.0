From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V1 09/12] soc/tegra: pmc: add pmc wake support for tegra210
Date: Tue, 21 May 2019 16:31:20 -0700
Message-ID: <1558481483-22254-10-git-send-email-skomatineni@nvidia.com>
References: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: jckuo@nvidia.com, talho@nvidia.com, josephl@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch implements PMC wakeup sequence for Tegra210 and defines
common used wake events of RTC alarm and power key.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 120 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f77ce4b827e3..5e68e1de1780 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -57,6 +57,7 @@
 #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
 #include <dt-bindings/gpio/tegra186-gpio.h>
 #include <dt-bindings/gpio/tegra194-gpio.h>
+#include <dt-bindings/gpio/tegra-gpio.h>
 
 #define PMC_CNTRL			0x0
 #define  PMC_CNTRL_INTR_POLARITY	BIT(17) /* inverts INTR polarity */
@@ -66,6 +67,12 @@
 #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
 #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
 #define  PMC_CNTRL_MAIN_RST		BIT(4)
+#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
+
+#define PMC_WAKE_MASK			0x0c
+#define PMC_WAKE_LEVEL			0x10
+#define PMC_WAKE_STATUS			0x14
+#define PMC_SW_WAKE_STATUS		0x18
 
 #define DPD_SAMPLE			0x020
 #define  DPD_SAMPLE_ENABLE		BIT(0)
@@ -96,6 +103,11 @@
 
 #define PMC_SCRATCH41			0x140
 
+#define PMC_WAKE2_MASK			0x160
+#define PMC_WAKE2_LEVEL			0x164
+#define PMC_WAKE2_STATUS		0x168
+#define PMC_SW_WAKE2_STATUS		0x16c
+
 #define PMC_SENSOR_CTRL			0x1b0
 #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
 #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
@@ -1917,6 +1929,65 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
 	.alloc = tegra_pmc_irq_alloc,
 };
 
+static inline void clear_pmc_sw_wake_status(void)
+{
+	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
+	if (tegra_get_chip_id() != TEGRA20)
+		tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
+}
+
+static inline void clear_pmc_wake_status(void)
+{
+	u32 reg;
+
+	reg = tegra_pmc_readl(pmc, PMC_WAKE_STATUS);
+	if (reg)
+		tegra_pmc_writel(pmc, reg, PMC_WAKE_STATUS);
+	if (tegra_get_chip_id() != TEGRA20) {
+		reg = tegra_pmc_readl(pmc, PMC_WAKE2_STATUS);
+		if (reg)
+			tegra_pmc_writel(pmc, reg, PMC_WAKE2_STATUS);
+	}
+}
+
+static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
+{
+	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
+	unsigned int offset, bit;
+	u32 pmc_wake_mask_reg;
+	u32 value;
+
+	if (data->hwirq < 0)
+		return 0;
+
+	offset = data->hwirq / 32;
+	bit = data->hwirq % 32;
+
+	clear_pmc_sw_wake_status();
+
+	/* enable PMC wake */
+	value = tegra_pmc_readl(pmc, PMC_CNTRL);
+	value |= PMC_CNTRL_LATCH_WAKEUPS;
+	tegra_pmc_writel(pmc, value, PMC_CNTRL);
+	usleep_range(110, 120);
+
+	value &= ~PMC_CNTRL_LATCH_WAKEUPS;
+	tegra_pmc_writel(pmc, value, PMC_CNTRL);
+	usleep_range(110, 120);
+
+	clear_pmc_wake_status();
+
+	pmc_wake_mask_reg = (offset) ? PMC_WAKE2_MASK : PMC_WAKE_MASK;
+	value = tegra_pmc_readl(pmc, pmc_wake_mask_reg);
+	if (on)
+		value |= 1 << bit;
+	else
+		value &= ~(1 << bit);
+	tegra_pmc_writel(pmc, value, pmc_wake_mask_reg);
+
+	return 0;
+}
+
 static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
@@ -1948,6 +2019,46 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
+static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
+	unsigned int offset, bit;
+	u32 pmc_wake_lvl_reg;
+	u32 value;
+
+	if (data->hwirq < 0)
+		return 0;
+
+	offset = data->hwirq / 32;
+	bit = data->hwirq % 32;
+
+	pmc_wake_lvl_reg = (offset) ? PMC_WAKE2_LEVEL : PMC_WAKE_LEVEL;
+	value = tegra_pmc_readl(pmc, pmc_wake_lvl_reg);
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_LEVEL_HIGH:
+		value |= 1 << bit;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+	case IRQ_TYPE_LEVEL_LOW:
+		value &= ~(1 << bit);
+		break;
+
+	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
+		value ^= 1 << bit;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	tegra_pmc_writel(pmc, value, pmc_wake_lvl_reg);
+
+	return 0;
+}
+
 static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
@@ -2535,6 +2646,11 @@ static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
 	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
 };
 
+static const struct tegra_wake_event tegra210_wake_events[] = {
+	TEGRA_WAKE_GPIO("power", 24, 0, 189), /*TEGRA_GPIO(X, 5)*/
+	TEGRA_WAKE_IRQ("rtc", 16, 2),
+};
+
 static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.num_powergates = ARRAY_SIZE(tegra210_powergates),
 	.powergates = tegra210_powergates,
@@ -2552,10 +2668,14 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.regs = &tegra20_pmc_regs,
 	.init = tegra20_pmc_init,
 	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
+	.pmc_irq_set_wake = tegra210_pmc_irq_set_wake,
+	.pmc_irq_set_type = tegra210_pmc_irq_set_type,
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
