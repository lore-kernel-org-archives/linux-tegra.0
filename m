From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 1/4] regulator: tps65910: update type for regmap
Date: Tue, 17 Apr 2012 18:00:26 -0700
Message-ID: <1334710829-22777-2-git-send-email-rklein@nvidia.com>
References: <1334710829-22777-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1334710829-22777-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Samuel Ortiz <sameo@linux.intel.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When accessing the regmap via the read/write functions, we need to use a
unsigned int * instead of a u8 * otherwise corruption will occur.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/regulator/tps65910-regulator.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator/tps65910-regulator.c
index 747bf57..9fd0fe1 100644
--- a/drivers/regulator/tps65910-regulator.c
+++ b/drivers/regulator/tps65910-regulator.c
@@ -331,7 +331,7 @@ struct tps65910_reg {
 
 static inline int tps65910_read(struct tps65910_reg *pmic, u8 reg)
 {
-	u8 val;
+	unsigned int val;
 	int err;
 
 	err = pmic->mfd->read(pmic->mfd, reg, 1, &val);
-- 
1.7.0.4
