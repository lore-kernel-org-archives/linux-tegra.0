From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] regulator: core: Unset supplies when regulators are unregistered
Date: Fri, 6 Jan 2017 11:54:38 +0000
Message-ID: <1483703678-19575-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When regulators are unregistered they are removed from the regulator map
list, however, if the register has been added as a supply for another
regulator, it is not removed from the regulator as a supply. Therefore,
a regulator may still be holding a reference to a regulator that has
been unregistered a lead to a panic.

There is a case where a child regulator is registered before its supply
and when the supply is registered successfully, the supply for the child
is then set. Although, this in itself is not a problem, a problem arises
when the supply is then unregistered again, due to the parent device
being probed deferred, after successfully registering the supply. This
leaves the regulator with an invalid reference to supply and can
eventually result in a kernel panic.

Addtionally, even in the normal case when a regulator is unregistered,
by unloading a driver, if the regulator happens to be a supply for
another regulator it is not removed.

Fix this by scanning all the registered regulators when a regulator is
removed and remove it as a supply to any other regulator. There is a
possibility that a child regulator is in use when the supply is removed
and so WARN if this happens.

Note that the debugfs node for the regulator supply must be freed before
the debugfs node for the regulator_dev and so ensure the regulator_dev
debugfs node is freed after the any supplies have been removed.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---

This problem has been exposed on -next due to some other changes that
have caused a slight re-ordering in the boot sequence for Tegra124
Jetson-TK1 and causes the boot to fail. The board panics when trying
to enable a supply which is not valid. This happens because the supply
for a regulator is resolved when the supply is registered but then the
supply gets unregistered again due to a probe deferral later on,
leaving a invalid reference to the supply for the regulator.

I can't say I am completely happy with this as there is still the
potential for someone to remove a supply while a child regulator is
in use. However, I guess that is no different from today AFAICT, but
hopefully this will avoid some panics?!?

Ideally, it would be good to defer all the supply resolution until we
know for certain that the device has been probed OK and will not be
deferred in anyway. So I am not sure if there is a better way to fix
this.

 drivers/regulator/core.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 04baac9..18b22fd 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1242,6 +1242,21 @@ static int set_consumer_device_supply(struct regulator_dev *rdev,
 	return 0;
 }
 
+static int regulator_unset_supply(struct device *dev, void *data)
+{
+	struct regulator_dev *rdev = dev_to_rdev(dev);
+	struct regulator_dev *supply_rdev = data;
+
+	if (rdev->supply && rdev->supply->rdev == supply_rdev) {
+		rdev_dbg(rdev, "removing supply %s\n", rdev_get_name(rdev));
+		WARN_ON(rdev->open_count);
+		_regulator_put(rdev->supply);
+		rdev->supply = NULL;
+	}
+
+	return 0;
+}
+
 static void unset_regulator_supplies(struct regulator_dev *rdev)
 {
 	struct regulator_map *node, *n;
@@ -1253,6 +1268,9 @@ static void unset_regulator_supplies(struct regulator_dev *rdev)
 			kfree(node);
 		}
 	}
+
+	class_for_each_device(&regulator_class, NULL, rdev,
+			      regulator_unset_supply);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -4131,10 +4149,10 @@ void regulator_unregister(struct regulator_dev *rdev)
 		regulator_put(rdev->supply);
 	}
 	mutex_lock(&regulator_list_mutex);
-	debugfs_remove_recursive(rdev->debugfs);
 	flush_work(&rdev->disable_work.work);
-	WARN_ON(rdev->open_count);
 	unset_regulator_supplies(rdev);
+	debugfs_remove_recursive(rdev->debugfs);
+	WARN_ON(rdev->open_count);
 	list_del(&rdev->list);
 	regulator_ena_gpio_free(rdev);
 	mutex_unlock(&regulator_list_mutex);
-- 
1.9.1
