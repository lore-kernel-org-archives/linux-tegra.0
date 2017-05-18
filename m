From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Refactor/fix channel allocation code
Date: Thu, 18 May 2017 14:55:10 +0300
Message-ID: <47f76f18-9940-ec07-0a71-1e53dd8dd08e@kapsi.fi>
References: <20170320184402.32723-1-mperttunen@nvidia.com>
 <71538e6d-f8f5-06e0-ca4e-42c7f33acacc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <71538e6d-f8f5-06e0-ca4e-42c7f33acacc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 18.05.2017 14:42, Dmitry Osipenko wrote:
> On 20.03.2017 21:44, Mikko Perttunen wrote:
>> ...
>>  struct host1x_channel *host1x_channel_request(struct device *dev)
>>  {
>>  	struct host1x *host = dev_get_drvdata(dev->parent);
>> +	struct host1x_channel_list *chlist = &host->channel_list;
>>  	unsigned int max_channels = host->info->nb_channels;
>>  	struct host1x_channel *channel = NULL;
>> -	unsigned long index;
>> +	unsigned int index;
>>  	int err;
>>
>> -	mutex_lock(&host->chlist_mutex);
>> +	down(&chlist->alloc_sema);
>> +
>
> It's a bit hard to follow lockings in the code, could you please explain why
> you've added this semaphore? What problem it solves?

Sure. The role of the semaphore is to allow the caller to sleep waiting 
for a free channel, and also to be sure that a channel is available once 
the down() call finishes. Currently the channel allocation model is such 
that each unit allocates a single channel for itself, in which case this 
is not useful, but with later chips with more available channels we can 
move to a model where a channel is allocated for each userspace client. 
In this case we can allow the application to sleep if there are no 
available channels.

Of course, there is also the possibility of just returning -EBUSY if 
there are no channels - that's probably fine too..

Cheers,
Mikko.
