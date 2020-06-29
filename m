From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
Date: Mon, 29 Jun 2020 22:42:46 +0300
Message-ID: <f1a88006-ab3e-9068-e220-15eee17aeba0@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
 <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
 <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
 <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <827c92a6-7fed-a81c-ba8e-6c69416c4ab9-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

29.06.2020 13:27, Mikko Perttunen пишет:
...
>>>> 4. The job's sync point can't be re-used after job's submission (UAPI
>>>> constraint!). Userspace must free sync point and allocate a new one for
>>>> the next job submission. And now we:
>>>>
>>>>     - Know that job's sync point is always in a healthy state!
>>>>
>>>>     - We're not limited by a number of physically available hardware
>>>> sync
>>>> points! Allocation should block until free sync point is available.
>>>>
>>>>     - The logical number of job's sync point increments matches the SP
>>>> hardware state! Which is handy for a job's debugging.
>>>>
>>>> Optionally, the job's sync point could be auto-removed from the DRM's
>>>> context after job's submission, avoiding a need for an extra SYNCPT_PUT
>>>> IOCTL invocation to be done by userspace after the job's submission.
>>>> Could be a job's flag.
>>>
>>> I think this would cause problems where after a job completes but before
>>> the fence has been waited, the syncpoint is already recycled (especially
>>> if the syncpoint is reset into some clean state).
>>
>> Exactly, good point! The dma-fence shouldn't be hardwired to the sync
>> point in order to avoid this situation :)
>>
>> Please take a look at the fence implementation that I made for the
>> grate-driver [3]. The host1x-fence is a dma-fence [4] that is attached
>> to a sync point by host1x_fence_create(). Once job is completed, the
>> host1x-fence is detached from the sync point [5][6] and sync point could
>> be recycled safely!
> 
> What if the fence has been programmed as a prefence to another channel
> (that is getting delayed), or to the GPU, or some other accelerator like
> DLA, or maybe some other VM? Those don't know the dma_fence has been
> signaled, they can only rely on the syncpoint ID/threshold pair.

The explicit job's fence is always just a dma-fence, it's not tied to a
host1x-fence and it should be waited for a signal on CPU.

If you want to make job to wait for a sync point on hardware, then you
should use the drm_tegra_submit_command wait-command.

Again, please notice that DRM scheduler supports the job-submitted
fence! This dma-fence will signal once job is pushed to hardware for
execution, so it shouldn't be a problem to maintain jobs order for a
complex jobs without much hassle. We'll need to write some userspace to
check how it works in practice :) For now I really had experience with a
simple jobs only.

Secondly, I suppose neither GPU, nor DLA could wait on a host1x sync
point, correct? Or are they integrated with Host1x HW?

Anyways, it shouldn't be difficult to resolve dma-fence into
host1x-fence, get SP ID and maintain the SP's liveness. Please see more
below.

In the grate-driver I made all sync points refcounted, so sync point
won't be recycled while it has active users [1][2][3] in kernel (or
userspace).

[1]
https://github.com/grate-driver/linux/blob/master/include/linux/host1x.h#L428
[2]
https://github.com/grate-driver/linux/blob/master/include/linux/host1x.h#L1206
[3]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/host1x/soc/syncpoints.c#L163

Now, grate-kernel isn't a 100% complete implementation, as I already
mentioned before. The host1x-fence doesn't have a reference to a sync
point as you may see in the code, this is because the userspace sync
points are not implemented in the grate-driver.

But nothing stops us to add that SP reference and then we could simply
do the following in the code:

struct dma_fence *host1x_fence_create(syncpt,...)
{
	...
	fence->sp = syncpt;
	...
	return &fence->base;
}

void host1x_syncpt_signal_fence(struct host1x_fence *fence)
{
	...
	fence->sp = NULL;
}

irqreturn_t host1x_hw_syncpt_isr()
{
	spin_lock(&host1x_syncpts_lock);
	...
	host1x_syncpt_signal_fence(sp->fence);
	...
	spin_unlock(&host1x_syncpts_lock);
}

void host1x_submit_job(job)
{
	...
	spin_lock_irqsave(&host1x_syncpts_lock);
	sp = host1x_syncpt_get(host1x_fence->sp);
	spin_unlock_irqrestore(&host1x_syncpts_lock);
	...
	if (sp) {
		push(WAIT(sp->id, host1x_fence->threshold));
		job->sync_points = sp;
	}
}

void host1x_free_job(job)
{
	host1x_syncpt_put(job->sync_points);
	...
}

For example: if you'll share host1-fence (dma-fence) with a GPU context,
then the fence's SP won't be released until GPU's context will be done
with the SP. The GPU's job will be timed out if shared SP won't get
incremented, and this is totally okay situation.

Does this answer yours question?

===

I'm not familiar with the Host1x VMs, so please let me use my
imagination here:

In a case of VM we could have a special VM-shared sync point type. The
userspace will allocate this special VM SP using ALLOCATE_SYNCPOINT and
this SP won't be used for a job(!). This is the case where job will need
to increment multiple sync points, its own SP + VM's SP. If job hangs,
then there should be a way to tell VM to release the SP and try again
next time with a freshly-allocated SP. The shared SP should stay alive
as long as VM uses it, so there should be a way for VM to tell that it's
done with SP.

Alternatively, we could add a SP recovery (or whatever is needed) for
the VM, but this should be left specific to T194+. Older Tegras
shouldn't ever need this complexity if I'm not missing anything.

Please provide a detailed information about the VM's workflow if the
above doesn't sound good.

Perhaps we shouldn't focus on the VM support for now, but may left some
room for a potential future expansion if necessary.
