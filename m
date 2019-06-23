From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/3] drm/tegra: Fix 2d and 3d clients detaching from IOMMU domain
Date: Sun, 23 Jun 2019 20:37:42 +0300
Message-ID: <20190623173743.24088-2-digetx@gmail.com>
References: <20190623173743.24088-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623173743.24088-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This should should fire up on the DRM's driver module re-loader because
there won't be enough available domains on older Tegra SoCs.

Cc: stable <stable@vger.kernel.org>
Fixes: 0c407de5ed1a ("drm/tegra: Refactor IOMMU attach/detach")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c   | 4 ++--
 drivers/gpu/drm/tegra/drm.c  | 9 ++++++---
 drivers/gpu/drm/tegra/drm.h  | 3 ++-
 drivers/gpu/drm/tegra/gr2d.c | 4 ++--
 drivers/gpu/drm/tegra/gr3d.c | 4 ++--
 5 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index fa505baaaabc..c1b885444d90 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2388,7 +2388,7 @@ static int tegra_dc_init(struct host1x_client *client)
 	if (!IS_ERR(primary))
 		drm_plane_cleanup(primary);
 
-	host1x_client_iommu_detach(client, dc->group);
+	host1x_client_iommu_detach(client, dc->group, true);
 	host1x_syncpt_free(dc->syncpt);
 
 	return err;
@@ -2412,7 +2412,7 @@ static int tegra_dc_exit(struct host1x_client *client)
 		return err;
 	}
 
-	host1x_client_iommu_detach(client, dc->group);
+	host1x_client_iommu_detach(client, dc->group, true);
 	host1x_syncpt_free(dc->syncpt);
 
 	return 0;
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index d2080bd7d392..f94441457c64 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1120,15 +1120,18 @@ struct iommu_group *host1x_client_iommu_attach(struct host1x_client *client,
 }
 
 void host1x_client_iommu_detach(struct host1x_client *client,
-				struct iommu_group *group)
+				struct iommu_group *group,
+				bool shared)
 {
 	struct drm_device *drm = dev_get_drvdata(client->parent);
 	struct tegra_drm *tegra = drm->dev_private;
 
 	if (group) {
-		if (group == tegra->group) {
+		if (!shared || group == tegra->group) {
 			iommu_detach_group(tegra->domain, group);
-			tegra->group = NULL;
+
+			if (group == tegra->group)
+				tegra->group = NULL;
 		}
 
 		iommu_group_put(group);
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 488f36f00bd8..9f1a3d6f3406 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -107,7 +107,8 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 struct iommu_group *host1x_client_iommu_attach(struct host1x_client *client,
 					       bool shared);
 void host1x_client_iommu_detach(struct host1x_client *client,
-				struct iommu_group *group);
+				struct iommu_group *group,
+				bool shared);
 
 int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
 int tegra_drm_exit(struct tegra_drm *tegra);
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 673059fd2fcb..c486e0a05c9d 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -69,7 +69,7 @@ static int gr2d_init(struct host1x_client *client)
 	return 0;
 
 detach:
-	host1x_client_iommu_detach(client, gr2d->group);
+	host1x_client_iommu_detach(client, gr2d->group, false);
 free:
 	host1x_syncpt_free(client->syncpts[0]);
 put:
@@ -89,7 +89,7 @@ static int gr2d_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	host1x_client_iommu_detach(client, gr2d->group);
+	host1x_client_iommu_detach(client, gr2d->group, false);
 	host1x_syncpt_free(client->syncpts[0]);
 	host1x_channel_put(gr2d->channel);
 
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 4778ae999668..591bafe455e0 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -79,7 +79,7 @@ static int gr3d_init(struct host1x_client *client)
 	return 0;
 
 detach:
-	host1x_client_iommu_detach(client, gr3d->group);
+	host1x_client_iommu_detach(client, gr3d->group, false);
 free:
 	host1x_syncpt_free(client->syncpts[0]);
 put:
@@ -98,7 +98,7 @@ static int gr3d_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
-	host1x_client_iommu_detach(client, gr3d->group);
+	host1x_client_iommu_detach(client, gr3d->group, false);
 	host1x_syncpt_free(client->syncpts[0]);
 	host1x_channel_put(gr3d->channel);
 
-- 
2.22.0
