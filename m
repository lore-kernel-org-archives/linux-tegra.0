From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v3 05/15] soc: pmc: Add blink output clock registration to Tegra PMC
Date: Thu, 5 Dec 2019 18:48:45 -0800
Message-ID: <1575600535-26877-6-git-send-email-skomatineni@nvidia.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

Tegra PMC has blink control to output 32 Khz clock out to Tegra
blink pin. Blink pad DPD state and enable controls are part of
Tegra PMC register space.

Currently Tegra clock driver registers blink control by passing
PMC address and register offset to clk_register_gate which performs
direct PMC access during clk_ops and with this when PMC is in secure
mode, any access from non-secure world does not go through.

This patch adds blink control registration to the Tegra PMC driver
using PMC specific clock gate operations that use tegra_pmc_readl
and tegra_pmc_writel to support both secure mode and non-secure
mode PMC register access.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index b8f6eb0ed8aa..c62ab84cce9c 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -61,12 +61,15 @@
 #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
 #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
 #define  PMC_CNTRL_PWRREQ_POLARITY	BIT(8)
+#define  PMC_CNTRL_BLINK_EN		7
 #define  PMC_CNTRL_MAIN_RST		BIT(4)
 
 #define PMC_WAKE_MASK			0x0c
 #define PMC_WAKE_LEVEL			0x10
 #define PMC_WAKE_STATUS			0x14
 #define PMC_SW_WAKE_STATUS		0x18
+#define PMC_DPD_PADS_ORIDE		0x1c
+#define  PMC_DPD_PADS_ORIDE_BLINK	20
 
 #define DPD_SAMPLE			0x020
 #define  DPD_SAMPLE_ENABLE		BIT(0)
@@ -79,6 +82,7 @@
 
 #define PWRGATE_STATUS			0x38
 
+#define PMC_BLINK_TIMER		0x40
 #define PMC_IMPL_E_33V_PWR		0x40
 
 #define PMC_PWR_DET			0x48
@@ -339,6 +343,7 @@ struct tegra_pmc_soc {
 
 	const struct pmc_clk_init_data *pmc_clks_data;
 	unsigned int num_pmc_clks;
+	bool has_blink_output;
 };
 
 static const char * const tegra186_reset_sources[] = {
@@ -2388,6 +2393,9 @@ static void tegra_pmc_clock_register(struct tegra_pmc *pmc,
 	/* each pmc clock output has a mux and a gate */
 	num_clks = pmc->soc->num_pmc_clks * 2;
 
+	if (pmc->soc->has_blink_output)
+		num_clks += 1;
+
 	if (!num_clks)
 		return;
 
@@ -2442,6 +2450,26 @@ static void tegra_pmc_clock_register(struct tegra_pmc *pmc,
 		clk_register_clkdev(clk, data->dev_name, data->gate_name);
 	}
 
+	if (pmc->soc->has_blink_output) {
+		tegra_pmc_writel(pmc, 0x0, PMC_BLINK_TIMER);
+		clk = tegra_pmc_clk_gate_register("blink_override",
+						  "clk_32k", 0,
+						  PMC_DPD_PADS_ORIDE,
+						  PMC_DPD_PADS_ORIDE_BLINK);
+		if (IS_ERR(clk))
+			goto free_clks;
+
+		clk = tegra_pmc_clk_gate_register("blink",
+						  "blink_override", 0,
+						  PMC_CNTRL,
+						  PMC_CNTRL_BLINK_EN);
+		if (IS_ERR(clk))
+			goto free_clks;
+
+		clk_data->clks[TEGRA_PMC_CLK_BLINK] = clk;
+		clk_register_clkdev(clk, "blink", NULL);
+	}
+
 	of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
 
 	return;
@@ -2715,6 +2743,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 	.num_reset_levels = 0,
 	.pmc_clks_data = NULL,
 	.num_pmc_clks = 0,
+	.has_blink_output = true,
 };
 
 static const char * const tegra30_powergates[] = {
@@ -2764,6 +2793,7 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 	.num_reset_levels = 0,
 	.pmc_clks_data = tegra_pmc_clks_data,
 	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
+	.has_blink_output = true,
 };
 
 static const char * const tegra114_powergates[] = {
@@ -2817,6 +2847,7 @@ static const struct tegra_pmc_soc tegra114_pmc_soc = {
 	.num_reset_levels = 0,
 	.pmc_clks_data = tegra_pmc_clks_data,
 	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
+	.has_blink_output = true,
 };
 
 static const char * const tegra124_powergates[] = {
@@ -2930,6 +2961,7 @@ static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.num_reset_levels = 0,
 	.pmc_clks_data = tegra_pmc_clks_data,
 	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
+	.has_blink_output = true,
 };
 
 static const char * const tegra210_powergates[] = {
@@ -3046,6 +3078,7 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.wake_events = tegra210_wake_events,
 	.pmc_clks_data = tegra_pmc_clks_data,
 	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
+	.has_blink_output = true,
 };
 
 #define TEGRA186_IO_PAD_TABLE(_pad)					     \
@@ -3177,6 +3210,7 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
 	.wake_events = tegra186_wake_events,
 	.pmc_clks_data = NULL,
 	.num_pmc_clks = 0,
+	.has_blink_output = false,
 };
 
 static const struct tegra_io_pad_soc tegra194_io_pads[] = {
@@ -3296,6 +3330,7 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.wake_events = tegra194_wake_events,
 	.pmc_clks_data = NULL,
 	.num_pmc_clks = 0,
+	.has_blink_output = false,
 };
 
 static const struct of_device_id tegra_pmc_match[] = {
-- 
2.7.4
