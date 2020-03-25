From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] gpu: host1x: Use SMMU on Tegra124 and Tegra210
Date: Wed, 25 Mar 2020 21:16:04 +0100
Message-ID: <20200325201604.833898-2-thierry.reding@gmail.com>
References: <20200325201604.833898-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200325201604.833898-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra124 and Tegra210 support addressing more than 32 bits of physical
memory. However, since their host1x does not support the wide GATHER
opcode, they should use the SMMU if at all possible to ensure that all
the system memory can be used for command buffers, irrespective of
whether or not the host1x firewall is enabled.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/dev.c | 46 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 40a4b9f8b861..d24344e91922 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -192,17 +192,55 @@ static void host1x_setup_sid_table(struct host1x *host)
 	}
 }
 
+static bool host1x_wants_iommu(struct host1x *host1x)
+{
+	/*
+	 * If we support addressing a maximum of 32 bits of physical memory
+	 * and if the host1x firewall is enabled, there's no need to enable
+	 * IOMMU support. This can happen for example on Tegra20, Tegra30
+	 * and Tegra114.
+	 *
+	 * Tegra124 and later can address up to 34 bits of physical memory and
+	 * many platforms come equipped with more than 2 GiB of system memory,
+	 * which requires crossing the 4 GiB boundary. But there's a catch: on
+	 * SoCs before Tegra186 (i.e. Tegra124 and Tegra210), the host1x can
+	 * only address up to 32 bits of memory in GATHER opcodes, which means
+	 * that command buffers need to either be in the first 2 GiB of system
+	 * memory (which could quickly lead to memory exhaustion), or command
+	 * buffers need to be treated differently from other buffers (which is
+	 * not possible with the current ABI).
+	 *
+	 * A third option is to use the IOMMU in these cases to make sure all
+	 * buffers will be mapped into a 32-bit IOVA space that host1x can
+	 * address. This allows all of the system memory to be used and works
+	 * within the limitations of the host1x on these SoCs.
+	 *
+	 * In summary, default to enable IOMMU on Tegra124 and later. For any
+	 * of the earlier SoCs, only use the IOMMU for additional safety when
+	 * the host1x firewall is disabled.
+	 */
+	if (host1x->info->dma_mask <= DMA_BIT_MASK(32)) {
+		if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+			return false;
+	}
+
+	return true;
+}
+
 static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
 	int err;
 
 	/*
-	 * If the host1x firewall is enabled, there's no need to enable IOMMU
-	 * support. Similarly, if host1x is already attached to an IOMMU (via
-	 * the DMA API), don't try to attach again.
+	 * We may not always want to enable IOMMU support (for example if the
+	 * host1x firewall is already enabled and we don't support addressing
+	 * more than 32 bits of physical memory), so check for that first.
+	 *
+	 * Similarly, if host1x is already attached to an IOMMU (via the DMA
+	 * API), don't try to attach again.
 	 */
-	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) || domain)
+	if (!host1x_wants_iommu(host) || domain)
 		return domain;
 
 	host->group = iommu_group_get(host->dev);
-- 
2.24.1
