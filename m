From: Sachin Nikam <Snikam@nvidia.com>
Subject: RE: [PATCH] sched/cputime: Remove unnecessary assignment statement
Date: Thu, 28 Feb 2019 12:14:09 +0000
Message-ID: <MN2PR12MB3278E52D04119DC55597A293BB750@MN2PR12MB3278.namprd12.prod.outlook.com>
References: <1551248002-27303-1-git-send-email-ketanp@nvidia.com>
 <20190227103230.GM32494@hirez.programming.kicks-ass.net>
 <9bce6378-2221-f358-dc97-f15ee7ab546b@nvidia.com>
 <20190228094733.GY32494@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228094733.GY32494@hirez.programming.kicks-ass.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>, Ketan Patil <ketanp@nvidia.com>
Cc: "mingo@redhat.com" <mingo@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Bharat Nihalani <bnihalani@nvidia.com>, Bo Yan <byan@nvidia.com>, Sai Gurrappadi <sgurrappadi@nvidia.com>, Thierry Reding <treding@nvidia.com>, Timo Alho <talho@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Ketan,
What is the Coverity Impact Level for this defect?
If it is Low then we can whitelist this defect and change.

Peter,
This isn't a security fix.
However, I see this is kind of code cleanup.

-----Original Message-----
From: Peter Zijlstra <peterz@infradead.org>=20
Sent: Thursday, February 28, 2019 3:18 PM
To: Ketan Patil <ketanp@nvidia.com>
Cc: mingo@redhat.com; linux-kernel@vger.kernel.org; linux-tegra@vger.kernel=
.org; Sachin Nikam <Snikam@nvidia.com>; Bharat Nihalani <bnihalani@nvidia.c=
om>; Bo Yan <byan@nvidia.com>; Sai Gurrappadi <sgurrappadi@nvidia.com>; Thi=
erry Reding <treding@nvidia.com>; Timo Alho <talho@nvidia.com>
Subject: Re: [PATCH] sched/cputime: Remove unnecessary assignment statement


A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

On Thu, Feb 28, 2019 at 03:12:13PM +0530, Ketan Patil wrote:
> The coverity tool has detected this issue as an unused value, since=20
> the code assigns the value to utime variable and then after the jump,=20
> the value of utime again gets updated, hence the previous value is not=20
> at all useful and this patch removes that first assignment.

Not a security issue then; just tell coverity to shut up.
