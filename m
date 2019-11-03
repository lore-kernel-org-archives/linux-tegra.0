From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v8 15/18] PM / devfreq: Add new interrupt_driven flag for governors
Date: Sun,  3 Nov 2019 23:41:27 +0300
Message-ID: <20191103204130.2172-16-digetx@gmail.com>
References: <20191103204130.2172-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191103204130.2172-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Currently interrupt-driven governors (like NVIDIA Tegra30 ACTMON governor)
are used to set polling_ms=0 in order to avoid periodic polling of device
status by devfreq core. This means that polling interval can't be changed
by userspace for such governors.

The new governor flag allows interrupt-driven governors to convey that
devfreq core shouldn't perform polling of device status and thus generic
devfreq polling interval could be supported by these governors now.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/devfreq.c  | 9 +++++++--
 drivers/devfreq/governor.h | 3 +++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index b905963cea7d..a711a76d386e 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -410,7 +410,8 @@ static void devfreq_monitor(struct work_struct *work)
 void devfreq_monitor_start(struct devfreq *devfreq)
 {
 	INIT_DEFERRABLE_WORK(&devfreq->work, devfreq_monitor);
-	if (devfreq->profile->polling_ms)
+	if (devfreq->profile->polling_ms &&
+	    !devfreq->governor->interrupt_driven)
 		queue_delayed_work(devfreq_wq, &devfreq->work,
 			msecs_to_jiffies(devfreq->profile->polling_ms));
 }
@@ -474,7 +475,8 @@ void devfreq_monitor_resume(struct devfreq *devfreq)
 		goto out;
 
 	if (!delayed_work_pending(&devfreq->work) &&
-			devfreq->profile->polling_ms)
+			devfreq->profile->polling_ms &&
+			!devfreq->governor->interrupt_driven)
 		queue_delayed_work(devfreq_wq, &devfreq->work,
 			msecs_to_jiffies(devfreq->profile->polling_ms));
 
@@ -509,6 +511,9 @@ void devfreq_interval_update(struct devfreq *devfreq, unsigned int *delay)
 	if (devfreq->stop_polling)
 		goto out;
 
+	if (devfreq->governor->interrupt_driven)
+		goto out;
+
 	/* if new delay is zero, stop polling */
 	if (!new_delay) {
 		mutex_unlock(&devfreq->lock);
diff --git a/drivers/devfreq/governor.h b/drivers/devfreq/governor.h
index bbe5ff9fcecf..dc7533ccc3db 100644
--- a/drivers/devfreq/governor.h
+++ b/drivers/devfreq/governor.h
@@ -31,6 +31,8 @@
  * @name:		Governor's name
  * @immutable:		Immutable flag for governor. If the value is 1,
  *			this govenror is never changeable to other governor.
+ * @interrupt_driven:	Devfreq core won't schedule polling work for this
+ *			governor if value is set to 1.
  * @get_target_freq:	Returns desired operating frequency for the device.
  *			Basically, get_target_freq will run
  *			devfreq_dev_profile.get_dev_status() to get the
@@ -49,6 +51,7 @@ struct devfreq_governor {
 
 	const char name[DEVFREQ_NAME_LEN];
 	const unsigned int immutable;
+	const unsigned int interrupt_driven;
 	int (*get_target_freq)(struct devfreq *this, unsigned long *freq);
 	int (*event_handler)(struct devfreq *devfreq,
 				unsigned int event, void *data);
-- 
2.23.0
