From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v2 04/11] soc: pmc: Add blink output clock registration to Tegra PMC
Date: Tue, 26 Nov 2019 20:59:26 -0800
Message-ID: <1574830773-14892-5-git-send-email-skomatineni@nvidia.com>
References: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
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
 drivers/soc/tegra/pmc.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index a353f6d0a832..1cfb7797dbd5 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -61,12 +61,15 @@
 #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
 #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
 #define  PMC_CNTRL_PWRREQ_POLARITY	BIT(8)
+#define  PMC_CNTRL_BLINK_EN		BIT(7)
 #define  PMC_CNTRL_MAIN_RST		BIT(4)
 
 #define PMC_WAKE_MASK			0x0c
 #define PMC_WAKE_LEVEL			0x10
 #define PMC_WAKE_STATUS			0x14
 #define PMC_SW_WAKE_STATUS		0x18
+#define PMC_DPD_PADS_ORIDE		0x1c
+#define  PMC_DPD_PADS_ORIDE_BLINK	BIT(20)
 
 #define DPD_SAMPLE			0x020
 #define  DPD_SAMPLE_ENABLE		BIT(0)
@@ -79,6 +82,7 @@
 
 #define PWRGATE_STATUS			0x38
 
+#define TEGRA210_PMC_BLINK_TIMER	0x40
 #define PMC_IMPL_E_33V_PWR		0x40
 
 #define PMC_PWR_DET			0x48
@@ -347,6 +351,8 @@ struct tegra_pmc_soc {
 
 	struct pmc_clk_init_data *pmc_clks_data;
 	unsigned int num_pmc_clks;
+	bool has_blink_output;
+	bool blink_init_state;
 };
 
 static const char * const tegra186_reset_sources[] = {
@@ -2396,6 +2402,9 @@ static void tegra_pmc_clock_register(struct tegra_pmc *pmc,
 	/* each pmc clock output has a mux and a gate */
 	num_clks = pmc->soc->num_pmc_clks * 2;
 
+	if (pmc->soc->has_blink_output)
+		num_clks += 1;
+
 	if (!num_clks)
 		return;
 
@@ -2468,6 +2477,34 @@ static void tegra_pmc_clock_register(struct tegra_pmc *pmc,
 		}
 	}
 
+	if (pmc->soc->has_blink_output) {
+		tegra_pmc_writel(pmc, 0x0, TEGRA210_PMC_BLINK_TIMER);
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
+
+		if (pmc->soc->blink_init_state) {
+			if (clk_prepare_enable(clk)) {
+				pr_err("%s: Failed to enable %s\n", __func__,
+				       __clk_get_name(clk));
+				WARN_ON(1);
+			}
+		}
+	}
+
 	of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
 
 	return;
@@ -2740,6 +2777,8 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 	.num_reset_levels = 0,
 	.pmc_clks_data = NULL,
 	.num_pmc_clks = 0,
+	.has_blink_output = true,
+	.blink_init_state = true,
 };
 
 static const char * const tegra30_powergates[] = {
@@ -2789,6 +2828,8 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 	.num_reset_levels = 0,
 	.pmc_clks_data = tegra_pmc_clks_data,
 	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
+	.has_blink_output = true,
+	.blink_init_state = true,
 };
 
 static const char * const tegra114_powergates[] = {
@@ -2842,6 +2883,8 @@ static const struct tegra_pmc_soc tegra114_pmc_soc = {
 	.num_reset_levels = 0,
 	.pmc_clks_data = tegra_pmc_clks_data,
 	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
+	.has_blink_output = true,
+	.blink_init_state = false,
 };
 
 static const char * const tegra124_powergates[] = {
@@ -2955,6 +2998,8 @@ static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.num_reset_levels = 0,
 	.pmc_clks_data = tegra_pmc_clks_data,
 	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
+	.has_blink_output = true,
+	.blink_init_state = false,
 };
 
 static const char * const tegra210_powergates[] = {
@@ -3071,6 +3116,8 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.wake_events = tegra210_wake_events,
 	.pmc_clks_data = tegra_pmc_clks_data,
 	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
+	.has_blink_output = true,
+	.blink_init_state = false,
 };
 
 #define TEGRA186_IO_PAD_TABLE(_pad)					     \
@@ -3202,6 +3249,7 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
 	.wake_events = tegra186_wake_events,
 	.pmc_clks_data = NULL,
 	.num_pmc_clks = 0,
+	.has_blink_output = false,
 };
 
 static const struct tegra_io_pad_soc tegra194_io_pads[] = {
@@ -3321,6 +3369,7 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.wake_events = tegra194_wake_events,
 	.pmc_clks_data = NULL,
 	.num_pmc_clks = 0,
+	.has_blink_output = false,
 };
 
 static const struct of_device_id tegra_pmc_match[] = {
-- 
2.7.4
