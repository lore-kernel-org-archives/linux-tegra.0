From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 3/3] drm/tegra: vic: Use common helpers to attach/detach from IOMMU domain
Date: Sun, 23 Jun 2019 20:37:43 +0300
Message-ID: <20190623173743.24088-3-digetx@gmail.com>
References: <20190623173743.24088-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623173743.24088-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

We now have helpers for the domain's attachment, let's use them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/vic.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 982ce37ecde1..baa00da780d0 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -36,7 +36,7 @@ struct vic {
 	void __iomem *regs;
 	struct tegra_drm_client client;
 	struct host1x_channel *channel;
-	struct iommu_domain *domain;
+	struct iommu_group *group;
 	struct device *dev;
 	struct clk *clk;
 	struct reset_control *rst;
@@ -183,21 +183,16 @@ static const struct falcon_ops vic_falcon_ops = {
 static int vic_init(struct host1x_client *client)
 {
 	struct tegra_drm_client *drm = host1x_to_drm_client(client);
-	struct iommu_group *group = iommu_group_get(client->dev);
 	struct drm_device *dev = dev_get_drvdata(client->parent);
 	struct tegra_drm *tegra = dev->dev_private;
 	struct vic *vic = to_vic(drm);
 	int err;
 
-	if (group && tegra->domain) {
-		err = iommu_attach_group(tegra->domain, group);
-		if (err < 0) {
-			dev_err(vic->dev, "failed to attach to domain: %d\n",
-				err);
-			return err;
-		}
-
-		vic->domain = tegra->domain;
+	vic->group = host1x_client_iommu_attach(client, false);
+	if (IS_ERR(vic->group)) {
+		err = PTR_ERR(vic->group);
+		dev_err(client->dev, "failed to attach to domain: %d\n", err);
+		return err;
 	}
 
 	vic->channel = host1x_channel_request(client->dev);
@@ -223,8 +218,7 @@ static int vic_init(struct host1x_client *client)
 free_channel:
 	host1x_channel_put(vic->channel);
 detach:
-	if (group && tegra->domain)
-		iommu_detach_group(tegra->domain, group);
+	host1x_client_iommu_detach(client, vic->group, false);
 
 	return err;
 }
@@ -232,7 +226,6 @@ static int vic_init(struct host1x_client *client)
 static int vic_exit(struct host1x_client *client)
 {
 	struct tegra_drm_client *drm = host1x_to_drm_client(client);
-	struct iommu_group *group = iommu_group_get(client->dev);
 	struct drm_device *dev = dev_get_drvdata(client->parent);
 	struct tegra_drm *tegra = dev->dev_private;
 	struct vic *vic = to_vic(drm);
@@ -244,11 +237,7 @@ static int vic_exit(struct host1x_client *client)
 
 	host1x_syncpt_free(client->syncpts[0]);
 	host1x_channel_put(vic->channel);
-
-	if (vic->domain) {
-		iommu_detach_group(vic->domain, group);
-		vic->domain = NULL;
-	}
+	host1x_client_iommu_detach(client, vic->group, false);
 
 	return 0;
 }
-- 
2.22.0
