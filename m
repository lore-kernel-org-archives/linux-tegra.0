From: Nicholas Mc Guire <hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
Subject: [PATCH] soc: tegra: match wait_for_completion_timeout return type
Date: Mon,  9 Mar 2015 03:12:26 -0400
Message-ID: <1425885146-29065-1-git-send-email-hofrat@osadl.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicholas Mc Guire <hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

return type of wait_for_completion_timeout is unsigned long not int. An
appropriately named unsigned long is added and the assignment fixed up.

Signed-off-by: Nicholas Mc Guire <hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
---

This was only compile tested for tegra_defconfig 
(implies CONFIG_ARCH_TEGRA_2x_SOC=y)

Patch is against 4.0-rc2 linux-next (localversion-next is -next-20150306)

 drivers/soc/tegra/fuse/fuse-tegra20.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index 5eff6f0..6acc2c4 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -59,6 +59,7 @@ static u32 tegra20_fuse_readl(const unsigned int offset)
 	int ret;
 	u32 val = 0;
 	struct dma_async_tx_descriptor *dma_desc;
+	unsigned long time_left;
 
 	mutex_lock(&apb_dma_lock);
 
@@ -82,9 +83,10 @@ static u32 tegra20_fuse_readl(const unsigned int offset)
 
 	dmaengine_submit(dma_desc);
 	dma_async_issue_pending(apb_dma_chan);
-	ret = wait_for_completion_timeout(&apb_dma_wait, msecs_to_jiffies(50));
+	time_left = wait_for_completion_timeout(&apb_dma_wait,
+						msecs_to_jiffies(50));
 
-	if (WARN(ret == 0, "apb read dma timed out"))
+	if (WARN(time_left == 0, "apb read dma timed out"))
 		dmaengine_terminate_all(apb_dma_chan);
 	else
 		val = *apb_buffer;
-- 
1.7.10.4
