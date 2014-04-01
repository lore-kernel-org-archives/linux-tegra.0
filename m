From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] gpu: host1x: handle the correct # of syncpt regs
Date: Tue,  1 Apr 2014 14:10:37 -0600
Message-ID: <1396383037-5891-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

BIT_WORD() truncates rather than rounds, so the loops in
syncpt_thresh_isr() and _host1x_intr_disable_all_syncpt_intrs() use <=
rather than < in an attempt to process the correct number of registers
when rounding of the conversion of count of bits to count of words is
necessary. However, when rounding isn't necessary (as is the case for
all values of nb_pts the code actually sees), this causes one too many
registers to be processed.

Solve this by using BITS_TO_LONGS() (which rounds internally), rather
than BIT_WORD(), and comparing with < rather than <=.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/hw/intr_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
index db9017adfe2b..17407b2de2bf 100644
--- a/drivers/gpu/host1x/hw/intr_hw.c
+++ b/drivers/gpu/host1x/hw/intr_hw.c
@@ -47,7 +47,7 @@ static irqreturn_t syncpt_thresh_isr(int irq, void *dev_id)
 	unsigned long reg;
 	int i, id;
 
-	for (i = 0; i <= BIT_WORD(host->info->nb_pts); i++) {
+	for (i = 0; i < BITS_TO_LONGS(host->info->nb_pts); i++) {
 		reg = host1x_sync_readl(host,
 			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i));
 		for_each_set_bit(id, &reg, BITS_PER_LONG) {
@@ -64,7 +64,7 @@ static void _host1x_intr_disable_all_syncpt_intrs(struct host1x *host)
 {
 	u32 i;
 
-	for (i = 0; i <= BIT_WORD(host->info->nb_pts); ++i) {
+	for (i = 0; i < BITS_TO_LONGS(host->info->nb_pts); ++i) {
 		host1x_sync_writel(host, 0xffffffffu,
 			HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(i));
 		host1x_sync_writel(host, 0xffffffffu,
-- 
1.8.1.5
