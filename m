From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] workqueue: warn if memory reclaim tries to flush
 !WQ_MEM_RECLAIM workqueue
Date: Thu, 28 Jan 2016 11:12:10 +0100
Message-ID: <20160128101210.GC6357@twins.programming.kicks-ass.net>
References: <20151203002810.GJ19878@mtj.duckdns.org>
 <20151203093350.GP17308@twins.programming.kicks-ass.net>
 <20151203100018.GO11639@twins.programming.kicks-ass.net>
 <20151203144811.GA27463@mtj.duckdns.org>
 <20151203150442.GR17308@twins.programming.kicks-ass.net>
 <20151203150604.GC27463@mtj.duckdns.org>
 <20151203192616.GJ27463@mtj.duckdns.org>
 <20160126173843.GA11115@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160126173843.GA11115-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ulrich Obergfell <uobergfe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-team-b10kYP2dOMg@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 26, 2016 at 06:38:43PM +0100, Thierry Reding wrote:
> > Task or work item involved in memory reclaim trying to flush a
> > non-WQ_MEM_RECLAIM workqueue or one of its work items can lead to
> > deadlock.  Trigger WARN_ONCE() if such conditions are detected.
> I've started noticing the following during boot on some of the devices I
> work with:
> 
> [    4.723705] WARNING: CPU: 0 PID: 6 at kernel/workqueue.c:2361 check_flush_dependency+0x138/0x144()
> [    4.736818] workqueue: WQ_MEM_RECLAIM deferwq:deferred_probe_work_func is flushing !WQ_MEM_RECLAIM events:lru_add_drain_per_cpu
> [    4.748099] Modules linked in:
> [    4.751342] CPU: 0 PID: 6 Comm: kworker/u8:0 Not tainted 4.5.0-rc1-00018-g420fc292d9c7 #1
> [    4.759504] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [    4.765762] Workqueue: deferwq deferred_probe_work_func
> [    4.771004] [<c0017acc>] (unwind_backtrace) from [<c0013134>] (show_stack+0x10/0x14)
> [    4.778746] [<c0013134>] (show_stack) from [<c0245f18>] (dump_stack+0x94/0xd4)
> [    4.785966] [<c0245f18>] (dump_stack) from [<c0026f9c>] (warn_slowpath_common+0x80/0xb0)
> [    4.794048] [<c0026f9c>] (warn_slowpath_common) from [<c0026ffc>] (warn_slowpath_fmt+0x30/0x40)
> [    4.802736] [<c0026ffc>] (warn_slowpath_fmt) from [<c00390b8>] (check_flush_dependency+0x138/0x144)
> [    4.811769] [<c00390b8>] (check_flush_dependency) from [<c0039ca0>] (flush_work+0x50/0x15c)
> [    4.820112] [<c0039ca0>] (flush_work) from [<c00c51b0>] (lru_add_drain_all+0x130/0x180)
> [    4.828110] [<c00c51b0>] (lru_add_drain_all) from [<c00f728c>] (migrate_prep+0x8/0x10)

Right, also, I think it makes sense to do lru_add_drain_all() from a
WQ_MEM_RECLAIM workqueue, it is, after all, aiding in getting memory
freed.

Does something like the below cure things?

TJ does this make sense to you?

---
 mm/swap.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/swap.c b/mm/swap.c
index 09fe5e97714a..a3de016b2a9d 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -666,6 +666,15 @@ static void lru_add_drain_per_cpu(struct work_struct *dummy)
 
 static DEFINE_PER_CPU(struct work_struct, lru_add_drain_work);
 
+static struct workqueue_struct *lru_wq;
+
+static int __init lru_init(void)
+{
+	lru_wq = create_workqueue("lru");
+	return 0;
+}
+early_initcall(lru_init);
+
 void lru_add_drain_all(void)
 {
 	static DEFINE_MUTEX(lock);
@@ -685,7 +694,7 @@ void lru_add_drain_all(void)
 		    pagevec_count(&per_cpu(lru_deactivate_pvecs, cpu)) ||
 		    need_activate_page_drain(cpu)) {
 			INIT_WORK(work, lru_add_drain_per_cpu);
-			schedule_work_on(cpu, work);
+			queue_work_on(cpu, &lru_wq, work);
 			cpumask_set_cpu(cpu, &has_work);
 		}
 	}
