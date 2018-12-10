From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] host1x: cdma: use completion instead of semaphore
Date: Mon, 10 Dec 2018 22:51:04 +0100
Message-ID: <20181210215119.1903413-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mikko Perttunen <cyndis@kapsi.fi>, Dmitry Osipenko <digetx@gmail.com>, Emil Goode <emil.fsw@goode.io>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

In this usage, the two are completely equivalent, but the
completion documents better what is going on, and we generally
try to avoid semaphores these days.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/host1x/cdma.c | 6 +++---
 drivers/gpu/host1x/cdma.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index 6bfb3e6f43d7..bdc80a303cec 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -204,7 +204,7 @@ unsigned int host1x_cdma_wait_locked(struct host1x_cdma *cdma,
 		cdma->event = event;
 
 		mutex_unlock(&cdma->lock);
-		down(&cdma->sem);
+		wait_for_completion(&cdma->complete);
 		mutex_lock(&cdma->lock);
 	}
 
@@ -308,7 +308,7 @@ static void update_cdma_locked(struct host1x_cdma *cdma)
 
 	if (signal) {
 		cdma->event = CDMA_EVENT_NONE;
-		up(&cdma->sem);
+		complete(&cdma->complete);
 	}
 }
 
@@ -410,7 +410,7 @@ int host1x_cdma_init(struct host1x_cdma *cdma)
 	int err;
 
 	mutex_init(&cdma->lock);
-	sema_init(&cdma->sem, 0);
+	init_completion(&cdma->complete);
 
 	INIT_LIST_HEAD(&cdma->sync_queue);
 
diff --git a/drivers/gpu/host1x/cdma.h b/drivers/gpu/host1x/cdma.h
index c628070b94d7..ba790f9bfebc 100644
--- a/drivers/gpu/host1x/cdma.h
+++ b/drivers/gpu/host1x/cdma.h
@@ -20,7 +20,7 @@
 #define __HOST1X_CDMA_H
 
 #include <linux/sched.h>
-#include <linux/semaphore.h>
+#include <linux/completion.h>
 #include <linux/list.h>
 
 struct host1x_syncpt;
@@ -70,7 +70,7 @@ enum cdma_event {
 
 struct host1x_cdma {
 	struct mutex lock;		/* controls access to shared state */
-	struct semaphore sem;		/* signalled when event occurs */
+	struct completion complete;	/* signalled when event occurs */
 	enum cdma_event event;		/* event that sem is waiting for */
 	unsigned int slots_used;	/* pb slots used in current submit */
 	unsigned int slots_free;	/* pb slots free in current submit */
-- 
2.20.0
