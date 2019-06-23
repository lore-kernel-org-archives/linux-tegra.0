From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on client's registration
Date: Sun, 23 Jun 2019 20:37:41 +0300
Message-ID: <20190623173743.24088-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On ARM32 we don't want any of the clients device to be backed by the
implicit domain, simply because we can't afford such a waste on older
Tegra SoCs that have very few domains available in total. The recent IOMMU
support addition for the Video Decoder hardware uncovered the problem
that an unfortunate drivers probe order results in the DRM driver probe
failure if CONFIG_ARM_DMA_USE_IOMMU=y due to a shortage of IOMMU domains
caused by the implicit backing. The host1x_client_register() is a common
function that is invoked by all of the relevant DRM drivers during theirs
probe and hence it is convenient to remove the implicit backing there,
resolving the problem.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/bus.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 742aa9ff21b8..559df3974afb 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -14,6 +14,10 @@
 #include "bus.h"
 #include "dev.h"
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+#endif
+
 static DEFINE_MUTEX(clients_lock);
 static LIST_HEAD(clients);
 
@@ -710,6 +714,21 @@ int host1x_client_register(struct host1x_client *client)
 	struct host1x *host1x;
 	int err;
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+	/*
+	 * The client's driver could be backed by implicit IOMMU mapping
+	 * and we don't want to have that because all of current Tegra
+	 * drivers are managing IOMMU by themselves. This is a convenient
+	 * place for unmapping of the implicit mapping because this function
+	 * is called by all host1x drivers during theirs probe.
+	 */
+	if (client->dev->archdata.mapping) {
+		struct dma_iommu_mapping *mapping =
+			to_dma_iommu_mapping(client->dev);
+		arm_iommu_detach_device(client->dev);
+		arm_iommu_release_mapping(mapping);
+	}
+#endif
 	mutex_lock(&devices_lock);
 
 	list_for_each_entry(host1x, &devices, list) {
-- 
2.22.0
