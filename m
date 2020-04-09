From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v6 03/14] of: reserved-memory: Support multiple regions per device
Date: Thu,  9 Apr 2020 19:52:27 +0200
Message-ID: <20200409175238.3586487-4-thierry.reding@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20200409175238.3586487-1-thierry.reding@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

While the lookup/initialization code already supports multiple memory
regions per device, the release code will only ever release the first
matching memory region.

Enhance the code to release all matching regions. Each attachment of
a region to a device is uniquely identifiable using a struct device
pointer and a pointer to the memory region's struct reserved_mem.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/of_reserved_mem.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ed2ff6f01d32..f61e8739502a 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -385,24 +385,22 @@ EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_by_name);
  */
 void of_reserved_mem_device_release(struct device *dev)
 {
-	struct rmem_assigned_device *rd;
-	struct reserved_mem *rmem = NULL;
+	struct rmem_assigned_device *rd, *tmp;
+	LIST_HEAD(release_list);
 
 	mutex_lock(&of_rmem_assigned_device_mutex);
-	list_for_each_entry(rd, &of_rmem_assigned_device_list, list) {
-		if (rd->dev == dev) {
-			rmem = rd->rmem;
-			list_del(&rd->list);
-			kfree(rd);
-			break;
-		}
+	list_for_each_entry_safe(rd, tmp, &of_rmem_assigned_device_list, list) {
+		if (rd->dev == dev)
+			list_move_tail(&rd->list, &release_list);
 	}
 	mutex_unlock(&of_rmem_assigned_device_mutex);
 
-	if (!rmem || !rmem->ops || !rmem->ops->device_release)
-		return;
+	list_for_each_entry_safe(rd, tmp, &release_list, list) {
+		if (rd->rmem && rd->rmem->ops && rd->rmem->ops->device_release)
+			rd->rmem->ops->device_release(rd->rmem, dev);
 
-	rmem->ops->device_release(rmem, dev);
+		kfree(rd);
+	}
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_device_release);
 
-- 
2.24.1
