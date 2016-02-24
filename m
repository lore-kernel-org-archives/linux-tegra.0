From: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] regulator: core: fix error path of regulator_ena_gpio_free
Date: Wed, 24 Feb 2016 09:27:59 +0100
Message-ID: <1456302479-14045-1-git-send-email-krzysztof.adamski@tieto.com>
References: <56CC7863.4080202@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56CC7863.4080202-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This problem was introduced by:
commit daad134d6649 ("regulator: core: Request GPIO before creating
sysfs entries")

The error path was not updated correctly and in case
regulator_ena_gpio_free failed, device_unregister was called even though
it was not registered yet.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
Reported-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6ee9ba4..055f8c1 100644
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
 
@@ -3931,7 +3931,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	ret = device_register(&rdev->dev);
 	if (ret != 0) {
 		put_device(&rdev->dev);
-		goto clean;
+		goto wash;
 	}
 
 	dev_set_drvdata(&rdev->dev, rdev);
@@ -3974,13 +3974,13 @@ unset_supplies:
 
 scrub:
 	regulator_ena_gpio_free(rdev);
-
-wash:
 	device_unregister(&rdev->dev);
 	/* device core frees rdev */
 	rdev = ERR_PTR(ret);
 	goto out;
 
+wash:
+	regulator_ena_gpio_free(rdev);
 clean:
 	kfree(rdev);
 	rdev = ERR_PTR(ret);
-- 
2.1.4
