From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/14] gpu: host1x: Make mapped field of push buffers void *
Date: Mon, 13 Oct 2014 12:21:43 +0200
Message-ID: <1413195715-4719-2-git-send-email-thierry.reding@gmail.com>
References: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413195715-4719-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This reduces the amount of casting that needs to be done to get rid of
annoying warnings on 64-bit builds.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/cdma.c       | 2 +-
 drivers/gpu/host1x/cdma.h       | 2 +-
 drivers/gpu/host1x/hw/cdma_hw.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index 3995255b16c7..5a8c8d55317a 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -97,7 +97,7 @@ fail:
 static void host1x_pushbuffer_push(struct push_buffer *pb, u32 op1, u32 op2)
 {
 	u32 pos = pb->pos;
-	u32 *p = (u32 *)((u32)pb->mapped + pos);
+	u32 *p = (u32 *)((void *)pb->mapped + pos);
 	WARN_ON(pos == pb->fence);
 	*(p++) = op1;
 	*(p++) = op2;
diff --git a/drivers/gpu/host1x/cdma.h b/drivers/gpu/host1x/cdma.h
index 313c4b784348..470087af8fe5 100644
--- a/drivers/gpu/host1x/cdma.h
+++ b/drivers/gpu/host1x/cdma.h
@@ -42,7 +42,7 @@ struct host1x_job;
  */
 
 struct push_buffer {
-	u32 *mapped;			/* mapped pushbuffer memory */
+	void *mapped;			/* mapped pushbuffer memory */
 	dma_addr_t phys;		/* physical address of pushbuffer */
 	u32 fence;			/* index we've written */
 	u32 pos;			/* index to write to */
diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/cdma_hw.c
index 6b09b71940c2..a1197c40a454 100644
--- a/drivers/gpu/host1x/hw/cdma_hw.c
+++ b/drivers/gpu/host1x/hw/cdma_hw.c
@@ -30,7 +30,7 @@
  */
 static void push_buffer_init(struct push_buffer *pb)
 {
-	*(pb->mapped + (pb->size_bytes >> 2)) = host1x_opcode_restart(0);
+	*(u32 *)(pb->mapped + pb->size_bytes) = host1x_opcode_restart(0);
 }
 
 /*
@@ -51,7 +51,7 @@ static void cdma_timeout_cpu_incr(struct host1x_cdma *cdma, u32 getptr,
 
 	/* NOP all the PB slots */
 	while (nr_slots--) {
-		u32 *p = (u32 *)((u32)pb->mapped + getptr);
+		u32 *p = (u32 *)(pb->mapped + getptr);
 		*(p++) = HOST1X_OPCODE_NOP;
 		*(p++) = HOST1X_OPCODE_NOP;
 		dev_dbg(host1x->dev, "%s: NOP at %#llx\n", __func__,
-- 
2.1.2
