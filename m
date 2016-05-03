From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra: crash fix observed during dma
 client(UART) stress testing
Date: Tue, 3 May 2016 15:09:16 +0100
Message-ID: <5728B10C.1090608@nvidia.com>
References: <1462277698-11360-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462277698-11360-1-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 03/05/16 13:14, Shardar Shariff Md wrote:
> During DMA client(UART) stress testing, observed below crash:
> 
> [  167.041591] Unable to handle kernel paging request at virtual address 00100108
> [  167.048818] pgd = ffffffc0de7ee000
> [  167.052222] [00100108] *pgd=0000000000000000
> [  167.056513] Internal error: Oops: 96000045 [#1] PREEMPT SMP
> [  167.084048] Modules linked in:
> [  167.087126] CPU: 0 PID: 1786 Comm: uarttest Tainted: G        W    3.10.33-gb76f6f9 #5
> [  167.095040] task: ffffffc0a5ba6ac0 ti: ffffffc094380000 task.ti: ffffffc094380000
> [  167.102529] PC is at tegra_dma_tasklet+0x50/0xf4
> [  167.107148] LR is at tegra_dma_tasklet+0xc0/0xf4
> [  167.111767] pc : [<ffffffc00044acc8>] lr : [<ffffffc00044ad38>] pstate: 800001c5
> [  167.119155] sp : ffffffc094383a60
> [  167.122469] x29: ffffffc094383a60 x28: 0000000000000000

This appears to be from quite an old kernel. I assume that this is still
valid for the latest mainline?

> Issue: UART RX channel DMA completion EOC(End of completion) interrupt
> occurs and dma driver schedules tasklet() to execute callback function
> and empty the cb_desc (callback descriptor). Before dma driver tasklet
> runs, UART RX EORD (end of receive data) interrupt occurs. Here UART RX
> ISR handler calls tegra_dma_terminate_all() and re-configures the DMA
> for RX. While re-configuring, the cb_node data is re-initialized but the
> cb_desc list is not emptied. Now when dma driver tasklet callback function
> tries to check cb_desc and delete the cb_node (re-initialized node) kernel
> crashes.

I am wondering if we can simplify the description a bit here.

Is the problem that the current implementation assumes that the tasklet
will run before the next transfer has been configured? And if this does
not happen then we may request the same descriptor for the next tranfer
that is currently on the callback queue waiting for the tasklet to run?

> Fix: Empty the cb_desc data structure during tegra_dma_terminate_all()
> routine if there are no pending transfers.

Does note really describe the fix. We are emptying a list of descriptors
that have a callback pending.

I would be tempted to change the subject slightly as this is fixing a
race condition that could be seen by various different clients.

Cheers
Jon
