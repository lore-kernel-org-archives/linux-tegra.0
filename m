From: Bhaktipriya Shridhar <bhaktipriya96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] gpu: host1x: hw: intr_hw: Remove create_workqueue
Date: Tue, 28 Jun 2016 22:14:29 +0530
Message-ID: <CAFNHFT8AWParnHXjTrGmCXNy2UaY_+XQjknzM8ZUj+pSL4OJMQ@mail.gmail.com>
References: <20160618090632.GA11246@Karyakshetra> <20160620151123.GY3262@mtj.duckdns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160620151123.GY3262-qYNAdHglDFBN0TnZuCh8vA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Ping!
Thanks,
Bhaktipriya


On Mon, Jun 20, 2016 at 8:41 PM, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sat, Jun 18, 2016 at 02:36:32PM +0530, Bhaktipriya Shridhar wrote:
>> System workqueues have been able to handle high level of concurrency
>> for a long time now and there's no reason to use dedicated workqueues
>> just to gain concurrency. Since the workqueue host->intr_wq is involved
>> in sync point interrupts, and sync point wait and is not being used on
>> a memory reclaim path, dedicated host->intr_wq has been replaced with the
>> use of system_wq.
>>
>> Unlike a dedicated per-cpu workqueue created with create_workqueue(),
>> system_wq allows multiple work items to overlap executions even on
>> the same CPU; however, a per-cpu workqueue doesn't have any CPU
>> locality or global ordering guarantees unless the target CPU is
>> explicitly specified and thus the increase of local concurrency
>> shouldn't make any difference.
>>
>> cancel_work_sync() has been used  in _host1x_free_syncpt_irq() to ensure
>> that no work is pending by the time exit path runs.
>
> Alternatively, this could have used alloc_workqueue() w/o
> WQ_MEM_RECLAIM and used it just as a flush domain.  Either way is
> fine.
>
> Acked-by: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Thanks.
>
> --
> tejun
