From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] of: reserved-memory: Support multiple regions per device
Date: Fri,  3 Apr 2020 20:56:40 +0200
Message-ID: <20200403185640.118569-5-thierry.reding@gmail.com>
References: <20200403185640.118569-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200403185640.118569-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

While the lookup/initialization code already supports multiple memory
regions per device, the release code will only ever release the first
matching memory region.

Enhance the code to release all matching regions. Each attachment of
a region to a device is uniquely identifiable using a struct device
pointer and a pointer to the memory region's struct reserved_mem.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/of_reserved_mem.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index dae70b147552..3ad24df0f673 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -388,24 +388,22 @@ EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_by_name);
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
