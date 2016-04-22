From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: core: Don't terminate supply resolution early" to the regulator tree
Date: Fri, 22 Apr 2016 11:49:46 +0100
Message-ID: <E1atYeg-0002kG-CI@debutante>
References: <1461255121-5245-2-git-send-email-jonathanh@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461255121-5245-2-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The patch

   regulator: core: Don't terminate supply resolution early

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 7ddede6a58a0bd26efcfd2a5055611195411f514 Mon Sep 17 00:00:00 2001
From: Jon Hunter <jonathanh@nvidia.com>
Date: Thu, 21 Apr 2016 17:11:57 +0100
Subject: [PATCH] regulator: core: Don't terminate supply resolution early

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
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index fd0e4e37f4e1..9922922ce6bd 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3842,7 +3842,12 @@ static void rdev_init_debugfs(struct regulator_dev *rdev)
 
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
2.8.0.rc3
