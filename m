From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: core: Move registration of regulator device" to the regulator tree
Date: Fri, 22 Apr 2016 11:49:40 +0100
Message-ID: <E1atYea-0002ix-GT@debutante>
References: <1461255121-5245-4-git-send-email-jonathanh@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461255121-5245-4-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The patch

   regulator: core: Move registration of regulator device

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

From c438b9d017362b65f6b1a9e54f7f35e7f873dc7c Mon Sep 17 00:00:00 2001
From: Jon Hunter <jonathanh@nvidia.com>
Date: Thu, 21 Apr 2016 17:11:59 +0100
Subject: [PATCH] regulator: core: Move registration of regulator device

The public functions to acquire a regulator, such as regulator_get(),
internally look-up the regulator from the list of regulators that have
been registered with the regulator device class. The registration of
a new regulator with the regulator device class happens before the
regulator has been completely setup. Therefore, it is possible that
the regulator could be acquired before it has been setup successfully.
To avoid this move the device registration of the regulator to the end
of the regulator setup and update the error exit path accordingly.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index a17ce6cbbe77..8362a0a5105d 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3970,14 +3970,6 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	if (ret < 0)
 		goto wash;
 
-	ret = device_register(&rdev->dev);
-	if (ret != 0) {
-		put_device(&rdev->dev);
-		goto wash;
-	}
-
-	dev_set_drvdata(&rdev->dev, rdev);
-
 	if (init_data && init_data->supply_regulator)
 		rdev->supply_name = init_data->supply_regulator;
 	else if (regulator_desc->supply_name)
@@ -3997,9 +3989,17 @@ regulator_register(const struct regulator_desc *regulator_desc,
 		}
 	}
 
-	rdev_init_debugfs(rdev);
 	mutex_unlock(&regulator_list_mutex);
 
+	ret = device_register(&rdev->dev);
+	if (ret != 0) {
+		put_device(&rdev->dev);
+		goto unset_supplies;
+	}
+
+	dev_set_drvdata(&rdev->dev, rdev);
+	rdev_init_debugfs(rdev);
+
 	/* try to resolve regulators supply since a new one was registered */
 	class_for_each_device(&regulator_class, NULL, NULL,
 			      regulator_register_resolve_supply);
@@ -4008,17 +4008,11 @@ regulator_register(const struct regulator_desc *regulator_desc,
 
 unset_supplies:
 	unset_regulator_supplies(rdev);
-	regulator_ena_gpio_free(rdev);
-	device_unregister(&rdev->dev);
-	/* device core frees rdev */
-	goto out;
-
 wash:
 	kfree(rdev->constraints);
 	regulator_ena_gpio_free(rdev);
 clean:
 	kfree(rdev);
-out:
 	mutex_unlock(&regulator_list_mutex);
 	kfree(config);
 	return ERR_PTR(ret);
-- 
2.8.0.rc3
