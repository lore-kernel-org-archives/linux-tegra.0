From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/5] reset: Add acquire/release support for arrays
Date: Thu, 21 Feb 2019 16:25:55 +0100
Message-ID: <20190221152557.8534-3-thierry.reding@gmail.com>
References: <20190221152557.8534-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221152557.8534-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add implementations that apply acquire and release operations to all
reset controls part of a reset control array.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/reset/core.c  | 36 +++++++++++++++++++++++++++++++++++-
 include/linux/reset.h |  6 ++++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index f94da91c22af..81ea77cba123 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -245,6 +245,34 @@ static int reset_control_array_deassert(struct reset_control_array *resets)
 	return ret;
 }
 
+static int reset_control_array_acquire(struct reset_control_array *resets)
+{
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < resets->num_rstcs; i++) {
+		err = reset_control_acquire(resets->rstc[i]);
+		if (err < 0)
+			goto release;
+	}
+
+	return 0;
+
+release:
+	while (i--)
+		reset_control_release(resets->rstc[i]);
+
+	return err;
+}
+
+static void reset_control_array_release(struct reset_control_array *resets)
+{
+	unsigned int i;
+
+	for (i = 0; i < resets->num_rstcs; i++)
+		reset_control_release(resets->rstc[i]);
+}
+
 static inline bool reset_control_is_array(struct reset_control *rstc)
 {
 	return rstc->array;
@@ -464,6 +492,9 @@ int reset_control_acquire(struct reset_control *rstc)
 	if (WARN_ON(IS_ERR(rstc)))
 		return -EINVAL;
 
+	if (reset_control_is_array(rstc))
+		return reset_control_array_acquire(rstc_to_array(rstc));
+
 	mutex_lock(&reset_list_mutex);
 
 	if (rstc->acquired) {
@@ -502,7 +533,10 @@ void reset_control_release(struct reset_control *rstc)
 	if (!rstc || WARN_ON(IS_ERR(rstc)))
 		return;
 
-	rstc->acquired = false;
+	if (reset_control_is_array(rstc))
+		reset_control_array_release(rstc_to_array(rstc));
+	else
+		rstc->acquired = false;
 }
 EXPORT_SYMBOL_GPL(reset_control_release);
 
diff --git a/include/linux/reset.h b/include/linux/reset.h
index a01b32bf51d4..95d555c2130a 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -470,6 +470,12 @@ of_reset_control_array_get_exclusive(struct device_node *node)
 	return of_reset_control_array_get(node, false, false, true);
 }
 
+static inline struct reset_control *
+of_reset_control_array_get_exclusive_released(struct device_node *node)
+{
+	return of_reset_control_array_get(node, false, false, false);
+}
+
 static inline struct reset_control *
 of_reset_control_array_get_shared(struct device_node *node)
 {
-- 
2.20.1
