From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] ARM: tegra: Prevent requeuing in-progress DMA requests
Date: Sat, 19 Feb 2011 20:38:55 -0700
Message-ID: <1298173137-9242-3-git-send-email-swarren@nvidia.com>
References: <1298173137-9242-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298173137-9242-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If a request already in the queue is passed to tegra_dma_enqueue_req,
tegra_dma_req.node->{next,prev} will end up pointing to itself instead
of at tegra_dma_channel.list, which is the way a the end-of-list
should be set up. When the DMA request completes and is list_del'd,
the list head will still point at it, yet the node's next/prev will
contain the list poison values. When the next DMA request completes,
a kernel panic will occur when those poison values are dereferenced.

This makes the DMA driver more robust in the face of buggy clients.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/dma.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/dma.c b/arch/arm/mach-tegra/dma.c
index 250bc7b..f3b869b 100644
--- a/arch/arm/mach-tegra/dma.c
+++ b/arch/arm/mach-tegra/dma.c
@@ -311,6 +311,7 @@ int tegra_dma_enqueue_req(struct tegra_dma_channel *ch,
 	struct tegra_dma_req *req)
 {
 	unsigned long irq_flags;
+	struct tegra_dma_req *_req;
 	int start_dma = 0;
 
 	if (req->size > NV_DMA_MAX_TRASFER_SIZE ||
@@ -321,6 +322,13 @@ int tegra_dma_enqueue_req(struct tegra_dma_channel *ch,
 
 	spin_lock_irqsave(&ch->lock, irq_flags);
 
+	list_for_each_entry(_req, &ch->list, node) {
+		if (req == _req) {
+			spin_unlock_irqrestore(&ch->lock, irq_flags);
+			return -EEXIST;
+		}
+	}
+
 	req->bytes_transferred = 0;
 	req->status = 0;
 	req->buffer_status = 0;
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
