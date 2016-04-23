From: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4] dmaengine: tegra-apb: proper default init of channel slave_id
Date: Sat, 23 Apr 2016 15:06:00 +0530
Message-ID: <1461404160-19612-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Initialize default channel slave_id(req_sel) to invalid id
(i.e max supported slave id + 1) to avoid overwriting of slave_id
during tegra_dma_slave_config() with client data if slave_id
is not initialized through DT

Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
Changes from v1:
- Instead of initializing the slave id to -1 define macros for
  max slave id and invalid slave id and do the checks accordingly.

Changes from v2:
- Check slave id boundary before dma channel is allocated to
  avoid channel leakage.
- Calculate the max slave id from the CSR slave id(req sel)
  mask bits.

Changes from v3:
- Remove *MAX_SLAVD_ID macro and instead use *REQ_SEL_MASK
- During tegra_dma_slave_config() check for slave_id boundary
  condition
---
 drivers/dma/tegra20-apb-dma.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 3871f29..01e316f 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -54,6 +54,7 @@
 #define TEGRA_APBDMA_CSR_ONCE			BIT(27)
 #define TEGRA_APBDMA_CSR_FLOW			BIT(21)
 #define TEGRA_APBDMA_CSR_REQ_SEL_SHIFT		16
+#define TEGRA_APBDMA_CSR_REQ_SEL_MASK		0x1F
 #define TEGRA_APBDMA_CSR_WCOUNT_MASK		0xFFFC
 
 /* STATUS register */
@@ -114,6 +115,8 @@
 /* Channel base address offset from APBDMA base address */
 #define TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET	0x1000
 
+#define TEGRA_APBDMA_SLAVE_ID_INVALID	(TEGRA_APBDMA_CSR_REQ_SEL_MASK + 1)
+
 struct tegra_dma;
 
 /*
@@ -353,8 +356,11 @@ static int tegra_dma_slave_config(struct dma_chan *dc,
 	}
 
 	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
-	if (!tdc->slave_id)
+	if (tdc->slave_id == TEGRA_APBDMA_SLAVE_ID_INVALID) {
+		if (sconfig->slave_id > TEGRA_APBDMA_CSR_REQ_SEL_MASK)
+			return -EINVAL;
 		tdc->slave_id = sconfig->slave_id;
+	}
 	tdc->config_init = true;
 	return 0;
 }
@@ -1236,7 +1242,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 	}
 	pm_runtime_put(tdma->dev);
 
-	tdc->slave_id = 0;
+	tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
 }
 
 static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
@@ -1246,6 +1252,11 @@ static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
 	struct dma_chan *chan;
 	struct tegra_dma_channel *tdc;
 
+	if (dma_spec->args[0] > TEGRA_APBDMA_CSR_REQ_SEL_MASK) {
+		dev_err(tdma->dev, "Invalid slave id: %d\n", dma_spec->args[0]);
+		return NULL;
+	}
+
 	chan = dma_get_any_slave_channel(&tdma->dma_dev);
 	if (!chan)
 		return NULL;
@@ -1389,6 +1400,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 				&tdma->dma_dev.channels);
 		tdc->tdma = tdma;
 		tdc->id = i;
+		tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
 
 		tasklet_init(&tdc->tasklet, tegra_dma_tasklet,
 				(unsigned long)tdc);
-- 
1.8.1.5
