From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] sched/cputime: Remove unnecessary assignment statement
Date: Wed, 27 Feb 2019 11:32:30 +0100
Message-ID: <20190227103230.GM32494@hirez.programming.kicks-ass.net>
References: <1551248002-27303-1-git-send-email-ketanp@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551248002-27303-1-git-send-email-ketanp@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ketan Patil <ketanp@nvidia.com>
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, snikam@nvidia.com, bnihalani@nvidia.com, byan@nvidia.com, sgurrappadi@nvidia.com, treding@nvidia.com, talho@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 27, 2019 at 11:43:22AM +0530, Ketan Patil wrote:
> The original code assigns the value from rtime to utime variable,
> and then jumps to the update label. And the value of utime is then
> updated, so the earlier value of utime is not used. Hence remove
> that unnecessary assignment statement.
> 
> This fixes one of the coverity defects.

Why does coverity care? I like the way the code is now, it makes
conceptual sense. Removing that assignment makes the code harder to read
and less symmetric (see the utime case right below).

Any sensible compiler will 'fix' this for us anyway.

> Based on work by Ishan Mittal <imittal@nvidia.com>
> Signed-off-by: Ketan Patil <ketanp@nvidia.com>
> ---
>  kernel/sched/cputime.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index ba4a143..ad64771 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -616,10 +616,8 @@ void cputime_adjust(struct task_cputime *curr, struct prev_cputime *prev,
>  	 * Once a task gets some ticks, the monotonicy code at 'update:'
>  	 * will ensure things converge to the observed ratio.
>  	 */
> -	if (stime == 0) {
> -		utime = rtime;
> +	if (stime == 0)
>  		goto update;
> -	}
>  
>  	if (utime == 0) {
>  		stime = rtime;
