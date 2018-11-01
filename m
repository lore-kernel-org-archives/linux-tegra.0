From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH] drm/tegra: falcon: Validate firmware.vaddr with IS_ERR_OR_NULL
Date: Wed, 31 Oct 2018 18:44:20 -0700
Message-ID: <20181101014420.13366-1-nicoleotsuka@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The firmware.vaddr might be assigned with an error code instead of
NULL, so this patch uses an IS_ERR_OR_NULL check to fix below bug.

Unable to handle kernel paging request at virtual address fffffffffffffff0
[...]
pc : falcon_load_firmware+0x80/0x358 [tegra_drm]
lr : falcon_load_firmware+0x2b4/0x358 [tegra_drm]
sp : ffff000010feb4a0
[...]
Call trace:
 falcon_load_firmware+0x80/0x358 [tegra_drm]
 vic_init+0x74/0x158 [tegra_drm]
 host1x_device_init+0x58/0x108 [host1x]
 tegra_drm_load+0xdc/0x2b8 [tegra_drm]

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/gpu/drm/tegra/falcon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falcon.c
index f685e72949d1..9126d4fc5933 100644
--- a/drivers/gpu/drm/tegra/falcon.c
+++ b/drivers/gpu/drm/tegra/falcon.c
@@ -141,9 +141,10 @@ int falcon_load_firmware(struct falcon *falcon)
 	/* allocate iova space for the firmware */
 	falcon->firmware.vaddr = falcon->ops->alloc(falcon, firmware->size,
 						    &falcon->firmware.paddr);
-	if (!falcon->firmware.vaddr) {
+	if (IS_ERR_OR_NULL(falcon->firmware.vaddr)) {
 		dev_err(falcon->dev, "dma memory mapping failed\n");
-		return -ENOMEM;
+		err = PTR_ERR(falcon->firmware.vaddr);
+		return err ? err : -ENOMEM;
 	}
 
 	/* copy firmware image into local area. this also ensures endianness */
-- 
2.17.1
