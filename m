From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] regulator: as3722: Make 0 a valid selector
Date: Tue,  3 Jun 2014 17:17:32 +0200
Message-ID: <1401808652-20524-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

As of commit 064d5cd110f9 (regulator: core: Fix the init of DT defined
fixed regulators) the regulator core tries to query the current voltage
of a regulator when applying constraints. This exposes a bug in the
AS3722 regulator driver which fails to read the voltage of disabled
regulators. The reason is that the hardware is programmed to a selector
of 0, but none of the voltage tables include 0 as a valid selector. The
datasheets indicate that 0 is a valid selector when the regulators are
powered off.

To fix this, add a range including selector 0 to the voltage tables.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/regulator/as3722-regulator.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/regulator/as3722-regulator.c b/drivers/regulator/as3722-regulator.c
index 85585219ce82..ad9e0c9b7daf 100644
--- a/drivers/regulator/as3722-regulator.c
+++ b/drivers/regulator/as3722-regulator.c
@@ -433,6 +433,7 @@ static struct regulator_ops as3722_ldo3_extcntrl_ops = {
 };
 
 static const struct regulator_linear_range as3722_ldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(0, 0x00, 0x00, 0),
 	REGULATOR_LINEAR_RANGE(825000, 0x01, 0x24, 25000),
 	REGULATOR_LINEAR_RANGE(1725000, 0x40, 0x7F, 25000),
 };
@@ -609,6 +610,7 @@ static bool as3722_sd0_is_low_voltage(struct as3722_regulators *as3722_regs)
 }
 
 static const struct regulator_linear_range as3722_sd2345_ranges[] = {
+	REGULATOR_LINEAR_RANGE(0, 0x00, 0x00, 0),
 	REGULATOR_LINEAR_RANGE(612500, 0x01, 0x40, 12500),
 	REGULATOR_LINEAR_RANGE(1425000, 0x41, 0x70, 25000),
 	REGULATOR_LINEAR_RANGE(2650000, 0x71, 0x7F, 50000),
-- 
1.9.2
