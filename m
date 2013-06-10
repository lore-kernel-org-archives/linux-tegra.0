From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] mfd: tps6586x: correct device name of the regulator cell
Date: Mon, 10 Jun 2013 22:06:01 +0200
Message-ID: <89e4451e14f324d8bd480f843fa5960b481e3188.1370894247.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Change the device name of the regulator function to the one chosed for
MODULE_ALIAS. This fixes kernel module loading for the regulator function.
Also change the name of the platform driver to make everything consistent.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
I don't think this "fix" can still go into 3.10, but I would love to see
it there because otherwise many distro kernels supporting tegra2 would have
to force load the driver.

 drivers/mfd/tps6586x.c                 |    2 +-
 drivers/regulator/tps6586x-regulator.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 721b918..4b93ed4 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -107,7 +107,7 @@ static struct mfd_cell tps6586x_cell[] = {
 		.name = "tps6586x-gpio",
 	},
 	{
-		.name = "tps6586x-pmic",
+		.name = "tps6586x-regulator",
 	},
 	{
 		.name = "tps6586x-rtc",
diff --git a/drivers/regulator/tps6586x-regulator.c b/drivers/regulator/tps6586x-regulator.c
index d8fa37d..2c9155b 100644
--- a/drivers/regulator/tps6586x-regulator.c
+++ b/drivers/regulator/tps6586x-regulator.c
@@ -439,7 +439,7 @@ static int tps6586x_regulator_remove(struct platform_device *pdev)
 
 static struct platform_driver tps6586x_regulator_driver = {
 	.driver	= {
-		.name	= "tps6586x-pmic",
+		.name	= "tps6586x-regulator",
 		.owner	= THIS_MODULE,
 	},
 	.probe		= tps6586x_regulator_probe,
-- 
1.7.9.5
