From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] drm/tegra: Correct idr_alloc() minimum id
Date: Fri, 12 May 2017 22:00:44 +0300
Message-ID: <20170512190044.17541-2-digetx@gmail.com>
References: <20170512190044.17541-1-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170512190044.17541-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The start = 0 is invalid and causes weird CDMA channel timeouts, presumably
some memory misuse/corruption is going on.

Fixes: bdd2f9cd10eb ("drm/tegra: Don't leak kernel pointer to userspace")
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 768750226452..732c8d98044f 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -518,7 +518,7 @@ static int tegra_client_open(struct tegra_drm_file *fpriv,
 	if (err < 0)
 		return err;
 
-	err = idr_alloc(&fpriv->contexts, context, 0, 0, GFP_KERNEL);
+	err = idr_alloc(&fpriv->contexts, context, 1, 0, GFP_KERNEL);
 	if (err < 0) {
 		client->ops->close_channel(context);
 		return err;
-- 
2.12.2
