From: Laxman Dewangan <ldewangan.com-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] regulator: Rail is said to be enable only if this and supply rails are enabled.
Date: Tue,  3 Jan 2012 11:39:43 +0530
Message-ID: <1325570983-3700-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The given rail is said to be enabled only if this rail is eanbled
along with supply rail.
Adding check for the supply rail whether it is enabled or not when
query about rail enabled.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
When consumer of any rails query about whether rail is enabled
or not, the function regulator_is_enabled() should return enabled
only if this rail and supply rail (both) are enabled.
if any one of rail, whether the given rail or supply rail, is enabled
then function should return as not enabled.

 drivers/regulator/core.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index dbdebed..d914435 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1701,6 +1701,12 @@ int regulator_is_enabled(struct regulator *regulator)
 {
 	int ret;
 
+	if (regulator->rdev->supply) {
+		ret = regulator_is_enabled(regulator->rdev->supply);
+		if (ret <= 0)
+			return ret;
+	}
+
 	mutex_lock(&regulator->rdev->mutex);
 	ret = _regulator_is_enabled(regulator->rdev);
 	mutex_unlock(&regulator->rdev->mutex);
-- 
1.7.1.1
