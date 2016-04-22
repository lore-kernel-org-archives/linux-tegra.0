From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: core: Clear the supply pointer if enabling fails" to the regulator tree
Date: Fri, 22 Apr 2016 11:49:43 +0100
Message-ID: <E1atYed-0002jb-Dw@debutante>
References: <1461255121-5245-3-git-send-email-jonathanh@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461255121-5245-3-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The patch

   regulator: core: Clear the supply pointer if enabling fails

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

From 8e5356a73604f53da6a1e0756727cb8f9f7bba17 Mon Sep 17 00:00:00 2001
From: Jon Hunter <jonathanh@nvidia.com>
Date: Thu, 21 Apr 2016 17:11:58 +0100
Subject: [PATCH] regulator: core: Clear the supply pointer if enabling fails

During the resolution of a regulator's supply, we may attempt to enable
the supply if the regulator itself is already enabled. If enabling the
supply fails, then we will call _regulator_put() for the supply.
However, the pointer to the supply has not been cleared for the
regulator and this will cause a crash if we then unregister the
regulator and attempt to call regulator_put() a second time for the
supply. Fix this by clearing the supply pointer if enabling the supply
after fails when resolving the supply for a regulator.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 9922922ce6bd..bd9ec309b707 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1536,6 +1536,7 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
 		ret = regulator_enable(rdev->supply);
 		if (ret < 0) {
 			_regulator_put(rdev->supply);
+			rdev->supply = NULL;
 			return ret;
 		}
 	}
-- 
2.8.0.rc3
