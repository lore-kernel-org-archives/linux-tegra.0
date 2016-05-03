From: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dmaengine: tegra: crash fix observed during dma client(UART) stress testing
Date: Tue, 3 May 2016 17:44:58 +0530
Message-ID: <1462277698-11360-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

During DMA client(UART) stress testing, observed below crash:

[  167.041591] Unable to handle kernel paging request at virtual address 00100108
[  167.048818] pgd = ffffffc0de7ee000
[  167.052222] [00100108] *pgd=0000000000000000
[  167.056513] Internal error: Oops: 96000045 [#1] PREEMPT SMP
[  167.084048] Modules linked in:
[  167.087126] CPU: 0 PID: 1786 Comm: uarttest Tainted: G        W    3.10.33-gb76f6f9 #5
[  167.095040] task: ffffffc0a5ba6ac0 ti: ffffffc094380000 task.ti: ffffffc094380000
[  167.102529] PC is at tegra_dma_tasklet+0x50/0xf4
[  167.107148] LR is at tegra_dma_tasklet+0xc0/0xf4
[  167.111767] pc : [<ffffffc00044acc8>] lr : [<ffffffc00044ad38>] pstate: 800001c5
[  167.119155] sp : ffffffc094383a60
[  167.122469] x29: ffffffc094383a60 x28: 0000000000000000

Issue: UART RX channel DMA completion EOC(End of completion) interrupt
occurs and dma driver schedules tasklet() to execute callback function
and empty the cb_desc (callback descriptor). Before dma driver tasklet
runs, UART RX EORD (end of receive data) interrupt occurs. Here UART RX
ISR handler calls tegra_dma_terminate_all() and re-configures the DMA
for RX. While re-configuring, the cb_node data is re-initialized but the
cb_desc list is not emptied. Now when dma driver tasklet callback function
tries to check cb_desc and delete the cb_node (re-initialized node) kernel
crashes.

Fix: Empty the cb_desc data structure during tegra_dma_terminate_all()
routine if there are no pending transfers.

Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 3871f29..34bb4cd 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -751,10 +751,8 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
 	bool was_busy;
 
 	spin_lock_irqsave(&tdc->lock, flags);
-	if (list_empty(&tdc->pending_sg_req)) {
-		spin_unlock_irqrestore(&tdc->lock, flags);
-		return 0;
-	}
+	if (list_empty(&tdc->pending_sg_req))
+		goto empty_cblist;
 
 	if (!tdc->busy)
 		goto skip_dma_stop;
@@ -787,6 +785,7 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
 skip_dma_stop:
 	tegra_dma_abort_all(tdc);
 
+empty_cblist:
 	while (!list_empty(&tdc->cb_desc)) {
 		dma_desc  = list_first_entry(&tdc->cb_desc,
 					typeof(*dma_desc), cb_node);
-- 
1.8.1.5
