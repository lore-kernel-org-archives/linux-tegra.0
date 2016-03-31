From: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dmaengine: tegra-apb: proper default init of channel slave_id
Date: Thu, 31 Mar 2016 11:56:51 +0530
Message-ID: <1459405611-12470-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Initialize default channel slave_id(req_sel) to -1 to avoid
overwriting of slave_id with client data as zero is the
valid slave_id(request_select).

Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 3871f29..35a0df0 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -204,7 +204,7 @@ struct tegra_dma_channel {
 	struct tasklet_struct	tasklet;
 
 	/* Channel-slave specific configuration */
-	unsigned int slave_id;
+	int slave_id;
 	struct dma_slave_config dma_sconfig;
 	struct tegra_dma_channel_regs	channel_reg;
 };
@@ -353,7 +353,7 @@ static int tegra_dma_slave_config(struct dma_chan *dc,
 	}
 
 	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
-	if (!tdc->slave_id)
+	if (tdc->slave_id == -1)
 		tdc->slave_id = sconfig->slave_id;
 	tdc->config_init = true;
 	return 0;
@@ -1236,7 +1236,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 	}
 	pm_runtime_put(tdma->dev);
 
-	tdc->slave_id = 0;
+	tdc->slave_id = -1;
 }
 
 static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
@@ -1389,6 +1389,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 				&tdma->dma_dev.channels);
 		tdc->tdma = tdma;
 		tdc->id = i;
+		tdc->slave_id = -1;
 
 		tasklet_init(&tdc->tasklet, tegra_dma_tasklet,
 				(unsigned long)tdc);
-- 
1.8.1.5
