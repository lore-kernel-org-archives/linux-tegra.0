From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] firmware: tegra: Defer BPMP probe if shared memory not available
Date: Wed, 20 May 2020 16:12:06 +0100
Message-ID: <20200520151206.15253-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Since commit 93d2e4322aa7 ("of: platform: Batch fwnode parsing when
adding all top level devices") was added, the probing of the Tegra
SRAM device has occurred later in the boot sequence, after the BPMP
has been probed. The BPMP uses sections of the SRAM for shared memory
and if the BPMP is probed before the SRAM then it fails to probe and
never tries again. This is causing a boot failure on Tegra186 and
Tegra194. Fix this by allowing the probe of the BPMP to be deferred if
the SRAM is not available yet.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/firmware/tegra/bpmp-tegra186.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/tegra/bpmp-tegra186.c
index ea308751635f..63ab21d89c2c 100644
--- a/drivers/firmware/tegra/bpmp-tegra186.c
+++ b/drivers/firmware/tegra/bpmp-tegra186.c
@@ -176,7 +176,7 @@ static int tegra186_bpmp_init(struct tegra_bpmp *bpmp)
 	priv->tx.pool = of_gen_pool_get(bpmp->dev->of_node, "shmem", 0);
 	if (!priv->tx.pool) {
 		dev_err(bpmp->dev, "TX shmem pool not found\n");
-		return -ENOMEM;
+		return -EPROBE_DEFER;
 	}
 
 	priv->tx.virt = gen_pool_dma_alloc(priv->tx.pool, 4096, &priv->tx.phys);
@@ -188,7 +188,7 @@ static int tegra186_bpmp_init(struct tegra_bpmp *bpmp)
 	priv->rx.pool = of_gen_pool_get(bpmp->dev->of_node, "shmem", 1);
 	if (!priv->rx.pool) {
 		dev_err(bpmp->dev, "RX shmem pool not found\n");
-		err = -ENOMEM;
+		err = -EPROBE_DEFER;
 		goto free_tx;
 	}
 
-- 
2.17.1
