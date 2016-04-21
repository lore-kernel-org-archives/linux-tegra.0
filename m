From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/5] regulator: core: Move registration of regulator device
Date: Thu, 21 Apr 2016 17:11:59 +0100
Message-ID: <1461255121-5245-4-git-send-email-jonathanh@nvidia.com>
References: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461255121-5245-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The public functions to acquire a regulator, such as regulator_get(),
internally look-up the regulator from the list of regulators that have
been registered with the regulator device class. The registration of
a new regulator with the regulator device class happens before the
regulator has been completely setup. Therefore, it is possible that
the regulator could be acquired before it has been setup successfully.
To avoid this move the device registration of the regulator to the end
of the regulator setup and update the error exit path accordingly.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/core.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 39d05fcc07e9..754f3b4c2218 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3993,14 +3993,6 @@ regulator_register(const struct regulator_desc *regulator_desc,
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
@@ -4020,9 +4012,17 @@ regulator_register(const struct regulator_desc *regulator_desc,
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
@@ -4031,17 +4031,11 @@ regulator_register(const struct regulator_desc *regulator_desc,
 
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
2.1.4
