From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 5/5] regulator: helpers: Ensure bypass register field matches ON value
Date: Thu, 21 Apr 2016 17:12:01 +0100
Message-ID: <1461255121-5245-6-git-send-email-jonathanh@nvidia.com>
References: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When checking bypass state for a regulator, we check to see if any bits
in the bypass mask are set. For most cases this is fine because there is
typically, only a single bit used to determine if the regulator is in
bypass. However, for some regulators, such as LDO6 on AS3722, the bypass
state is indicate by a value rather than a single bit. Therefore, when
checking the bypass state, check that the bypass field matches the ON
value.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/regulator/helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
index b1e32e7482e9..bcf38fd5106a 100644
--- a/drivers/regulator/helpers.c
+++ b/drivers/regulator/helpers.c
@@ -460,7 +460,7 @@ int regulator_get_bypass_regmap(struct regulator_dev *rdev, bool *enable)
 	if (ret != 0)
 		return ret;
 
-	*enable = val & rdev->desc->bypass_mask;
+	*enable = (val & rdev->desc->bypass_mask) == rdev->desc->bypass_val_on;
 
 	return 0;
 }
-- 
2.1.4
