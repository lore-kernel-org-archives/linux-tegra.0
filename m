From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: core: Add early supply resolution for regulators" to the regulator tree
Date: Wed, 27 Apr 2016 17:35:15 +0100
Message-ID: <E1avSQl-0004YH-Jk@debutante>
References: <1461666585-11306-1-git-send-email-jonathanh@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461666585-11306-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

The patch

   regulator: core: Add early supply resolution for regulators

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

From 45389c47526d1eca70f96872c172aea0941e8520 Mon Sep 17 00:00:00 2001
From: Jon Hunter <jonathanh@nvidia.com>
Date: Tue, 26 Apr 2016 11:29:45 +0100
Subject: [PATCH] regulator: core: Add early supply resolution for regulators

The call to set_machine_constraints() in regulator_register(), will
attempt to get the voltage for the regulator. If a regulator is in
bypass will fail to get the voltage (ie. it's bypass voltage) and
hence register the regulator, because the supply for the regulator has
not been resolved yet.

To fix this, add a call to regulator_resolve_supply() before we call
set_machine_constraints(). If the call to regulator_resolve_supply()
fails, rather than returning an error at this point, allow the
registration of the regulator to continue because for some regulators
resolving the supply at this point may not be necessary and it will be
resolved later as more regulators are added. Furthermore, if the supply
is still not resolved for a bypassed regulator, this will be detected
when we attempt to get the voltage for the regulator and an error will
be propagated at this point.

If a bypassed regulator does not have a supply when we attempt to get
the voltage, rather than returing -EINVAL, return -EPROBE_DEFER instead
to allow the registration of the regulator to be deferred and tried
again later.

Please note that regulator_resolve_supply() will call
regulator_dev_lookup() which may acquire the regulator_list_mutex. To
avoid any deadlocks we cannot hold the regulator_list_mutex when calling
regulator_resolve_supply(). Therefore, rather than holding the lock
around a large portion of the registration code, just hold the lock when
aquiring any GPIOs and setting up supplies because these sections may
add entries to the regulator_map_list and regulator_ena_gpio_list,
respectively.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index f6d624dfcf9f..f4ab8c8bab23 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3118,8 +3118,11 @@ static int _regulator_get_voltage(struct regulator_dev *rdev)
 			return ret;
 		if (bypassed) {
 			/* if bypassed the regulator must have a supply */
-			if (!rdev->supply)
-				return -EINVAL;
+			if (!rdev->supply) {
+				rdev_err(rdev,
+					 "bypassed regulator has no supply!\n");
+				return -EPROBE_DEFER;
+			}
 
 			return _regulator_get_voltage(rdev->supply->rdev);
 		}
@@ -3936,8 +3939,6 @@ regulator_register(const struct regulator_desc *regulator_desc,
 		rdev->dev.of_node = of_node_get(config->of_node);
 	}
 
-	mutex_lock(&regulator_list_mutex);
-
 	mutex_init(&rdev->mutex);
 	rdev->reg_data = config->driver_data;
 	rdev->owner = regulator_desc->owner;
@@ -3962,7 +3963,9 @@ regulator_register(const struct regulator_desc *regulator_desc,
 
 	if ((config->ena_gpio || config->ena_gpio_initialized) &&
 	    gpio_is_valid(config->ena_gpio)) {
+		mutex_lock(&regulator_list_mutex);
 		ret = regulator_ena_gpio_request(rdev, config);
+		mutex_unlock(&regulator_list_mutex);
 		if (ret != 0) {
 			rdev_err(rdev, "Failed to request enable GPIO%d: %d\n",
 				 config->ena_gpio, ret);
@@ -3980,31 +3983,40 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	if (init_data)
 		constraints = &init_data->constraints;
 
-	ret = set_machine_constraints(rdev, constraints);
-	if (ret < 0)
-		goto wash;
-
 	if (init_data && init_data->supply_regulator)
 		rdev->supply_name = init_data->supply_regulator;
 	else if (regulator_desc->supply_name)
 		rdev->supply_name = regulator_desc->supply_name;
 
+	/*
+	 * Attempt to resolve the regulator supply, if specified,
+	 * but don't return an error if we fail because we will try
+	 * to resolve it again later as more regulators are added.
+	 */
+	if (regulator_resolve_supply(rdev))
+		rdev_dbg(rdev, "unable to resolve supply\n");
+
+	ret = set_machine_constraints(rdev, constraints);
+	if (ret < 0)
+		goto wash;
+
 	/* add consumers devices */
 	if (init_data) {
+		mutex_lock(&regulator_list_mutex);
 		for (i = 0; i < init_data->num_consumer_supplies; i++) {
 			ret = set_consumer_device_supply(rdev,
 				init_data->consumer_supplies[i].dev_name,
 				init_data->consumer_supplies[i].supply);
 			if (ret < 0) {
+				mutex_unlock(&regulator_list_mutex);
 				dev_err(dev, "Failed to set supply %s\n",
 					init_data->consumer_supplies[i].supply);
 				goto unset_supplies;
 			}
 		}
+		mutex_unlock(&regulator_list_mutex);
 	}
 
-	mutex_unlock(&regulator_list_mutex);
-
 	ret = device_register(&rdev->dev);
 	if (ret != 0) {
 		put_device(&rdev->dev);
@@ -4021,13 +4033,16 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	return rdev;
 
 unset_supplies:
+	mutex_lock(&regulator_list_mutex);
 	unset_regulator_supplies(rdev);
+	mutex_unlock(&regulator_list_mutex);
 wash:
 	kfree(rdev->constraints);
+	mutex_lock(&regulator_list_mutex);
 	regulator_ena_gpio_free(rdev);
+	mutex_unlock(&regulator_list_mutex);
 clean:
 	kfree(rdev);
-	mutex_unlock(&regulator_list_mutex);
 	kfree(config);
 	return ERR_PTR(ret);
 }
-- 
2.8.0.rc3
