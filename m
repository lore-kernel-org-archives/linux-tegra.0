From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
Date: Wed, 1 Jul 2020 03:22:10 +0300
Message-ID: <2190fe9d-6381-0b5e-39d8-a04daca9a1bf@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
 <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
 <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
 <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
 <f1a88006-ab3e-9068-e220-15eee17aeba0@gmail.com>
 <3b058989-a93a-6796-8d94-f60ce39e3fba@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3b058989-a93a-6796-8d94-f60ce39e3fba-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

30.06.2020 13:26, Mikko Perttunen пишет:
> On 6/29/20 10:42 PM, Dmitry Osipenko wrote:
>>
>> Secondly, I suppose neither GPU, nor DLA could wait on a host1x sync
>> point, correct? Or are they integrated with Host1x HW?
>>
> 
> They can access syncpoints directly. (That's what I alluded to in the
> "Introduction to the hardware" section :) all those things have hardware
> access to syncpoints)

Should we CC all the Nouveau developers then, or is it a bit too early? :)

>>
>> .. rest ..
>>
> 
> Let me try to summarize once more for my own understanding:
> 
> * When submitting a job, you would allocate new syncpoints for the job

- Yes

> * After submitting the job, those syncpoints are not usable anymore

- Yes

Although, thinking a bit more about it, this needs to be relaxed.

It should be a userspace agreement/policy how to utilize sync points.

For example, if we know that userspace will have multiple application
instances all using Tegra DRM UAPI, like a mesa or VDPAU drivers, then
this userspace should consider to return sync points into the pool for
sharing them with others. While something like an Opentegra Xorg driver,
which usually has a single instance, could keep sync points pre-allocated.

The job's sync point counter will be reset to 0 by the kernel driver
during of the submission process for each job, so we won't have the sync
point recovery problem.

> * Postfences of that job would keep references to those syncpoints so
> they aren't freed and cleared before the fences have been released

- No

I suggested that fence shouldn't refcount the sync point and *only* have
a reference to it, this reference will be invalidated once fence is
signaled by sync point reaching the threshold or once sync point is
released.

The sync point will have a reference to every active fence (waiting for
the signal) that is using this sync point until the threshold is reached.

So fence could detach itself from the sync point + sync point could
detach all the fences from itself.

There will be more about this below, please see example with a dead
process in the end of this email.

> * Once postfences have been released, syncpoints would be returned to
> the pool and reset to zero

- No

I'm suggesting that sync point should be returned to the pool once its
usage refcount reaches 0. This means that both userspace that created
this sync point + the executed job will both keep the sync point alive
until it is closed by userspace + job is completed.

> The advantage of this would be that at any point in time, there would be
> a 1:1 correspondence between allocated syncpoints and jobs; so you could
>  shuffle the jobs around channels or reorder them.

- Yes

> Please correct if I got that wrong :)
> 
> ---
> 
> I have two concerns:
> 
> * A lot of churn on syncpoints - any time you submit a job you might not
> get a syncpoint for an indefinite time. If we allocate syncpoints
> up-front at least you know beforehand, and then you have the syncpoint
> as long as you need it.

If you'll have a lot of active application instances all allocating sync
points, then inevitably the sync points pool will be exhausted.

But my proposal doesn't differ from yours in this regards, correct?

And maybe there is a nice solution, please see more below!

> * Plumbing the dma-fence/sync_file everywhere, and keeping it alive
> until waits on it have completed, is more work than just having the
> ID/threshold. This is probably mainly a problem for downstream, where
> updating code for this would be difficult. I know that's not a proper
> argument but I hope we can reach something that works for both worlds.

You could have ID/threshold! :)

But, you can't use the *job's* ID/threshold because you won't know them
until kernel driver scheduler will *complete(!)* the job's execution!
The job may be re-pushed multiple times by the scheduler to recovered
channel if a previous jobs hang!

Now, you could allocate *two* sync points:

  1. For the job itself (job's sync point).

  2. For the userspace to wait (user's sync point).

The job will have to increment both these sync points (example of
multiple sync points usage) and you know the user's sync point ID/threshold!

If job times out, you *could* increment the user's sync point on CPU
from userspace!

The counter of the user's sync point won't be touched by the kernel
driver if job hangs!

> Here's a proposal in between:
> 
> * Keep syncpoint allocation and submission in jobs as in my original
> proposal

Yes, we could keep it.

But, as I suggested in my other email, we may want to extend the
allocation IOCTL for the multi-syncpoint allocation support.

Secondly, if we'll want to have the multi-syncpoint support for the job,
then we may want improve the SUBMIT IOCTL like this:

struct drm_tegra_channel_submit {
        __u32 num_usr_syncpt_incrs;
        __u64 usr_sync_points_ptr;

        __u32 num_job_syncpt_incrs;
        __u32 job_syncpt_handle;
};

If job doesn't need to increment user's sync points, then there is no
need to copy them from userspace, hence num_usr_syncpt_incrs should be
0. I.e. one less copy_from_user() operation.

> * Don't attempt to recover user channel contexts. What this means:
>   * If we have a hardware channel per context (MLOCKing), just tear down
> the channel

!!!

Hmm, we actually should be able to have a one sync point per-channel for
the job submission, similarly to what the current driver does!

I'm keep forgetting about the waitbase existence!

Please read more below.

>   * Otherwise, we can just remove (either by patching or by full
> teardown/resubmit of the channel) all jobs submitted by the user channel
> context that submitted the hanging job. Jobs of other contexts would be
> undisturbed (though potentially delayed, which could be taken into
> account and timeouts adjusted)

The DRM scheduler itself has an assumption/requirement that when channel
hangs, it must be fully reset. The hanged job will be killed by the
scheduler (maybe dependent jobs will be killed too, but I don't remember
details right now) and then scheduler will re-submit jobs to the
recovered channel [1].

[1]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/uapi/scheduler.c#L206

Hence, if we could assign a sync point per-channel, then during of the
channel's recovery, the channel's sync point will be reset as well! Only
the waitbases of the re-submitted jobs will differ!

It also means that userspace won't need to allocate sync point for each job!

So far it sounds great! I'll try to think more thoroughly about this.

> * If this happens, we can set removed jobs' post-fences to error status
> and user will have to resubmit them.
> * We should be able to keep the syncpoint refcounting based on fences.

The fence doesn't need the sync point itself, it only needs to get a
signal when the threshold is reached or when sync point is ceased.

Imagine:

  - Process A creates sync point
  - Process A creates dma-fence from this sync point
  - Process A exports dma-fence to process B
  - Process A dies

What should happen to process B?

  - Should dma-fence of the process B get a error signal when process A
dies?
  - Should process B get stuck waiting endlessly for the dma-fence?

This is one example of why I'm proposing that fence shouldn't be coupled
tightly to a sync point.

> This can be made more fine-grained by not caring about the user channel
> context, but tearing down all jobs with the same syncpoint. I think the
> result would be that we can get either what you described (or how I
> understood it in the summary in the beginning of the message), or a more
> traditional syncpoint-per-userctx workflow, depending on how the
> userspace decides to allocate syncpoints.
> 
> If needed, the kernel can still do e.g. reordering (you mentioned job
> priorities) at syncpoint granularity, which, if the userspace followed
> the model you described, would be the same thing as job granularity.
> 
> (Maybe it would be more difficult with current drm_scheduler, sorry,
> haven't had the time yet to read up on that. Dealing with clearing work
> stuff up before summer vacation)

Please take yours time! You definitely will need take a closer look at
the DRM scheduler.
