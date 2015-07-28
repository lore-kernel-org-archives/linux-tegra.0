From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] regulator: max8973: Set VSEL regmap ops if DVS GPIO is not set
Date: Tue, 28 Jul 2015 11:34:11 +0300
Message-ID: <1438072451-22590-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, ldewangan@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Use regmap helpers for get_voltage_sel and set_voltage_sel ops
if the DVS GPIO is not set.

The DVS GPIO allows on the fly selection of the VSEL register
from two choices. However, if it is not set, the VSEL register
will stay fixed and we can use the regmap ops. This allows use
of the *hardware_vsel* regulator APIs.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
This was just compile-tested as I don't have a board with this regulator.

 drivers/regulator/max8973-regulator.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/regulator/max8973-regulator.c b/drivers/regulator/max8973-regulator.c
index a3e0bccb3f7d..5b75b7c2e3ea 100644
--- a/drivers/regulator/max8973-regulator.c
+++ b/drivers/regulator/max8973-regulator.c
@@ -637,6 +637,15 @@ static int max8973_probe(struct i2c_client *client,
 			max->lru_index[i] = i;
 		max->lru_index[0] = max->curr_vout_reg;
 		max->lru_index[max->curr_vout_reg] = 0;
+	} else {
+		/*
+		 * If there is no DVS GPIO, the VOUT register
+		 * address is fixed.
+		 */
+		max->ops.set_voltage_sel = regulator_set_voltage_sel_regmap;
+		max->ops.get_voltage_sel = regulator_get_voltage_sel_regmap;
+		max->desc.vsel_reg = max->curr_vout_reg;
+		max->desc.vsel_mask = MAX8973_VOUT_MASK;
 	}
 
 	if (pdata_from_dt)
-- 
2.1.4
