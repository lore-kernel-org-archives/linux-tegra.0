From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 1/2] devfreq: Rename devfreq_update_status() to devfreq_update_stats() and viceversa
Date: Wed, 25 Sep 2019 11:43:13 -0700
Message-ID: <20190925184314.30251-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: linux-tegra@vger.kernel.org

devfreq has two functions with very similar names, devfreq_update_status()
and devfreq_update_stats(). _update_status() currently updates
frequency transitions statistics, while _update_stats() retrieves the
device 'status'. The function names are inversed with respect to what
the functions are actually doing, rename devfreq_update_status() to
devfreq_update_stats() and viceversa.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
We could also rename the current devfreq_update_stats() to
devfreq_refresh_status() to make it easier to distinguish it from
devfreq_update_stats().
---
 drivers/devfreq/devfreq.c                 | 12 ++++++------
 drivers/devfreq/governor.h                |  4 ++--
 drivers/devfreq/governor_passive.c        |  2 +-
 drivers/devfreq/governor_simpleondemand.c |  2 +-
 drivers/devfreq/tegra30-devfreq.c         |  2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 446490c9d635..fb4318d59aa9 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -151,11 +151,11 @@ static int set_freq_table(struct devfreq *devfreq)
 }
 
 /**
- * devfreq_update_status() - Update statistics of devfreq behavior
+ * devfreq_update_stats() - Update statistics of devfreq behavior
  * @devfreq:	the devfreq instance
  * @freq:	the update target frequency
  */
-int devfreq_update_status(struct devfreq *devfreq, unsigned long freq)
+int devfreq_update_stats(struct devfreq *devfreq, unsigned long freq)
 {
 	int lev, prev_lev, ret = 0;
 	unsigned long cur_time;
@@ -191,7 +191,7 @@ int devfreq_update_status(struct devfreq *devfreq, unsigned long freq)
 	devfreq->last_stat_updated = cur_time;
 	return ret;
 }
-EXPORT_SYMBOL(devfreq_update_status);
+EXPORT_SYMBOL(devfreq_update_stats);
 
 /**
  * find_devfreq_governor() - find devfreq governor from name
@@ -311,7 +311,7 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	freqs.new = new_freq;
 	devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
 
-	if (devfreq_update_status(devfreq, new_freq))
+	if (devfreq_update_stats(devfreq, new_freq))
 		dev_err(&devfreq->dev,
 			"Couldn't update frequency transition information.\n");
 
@@ -450,7 +450,7 @@ void devfreq_monitor_suspend(struct devfreq *devfreq)
 		return;
 	}
 
-	devfreq_update_status(devfreq, devfreq->previous_freq);
+	devfreq_update_stats(devfreq, devfreq->previous_freq);
 	devfreq->stop_polling = true;
 	mutex_unlock(&devfreq->lock);
 	cancel_delayed_work_sync(&devfreq->work);
@@ -1398,7 +1398,7 @@ static ssize_t trans_stat_show(struct device *dev,
 	unsigned int max_state = devfreq->profile->max_state;
 
 	if (!devfreq->stop_polling &&
-			devfreq_update_status(devfreq, devfreq->previous_freq))
+			devfreq_update_stats(devfreq, devfreq->previous_freq))
 		return 0;
 	if (max_state == 0)
 		return sprintf(buf, "Not Supported.\n");
diff --git a/drivers/devfreq/governor.h b/drivers/devfreq/governor.h
index bbe5ff9fcecf..e11f447be2b5 100644
--- a/drivers/devfreq/governor.h
+++ b/drivers/devfreq/governor.h
@@ -64,9 +64,9 @@ extern void devfreq_interval_update(struct devfreq *devfreq,
 extern int devfreq_add_governor(struct devfreq_governor *governor);
 extern int devfreq_remove_governor(struct devfreq_governor *governor);
 
-extern int devfreq_update_status(struct devfreq *devfreq, unsigned long freq);
+extern int devfreq_update_stats(struct devfreq *devfreq, unsigned long freq);
 
-static inline int devfreq_update_stats(struct devfreq *df)
+static inline int devfreq_update_status(struct devfreq *df)
 {
 	return df->profile->get_dev_status(df->dev.parent, &df->last_status);
 }
diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
index be6eeab9c814..1c746b96d3db 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -110,7 +110,7 @@ static int update_devfreq_passive(struct devfreq *devfreq, unsigned long freq)
 		goto out;
 
 	if (devfreq->profile->freq_table
-		&& (devfreq_update_status(devfreq, freq)))
+		&& (devfreq_update_stats(devfreq, freq)))
 		dev_err(&devfreq->dev,
 			"Couldn't update frequency transition information.\n");
 
diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
index 3d809f228619..2cbf26bdcfd6 100644
--- a/drivers/devfreq/governor_simpleondemand.c
+++ b/drivers/devfreq/governor_simpleondemand.c
@@ -25,7 +25,7 @@ static int devfreq_simple_ondemand_func(struct devfreq *df,
 	unsigned int dfso_downdifferential = DFSO_DOWNDIFFERENCTIAL;
 	struct devfreq_simple_ondemand_data *data = df->data;
 
-	err = devfreq_update_stats(df);
+	err = devfreq_update_status(df);
 	if (err)
 		return err;
 
diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index a6ba75f4106d..536273a811fe 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -526,7 +526,7 @@ static int tegra_governor_get_target(struct devfreq *devfreq,
 	unsigned int i;
 	int err;
 
-	err = devfreq_update_stats(devfreq);
+	err = devfreq_update_status(devfreq);
 	if (err)
 		return err;
 
-- 
2.23.0.444.g18eeb5a265-goog
