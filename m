From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] sched/cputime: Remove unnecessary assignment statement
Date: Thu, 28 Feb 2019 10:47:33 +0100
Message-ID: <20190228094733.GY32494@hirez.programming.kicks-ass.net>
References: <1551248002-27303-1-git-send-email-ketanp@nvidia.com>
 <20190227103230.GM32494@hirez.programming.kicks-ass.net>
 <9bce6378-2221-f358-dc97-f15ee7ab546b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9bce6378-2221-f358-dc97-f15ee7ab546b@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ketan Patil <ketanp@nvidia.com>
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, snikam@nvidia.com, bnihalani@nvidia.com, byan@nvidia.com, sgurrappadi@nvidia.com, treding@nvidia.com, talho@nvidia.com
List-Id: linux-tegra@vger.kernel.org


A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

On Thu, Feb 28, 2019 at 03:12:13PM +0530, Ketan Patil wrote:
> The coverity tool has detected this issue as an unused value, since
> the code assigns the value to utime variable and then after the jump, the
> value of utime again gets updated, hence the previous value is not at all
> useful and this patch removes that first assignment.

Not a security issue then; just tell coverity to shut up.
