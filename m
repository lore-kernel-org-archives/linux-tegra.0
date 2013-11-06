From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] regulator: core: set full constraints in regulator_init
Date: Wed, 6 Nov 2013 15:19:40 +0800
Message-ID: <1383722380-5845-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When use DT to probe device, the probe routine may be erailier than
regulator_init_complete(), so at that time the full_constraints isn't
set yet, then the regulator_get() can't get the dummy regulator if the
regulator is physically present and enabled.
Set the full constraints in regulator_init() can fix this problem.

Discussed this in the link:
https://lkml.org/lkml/2013/10/8/40

Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/core.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6382f0a..e80dd88 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3773,6 +3773,15 @@ static int __init regulator_init(void)
 
 	regulator_dummy_init();
 
+	/*
+	 * Since DT doesn't provide an idiomatic mechanism for
+	 * enabling full constraints and since it's much more natural
+	 * with DT to provide them just assume that a DT enabled
+	 * system has full constraints.
+	 */
+	if (of_have_populated_dt())
+		has_full_constraints = true;
+
 	return ret;
 }
 
@@ -3786,15 +3795,6 @@ static int __init regulator_init_complete(void)
 	struct regulation_constraints *c;
 	int enabled, ret;
 
-	/*
-	 * Since DT doesn't provide an idiomatic mechanism for
-	 * enabling full constraints and since it's much more natural
-	 * with DT to provide them just assume that a DT enabled
-	 * system has full constraints.
-	 */
-	if (of_have_populated_dt())
-		has_full_constraints = true;
-
 	mutex_lock(&regulator_list_mutex);
 
 	/* If we have a full configuration then disable any regulators
-- 
1.7.9.5
