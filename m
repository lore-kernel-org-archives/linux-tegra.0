From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 020/102] drm/nouveau/tegra: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:25:24 +0200
Message-ID: <20170719152646.25903-21-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 189ed80e21ffb..ac5d4cf058c25 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -282,7 +282,7 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		}
 	}
 
-	tdev->rst = devm_reset_control_get(&pdev->dev, "gpu");
+	tdev->rst = devm_reset_control_get_exclusive(&pdev->dev, "gpu");
 	if (IS_ERR(tdev->rst)) {
 		ret = PTR_ERR(tdev->rst);
 		goto free;
-- 
2.11.0
