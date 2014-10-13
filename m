From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/14] gpu: host1x: Use struct host1x_bo pointers in traces
Date: Mon, 13 Oct 2014 12:21:42 +0200
Message-ID: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Rather than cast to a u32 use the struct host1x_bo pointers directly.
This avoid annoying warnings for 64-bit builds.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/hw/channel_hw.c | 12 ++++++++----
 include/trace/events/host1x.h      | 27 +++++++++++++++------------
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 4608257ab656..946c332c3906 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -32,6 +32,7 @@
 static void trace_write_gather(struct host1x_cdma *cdma, struct host1x_bo *bo,
 			       u32 offset, u32 words)
 {
+	struct device *dev = cdma_to_channel(cdma)->dev;
 	void *mem = NULL;
 
 	if (host1x_debug_trace_cmdbuf)
@@ -44,11 +45,14 @@ static void trace_write_gather(struct host1x_cdma *cdma, struct host1x_bo *bo,
 		 * of how much you can output to ftrace at once.
 		 */
 		for (i = 0; i < words; i += TRACE_MAX_LENGTH) {
-			trace_host1x_cdma_push_gather(
-				dev_name(cdma_to_channel(cdma)->dev),
-				(u32)bo, min(words - i, TRACE_MAX_LENGTH),
-				offset + i * sizeof(u32), mem);
+			u32 num_words = min(words - i, TRACE_MAX_LENGTH);
+			offset += i * sizeof(u32);
+
+			trace_host1x_cdma_push_gather(dev_name(dev), bo,
+						      num_words, offset,
+						      mem);
 		}
+
 		host1x_bo_munmap(bo, mem);
 	}
 }
diff --git a/include/trace/events/host1x.h b/include/trace/events/host1x.h
index 94db6a2c3540..63116362543c 100644
--- a/include/trace/events/host1x.h
+++ b/include/trace/events/host1x.h
@@ -29,6 +29,8 @@
 #include <linux/ktime.h>
 #include <linux/tracepoint.h>
 
+struct host1x_bo;
+
 DECLARE_EVENT_CLASS(host1x,
 	TP_PROTO(const char *name),
 	TP_ARGS(name),
@@ -79,14 +81,14 @@ TRACE_EVENT(host1x_cdma_push,
 );
 
 TRACE_EVENT(host1x_cdma_push_gather,
-	TP_PROTO(const char *name, u32 mem_id,
+	TP_PROTO(const char *name, struct host1x_bo *bo,
 			u32 words, u32 offset, void *cmdbuf),
 
-	TP_ARGS(name, mem_id, words, offset, cmdbuf),
+	TP_ARGS(name, bo, words, offset, cmdbuf),
 
 	TP_STRUCT__entry(
 		__field(const char *, name)
-		__field(u32, mem_id)
+		__field(struct host1x_bo *, bo)
 		__field(u32, words)
 		__field(u32, offset)
 		__field(bool, cmdbuf)
@@ -100,13 +102,13 @@ TRACE_EVENT(host1x_cdma_push_gather,
 		}
 		__entry->cmdbuf = cmdbuf;
 		__entry->name = name;
-		__entry->mem_id = mem_id;
+		__entry->bo = bo;
 		__entry->words = words;
 		__entry->offset = offset;
 	),
 
-	TP_printk("name=%s, mem_id=%08x, words=%u, offset=%d, contents=[%s]",
-	  __entry->name, __entry->mem_id,
+	TP_printk("name=%s, bo=%p, words=%u, offset=%d, contents=[%s]",
+	  __entry->name, __entry->bo,
 	  __entry->words, __entry->offset,
 	  __print_hex(__get_dynamic_array(cmdbuf),
 		  __entry->cmdbuf ? __entry->words * 4 : 0))
@@ -221,12 +223,13 @@ TRACE_EVENT(host1x_syncpt_load_min,
 );
 
 TRACE_EVENT(host1x_syncpt_wait_check,
-	TP_PROTO(void *mem_id, u32 offset, u32 syncpt_id, u32 thresh, u32 min),
+	TP_PROTO(struct host1x_bo *bo, u32 offset, u32 syncpt_id, u32 thresh,
+		 u32 min),
 
-	TP_ARGS(mem_id, offset, syncpt_id, thresh, min),
+	TP_ARGS(bo, offset, syncpt_id, thresh, min),
 
 	TP_STRUCT__entry(
-		__field(void *, mem_id)
+		__field(struct host1x_bo *, bo)
 		__field(u32, offset)
 		__field(u32, syncpt_id)
 		__field(u32, thresh)
@@ -234,15 +237,15 @@ TRACE_EVENT(host1x_syncpt_wait_check,
 	),
 
 	TP_fast_assign(
-		__entry->mem_id = mem_id;
+		__entry->bo = bo;
 		__entry->offset = offset;
 		__entry->syncpt_id = syncpt_id;
 		__entry->thresh = thresh;
 		__entry->min = min;
 	),
 
-	TP_printk("mem_id=%p, offset=%05x, id=%d, thresh=%d, current=%d",
-		__entry->mem_id, __entry->offset,
+	TP_printk("bo=%p, offset=%05x, id=%d, thresh=%d, current=%d",
+		__entry->bo, __entry->offset,
 		__entry->syncpt_id, __entry->thresh,
 		__entry->min)
 );
-- 
2.1.2
