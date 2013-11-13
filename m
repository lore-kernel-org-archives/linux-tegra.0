From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] gpu: host1x: Silence a few warnings with LPAE=y
Date: Tue, 12 Nov 2013 23:16:50 -0800
Message-ID: <1384327010-8870-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When building with LPAE=y (64-bit dma_addr_t), the following warnings are seen:

drivers/gpu/host1x/hw/cdma_hw.c:57:3: warning: format '%x' expects
  argument of type 'unsigned int', but argument 5 has type 'dma_addr_t'

drivers/gpu/host1x/hw/debug_hw.c:167:10: warning: format '%x' expects
  argument of type 'unsigned int', but argument 3 has type 'dma_addr_t'

The agreed-to solution for this is upcast to u64 and using %llx.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 drivers/gpu/host1x/hw/cdma_hw.c  |    4 ++--
 drivers/gpu/host1x/hw/debug_hw.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/cdma_hw.c
index 37e2a63..6b09b71 100644
--- a/drivers/gpu/host1x/hw/cdma_hw.c
+++ b/drivers/gpu/host1x/hw/cdma_hw.c
@@ -54,8 +54,8 @@ static void cdma_timeout_cpu_incr(struct host1x_cdma *cdma, u32 getptr,
 		u32 *p = (u32 *)((u32)pb->mapped + getptr);
 		*(p++) = HOST1X_OPCODE_NOP;
 		*(p++) = HOST1X_OPCODE_NOP;
-		dev_dbg(host1x->dev, "%s: NOP at 0x%x\n", __func__,
-			pb->phys + getptr);
+		dev_dbg(host1x->dev, "%s: NOP at %#llx\n", __func__,
+			(u64)pb->phys + getptr);
 		getptr = (getptr + 8) & (pb->size_bytes - 1);
 	}
 	wmb();
diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
index 640c75c..f72c873 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -163,8 +163,8 @@ static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 				continue;
 			}
 
-			host1x_debug_output(o, "    GATHER at %08x+%04x, %d words\n",
-					    g->base, g->offset, g->words);
+			host1x_debug_output(o, "    GATHER at %#llx+%04x, %d words\n",
+					    (u64)g->base, g->offset, g->words);
 
 			show_gather(o, g->base + g->offset, g->words, cdma,
 				    g->base, mapped);
-- 
1.7.10.4
