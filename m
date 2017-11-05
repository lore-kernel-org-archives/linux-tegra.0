From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 01/10] gpu: host1x: Parameterize channel aperture size
Date: Sun,  5 Nov 2017 13:01:09 +0200
Message-ID: <20171105110118.15142-2-mperttunen@nvidia.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171105110118.15142-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The size of a single channel's aperture is different on Tegra186 vs.
previous chips. Parameterize the value using a new define in the
register definition headers.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/hw/channel_hw.c          | 3 +--
 drivers/gpu/host1x/hw/hw_host1x01_channel.h | 2 ++
 drivers/gpu/host1x/hw/hw_host1x02_channel.h | 2 ++
 drivers/gpu/host1x/hw/hw_host1x04_channel.h | 2 ++
 drivers/gpu/host1x/hw/hw_host1x05_channel.h | 2 ++
 drivers/gpu/host1x/hw/hw_host1x06_vm.h      | 2 ++
 6 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 5c0dc6bb51d1..246b78c41281 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -26,7 +26,6 @@
 #include "../intr.h"
 #include "../job.h"
 
-#define HOST1X_CHANNEL_SIZE 16384
 #define TRACE_MAX_LENGTH 128U
 
 static void trace_write_gather(struct host1x_cdma *cdma, struct host1x_bo *bo,
@@ -205,7 +204,7 @@ static void enable_gather_filter(struct host1x *host,
 static int host1x_channel_init(struct host1x_channel *ch, struct host1x *dev,
 			       unsigned int index)
 {
-	ch->regs = dev->regs + index * HOST1X_CHANNEL_SIZE;
+	ch->regs = dev->regs + HOST1X_CHANNEL_BASE(index);
 	enable_gather_filter(dev, ch);
 	return 0;
 }
diff --git a/drivers/gpu/host1x/hw/hw_host1x01_channel.h b/drivers/gpu/host1x/hw/hw_host1x01_channel.h
index b4bc7ca4e051..be56a3a506de 100644
--- a/drivers/gpu/host1x/hw/hw_host1x01_channel.h
+++ b/drivers/gpu/host1x/hw/hw_host1x01_channel.h
@@ -51,6 +51,8 @@
 #ifndef __hw_host1x_channel_host1x_h__
 #define __hw_host1x_channel_host1x_h__
 
+#define HOST1X_CHANNEL_BASE(x)		((x) * 0x4000)
+
 static inline u32 host1x_channel_fifostat_r(void)
 {
 	return 0x0;
diff --git a/drivers/gpu/host1x/hw/hw_host1x02_channel.h b/drivers/gpu/host1x/hw/hw_host1x02_channel.h
index e490bcde33fe..a142576a2c6e 100644
--- a/drivers/gpu/host1x/hw/hw_host1x02_channel.h
+++ b/drivers/gpu/host1x/hw/hw_host1x02_channel.h
@@ -51,6 +51,8 @@
 #ifndef HOST1X_HW_HOST1X02_CHANNEL_H
 #define HOST1X_HW_HOST1X02_CHANNEL_H
 
+#define HOST1X_CHANNEL_BASE(x)		((x) * 0x4000)
+
 static inline u32 host1x_channel_fifostat_r(void)
 {
 	return 0x0;
diff --git a/drivers/gpu/host1x/hw/hw_host1x04_channel.h b/drivers/gpu/host1x/hw/hw_host1x04_channel.h
index 2e8b635aa660..645483c07fc2 100644
--- a/drivers/gpu/host1x/hw/hw_host1x04_channel.h
+++ b/drivers/gpu/host1x/hw/hw_host1x04_channel.h
@@ -51,6 +51,8 @@
 #ifndef HOST1X_HW_HOST1X04_CHANNEL_H
 #define HOST1X_HW_HOST1X04_CHANNEL_H
 
+#define HOST1X_CHANNEL_BASE(x)		((x) * 0x4000)
+
 static inline u32 host1x_channel_fifostat_r(void)
 {
 	return 0x0;
diff --git a/drivers/gpu/host1x/hw/hw_host1x05_channel.h b/drivers/gpu/host1x/hw/hw_host1x05_channel.h
index abbbc2641ce6..6aef6bc1c96d 100644
--- a/drivers/gpu/host1x/hw/hw_host1x05_channel.h
+++ b/drivers/gpu/host1x/hw/hw_host1x05_channel.h
@@ -51,6 +51,8 @@
 #ifndef HOST1X_HW_HOST1X05_CHANNEL_H
 #define HOST1X_HW_HOST1X05_CHANNEL_H
 
+#define HOST1X_CHANNEL_BASE(x)		((x) * 0x4000)
+
 static inline u32 host1x_channel_fifostat_r(void)
 {
 	return 0x0;
diff --git a/drivers/gpu/host1x/hw/hw_host1x06_vm.h b/drivers/gpu/host1x/hw/hw_host1x06_vm.h
index e54b33902332..0750aea78a30 100644
--- a/drivers/gpu/host1x/hw/hw_host1x06_vm.h
+++ b/drivers/gpu/host1x/hw/hw_host1x06_vm.h
@@ -15,6 +15,8 @@
  *
  */
 
+#define HOST1X_CHANNEL_BASE(x)				((x) * 0x100)
+
 #define HOST1X_CHANNEL_DMASTART				0x0000
 #define HOST1X_CHANNEL_DMASTART_HI			0x0004
 #define HOST1X_CHANNEL_DMAPUT				0x0008
-- 
2.14.2
