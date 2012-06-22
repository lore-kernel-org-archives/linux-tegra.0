From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] dma: tegra: do not set transfer desc flag to DMA_CTRL_ACK in cyclic mode
Date: Fri, 22 Jun 2012 17:12:44 +0530
Message-ID: <1340365364-16276-2-git-send-email-ldewangan@nvidia.com>
References: <1340365364-16276-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340365364-16276-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The sound dmaengine pcm driver uses the dma in cyclic mode and
it does not ack the transfer descriptor  after transfer stops.
This may lead to hold that desc in chip's dma driver and does
not allow to reuse/free that descriptors. Hence not enabling
flag DMA_CTRL_ACK when dma runs in cyclic mode.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index b4bd50c..2e4c187 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1093,7 +1093,7 @@ struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 		mem += len;
 	}
 	sg_req->last_sg = true;
-	dma_desc->txd.flags = DMA_CTRL_ACK;
+	dma_desc->txd.flags = 0;
 
 	/*
 	 * Make sure that mode should not be conflicting with currently
-- 
1.7.1.1
