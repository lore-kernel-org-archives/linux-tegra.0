From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 4/4] gpu: host1x: debug: Dump push buffer state
Date: Sun, 24 May 2020 20:51:00 +0300
Message-ID: <20200524175100.9334-5-digetx@gmail.com>
References: <20200524175100.9334-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200524175100.9334-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When job hangs and there is a memory error pointing at channel's push
buffer, it is very handy to know the push buffer's state. This patch
makes the push buffer's state to be dumped into KMSG in addition to the
job's gathers.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/host1x/hw/debug_hw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
index 02125842071c..c25c3fe0a295 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -192,8 +192,14 @@ static void show_gather(struct output *o, phys_addr_t phys_addr,
 
 static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 {
+	struct push_buffer *pb = &cdma->push_buffer;
 	struct host1x_job *job;
 
+	host1x_debug_output(o, "Push Buffer at %08x, %d words\n",
+			    pb->dma, pb->size / 4);
+
+	show_gather(o, pb->dma, pb->size / 4, cdma, pb->dma, pb->mapped);
+
 	list_for_each_entry(job, &cdma->sync_queue, list) {
 		unsigned int i;
 
-- 
2.26.0
