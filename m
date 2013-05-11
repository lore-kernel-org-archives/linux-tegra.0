From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] dma: tegra: avoid channel lock up after free
Date: Sat, 11 May 2013 20:30:53 +0400
Message-ID: <1368289853-20011-2-git-send-email-digetx@gmail.com>
References: <1368289853-20011-1-git-send-email-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368289853-20011-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Lock scenario: Channel 1 was allocated and prepared as slave_sg, used and freed.
Now preparation of cyclic dma on channel 1 will fail with err "DMA configuration
conflict" because tdc->isr_handler still setted to handle_once_dma_done.

This happens because tegra_dma_abort_all() won't be called on channel freeing
if pending list is empty and channel not busy. We need to clear isr_handler
on channel freeing to avoid locking.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Reposting with dma maintainers cc'd as suggested by Stephen.
Added Stephen's ack.

 drivers/dma/tegra20-apb-dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index a84bb7f..c541276 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1191,6 +1191,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 	list_splice_init(&tdc->free_dma_desc, &dma_desc_list);
 	INIT_LIST_HEAD(&tdc->cb_desc);
 	tdc->config_init = false;
+	tdc->isr_handler = NULL;
 	spin_unlock_irqrestore(&tdc->lock, flags);
 
 	while (!list_empty(&dma_desc_list)) {
-- 
1.8.2.1
