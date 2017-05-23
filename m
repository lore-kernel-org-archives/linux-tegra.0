From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/22] drm/tegra: Check syncpoint ID in the 'submit' IOCTL
Date: Tue, 23 May 2017 03:14:21 +0300
Message-ID: <f116e4fbab1391ed59a7401f2838e95bcc3025d9.1495498184.git.digetx@gmail.com>
References: <cover.1495498184.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In case of invalid syncpoint ID, the host1x_syncpt_get() returns NULL and
none of its users perform a check of the returned pointer later. Let's bail
out until it's too late.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index eae0c1512ab0..cdb05d6efde4 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -393,6 +393,8 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	struct drm_tegra_waitchk __user *waitchks =
 		(void __user *)(uintptr_t)args->waitchks;
 	struct drm_tegra_syncpt syncpt;
+	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
+	struct host1x_syncpt *sp;
 	struct host1x_job *job;
 	int err;
 
@@ -521,6 +523,13 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 		goto fail;
 	}
 
+	/* check whether syncpoint ID is valid */
+	sp = host1x_syncpt_get(host1x, syncpt.id);
+	if (!sp) {
+		err = -ENOENT;
+		goto fail;
+	}
+
 	job->is_addr_reg = context->client->ops->is_addr_reg;
 	job->syncpt_incrs = syncpt.incrs;
 	job->syncpt_id = syncpt.id;
-- 
2.13.0
