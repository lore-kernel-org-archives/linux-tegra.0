From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] sched/cputime: Remove unnecessary assignment statement
Date: Thu, 28 Feb 2019 13:53:31 +0000
Message-ID: <397917cc-3656-e26c-7715-d4feec97bb4b@nvidia.com>
References: <1551248002-27303-1-git-send-email-ketanp@nvidia.com>
 <20190227103230.GM32494@hirez.programming.kicks-ass.net>
 <9bce6378-2221-f358-dc97-f15ee7ab546b@nvidia.com>
 <20190228094733.GY32494@hirez.programming.kicks-ass.net>
 <MN2PR12MB3278E52D04119DC55597A293BB750@MN2PR12MB3278.namprd12.prod.outlook.com>
 <20190228123120.GA32494@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228123120.GA32494@hirez.programming.kicks-ass.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>, Sachin Nikam <Snikam@nvidia.com>
Cc: Ketan Patil <ketanp@nvidia.com>, "mingo@redhat.com" <mingo@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Bharat Nihalani <bnihalani@nvidia.com>, Bo Yan <byan@nvidia.com>, Sai Gurrappadi <sgurrappadi@nvidia.com>, Thierry Reding <treding@nvidia.com>, Timo Alho <talho@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 28/02/2019 12:31, Peter Zijlstra wrote:
> 
> Clearly, because reading comprehension isn't your strong point:
> 
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?

Sorry we have a few people helping out cleaning up our kernel branches
and we need to do a better job here indeed!

> On Thu, Feb 28, 2019 at 12:14:09PM +0000, Sachin Nikam wrote:
> 
>> This isn't a security fix.
>> However, I see this is kind of code cleanup.
> 
> As I've explained previously, it makes conceptual sense to have it in
> the code, and any halfway sane compiler will observe the same double
> store and eliminate it in its DCE pass.

OK. Thanks for the feedback. We can agree to drop this and we will try
to do a better job reviewing this type of thing before hand in future.

Cheers
Jon

-- 
nvpublic
