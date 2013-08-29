From: Colin Cross <ccross@android.com>
Subject: Re: [PATCH v2] cpuidle: coupled: abort idle if pokes are pending
Date: Thu, 29 Aug 2013 14:23:10 -0700
Message-ID: <CAMbhsRTnMKMVXBav+FwJxw3+Ochk-wfs8WU3oWAExzYMfm4RRw@mail.gmail.com>
References: <1377740508-22134-1-git-send-email-ccross@android.com>
	<7272744.lhUaaLc3cm@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <7272744.lhUaaLc3cm@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Linux PM list <linux-pm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Neil Zhang <zhangwm@marvell.com>, Joseph Lo <josephl@nvidia.com>, linux-tegra <linux-tegra@vger.kernel.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Jon Medhurst <tixy@linaro.org>, Sivaram Nair <sivaramn@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 29, 2013 at 1:28 PM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Wednesday, August 28, 2013 06:41:47 PM Colin Cross wrote:
>> Joseph Lo <josephl@nvidia.com> reported a lockup on Tegra20 caused
>> by a race condition in coupled cpuidle.  When two or more cpus
>> enter idle at the same time, the first cpus to arrive may go to the
>> ready loop without processing pending pokes from the last cpu to
>> arrive.
>>
>> This patch adds a check for pending pokes once all cpus have been
>> synchronized in the ready loop and resets the coupled state and
>> retries if any cpus failed to handle their pending poke.
>>
>> Retrying on all cpus may trigger the same issue again, so this patch
>> also adds a check to ensure that each cpu has received at least one
>> poke between when it enters the waiting loop and when it moves on to
>> the ready loop.
>>
>> Reported-by: Joseph Lo <josephl@nvidia.com>
>> Tested-by: Stephen Warren <swarren@nvidia.com>
>> Tested-by: Joseph Lo <josephl@nvidia.com>
>> Signed-off-by: Colin Cross <ccross@android.com>
>
> Still stable material I suppose?

Yes please
