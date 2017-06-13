From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 16/22] gpu: host1x: Forbid unrelated SETCLASS opcode in the firewall
Date: Wed, 14 Jun 2017 02:15:55 +0300
Message-ID: <474c04836de19a06705131fce13280c73157001a.1497394243.git.digetx@gmail.com>
References: <cover.1497394243.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Several channels could be made to write the same unit concurrently via the
SETCLASS opcode, trusting userspace is a bad idea. It should be possible to
drop the per-client channel reservation and add a per-unit locking by
inserting MLOCK's to the command stream to re-allow the SETCLASS opcode, but
it will be much more work. Let's forbid the unit-unrelated class changes for
now.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c  |  1 +
 drivers/gpu/drm/tegra/drm.h  |  1 +
 drivers/gpu/drm/tegra/gr2d.c |  7 +++++++
 drivers/gpu/host1x/job.c     | 24 ++++++++++++++++++++----
 include/linux/host1x.h       |  3 +++
 5 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index aa7988dcc28f..971cdead6436 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -533,6 +533,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	}
 
 	job->is_addr_reg = context->client->ops->is_addr_reg;
+	job->is_valid_class = context->client->ops->is_valid_class;
 	job->syncpt_incrs = syncpt.incrs;
 	job->syncpt_id = syncpt.id;
 	job->timeout = 10000;
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 85aa2e3d9d4e..6d6da01282f3 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -83,6 +83,7 @@ struct tegra_drm_client_ops {
 			    struct tegra_drm_context *context);
 	void (*close_channel)(struct tegra_drm_context *context);
 	int (*is_addr_reg)(struct device *dev, u32 class, u32 offset);
+	int (*is_valid_class)(u32 class);
 	int (*submit)(struct tegra_drm_context *context,
 		      struct drm_tegra_submit *args, struct drm_device *drm,
 		      struct drm_file *file);
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 02cd3e37a6ec..fbe0b8b25b42 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -109,10 +109,17 @@ static int gr2d_is_addr_reg(struct device *dev, u32 class, u32 offset)
 	return 0;
 }
 
+static int gr2d_is_valid_class(u32 class)
+{
+	return (class == HOST1X_CLASS_GR2D ||
+		class == HOST1X_CLASS_GR2D_SB);
+}
+
 static const struct tegra_drm_client_ops gr2d_ops = {
 	.open_channel = gr2d_open_channel,
 	.close_channel = gr2d_close_channel,
 	.is_addr_reg = gr2d_is_addr_reg,
+	.is_valid_class = gr2d_is_valid_class,
 	.submit = tegra_drm_submit,
 };
 
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 3680b4b7dce9..32d3300bcf99 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -373,6 +373,9 @@ struct host1x_firewall {
 
 static int check_register(struct host1x_firewall *fw, unsigned long offset)
 {
+	if (!fw->job->is_addr_reg)
+		return 0;
+
 	if (fw->job->is_addr_reg(fw->dev, fw->class, offset)) {
 		if (!fw->num_relocs)
 			return -EINVAL;
@@ -390,6 +393,19 @@ static int check_register(struct host1x_firewall *fw, unsigned long offset)
 	return 0;
 }
 
+static int check_class(struct host1x_firewall *fw, u32 class)
+{
+	if (!fw->job->is_valid_class) {
+		if (fw->class != class)
+			return -EINVAL;
+	} else {
+		if (!fw->job->is_valid_class(fw->class))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int check_mask(struct host1x_firewall *fw)
 {
 	u32 mask = fw->mask;
@@ -463,11 +479,9 @@ static int validate(struct host1x_firewall *fw, struct host1x_job_gather *g)
 {
 	u32 *cmdbuf_base = (u32 *)fw->job->gather_copy_mapped +
 		(g->offset / sizeof(u32));
+	u32 job_class = fw->class;
 	int err = 0;
 
-	if (!fw->job->is_addr_reg)
-		return 0;
-
 	fw->words = g->words;
 	fw->cmdbuf = g->bo;
 	fw->offset = 0;
@@ -487,7 +501,9 @@ static int validate(struct host1x_firewall *fw, struct host1x_job_gather *g)
 			fw->class = word >> 6 & 0x3ff;
 			fw->mask = word & 0x3f;
 			fw->reg = word >> 16 & 0xfff;
-			err = check_mask(fw);
+			err = check_class(fw, job_class);
+			if (!err)
+				err = check_mask(fw);
 			if (err)
 				goto out;
 			break;
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index aa323e43ae4e..71a34774b56a 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -235,6 +235,9 @@ struct host1x_job {
 	/* Check if register is marked as an address reg */
 	int (*is_addr_reg)(struct device *dev, u32 reg, u32 class);
 
+	/* Check if class belongs to the unit */
+	int (*is_valid_class)(u32 class);
+
 	/* Request a SETCLASS to this class */
 	u32 class;
 
-- 
2.13.0
