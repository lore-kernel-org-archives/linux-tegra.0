From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 05/22] drm/tegra: Check syncpoint ID in the 'submit' IOCTL
Date: Wed, 14 Jun 2017 02:15:44 +0300
Message-ID: <746d938d97c43e1b80f448c00e27a04188b01332.1497394243.git.digetx@gmail.com>
References: <cover.1497394243.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In case of invalid syncpoint ID, the host1x_syncpt_get() returns NULL and
none of its users perform a check of the returned pointer later. Let's bail
out until it's too late.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index b90ed2cd32ce..e999391aedc9 100644
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
 
@@ -522,6 +524,13 @@ int tegra_drm_submit(struct tegra_drm_context *context,
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
