From: Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH 7/7] drm/tegra: fix possible object reference leak
Date: Thu, 4 Apr 2019 00:04:15 +0800
Message-ID: <1554307455-40361-8-git-send-email-wen.yang99@zte.com.cn>
References: <1554307455-40361-1-git-send-email-wen.yang99@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554307455-40361-1-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The call to  of_get_child_by_name returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./drivers/gpu/drm/tegra/rgb.c:225:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 223, but without a corresponding object release within this function.
./drivers/gpu/drm/tegra/rgb.c:229:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 223, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/tegra/output.c | 2 ++
 drivers/gpu/drm/tegra/rgb.c    | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 9c2b9da..78553d7 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -193,6 +193,8 @@ void tegra_output_remove(struct tegra_output *output)
 
 	if (output->ddc)
 		put_device(&output->ddc->dev);
+	if (output->of_node)
+		of_node_put(output->of_node);
 }
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 28a78d3..ad683a2 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -221,12 +221,16 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 	int err;
 
 	np = of_get_child_by_name(dc->dev->of_node, "rgb");
-	if (!np || !of_device_is_available(np))
+	if (!np || !of_device_is_available(np)) {
+		of_node_put(np);
 		return -ENODEV;
+	}
 
 	rgb = devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
-	if (!rgb)
+	if (!rgb) {
+		of_node_put(np);
 		return -ENOMEM;
+	}
 
 	rgb->output.dev = dc->dev;
 	rgb->output.of_node = np;
-- 
2.9.5
