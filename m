From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: add support for runtime pm
Date: Tue, 28 May 2013 08:45:03 +0300
Message-ID: <51A4445F.1000201@nvidia.com>
References: <1369662568-22390-1-git-send-email-mkulkarni@nvidia.com> <20130527154539.GD9460@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130527154539.GD9460@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 27.05.2013 18:45, Thierry Reding wrote:
> On Mon, May 27, 2013 at 07:19:28PM +0530, Mayuresh Kulkarni wrote:
>> +#ifdef CONFIG_PM_RUNTIME
>> +static int host1x_runtime_suspend(struct device *dev)
>> +{
>> +	struct host1x *host;
>> +
>> +	host = dev_get_drvdata(dev);
>> +	if (IS_ERR_OR_NULL(host))
> 
> I think a simple
> 
> 	if (!host)
> 		return -EINVAL;
> 
> would be enough here. The driver-data of the device should never be an
> ERR_PTR()-encoded value, but either a valid pointer to a host1x object
> or NULL.

True, we should avoid IS_ERR_OR_NULL() like plague. We always know if
the called API returns a NULL on error or an error code. In case of
error code we should just propagate that.

> Same comments apply here. Also I think it might be a good idea to split
> the host1x and gr2d changes into separate patches.

That's a bit tricky, but doable. We just need to enable it for 2D first,
and then host1x to keep bisectability.

>>  static void action_submit_complete(struct host1x_waitlist *waiter)
>>  {
>> +	int completed = waiter->count;
>>  	struct host1x_channel *channel = waiter->data;
>>  
>> +	/* disable clocks for all the submits that got completed in this lot */
>> +	while (completed--)
>> +		pm_runtime_put(channel->dev);
>> +
>>  	host1x_cdma_update(&channel->cdma);
>>  
>> -	/*  Add nr_completed to trace */
>> +	/* Add nr_completed to trace */
>>  	trace_host1x_channel_submit_complete(dev_name(channel->dev),
>>  					     waiter->count, waiter->thresh);
>> -
>>  }
> 
> This feels hackish. But I can't see any better place to do this. Terje,
> Arto: any ideas how we can do this in a cleaner way? If there's nothing
> better then maybe moving the code into a separate function, say
> host1x_waitlist_complete(), might make this less awkward?

Yeah, it's a bit awkward. action_submit_complete() actually does handle
completion of multiple jobs, and we do one pm_runtime_get() per job.

We could do pm_runtime_put() in host1x_cdma_update(). It anyway goes
through each job that is completed, so while freeing the job it could as
well call runtime PM. That way we could even remove the waiter->count
variable altogether as it's not needed anymore.

The not-so-beautiful aspect is that we do pm_runtime_get() in
host1x_channel.c and pm_runtime_put() in host1x_cdma.c. For code
readability it's be great to have them in the same file. I actually get
questions every now and then because in downstream because of doing
these operations in different files.

Terje
