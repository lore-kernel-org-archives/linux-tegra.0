From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dma: tegra: use sg_dma_address() for getting dma buffer address
Date: Fri, 22 Jun 2012 20:41:10 +0530
Message-ID: <1340377870-10035-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use the sg_dma_address() to get the segment buffer address for
DMA transfer in place of sg_phys() which returns the physical
address of an sg entry.
The sg_dma_address() returns the correct buffer memory address
for DMA transfer.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 2e4c187..a46a21c 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -929,7 +929,7 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 	for_each_sg(sgl, sg, sg_len, i) {
 		u32 len, mem;
 
-		mem = sg_phys(sg);
+		mem = sg_dma_address(sg);
 		len = sg_dma_len(sg);
 
 		if ((len & 3) || (mem & 3) ||
-- 
1.7.1.1
