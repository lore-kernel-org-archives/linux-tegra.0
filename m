From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] iommu: Do not probe devices on IOMMU-less busses
Date: Mon, 11 May 2020 18:10:00 +0200
Message-ID: <20200511161000.3853342-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The host1x bus implemented on Tegra SoCs is primarily an abstraction to
create logical device from multiple platform devices. Since the devices
in such a setup are typically hierarchical, DMA setup still needs to be
done so that DMA masks can be properly inherited, but we don't actually
want to attach the host1x logical devices to any IOMMU. The platform
devices that make up the logical device are responsible for memory bus
transactions, so it is them that will need to be attached to the IOMMU.

Add a check to __iommu_probe_device() that aborts IOMMU setup early for
busses that don't have the IOMMU operations pointer set since they will
cause a crash otherwise.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note that this is probably also required for the BCMA bus implemented in
drivers/bcma/main.c since no IOMMU operations are ever assigned to that
either.

 drivers/iommu/iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 9888a3c82b15..4050569188be 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -196,6 +196,9 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	struct iommu_group *group;
 	int ret;
 
+	if (!ops)
+		return -ENODEV;
+
 	if (!dev_iommu_get(dev))
 		return -ENOMEM;
 
-- 
2.24.1
