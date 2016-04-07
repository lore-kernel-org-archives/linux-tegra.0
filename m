From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH] pinctrl: tegra: clear park bit for all pins
Date: Thu, 7 Apr 2016 17:37:08 -0400
Message-ID: <1460065028-26169-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Parking bits might not be cleared by the bootloader properly (if for
instance it doesn't use the device configured by that pin). Clear
the park bits for all the pins during pinctrl probe.

This is present on T210 platforms but not earlier ones, so for earlier
generations, set parked_reg = -1 to disable.

The park bit is used to prevent glitching when reprogramming pinctrl
registers.

Based on work by:
Shravani Dingari <shravanid@nvidia.com>

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c    | 18 ++++++++++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra.h    |  6 ++++++
 drivers/pinctrl/tegra/pinctrl-tegra114.c |  2 ++
 drivers/pinctrl/tegra/pinctrl-tegra124.c |  2 ++
 drivers/pinctrl/tegra/pinctrl-tegra20.c  |  3 +++
 drivers/pinctrl/tegra/pinctrl-tegra210.c |  4 ++++
 drivers/pinctrl/tegra/pinctrl-tegra30.c  |  2 ++
 7 files changed, 37 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 3f7fce9075ab..053d62016e5a 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -625,6 +625,22 @@ static struct pinctrl_desc tegra_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
+{
+	int i = 0;
+	const struct tegra_pingroup *g;
+	u32 val;
+
+	for (i = 0; i < pmx->soc->ngroups; ++i) {
+		if (pmx->soc->groups[i].parked_reg >= 0) {
+			g = &pmx->soc->groups[i];
+			val = pmx_readl(pmx, g->parked_bank, g->parked_reg);
+			val &= ~(1 << g->parked_bit);
+			pmx_writel(pmx, val, g->parked_bank, g->parked_reg);
+		}
+	}
+}
+
 static bool gpio_node_has_range(void)
 {
 	struct device_node *np;
@@ -725,6 +741,8 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 		return PTR_ERR(pmx->pctl);
 	}
 
+	tegra_pinctrl_clear_parked_bits(pmx);
+
 	if (!gpio_node_has_range())
 		pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
 
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index 1615db7e3a4b..20b893443d0b 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -93,6 +93,9 @@ struct tegra_function {
  * @tri_reg:		Tri-state register offset.
  * @tri_bank:		Tri-state register bank.
  * @tri_bit:		Tri-state register bit.
+ * @parked_reg:		Parked register offset. -1 if unsupported.
+ * @parked_bank:	Parked register bank. 0 if unsupported.
+ * @parked_bit:		Parked register bit. 0 if unsupported.
  * @einput_bit:		Enable-input register bit.
  * @odrain_bit:		Open-drain register bit.
  * @lock_bit:		Lock register bit.
@@ -135,13 +138,16 @@ struct tegra_pingroup {
 	s16 pupd_reg;
 	s16 tri_reg;
 	s16 drv_reg;
+	s16 parked_reg;
 	u32 mux_bank:2;
 	u32 pupd_bank:2;
 	u32 tri_bank:2;
 	u32 drv_bank:2;
+	u32 parked_bank:2;
 	s32 mux_bit:6;
 	s32 pupd_bit:6;
 	s32 tri_bit:6;
+	s32 parked_bit:6;
 	s32 einput_bit:6;
 	s32 odrain_bit:6;
 	s32 lock_bit:6;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
index 05e49d5137ab..b831dcfa5359 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
@@ -1578,6 +1578,7 @@ static struct tegra_function tegra114_functions[] = {
 		.lock_bit = 7,						\
 		.ioreset_bit = PINGROUP_BIT_##ior(8),			\
 		.rcv_sel_bit = PINGROUP_BIT_##rcv_sel(9),		\
+		.parked_reg = -1,					\
 		.drv_reg = -1,						\
 	}
 
@@ -1598,6 +1599,7 @@ static struct tegra_function tegra114_functions[] = {
 		.rcv_sel_bit = -1,					\
 		.drv_reg = DRV_PINGROUP_REG(r),				\
 		.drv_bank = 0,						\
+		.parked_reg = -1,					\
 		.hsm_bit = hsm_b,					\
 		.schmitt_bit = schmitt_b,				\
 		.lpmd_bit = lpmd_b,					\
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
index 7cd44c7c296d..199d301f7c3e 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
@@ -1747,6 +1747,7 @@ static struct tegra_function tegra124_functions[] = {
 		.lock_bit = 7,						\
 		.ioreset_bit = PINGROUP_BIT_##ior(8),			\
 		.rcv_sel_bit = PINGROUP_BIT_##rcv_sel(9),		\
+		.parked_reg = -1,					\
 		.drv_reg = -1,						\
 	}
 
@@ -1767,6 +1768,7 @@ static struct tegra_function tegra124_functions[] = {
 		.rcv_sel_bit = -1,					\
 		.drv_reg = DRV_PINGROUP_REG(r),				\
 		.drv_bank = 0,						\
+		.parked_reg = -1,					\
 		.hsm_bit = hsm_b,					\
 		.schmitt_bit = schmitt_b,				\
 		.lpmd_bit = lpmd_b,					\
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index 4833db4433d9..a2d0b98d72b3 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -1994,6 +1994,7 @@ static struct tegra_function tegra20_functions[] = {
 		.tri_reg = ((tri_r) - TRISTATE_REG_A),		\
 		.tri_bank = 0,					\
 		.tri_bit = tri_b,				\
+		.parked_reg = -1,				\
 		.einput_bit = -1,				\
 		.odrain_bit = -1,				\
 		.lock_bit = -1,					\
@@ -2013,6 +2014,7 @@ static struct tegra_function tegra20_functions[] = {
 		.pupd_bank = 2,					\
 		.pupd_bit = pupd_b,				\
 		.drv_reg = -1,					\
+		.parked_reg = -1,				\
 	}
 
 /* Pin groups for drive strength registers (configurable version) */
@@ -2028,6 +2030,7 @@ static struct tegra_function tegra20_functions[] = {
 		.tri_reg = -1,					\
 		.drv_reg = ((r) - PINGROUP_REG_A),		\
 		.drv_bank = 3,					\
+		.parked_reg = -1,				\
 		.hsm_bit = hsm_b,				\
 		.schmitt_bit = schmitt_b,			\
 		.lpmd_bit = lpmd_b,				\
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index 252b464901c0..825bf62d939a 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -1310,6 +1310,9 @@ static struct tegra_function tegra210_functions[] = {
 		.lock_bit = 7,						\
 		.ioreset_bit = -1,					\
 		.rcv_sel_bit = PINGROUP_BIT_##e_io_hv(10),		\
+		.parked_reg = PINGROUP_REG(r),				\
+		.parked_bank = 1,					\
+		.parked_bit = 5,					\
 		.hsm_bit = PINGROUP_BIT_##hsm(9),			\
 		.schmitt_bit = 12,					\
 		.drvtype_bit = PINGROUP_BIT_##drvtype(13),		\
@@ -1342,6 +1345,7 @@ static struct tegra_function tegra210_functions[] = {
 		.rcv_sel_bit = -1,					\
 		.drv_reg = DRV_PINGROUP_REG(r),				\
 		.drv_bank = 0,						\
+		.parked_reg = -1,					\
 		.hsm_bit = -1,						\
 		.schmitt_bit = -1,					\
 		.lpmd_bit = -1,						\
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra30.c b/drivers/pinctrl/tegra/pinctrl-tegra30.c
index 47b2fd8bb2e9..4dc9642c914a 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra30.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra30.c
@@ -2139,6 +2139,7 @@ static struct tegra_function tegra30_functions[] = {
 		.lock_bit = 7,						\
 		.ioreset_bit = PINGROUP_BIT_##ior(8),			\
 		.rcv_sel_bit = -1,					\
+		.parked_reg = -1,					\
 		.drv_reg = -1,						\
 	}
 
@@ -2159,6 +2160,7 @@ static struct tegra_function tegra30_functions[] = {
 		.rcv_sel_bit = -1,					\
 		.drv_reg = DRV_PINGROUP_REG(r),				\
 		.drv_bank = 0,						\
+		.parked_reg = -1,					\
 		.hsm_bit = hsm_b,					\
 		.schmitt_bit = schmitt_b,				\
 		.lpmd_bit = lpmd_b,					\
-- 
1.9.1
