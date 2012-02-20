From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v2] ARM: tegra: PCIe: Provide 3.3V supply voltage
Date: Mon, 20 Feb 2012 08:57:27 +0100
Message-ID: <1329724647-15783-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The PCIe reference clock needs a 3.3V supply voltage to work properly.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
This patch is based on next-20120217. Note that PCIe works without this
patch when the Linux kernel is booted with a combination of QuickBoot
and U-Boot because either apparently sets LD0 to 3.3V. This is not the
case when booting from mainline U-Boot, so it must be set explicitly.

Changes in v2:
* Set voltage via constraints as suggested by Mark Brown.

 arch/arm/mach-tegra/board-harmony-power.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony-power.c b/arch/arm/mach-tegra/board-harmony-power.c
index 976edfb0..82f32300 100644
--- a/arch/arm/mach-tegra/board-harmony-power.c
+++ b/arch/arm/mach-tegra/board-harmony-power.c
@@ -31,13 +31,14 @@ static struct regulator_consumer_supply tps658621_ldo0_supply[] = {
 
 static struct regulator_init_data ldo0_data = {
 	.constraints = {
-		.min_uV = 1250 * 1000,
+		.min_uV = 3300 * 1000,
 		.max_uV = 3300 * 1000,
 		.valid_modes_mask = (REGULATOR_MODE_NORMAL |
 				     REGULATOR_MODE_STANDBY),
 		.valid_ops_mask = (REGULATOR_CHANGE_MODE |
 				   REGULATOR_CHANGE_STATUS |
 				   REGULATOR_CHANGE_VOLTAGE),
+		.apply_uV = 1,
 	},
 	.num_consumer_supplies = ARRAY_SIZE(tps658621_ldo0_supply),
 	.consumer_supplies = tps658621_ldo0_supply,
-- 
1.7.9.1
