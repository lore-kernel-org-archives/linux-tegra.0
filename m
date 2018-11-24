From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] memory: tegra: Convert to using %pOFn instead of device_node.name
Date: Sat, 24 Nov 2018 09:07:25 -0500
Message-ID: <20181124140725.28593-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

In preparation to remove the node name pointer from struct device_node,
convert printf users to use the %pOFn format specifier.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/memory/tegra/mc.c           |  6 +++---
 drivers/memory/tegra/tegra124-emc.c | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index bd25faf6d13d..24afc36833bf 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -345,7 +345,7 @@ static int load_one_timing(struct tegra_mc *mc,
 	err = of_property_read_u32(node, "clock-frequency", &tmp);
 	if (err) {
 		dev_err(mc->dev,
-			"timing %s: failed to read rate\n", node->name);
+			"timing %pOFn: failed to read rate\n", node);
 		return err;
 	}
 
@@ -360,8 +360,8 @@ static int load_one_timing(struct tegra_mc *mc,
 					 mc->soc->num_emem_regs);
 	if (err) {
 		dev_err(mc->dev,
-			"timing %s: failed to read EMEM configuration\n",
-			node->name);
+			"timing %pOFn: failed to read EMEM configuration\n",
+			node);
 		return err;
 	}
 
diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 392dc8dd481f..eedb7d48e2ea 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -888,8 +888,8 @@ static int load_one_timing_from_dt(struct tegra_emc *emc,
 
 	err = of_property_read_u32(node, "clock-frequency", &value);
 	if (err) {
-		dev_err(emc->dev, "timing %s: failed to read rate: %d\n",
-			node->name, err);
+		dev_err(emc->dev, "timing %pOFn: failed to read rate: %d\n",
+			node, err);
 		return err;
 	}
 
@@ -900,16 +900,16 @@ static int load_one_timing_from_dt(struct tegra_emc *emc,
 					 ARRAY_SIZE(timing->emc_burst_data));
 	if (err) {
 		dev_err(emc->dev,
-			"timing %s: failed to read emc burst data: %d\n",
-			node->name, err);
+			"timing %pOFn: failed to read emc burst data: %d\n",
+			node, err);
 		return err;
 	}
 
 #define EMC_READ_PROP(prop, dtprop) { \
 	err = of_property_read_u32(node, dtprop, &timing->prop); \
 	if (err) { \
-		dev_err(emc->dev, "timing %s: failed to read " #prop ": %d\n", \
-			node->name, err); \
+		dev_err(emc->dev, "timing %pOFn: failed to read " #prop ": %d\n", \
+			node, err); \
 		return err; \
 	} \
 }
-- 
2.17.0
