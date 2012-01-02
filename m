From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1] regulator: Enable supply regulator if child rail is enabled.
Date: Mon,  2 Jan 2012 13:08:45 +0530
Message-ID: <1325489925-5148-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lrg-l0cyMroinI0@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

During regulator_register, the rail is set on the provided
machine constraints and if it is enabled then it is also
require to enable the supply regulator. This will make sure
that:
   1. Proper reference count for supply regulator to be maintain.
   2. Supply regulator should be enable when given rail is enabled.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
When given rail is registered and if it has machine constratins to
enable the rail then it is also require to enable the supply rail for
a given rail. This will make sure that given rail is enabled and
proper reference count is maintained for the supply rail to avoid
disable of supply rail even child rail is enabled.

 drivers/regulator/core.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index dbdebed..6e7a4f1 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2801,6 +2801,14 @@ struct regulator_dev *regulator_register(struct regulator_desc *regulator_desc,
 		ret = set_supply(rdev, r);
 		if (ret < 0)
 			goto scrub;
+
+		/* Enable supply if rail is enabled */
+		if (rdev->desc->ops->is_enabled &&
+				rdev->desc->ops->is_enabled(rdev)) {
+			ret = regulator_enable(rdev->supply);
+			if (ret < 0)
+				goto scrub;
+		}
 	}
 
 	/* add consumers devices */
-- 
1.7.1.1
