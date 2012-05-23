From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V4 1/2] dma: dmaengine: add slave req id in slave_config
Date: Wed, 23 May 2012 12:15:41 +0530
Message-ID: <1337755542-16271-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The DMA controller like Nvidia's Tegra Dma controller
supports the different slave requestor id from different slave.
This need to be configure in dma controller to handle the request
properly.

Adding the slave-id in the slave configuration so that information
can be passed from client when configuring for slave.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes from V2: 
- Make slave_id as unsigned.

No Changes from V3.

 include/linux/dmaengine.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 56377df..ccec62f 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -338,6 +338,9 @@ enum dma_slave_buswidth {
  * @device_fc: Flow Controller Settings. Only valid for slave channels. Fill
  * with 'true' if peripheral should be flow controller. Direction will be
  * selected at Runtime.
+ * @slave_id: Slave requester id. Only valid for slave channels. The dma
+ * slave peripheral will have unique id as dma requester which need to be
+ * pass as slave config.
  *
  * This struct is passed in as configuration data to a DMA engine
  * in order to set up a certain channel for DMA transport at runtime.
@@ -365,6 +368,7 @@ struct dma_slave_config {
 	u32 src_maxburst;
 	u32 dst_maxburst;
 	bool device_fc;
+	unsigned int slave_id;
 };
 
 static inline const char *dma_chan_name(struct dma_chan *chan)
-- 
1.7.1.1
