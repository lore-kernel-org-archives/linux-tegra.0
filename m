From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 1/4] gpu: host1x: Enable Tegra186 syncpoint protection
Date: Fri, 18 Aug 2017 19:15:50 +0300
Message-ID: <20170818161553.27597-2-mperttunen@nvidia.com>
References: <20170818161553.27597-1-mperttunen@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170818161553.27597-1-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: digetx@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Since Tegra186 the Host1x hardware allows syncpoints to be assigned to
specific channels, preventing any other channels from incrementing
them.

Enable this feature where available and assign syncpoints to channels
when submitting a job. Syncpoints are currently never unassigned from
channels since that would require extra work and is unnecessary with
the current channel allocation model.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.h           | 16 ++++++++++++++++
 drivers/gpu/host1x/hw/channel_hw.c |  3 +++
 drivers/gpu/host1x/hw/syncpt_hw.c  | 26 ++++++++++++++++++++++++++
 drivers/gpu/host1x/syncpt.c        |  3 +++
 4 files changed, 48 insertions(+)

diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index def802c0a6bf..2432a30ff6e2 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -79,6 +79,9 @@ struct host1x_syncpt_ops {
 	u32 (*load)(struct host1x_syncpt *syncpt);
 	int (*cpu_incr)(struct host1x_syncpt *syncpt);
 	int (*patch_wait)(struct host1x_syncpt *syncpt, void *patch_addr);
+	void (*assign_channel)(struct host1x_syncpt *syncpt,
+	                       struct host1x_channel *channel);
+	void (*set_protection)(struct host1x *host, bool enabled);
 };
 
 struct host1x_intr_ops {
@@ -186,6 +189,19 @@ static inline int host1x_hw_syncpt_patch_wait(struct host1x *host,
 	return host->syncpt_op->patch_wait(sp, patch_addr);
 }
 
+static inline void host1x_hw_syncpt_assign_channel(struct host1x *host,
+						   struct host1x_syncpt *sp,
+						   struct host1x_channel *ch)
+{
+	return host->syncpt_op->assign_channel(sp, ch);
+}
+
+static inline void host1x_hw_syncpt_set_protection(struct host1x *host,
+						   bool enabled)
+{
+	return host->syncpt_op->set_protection(host, enabled);
+}
+
 static inline int host1x_hw_intr_init_host_sync(struct host1x *host, u32 cpm,
 			void (*syncpt_thresh_work)(struct work_struct *))
 {
diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 8447a56c41ca..0161da331702 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -147,6 +147,9 @@ static int channel_submit(struct host1x_job *job)
 
 	syncval = host1x_syncpt_incr_max(sp, user_syncpt_incrs);
 
+	/* assign syncpoint to channel */
+	host1x_hw_syncpt_assign_channel(host, sp, ch);
+
 	job->syncpt_end = syncval;
 
 	/* add a setclass for modules that require it */
diff --git a/drivers/gpu/host1x/hw/syncpt_hw.c b/drivers/gpu/host1x/hw/syncpt_hw.c
index 7b0270d60742..5d117ab1699e 100644
--- a/drivers/gpu/host1x/hw/syncpt_hw.c
+++ b/drivers/gpu/host1x/hw/syncpt_hw.c
@@ -106,6 +106,30 @@ static int syncpt_patch_wait(struct host1x_syncpt *sp, void *patch_addr)
 	return 0;
 }
 
+static void syncpt_assign_channel(struct host1x_syncpt *sp,
+				  struct host1x_channel *ch)
+{
+#if HOST1X_HW >= 6
+	struct host1x *host = sp->host;
+
+	if (!host->hv_regs)
+		return;
+
+	host1x_sync_writel(host,
+			   HOST1X_SYNC_SYNCPT_CH_APP_CH(ch ? ch->id : 0xff),
+			   HOST1X_SYNC_SYNCPT_CH_APP(sp->id));
+#endif
+}
+
+static void syncpt_set_protection(struct host1x *host, bool enabled)
+{
+#if HOST1X_HW >= 6
+	host1x_hypervisor_writel(host,
+				 enabled ? HOST1X_HV_SYNCPT_PROT_EN_CH_EN : 0,
+				 HOST1X_HV_SYNCPT_PROT_EN);
+#endif
+}
+
 static const struct host1x_syncpt_ops host1x_syncpt_ops = {
 	.restore = syncpt_restore,
 	.restore_wait_base = syncpt_restore_wait_base,
@@ -113,4 +137,6 @@ static const struct host1x_syncpt_ops host1x_syncpt_ops = {
 	.load = syncpt_load,
 	.cpu_incr = syncpt_cpu_incr,
 	.patch_wait = syncpt_patch_wait,
+	.assign_channel = syncpt_assign_channel,
+	.set_protection = syncpt_set_protection,
 };
diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 048ac9e344ce..fe4d963b3e2a 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -398,6 +398,8 @@ int host1x_syncpt_init(struct host1x *host)
 	for (i = 0; i < host->info->nb_pts; i++) {
 		syncpt[i].id = i;
 		syncpt[i].host = host;
+
+		host1x_hw_syncpt_assign_channel(host, &syncpt[i], NULL);
 	}
 
 	for (i = 0; i < host->info->nb_bases; i++)
@@ -408,6 +410,7 @@ int host1x_syncpt_init(struct host1x *host)
 	host->bases = bases;
 
 	host1x_syncpt_restore(host);
+	host1x_hw_syncpt_set_protection(host, true);
 
 	/* Allocate sync point to use for clearing waits for expired fences */
 	host->nop_sp = host1x_syncpt_alloc(host, NULL, 0);
-- 
2.14.1
