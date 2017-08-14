From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: [PATCH] drm: tegra: fix NULL deref in debugfs/iova
Date: Mon, 14 Aug 2017 23:53:45 +0200
Message-ID: <7ca7b47df4aa1c164b7313172564923a2639dcc1.1502747460.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When IOMMU is off, ->mm_lock is not initialized and ->mm is NULL.

Signed-off-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 8b7842548b9f..f859c06b8ab0 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1033,9 +1033,11 @@ static int tegra_debugfs_iova(struct seq_file *s, void *data)
 	struct tegra_drm *tegra = drm->dev_private;
 	struct drm_printer p = drm_seq_file_printer(s);
 
-	mutex_lock(&tegra->mm_lock);
-	drm_mm_print(&tegra->mm, &p);
-	mutex_unlock(&tegra->mm_lock);
+	if (tegra->domain) {
+		mutex_lock(&tegra->mm_lock);
+		drm_mm_print(&tegra->mm, &p);
+		mutex_unlock(&tegra->mm_lock);
+	}
 
 	return 0;
 }
-- 
2.11.0
