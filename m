From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 02/11] regulator: Support driver probe deferral
Date: Thu,  8 Mar 2012 15:51:22 +0100
Message-ID: <1331218291-16119-3-git-send-email-thierry.reding@avionic-design.de>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331218291-16119-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

If we fail to locate a requested regulator return -EPROBE_DEFER. If drivers
pass this error code through to their caller (which they really should)
then this will ensure that the probe is retried later when further devices
become available.

Signed-off-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
[G,Manjunath Kondaiah removed in order not to bother him]
Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Acked-by: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
---
 drivers/regulator/core.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 5a6b8ba..8a4b0a8 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1198,7 +1198,7 @@ static struct regulator *_regulator_get(struct device *dev, const char *id,
 {
 	struct regulator_dev *rdev;
 	struct regulator_map *map;
-	struct regulator *regulator = ERR_PTR(-ENODEV);
+	struct regulator *regulator = ERR_PTR(-EPROBE_DEFER);
 	const char *devname = NULL;
 	int ret;
 
@@ -2926,7 +2926,7 @@ struct regulator_dev *regulator_register(struct regulator_desc *regulator_desc,
 
 		if (!r) {
 			dev_err(dev, "Failed to find supply %s\n", supply);
-			ret = -ENODEV;
+			ret = -EPROBE_DEFER;
 			goto scrub;
 		}
 
-- 
1.7.9.3
