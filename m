From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/4] of: reserved-memory: Support memory-regions property
Date: Fri,  3 Apr 2020 20:56:38 +0200
Message-ID: <20200403185640.118569-3-thierry.reding@gmail.com>
References: <20200403185640.118569-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200403185640.118569-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Implement the memory-regions property as the preferred way to get at the
list of reserved memory regions referenced by a device. For backwards-
compatibility, fallback to the memory-region property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/of_reserved_mem.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 1a84bc0d5fa8..62a35422c28d 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -302,9 +302,9 @@ static DEFINE_MUTEX(of_rmem_assigned_device_mutex);
  * @idx:	Index of selected region
  *
  * This function assigns respective DMA-mapping operations based on reserved
- * memory region specified by 'memory-region' property in @np node to the @dev
- * device. When driver needs to use more than one reserved memory region, it
- * should allocate child devices and initialize regions by name for each of
+ * memory region specified by 'memory-region(s)' property in @np node to the
+ * @dev device. When driver needs to use more than one reserved memory region,
+ * it should allocate child devices and initialize regions by name for each of
  * child device.
  *
  * Returns error code or zero on success.
@@ -320,7 +320,10 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
 	if (!np || !dev)
 		return -EINVAL;
 
-	target = of_parse_phandle(np, "memory-region", idx);
+	target = of_parse_phandle(np, "memory-regions", idx);
+	if (!target)
+		target = of_parse_phandle(np, "memory-region", idx);
+
 	if (!target)
 		return -ENODEV;
 
-- 
2.24.1
