From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH wq/for-4.5-fixes] workqueue: skip flush dependency checks
 for legacy workqueues
Date: Fri, 29 Jan 2016 13:32:03 -0500
Message-ID: <20160129183203.GQ3628@mtj.duckdns.org>
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
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160129105946.GJ32380@htj.duckdns.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ulrich Obergfell <uobergfe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-team@fb.com, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 29, 2016 at 05:59:46AM -0500, Tejun Heo wrote:
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
...

Applied to wq/for-4.5-fixes.

Thanks.

-- 
tejun
