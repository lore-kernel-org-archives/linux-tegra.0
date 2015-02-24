From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH 2/4] pinctrl: tegra: some bits move between registers
Date: Tue, 24 Feb 2015 14:00:49 -0700
Message-ID: <1424811651-18660-2-git-send-email-swarren@wwwdotorg.org>
References: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1424811651-18660-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

Some of the pinmux configuration bits that exist in "drive group"
registers in Tegra30..Tegra124 move to the "pinmux" registers on future
chips. Add a flag to support this.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 drivers/pinctrl/pinctrl-tegra.c    | 27 +++++++++++++++++++++------
 drivers/pinctrl/pinctrl-tegra.h    |  3 +++
 drivers/pinctrl/pinctrl-tegra114.c |  3 +++
 drivers/pinctrl/pinctrl-tegra124.c |  3 +++
 drivers/pinctrl/pinctrl-tegra20.c  |  3 +++
 drivers/pinctrl/pinctrl-tegra30.c  |  3 +++
 6 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
index e5949d51bc52..6cd651a88398 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/pinctrl-tegra.c
@@ -348,14 +348,24 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
 		*width = 1;
 		break;
 	case TEGRA_PINCONF_PARAM_HIGH_SPEED_MODE:
-		*bank = g->drv_bank;
-		*reg = g->drv_reg;
+		if (pmx->soc->hsm_in_mux) {
+			*bank = g->mux_bank;
+			*reg = g->mux_reg;
+		} else {
+			*bank = g->drv_bank;
+			*reg = g->drv_reg;
+		}
 		*bit = g->hsm_bit;
 		*width = 1;
 		break;
 	case TEGRA_PINCONF_PARAM_SCHMITT:
-		*bank = g->drv_bank;
-		*reg = g->drv_reg;
+		if (pmx->soc->schmitt_in_mux) {
+			*bank = g->mux_bank;
+			*reg = g->mux_reg;
+		} else {
+			*bank = g->drv_bank;
+			*reg = g->drv_reg;
+		}
 		*bit = g->schmitt_bit;
 		*width = 1;
 		break;
@@ -390,8 +400,13 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
 		*width = g->slwr_width;
 		break;
 	case TEGRA_PINCONF_PARAM_DRIVE_TYPE:
-		*bank = g->drv_bank;
-		*reg = g->drv_reg;
+		if (pmx->soc->drvtype_in_mux) {
+			*bank = g->mux_bank;
+			*reg = g->mux_reg;
+		} else {
+			*bank = g->drv_bank;
+			*reg = g->drv_reg;
+		}
 		*bit = g->drvtype_bit;
 		*width = 2;
 		break;
diff --git a/drivers/pinctrl/pinctrl-tegra.h b/drivers/pinctrl/pinctrl-tegra.h
index 8d94d1332e7b..d54ab9d38792 100644
--- a/drivers/pinctrl/pinctrl-tegra.h
+++ b/drivers/pinctrl/pinctrl-tegra.h
@@ -182,6 +182,9 @@ struct tegra_pinctrl_soc_data {
 	unsigned nfunctions;
 	const struct tegra_pingroup *groups;
 	unsigned ngroups;
+	bool hsm_in_mux;
+	bool schmitt_in_mux;
+	bool drvtype_in_mux;
 };
 
 int tegra_pinctrl_probe(struct platform_device *pdev,
diff --git a/drivers/pinctrl/pinctrl-tegra114.c b/drivers/pinctrl/pinctrl-tegra114.c
index 0740cdba7508..05e49d5137ab 100644
--- a/drivers/pinctrl/pinctrl-tegra114.c
+++ b/drivers/pinctrl/pinctrl-tegra114.c
@@ -1841,6 +1841,9 @@ static const struct tegra_pinctrl_soc_data tegra114_pinctrl = {
 	.nfunctions = ARRAY_SIZE(tegra114_functions),
 	.groups = tegra114_groups,
 	.ngroups = ARRAY_SIZE(tegra114_groups),
+	.hsm_in_mux = false,
+	.schmitt_in_mux = false,
+	.drvtype_in_mux = false,
 };
 
 static int tegra114_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/pinctrl-tegra124.c b/drivers/pinctrl/pinctrl-tegra124.c
index b7ba26064dbf..7cd44c7c296d 100644
--- a/drivers/pinctrl/pinctrl-tegra124.c
+++ b/drivers/pinctrl/pinctrl-tegra124.c
@@ -2053,6 +2053,9 @@ static const struct tegra_pinctrl_soc_data tegra124_pinctrl = {
 	.nfunctions = ARRAY_SIZE(tegra124_functions),
 	.groups = tegra124_groups,
 	.ngroups = ARRAY_SIZE(tegra124_groups),
+	.hsm_in_mux = false,
+	.schmitt_in_mux = false,
+	.drvtype_in_mux = false,
 };
 
 static int tegra124_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/pinctrl-tegra20.c b/drivers/pinctrl/pinctrl-tegra20.c
index d3a5722e4acb..4833db4433d9 100644
--- a/drivers/pinctrl/pinctrl-tegra20.c
+++ b/drivers/pinctrl/pinctrl-tegra20.c
@@ -2221,6 +2221,9 @@ static const struct tegra_pinctrl_soc_data tegra20_pinctrl = {
 	.nfunctions = ARRAY_SIZE(tegra20_functions),
 	.groups = tegra20_groups,
 	.ngroups = ARRAY_SIZE(tegra20_groups),
+	.hsm_in_mux = false,
+	.schmitt_in_mux = false,
+	.drvtype_in_mux = false,
 };
 
 static int tegra20_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/pinctrl-tegra30.c b/drivers/pinctrl/pinctrl-tegra30.c
index 77c0768d5bd8..47b2fd8bb2e9 100644
--- a/drivers/pinctrl/pinctrl-tegra30.c
+++ b/drivers/pinctrl/pinctrl-tegra30.c
@@ -2476,6 +2476,9 @@ static const struct tegra_pinctrl_soc_data tegra30_pinctrl = {
 	.nfunctions = ARRAY_SIZE(tegra30_functions),
 	.groups = tegra30_groups,
 	.ngroups = ARRAY_SIZE(tegra30_groups),
+	.hsm_in_mux = false,
+	.schmitt_in_mux = false,
+	.drvtype_in_mux = false,
 };
 
 static int tegra30_pinctrl_probe(struct platform_device *pdev)
-- 
1.9.1

