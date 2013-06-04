From: Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: add support for runtime pm
Date: Tue, 4 Jun 2013 14:11:27 +0530
Message-ID: <51ADA837.4020907@nvidia.com>
References: <1369662568-22390-1-git-send-email-mkulkarni@nvidia.com> <20130527154539.GD9460@mithrandir> <51A4445F.1000201@nvidia.com> <20130528091022.GB10934@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130528091022.GB10934@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 28 May 2013 02:40 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Tue, May 28, 2013 at 08:45:03AM +0300, Terje Bergstr=C3=B6m wrote:
>> On 27.05.2013 18:45, Thierry Reding wrote:
>>> On Mon, May 27, 2013 at 07:19:28PM +0530, Mayuresh Kulkarni wrote:
>>>> +#ifdef CONFIG_PM_RUNTIME
>>>> +static int host1x_runtime_suspend(struct device *dev)
>>>> +{
>>>> +	struct host1x *host;
>>>> +
>>>> +	host =3D dev_get_drvdata(dev);
>>>> +	if (IS_ERR_OR_NULL(host))
>>>
>>> I think a simple
>>>
>>> 	if (!host)
>>> 		return -EINVAL;
>>>
>>> would be enough here. The driver-data of the device should never be=
 an
>>> ERR_PTR()-encoded value, but either a valid pointer to a host1x obj=
ect
>>> or NULL.
>>
>> True, we should avoid IS_ERR_OR_NULL() like plague. We always know i=
f
>> the called API returns a NULL on error or an error code. In case of
>> error code we should just propagate that.
>
> Yes, that's the case in general. In this specific case the value
> obtained by dev_get_drvdata() should either be a valid pointer or NUL=
L,
> never an error code. We can easily make sure by only setting the data
> (using platform_set_drvdata()) when the pointer is valid.
>
> Thinking about it some more, I don't think we can ever get NULL here.=
 A
> device's .runtime_suspend() cannot be called when the device has been
> removed, right? That's the only case where the value returned might b=
e
> NULL. It would be NULL too if host1x wasn't initialized yet, but that=
's
> already dealt with by the proper ordering in .probe().
>
>>> Same comments apply here. Also I think it might be a good idea to s=
plit
>>> the host1x and gr2d changes into separate patches.
>>
>> That's a bit tricky, but doable. We just need to enable it for 2D fi=
rst,
>> and then host1x to keep bisectability.
>
> Right, there's a dependency. But I'd still prefer to have them separa=
te.
> Unless it gets really messy.
>
>>>>   static void action_submit_complete(struct host1x_waitlist *waite=
r)
>>>>   {
>>>> +	int completed =3D waiter->count;
>>>>   	struct host1x_channel *channel =3D waiter->data;
>>>>
>>>> +	/* disable clocks for all the submits that got completed in this=
 lot */
>>>> +	while (completed--)
>>>> +		pm_runtime_put(channel->dev);
>>>> +
>>>>   	host1x_cdma_update(&channel->cdma);
>>>>
>>>> -	/*  Add nr_completed to trace */
>>>> +	/* Add nr_completed to trace */
>>>>   	trace_host1x_channel_submit_complete(dev_name(channel->dev),
>>>>   					     waiter->count, waiter->thresh);
>>>> -
>>>>   }
>>>
>>> This feels hackish. But I can't see any better place to do this. Te=
rje,
>>> Arto: any ideas how we can do this in a cleaner way? If there's not=
hing
>>> better then maybe moving the code into a separate function, say
>>> host1x_waitlist_complete(), might make this less awkward?
>>
>> Yeah, it's a bit awkward. action_submit_complete() actually does han=
dle
>> completion of multiple jobs, and we do one pm_runtime_get() per job.
>>
>> We could do pm_runtime_put() in host1x_cdma_update(). It anyway goes
>> through each job that is completed, so while freeing the job it coul=
d as
>> well call runtime PM. That way we could even remove the waiter->coun=
t
>> variable altogether as it's not needed anymore.
>
> That sounds a lot better. We could add a helper (host1x_job_finish()
> perhaps) with the following from update_cdma_locked():
>
> 	/* Unpin the memory */
> 	host1x_job_unpin(job);
>
> 	/* Pop push buffer slots */
> 	if (job->num_slots) {
> 		struct push_buffer *pb =3D &cdma->push_buffer;
> 		host1x_pushbuffer_pop(pb, job->num_slots);
> 		if (cdma->event =3D=3D CDMA_EVENT_PUSH_BUFFER_SPACE)
> 			signal =3D true;
> 	}
>
> 	list_del(&job->list);
>
> And add pm_runtime_put() (as well as potentially other stuff) in ther=
e.
> That'll prevent update_cdma_unlocked() from growing too much. It isn'=
t
> too bad right now, so maybe a helper isn't warranted yet, but I don't
> think it'll hurt.
>
>> The not-so-beautiful aspect is that we do pm_runtime_get() in
>> host1x_channel.c and pm_runtime_put() in host1x_cdma.c. For code
>> readability it's be great to have them in the same file. I actually =
get
>> questions every now and then because in downstream because of doing
>> these operations in different files.
>
> With the above helper in place, we could move host1x_job_submit() to
> job.c instead and have all the code in one file.
>
> Thierry
>
> * Unknown Key
> * 0x7F3EB3A1
>

In downstream, we have 2 APIs which are wrapper over runtime PM calls.=20
We call those from _submit and job complete.

I wonder if we should follow the same here?
