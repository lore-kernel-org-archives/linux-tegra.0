From: <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] [tegra] Make syncpt routines accessible by drivers
Date: Mon, 14 Feb 2011 15:27:14 -0800
Message-ID: <1297726034-32762-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Make some Tegra syncpt routines accessible by kernel drivers that need
to use the syncpt mechanism.  This is similar to how some nvmap stuff
is made accessible to kernel drivers.

Change-Id: Id6cd2800e75223e5da29d6c0764bac5b233be185
Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/include/mach/nvsyncpt.h |   36 +++++++++++++++++++++++++++
 drivers/video/tegra/host/dev.c              |    4 +++
 drivers/video/tegra/host/nvhost_syncpt.c    |    7 +++++
 drivers/video/tegra/host/nvhost_syncpt.h    |    2 +
 4 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-tegra/include/mach/nvsyncpt.h

diff --git a/arch/arm/mach-tegra/include/mach/nvsyncpt.h b/arch/arm/mach-tegra/include/mach/nvsyncpt.h
new file mode 100644
index 0000000..021d498
--- /dev/null
+++ b/arch/arm/mach-tegra/include/mach/nvsyncpt.h
@@ -0,0 +1,36 @@
+/*
+ * Tegra host syncpt exports
+ *
+ * Copyright (c) 2009-2010, NVIDIA Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, write to the Free Software Foundation, Inc.,
+ * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+ */
+
+#ifndef __NVSYNCPT_H
+#define __NVSYNCPT_H
+
+#if defined(__KERNEL__)
+
+struct nvhost_syncpt;
+
+extern struct nvhost_syncpt *nvhost_getsyncpt(void);
+extern u32 nvhost_syncpt_read(struct nvhost_syncpt *sp, u32 id);
+extern int nvhost_syncpt_wait_timeout(struct nvhost_syncpt *sp,
+				      u32 id, u32 thresh, u32 timeout);
+extern void nvhost_syncpt_cpu_incr(struct nvhost_syncpt *sp, u32 id);
+
+#endif
+
+#endif
diff --git a/drivers/video/tegra/host/dev.c b/drivers/video/tegra/host/dev.c
index 20a4eda..af70a41 100644
--- a/drivers/video/tegra/host/dev.c
+++ b/drivers/video/tegra/host/dev.c
@@ -721,6 +721,8 @@ static int __devinit nvhost_probe(struct platform_device *pdev)
 
 	nvhost_debug_init(host);
 
+	nvhost_syncpt = &host->syncpt;
+
 	dev_info(&pdev->dev, "initialized\n");
 	return 0;
 
@@ -734,6 +736,8 @@ fail:
 
 static int __exit nvhost_remove(struct platform_device *pdev)
 {
+	nvhost_syncpt = NULL;
+
 	return 0;
 }
 
diff --git a/drivers/video/tegra/host/nvhost_syncpt.c b/drivers/video/tegra/host/nvhost_syncpt.c
index dd2ab0d..315050d 100644
--- a/drivers/video/tegra/host/nvhost_syncpt.c
+++ b/drivers/video/tegra/host/nvhost_syncpt.c
@@ -27,6 +27,8 @@
 #define syncpt_to_dev(sp) container_of(sp, struct nvhost_master, syncpt)
 #define SYNCPT_CHECK_PERIOD 2*HZ
 
+struct nvhost_syncpt *nvhost_syncpt;
+
 static bool check_max(struct nvhost_syncpt *sp, u32 id, u32 real)
 {
 	u32 max;
@@ -254,3 +256,8 @@ void nvhost_syncpt_debug(struct nvhost_syncpt *sp)
 
 	}
 }
+
+struct nvhost_syncpt *nvhost_getsyncpt(void)
+{
+	return nvhost_syncpt;
+}
diff --git a/drivers/video/tegra/host/nvhost_syncpt.h b/drivers/video/tegra/host/nvhost_syncpt.h
index f161f20..65f0c95 100644
--- a/drivers/video/tegra/host/nvhost_syncpt.h
+++ b/drivers/video/tegra/host/nvhost_syncpt.h
@@ -72,6 +72,8 @@ struct nvhost_syncpt {
 	u32 base_val[NV_HOST1X_SYNCPT_NB_BASES];
 };
 
+extern struct nvhost_syncpt *nvhost_syncpt;
+
 /**
  * Updates the value sent to hardware.
  */
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
