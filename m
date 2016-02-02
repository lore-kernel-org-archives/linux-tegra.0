From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH wq/for-4.5-fixes] workqueue: skip flush dependency checks
 for legacy workqueues
Date: Tue, 2 Feb 2016 12:24:16 +0530
Message-ID: <56B05298.2060301@codeaurora.org>
References: <20151203002810.GJ19878@mtj.duckdns.org>
 <20151203093350.GP17308@twins.programming.kicks-ass.net>
 <20151203100018.GO11639@twins.programming.kicks-ass.net>
 <20151203144811.GA27463@mtj.duckdns.org>
 <20151203150442.GR17308@twins.programming.kicks-ass.net>
 <20151203150604.GC27463@mtj.duckdns.org>
 <20151203192616.GJ27463@mtj.duckdns.org>
 <20160126173843.GA11115@ulmo.nvidia.com>
 <20160129105946.GJ32380@htj.duckdns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160129105946.GJ32380-piEFEHQLUPpN0TnZuCh8vA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ulrich Obergfell <uobergfe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-team-b10kYP2dOMg@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 01/29/2016 04:29 PM, Tejun Heo wrote:
> fca839c00a12 ("workqueue: warn if memory reclaim tries to flush
> !WQ_MEM_RECLAIM workqueue") implemented flush dependency warning which
> triggers if a PF_MEMALLOC task or WQ_MEM_RECLAIM workqueue tries to
> flush a !WQ_MEM_RECLAIM workquee.
>
> This assumes that workqueues marked with WQ_MEM_RECLAIM sit in memory
> reclaim path and making it depend on something which may need more
> memory to make forward progress can lead to deadlocks.  Unfortunately,
> workqueues created with the legacy create*_workqueue() interface
> always have WQ_MEM_RECLAIM regardless of whether they are depended
> upon memory reclaim or not.  These spurious WQ_MEM_RECLAIM markings
> cause spurious triggering of the flush dependency checks.
>
>    WARNING: CPU: 0 PID: 6 at kernel/workqueue.c:2361 check_flush_dependency+0x138/0x144()
>    workqueue: WQ_MEM_RECLAIM deferwq:deferred_probe_work_func is flushing !WQ_MEM_RECLAIM events:lru_add_drain_per_cpu
>    ...
>    Workqueue: deferwq deferred_probe_work_func
>    [<c0017acc>] (unwind_backtrace) from [<c0013134>] (show_stack+0x10/0x14)
>    [<c0013134>] (show_stack) from [<c0245f18>] (dump_stack+0x94/0xd4)
>    [<c0245f18>] (dump_stack) from [<c0026f9c>] (warn_slowpath_common+0x80/0xb0)
>    [<c0026f9c>] (warn_slowpath_common) from [<c0026ffc>] (warn_slowpath_fmt+0x30/0x40)
>    [<c0026ffc>] (warn_slowpath_fmt) from [<c00390b8>] (check_flush_dependency+0x138/0x144)
>    [<c00390b8>] (check_flush_dependency) from [<c0039ca0>] (flush_work+0x50/0x15c)
>    [<c0039ca0>] (flush_work) from [<c00c51b0>] (lru_add_drain_all+0x130/0x180)
>    [<c00c51b0>] (lru_add_drain_all) from [<c00f728c>] (migrate_prep+0x8/0x10)
>    [<c00f728c>] (migrate_prep) from [<c00bfbc4>] (alloc_contig_range+0xd8/0x338)
>    [<c00bfbc4>] (alloc_contig_range) from [<c00f8f18>] (cma_alloc+0xe0/0x1ac)
>    [<c00f8f18>] (cma_alloc) from [<c001cac4>] (__alloc_from_contiguous+0x38/0xd8)
>    [<c001cac4>] (__alloc_from_contiguous) from [<c001ceb4>] (__dma_alloc+0x240/0x278)
>    [<c001ceb4>] (__dma_alloc) from [<c001cf78>] (arm_dma_alloc+0x54/0x5c)
>    [<c001cf78>] (arm_dma_alloc) from [<c0355ea4>] (dmam_alloc_coherent+0xc0/0xec)
>    [<c0355ea4>] (dmam_alloc_coherent) from [<c039cc4c>] (ahci_port_start+0x150/0x1dc)
>    [<c039cc4c>] (ahci_port_start) from [<c0384734>] (ata_host_start.part.3+0xc8/0x1c8)
>    [<c0384734>] (ata_host_start.part.3) from [<c03898dc>] (ata_host_activate+0x50/0x148)
>    [<c03898dc>] (ata_host_activate) from [<c039d558>] (ahci_host_activate+0x44/0x114)
>    [<c039d558>] (ahci_host_activate) from [<c039f05c>] (ahci_platform_init_host+0x1d8/0x3c8)
>    [<c039f05c>] (ahci_platform_init_host) from [<c039e6bc>] (tegra_ahci_probe+0x448/0x4e8)
>    [<c039e6bc>] (tegra_ahci_probe) from [<c0347058>] (platform_drv_probe+0x50/0xac)
>    [<c0347058>] (platform_drv_probe) from [<c03458cc>] (driver_probe_device+0x214/0x2c0)
>    [<c03458cc>] (driver_probe_device) from [<c0343cc0>] (bus_for_each_drv+0x60/0x94)
>    [<c0343cc0>] (bus_for_each_drv) from [<c03455d8>] (__device_attach+0xb0/0x114)
>    [<c03455d8>] (__device_attach) from [<c0344ab8>] (bus_probe_device+0x84/0x8c)
>    [<c0344ab8>] (bus_probe_device) from [<c0344f48>] (deferred_probe_work_func+0x68/0x98)
>    [<c0344f48>] (deferred_probe_work_func) from [<c003b738>] (process_one_work+0x120/0x3f8)
>    [<c003b738>] (process_one_work) from [<c003ba48>] (worker_thread+0x38/0x55c)
>    [<c003ba48>] (worker_thread) from [<c0040f14>] (kthread+0xdc/0xf4)
>    [<c0040f14>] (kthread) from [<c000f778>] (ret_from_fork+0x14/0x3c)
>
> Fix it by marking workqueues created via create*_workqueue() with
> __WQ_LEGACY and disabling flush dependency checks on them.
>
> Signed-off-by: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Reported-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Link: http://lkml.kernel.org/g/20160126173843.GA11115-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org
> ---
> Hello, Thierry.
>
> Can youp please verify the fix?

This fixes a similar backtrace observed when the drm/msm driver
tries to allocate a vram buffer via cma.

Thanks,
Archit

>
> Thanks.
>
>   include/linux/workqueue.h |    9 +++++----
>   kernel/workqueue.c        |    3 ++-
>   2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index 0e32bc7..ca73c50 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -311,6 +311,7 @@ enum {
>
>   	__WQ_DRAINING		= 1 << 16, /* internal: workqueue is draining */
>   	__WQ_ORDERED		= 1 << 17, /* internal: workqueue is ordered */
> +	__WQ_LEGACY		= 1 << 18, /* internal: create*_workqueue() */
>
>   	WQ_MAX_ACTIVE		= 512,	  /* I like 512, better ideas? */
>   	WQ_MAX_UNBOUND_PER_CPU	= 4,	  /* 4 * #cpus for unbound wq */
> @@ -411,12 +412,12 @@ __alloc_workqueue_key(const char *fmt, unsigned int flags, int max_active,
>   	alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
>
>   #define create_workqueue(name)						\
> -	alloc_workqueue("%s", WQ_MEM_RECLAIM, 1, (name))
> +	alloc_workqueue("%s", __WQ_LEGACY | WQ_MEM_RECLAIM, 1, (name))
>   #define create_freezable_workqueue(name)				\
> -	alloc_workqueue("%s", WQ_FREEZABLE | WQ_UNBOUND | WQ_MEM_RECLAIM, \
> -			1, (name))
> +	alloc_workqueue("%s", __WQ_LEGACY | WQ_FREEZABLE | WQ_UNBOUND |	\
> +			WQ_MEM_RECLAIM, 1, (name))
>   #define create_singlethread_workqueue(name)				\
> -	alloc_ordered_workqueue("%s", WQ_MEM_RECLAIM, name)
> +	alloc_ordered_workqueue("%s", __WQ_LEGACY | WQ_MEM_RECLAIM, name)
>
>   extern void destroy_workqueue(struct workqueue_struct *wq);
>
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 61a0264..dc7faad 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -2355,7 +2355,8 @@ static void check_flush_dependency(struct workqueue_struct *target_wq,
>   	WARN_ONCE(current->flags & PF_MEMALLOC,
>   		  "workqueue: PF_MEMALLOC task %d(%s) is flushing !WQ_MEM_RECLAIM %s:%pf",
>   		  current->pid, current->comm, target_wq->name, target_func);
> -	WARN_ONCE(worker && (worker->current_pwq->wq->flags & WQ_MEM_RECLAIM),
> +	WARN_ONCE(worker && ((worker->current_pwq->wq->flags &
> +			      (WQ_MEM_RECLAIM | __WQ_LEGACY)) == WQ_MEM_RECLAIM),
>   		  "workqueue: WQ_MEM_RECLAIM %s:%pf is flushing !WQ_MEM_RECLAIM %s:%pf",
>   		  worker->current_pwq->wq->name, worker->current_func,
>   		  target_wq->name, target_func);
>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, hosted by The Linux Foundation
