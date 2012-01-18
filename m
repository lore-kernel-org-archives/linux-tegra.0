From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1 2/2] regulator: tps65910: Initialize n_voltages for rails.
Date: Wed, 18 Jan 2012 20:47:16 +0530
Message-ID: <1326899836-14470-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lrg-l0cyMroinI0@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Initializing the number of voltages supported by different
rails of pmic device tps65911.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/tps65910-regulator.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator/tps65910-regulator.c
index 6742418..3ac5f91 100644
--- a/drivers/regulator/tps65910-regulator.c
+++ b/drivers/regulator/tps65910-regulator.c
@@ -188,56 +188,67 @@ static struct tps_info tps65911_regs[] = {
 		.name = "VDD1",
 		.min_uV = 600000,
 		.max_uV = 4500000,
+		.table_len = 73,
 	},
 	{
 		.name = "VDD2",
 		.min_uV = 600000,
 		.max_uV = 4500000,
+		.table_len = 73,
 	},
 	{
 		.name = "VDDCTRL",
 		.min_uV = 600000,
 		.max_uV = 1400000,
+		.table_len = 65,
 	},
 	{
 		.name = "LDO1",
 		.min_uV = 1000000,
 		.max_uV = 3300000,
+		.table_len = 47,
 	},
 	{
 		.name = "LDO2",
 		.min_uV = 1000000,
 		.max_uV = 3300000,
+		.table_len = 47,
 	},
 	{
 		.name = "LDO3",
 		.min_uV = 1000000,
 		.max_uV = 3300000,
+		.table_len = 24,
 	},
 	{
 		.name = "LDO4",
 		.min_uV = 1000000,
 		.max_uV = 3300000,
+		.table_len = 47,
 	},
 	{
 		.name = "LDO5",
 		.min_uV = 1000000,
 		.max_uV = 3300000,
+		.table_len = 24,
 	},
 	{
 		.name = "LDO6",
 		.min_uV = 1000000,
 		.max_uV = 3300000,
+		.table_len = 24,
 	},
 	{
 		.name = "LDO7",
 		.min_uV = 1000000,
 		.max_uV = 3300000,
+		.table_len = 24,
 	},
 	{
 		.name = "LDO8",
 		.min_uV = 1000000,
 		.max_uV = 3300000,
+		.table_len = 24,
 	},
 };
 
-- 
1.7.1.1
