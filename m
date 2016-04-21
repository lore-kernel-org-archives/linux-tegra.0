From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 4/5] regulator: core: Add early supply resolution for a bypassed regulator
Date: Thu, 21 Apr 2016 17:12:00 +0100
Message-ID: <1461255121-5245-5-git-send-email-jonathanh@nvidia.com>
References: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The call to set_machine_constraints() in regulator_register(), will
attempt to get the voltage for the regulator.

A regulator that is in bypass will fail to be registered because we will
attempt to get the voltage of the regulator (ie. it's bypass voltage)
before the supply for the regulator has been resolved. Therefore, when
getting the voltage for a bypassed regulator, if the supply has not been
resolved, then attempt to resolve it. Additionally, move the setup of
the regulator's supply name to before the call to
set_machine_constraints() so that it can be resolved.

Please note that regulator_resolve_supply() will call
regulator_dev_lookup() which may acquire the regulator_list_mutex. To
avoid any deadlocks we cannot hold the regulator_list_mutex when calling
regulator_resolve_supply(). Following this change because
set_machine_constraints() may now result in a call to
regulator_resolve_supply() for a bypassed regulator, we can no longer
hold the regulator_list_mutex around this call. To avoid this rather
than holding the lock around a large portion of the registration code,
just hold the lock when aquiring any GPIOs and setting up supplies
because these sections may add entries to the regulator_map_list and
regulator_ena_gpio_list, respectively.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/regulator/core.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 754f3b4c2218..4f57a1832079 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3127,8 +3127,13 @@ static int _regulator_get_voltage(struct regulator_dev *rdev)
 			return ret;
 		if (bypassed) {
 			/* if bypassed the regulator must have a supply */
-			if (!rdev->supply)
-				return -EINVAL;
+			if (!rdev->supply) {
+				ret = regulator_resolve_supply(rdev);
+				if (ret < 0)
+					return ret;
+				if (!rdev->supply)
+					return -EINVAL;
+			}
 
 			return _regulator_get_voltage(rdev->supply->rdev);
 		}
@@ -3945,8 +3950,6 @@ regulator_register(const struct regulator_desc *regulator_desc,
 		rdev->dev.of_node = of_node_get(config->of_node);
 	}
 
-	mutex_lock(&regulator_list_mutex);
-
 	mutex_init(&rdev->mutex);
 	rdev->reg_data = config->driver_data;
 	rdev->owner = regulator_desc->owner;
@@ -3971,7 +3974,9 @@ regulator_register(const struct regulator_desc *regulator_desc,
 
 	if ((config->ena_gpio || config->ena_gpio_initialized) &&
 	    gpio_is_valid(config->ena_gpio)) {
+		mutex_lock(&regulator_list_mutex);
 		ret = regulator_ena_gpio_request(rdev, config);
+		mutex_unlock(&regulator_list_mutex);
 		if (ret != 0) {
 			rdev_err(rdev, "Failed to request enable GPIO%d: %d\n",
 				 config->ena_gpio, ret);
@@ -3989,31 +3994,32 @@ regulator_register(const struct regulator_desc *regulator_desc,
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
@@ -4030,13 +4036,16 @@ regulator_register(const struct regulator_desc *regulator_desc,
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
2.1.4
