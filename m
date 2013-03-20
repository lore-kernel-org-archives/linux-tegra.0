From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] regulator: palmas: add input supply names
Date: Wed, 20 Mar 2013 19:26:37 +0530
Message-ID: <1363787797-20659-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Palmas regulator support the different input supply pins for each of
the rails. Fill the regulator info data with their input supply pin
names.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes from V1:
- Passing desc->sname for input supply unconditionally.
- If input pins are unconnected then it will be connect
  to floating supply.

 drivers/regulator/palmas-regulator.c |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/drivers/regulator/palmas-regulator.c b/drivers/regulator/palmas-regulator.c
index 4a45942..bfca28f 100644
--- a/drivers/regulator/palmas-regulator.c
+++ b/drivers/regulator/palmas-regulator.c
@@ -29,6 +29,7 @@
 
 struct regs_info {
 	char	*name;
+	char	*sname;
 	u8	vsel_addr;
 	u8	ctrl_addr;
 	u8	tstep_addr;
@@ -37,110 +38,131 @@ struct regs_info {
 static const struct regs_info palmas_regs_info[] = {
 	{
 		.name		= "SMPS12",
+		.sname		= "smps1-in",
 		.vsel_addr	= PALMAS_SMPS12_VOLTAGE,
 		.ctrl_addr	= PALMAS_SMPS12_CTRL,
 		.tstep_addr	= PALMAS_SMPS12_TSTEP,
 	},
 	{
 		.name		= "SMPS123",
+		.sname		= "smps1-in",
 		.vsel_addr	= PALMAS_SMPS12_VOLTAGE,
 		.ctrl_addr	= PALMAS_SMPS12_CTRL,
 		.tstep_addr	= PALMAS_SMPS12_TSTEP,
 	},
 	{
 		.name		= "SMPS3",
+		.sname		= "smps3-in",
 		.vsel_addr	= PALMAS_SMPS3_VOLTAGE,
 		.ctrl_addr	= PALMAS_SMPS3_CTRL,
 	},
 	{
 		.name		= "SMPS45",
+		.sname		= "smps4-in",
 		.vsel_addr	= PALMAS_SMPS45_VOLTAGE,
 		.ctrl_addr	= PALMAS_SMPS45_CTRL,
 		.tstep_addr	= PALMAS_SMPS45_TSTEP,
 	},
 	{
 		.name		= "SMPS457",
+		.sname		= "smps4-in",
 		.vsel_addr	= PALMAS_SMPS45_VOLTAGE,
 		.ctrl_addr	= PALMAS_SMPS45_CTRL,
 		.tstep_addr	= PALMAS_SMPS45_TSTEP,
 	},
 	{
 		.name		= "SMPS6",
+		.sname		= "smps6-in",
 		.vsel_addr	= PALMAS_SMPS6_VOLTAGE,
 		.ctrl_addr	= PALMAS_SMPS6_CTRL,
 		.tstep_addr	= PALMAS_SMPS6_TSTEP,
 	},
 	{
 		.name		= "SMPS7",
+		.sname		= "smps7-in",
 		.vsel_addr	= PALMAS_SMPS7_VOLTAGE,
 		.ctrl_addr	= PALMAS_SMPS7_CTRL,
 	},
 	{
 		.name		= "SMPS8",
+		.sname		= "smps8-in",
 		.vsel_addr	= PALMAS_SMPS8_VOLTAGE,
 		.ctrl_addr	= PALMAS_SMPS8_CTRL,
 		.tstep_addr	= PALMAS_SMPS8_TSTEP,
 	},
 	{
 		.name		= "SMPS9",
+		.sname		= "smps9-in",
 		.vsel_addr	= PALMAS_SMPS9_VOLTAGE,
 		.ctrl_addr	= PALMAS_SMPS9_CTRL,
 	},
 	{
 		.name		= "SMPS10",
+		.sname		= "smps10-in",
 	},
 	{
 		.name		= "LDO1",
+		.sname		= "ldo1-in",
 		.vsel_addr	= PALMAS_LDO1_VOLTAGE,
 		.ctrl_addr	= PALMAS_LDO1_CTRL,
 	},
 	{
 		.name		= "LDO2",
+		.sname		= "ldo2-in",
 		.vsel_addr	= PALMAS_LDO2_VOLTAGE,
 		.ctrl_addr	= PALMAS_LDO2_CTRL,
 	},
 	{
 		.name		= "LDO3",
+		.sname		= "ldo3-in",
 		.vsel_addr	= PALMAS_LDO3_VOLTAGE,
 		.ctrl_addr	= PALMAS_LDO3_CTRL,
 	},
 	{
 		.name		= "LDO4",
+		.sname		= "ldo4-in",
 		.vsel_addr	= PALMAS_LDO4_VOLTAGE,
 		.ctrl_addr	= PALMAS_LDO4_CTRL,
 	},
 	{
 		.name		= "LDO5",
+		.sname		= "ldo5-in",
 		.vsel_addr	= PALMAS_LDO5_VOLTAGE,
 		.ctrl_addr	= PALMAS_LDO5_CTRL,
 	},
 	{
 		.name		= "LDO6",
+		.sname		= "ldo6-in",
 		.vsel_addr	= PALMAS_LDO6_VOLTAGE,
 		.ctrl_addr	= PALMAS_LDO6_CTRL,
 	},
 	{
 		.name		= "LDO7",
+		.sname		= "ldo7-in",
 		.vsel_addr	= PALMAS_LDO7_VOLTAGE,
 		.ctrl_addr	= PALMAS_LDO7_CTRL,
 	},
 	{
 		.name		= "LDO8",
+		.sname		= "ldo8-in",
 		.vsel_addr	= PALMAS_LDO8_VOLTAGE,
 		.ctrl_addr	= PALMAS_LDO8_CTRL,
 	},
 	{
 		.name		= "LDO9",
+		.sname		= "ldo9-in",
 		.vsel_addr	= PALMAS_LDO9_VOLTAGE,
 		.ctrl_addr	= PALMAS_LDO9_CTRL,
 	},
 	{
 		.name		= "LDOLN",
+		.sname		= "ldoln-in",
 		.vsel_addr	= PALMAS_LDOLN_VOLTAGE,
 		.ctrl_addr	= PALMAS_LDOLN_CTRL,
 	},
 	{
 		.name		= "LDOUSB",
+		.sname		= "ldousb-in",
 		.vsel_addr	= PALMAS_LDOUSB_VOLTAGE,
 		.ctrl_addr	= PALMAS_LDOUSB_CTRL,
 	},
@@ -710,6 +732,7 @@ static int palmas_regulators_probe(struct platform_device *pdev)
 		else
 			config.init_data = NULL;
 
+		pmic->desc[id].supply_name = palmas_regs_info[id].sname;
 		config.of_node = palmas_matches[id].of_node;
 
 		rdev = regulator_register(&pmic->desc[id], &config);
@@ -756,6 +779,7 @@ static int palmas_regulators_probe(struct platform_device *pdev)
 		else
 			config.init_data = NULL;
 
+		pmic->desc[id].supply_name = palmas_regs_info[id].sname;
 		config.of_node = palmas_matches[id].of_node;
 
 		rdev = regulator_register(&pmic->desc[id], &config);
-- 
1.7.1.1
