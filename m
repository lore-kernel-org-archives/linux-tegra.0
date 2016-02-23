From: Krzysztof Adamski <krzysztof.adamski@tieto.com>
Subject: [PATCH] regulator: core: fix error path of regulator_ena_gpio_free
Date: Tue, 23 Feb 2016 15:47:10 +0100
Message-ID: <1456238830-13733-1-git-send-email-krzysztof.adamski@tieto.com>
References: <56CC6979.3050305@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56CC6979.3050305@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Krzysztof Adamski <krzysztof.adamski@tieto.com>
List-Id: linux-tegra@vger.kernel.org

This problem was introduced by:
commit daad134d6649 ("regulator: core: Request GPIO before creating
sysfs entries")

The error path was not updated correctly and in case
regulator_ena_gpio_free failed, device_unregister was called even though
it was not registered yet.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@tieto.com>
Reported-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/regulator/core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6ee9ba4..d1e7859 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3919,7 +3919,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 		if (ret != 0) {
 			rdev_err(rdev, "Failed to request enable GPIO%d: %d\n",
 				 config->ena_gpio, ret);
-			goto wash;
+			goto clean;
 		}
 	}
 
@@ -3942,7 +3942,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 
 	ret = set_machine_constraints(rdev, constraints);
 	if (ret < 0)
-		goto scrub;
+		goto wash;
 
 	if (init_data && init_data->supply_regulator)
 		rdev->supply_name = init_data->supply_regulator;
@@ -3972,10 +3972,8 @@ out:
 unset_supplies:
 	unset_regulator_supplies(rdev);
 
-scrub:
-	regulator_ena_gpio_free(rdev);
-
 wash:
+	regulator_ena_gpio_free(rdev);
 	device_unregister(&rdev->dev);
 	/* device core frees rdev */
 	rdev = ERR_PTR(ret);
-- 
2.1.4
