From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/5] regulator: core: Don't terminate supply resolution early
Date: Thu, 21 Apr 2016 17:11:57 +0100
Message-ID: <1461255121-5245-2-git-send-email-jonathanh@nvidia.com>
References: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The function regulator_register_resolve_supply() is called from the
context of class_for_each_dev() (during the regulator registration) to
resolve any supplies added. regulator_register_resolve_supply() will
return an error if a regulator's supply cannot be resolved and this will
terminate the loop in class_for_each_dev(). This means that we will not
attempt to resolve any other supplies after one has failed. Hence, this
may delay the resolution of other regulator supplies until the failing
one itself can be resolved.

Rather than terminating the loop early, don't return an error code and
keep attempting to resolve any other supplies for regulators that have
been registered.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/regulator/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 61d3918f329e..a0b52ef11c30 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3865,7 +3865,12 @@ static void rdev_init_debugfs(struct regulator_dev *rdev)
 
 static int regulator_register_resolve_supply(struct device *dev, void *data)
 {
-	return regulator_resolve_supply(dev_to_rdev(dev));
+	struct regulator_dev *rdev = dev_to_rdev(dev);
+
+	if (regulator_resolve_supply(rdev))
+		rdev_dbg(rdev, "unable to resolve supply\n");
+
+	return 0;
 }
 
 /**
-- 
2.1.4
