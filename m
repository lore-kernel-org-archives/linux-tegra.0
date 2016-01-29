From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] workqueue: warn if memory reclaim tries to flush
 !WQ_MEM_RECLAIM workqueue
Date: Fri, 29 Jan 2016 13:28:56 -0500
Message-ID: <20160129182856.GP3628@mtj.duckdns.org>
References: <20151203093350.GP17308@twins.programming.kicks-ass.net>
 <20151203100018.GO11639@twins.programming.kicks-ass.net>
 <20151203144811.GA27463@mtj.duckdns.org>
 <20151203150442.GR17308@twins.programming.kicks-ass.net>
 <20151203150604.GC27463@mtj.duckdns.org>
 <20151203192616.GJ27463@mtj.duckdns.org>
 <20160126173843.GA11115@ulmo.nvidia.com>
 <20160128101210.GC6357@twins.programming.kicks-ass.net>
 <20160129110941.GK32380@htj.duckdns.org>
 <20160129151739.GA1087@worktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20160129151739.GA1087@worktop>
Sender: owner-linux-mm@kvack.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Ulrich Obergfell <uobergfe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-team@fb.com, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, rmk+kernel@arm.linux.org.uk, Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org
List-Id: linux-tegra@vger.kernel.org

Hey, Peter.

On Fri, Jan 29, 2016 at 04:17:39PM +0100, Peter Zijlstra wrote:
> On Fri, Jan 29, 2016 at 06:09:41AM -0500, Tejun Heo wrote:
> >  I posted a patch to disable
> > disable flush dependency checks on those workqueues and there's a
> > outreachy project to weed out the users of the old interface, so
> > hopefully this won't be an issue soon.
> 
> Will that same project review all workqueue users for the strict per-cpu
> stuff, so we can finally kill that weird stuff you do on hotplug?

Unfortunately not.  We do want to distinguish cpu-affine for
correctness and as an optimization; however, making that distinction
is unlikely to make the dynamic worker affinity binding go away.  We
can't forcifully shut down workers which are executing work items
which are affine as an optimization when the CPU goes down.

Thanks.

-- 
tejun

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
