From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [Patch-V2 2/4] pinctrl: tegra: Support 32 bit register access
Date: Thu, 9 May 2019 13:38:14 +0530
Message-ID: <1557389296-10257-2-git-send-email-kyarlagadda@nvidia.com>
References: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Cc: pdeschrijver@nvidia.com, josephl@nvidia.com, smangipudi@nvidia.com, ldewangan@nvidia.com, vidyas@nvidia.com, Krishna Yarlagadda <kyarlagadda@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra194 chip has 32 bit pinctrl registers. Existing register defines in
header are only 16 bit.
Modified common pinctrl-tegra driver to support 32 bit registers of
Tegra 194 and later chips.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 8 ++++----
 drivers/pinctrl/tegra/pinctrl-tegra.h | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index a5008c0..76e88c4 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -292,7 +292,7 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
 			     const struct tegra_pingroup *g,
 			     enum tegra_pinconf_param param,
 			     bool report_err,
-			     s8 *bank, s16 *reg, s8 *bit, s8 *width)
+			     s8 *bank, s32 *reg, s8 *bit, s8 *width)
 {
 	switch (param) {
 	case TEGRA_PINCONF_PARAM_PULL:
@@ -451,7 +451,7 @@ static int tegra_pinconf_group_get(struct pinctrl_dev *pctldev,
 	const struct tegra_pingroup *g;
 	int ret;
 	s8 bank, bit, width;
-	s16 reg;
+	s32 reg;
 	u32 val, mask;
 
 	g = &pmx->soc->groups[group];
@@ -480,7 +480,7 @@ static int tegra_pinconf_group_set(struct pinctrl_dev *pctldev,
 	const struct tegra_pingroup *g;
 	int ret, i;
 	s8 bank, bit, width;
-	s16 reg;
+	s32 reg;
 	u32 val, mask;
 
 	g = &pmx->soc->groups[group];
@@ -548,7 +548,7 @@ static void tegra_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 	const struct tegra_pingroup *g;
 	int i, ret;
 	s8 bank, bit, width;
-	s16 reg;
+	s32 reg;
 	u32 val;
 
 	g = &pmx->soc->groups[group];
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index 44c7194..82cd947 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -143,10 +143,10 @@ struct tegra_pingroup {
 	const unsigned *pins;
 	u8 npins;
 	u8 funcs[4];
-	s16 mux_reg;
-	s16 pupd_reg;
-	s16 tri_reg;
-	s16 drv_reg;
+	s32 mux_reg;
+	s32 pupd_reg;
+	s32 tri_reg;
+	s32 drv_reg;
 	u32 mux_bank:2;
 	u32 pupd_bank:2;
 	u32 tri_bank:2;
-- 
2.7.4
