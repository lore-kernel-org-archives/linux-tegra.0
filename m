From: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] workqueue: warn if memory reclaim tries to flush
 !WQ_MEM_RECLAIM workqueue
Date: Fri, 29 Jan 2016 06:09:41 -0500
Message-ID: <20160129110941.GK32380@htj.duckdns.org>
References: <20151203002810.GJ19878@mtj.duckdns.org>
 <20151203093350.GP17308@twins.programming.kicks-ass.net>
 <20151203100018.GO11639@twins.programming.kicks-ass.net>
 <20151203144811.GA27463@mtj.duckdns.org>
 <20151203150442.GR17308@twins.programming.kicks-ass.net>
 <20151203150604.GC27463@mtj.duckdns.org>
 <20151203192616.GJ27463@mtj.duckdns.org>
 <20160126173843.GA11115@ulmo.nvidia.com>
 <20160128101210.GC6357@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160128101210.GC6357-ndre7Fmf5hadTX5a5knrm8zTDFooKrT+cvkQGrU6aU0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulrich Obergfell <uobergfe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-team-b10kYP2dOMg@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Johannes Weiner <hannes-druUgvl0LCNAfugRpC6u6w@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello, Peter.

On Thu, Jan 28, 2016 at 11:12:10AM +0100, Peter Zijlstra wrote:
> On Tue, Jan 26, 2016 at 06:38:43PM +0100, Thierry Reding wrote:
> > > Task or work item involved in memory reclaim trying to flush a
> > > non-WQ_MEM_RECLAIM workqueue or one of its work items can lead to
> > > deadlock.  Trigger WARN_ONCE() if such conditions are detected.
> > I've started noticing the following during boot on some of the devices I
> > work with:
> > 
> > [    4.723705] WARNING: CPU: 0 PID: 6 at kernel/workqueue.c:2361 check_flush_dependency+0x138/0x144()
> > [    4.736818] workqueue: WQ_MEM_RECLAIM deferwq:deferred_probe_work_func is flushing !WQ_MEM_RECLAIM events:lru_add_drain_per_cpu
...
> Right, also, I think it makes sense to do lru_add_drain_all() from a
> WQ_MEM_RECLAIM workqueue, it is, after all, aiding in getting memory
> freed.
> 
> Does something like the below cure things?
> 
> TJ does this make sense to you?

The problem here is that deferwq which has nothing to do with memory
reclaim is marked with WQ_MEM_RECLAIM because it was created the old
create_singlethread_workqueue() which doesn't distinguish workqueues
which may be used on mem reclaim path and thus has to mark all as
needing forward progress guarantee.  I posted a patch to disable
disable flush dependency checks on those workqueues and there's a
outreachy project to weed out the users of the old interface, so
hopefully this won't be an issue soon.

As for whether lru drain should have WQ_MEM_RECLAIM, I'm not sure.
Cc'ing linux-mm.  The rule here is that any workquee which is depended
upon during memory reclaim should have WQ_MEM_RECLAIM set.  IOW, if a
work item failing to start execution under memory pressure can prevent
memory from being reclaimed, it should be scheduled on a
WQ_MEM_RECLAIM workqueue.  Would this be the case for
lru_add_drain_per_cpu()?

Thanks.

-- 
tejun
