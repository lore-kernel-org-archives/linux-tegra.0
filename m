From: Shardar Mohammed <smohammed@nvidia.com>
Subject: RE: [PATCH] dmaengine: tegra: crash fix observed during dma
 client(UART) stress testing
Date: Tue, 3 May 2016 14:44:49 +0000
Message-ID: <ec7e4483c2d74e36ade15e26684a6ee8@bgmail102.nvidia.com>
References: <1462277698-11360-1-git-send-email-smohammed@nvidia.com>
 <5728B10C.1090608@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5728B10C.1090608@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "gnurou@gmail.com" <gnurou@gmail.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Thanks for review. Please find my comments inline.

> On 03/05/16 13:14, Shardar Shariff Md wrote:
> > During DMA client(UART) stress testing, observed below crash:
> >
> > [  167.041591] Unable to handle kernel paging request at virtual
> > address 00100108 [  167.048818] pgd = ffffffc0de7ee000 [  167.052222]
> > [00100108] *pgd=0000000000000000 [  167.056513] Internal error: Oops:
> > 96000045 [#1] PREEMPT SMP [  167.084048] Modules linked in:
> > [  167.087126] CPU: 0 PID: 1786 Comm: uarttest Tainted: G        W    3.10.33-
> gb76f6f9 #5
> > [  167.095040] task: ffffffc0a5ba6ac0 ti: ffffffc094380000 task.ti:
> > ffffffc094380000 [  167.102529] PC is at tegra_dma_tasklet+0x50/0xf4 [
> > 167.107148] LR is at tegra_dma_tasklet+0xc0/0xf4 [  167.111767] pc :
> > [<ffffffc00044acc8>] lr : [<ffffffc00044ad38>] pstate: 800001c5 [
> > 167.119155] sp : ffffffc094383a60 [  167.122469] x29: ffffffc094383a60
> > x28: 0000000000000000
> 
> This appears to be from quite an old kernel. I assume that this is still valid for
> the latest mainline?
[Shardar] Yes.
> 
> > Issue: UART RX channel DMA completion EOC(End of completion) interrupt
> > occurs and dma driver schedules tasklet() to execute callback function
> > and empty the cb_desc (callback descriptor). Before dma driver tasklet
> > runs, UART RX EORD (end of receive data) interrupt occurs. Here UART
> > RX ISR handler calls tegra_dma_terminate_all() and re-configures the
> > DMA for RX. While re-configuring, the cb_node data is re-initialized
> > but the cb_desc list is not emptied. Now when dma driver tasklet
> > callback function tries to check cb_desc and delete the cb_node
> > (re-initialized node) kernel crashes.
> 
> I am wondering if we can simplify the description a bit here.
> 
[Shardar] Will modify and push new patch.

> Is the problem that the current implementation assumes that the tasklet will
> run before the next transfer has been configured? And if this does not
> happen then we may request the same descriptor for the next tranfer that is
> currently on the callback queue waiting for the tasklet to run?
[Shardar] Yes.
If tasklet has not yet run and meanwhile dma client (UART RX ISR for EORD case) isr handler runs then it calls the tegra_dma_terminate_all() and queries for the bytes transferred through dma and then acknowledges the dma_desc (async_tx_ack(rx_dma_desc)). As the dma desc is acknowledged the same descriptor is allocated to the next transfer and dma_desc is initialized (where cb_node list is initialized).
Now when the tasklet runs, channel callback descriptor queue will be pointed to reinitialized cb_node. Which will cause the crash when deleting cb_node.

> 
> > Fix: Empty the cb_desc data structure during tegra_dma_terminate_all()
> > routine if there are no pending transfers.
> 
> Does note really describe the fix. We are emptying a list of descriptors that
> have a callback pending.
> 
[Shardar] Will elaborate the fix and upload new patch set.
Here dma client (UART ISR) is calling the tegra_dma_terminate_all() before the tasklet is running, so there is no need to handle the functionality of tasklet i.e execute the callback function and deleting the callback nodes from the queue. So fix is to delete the callback queue when there are no pending transfers.

> I would be tempted to change the subject slightly as this is fixing a race
> condition that could be seen by various different clients.
> 
[Shardar] Will modify it.
> Cheers
> Jon
