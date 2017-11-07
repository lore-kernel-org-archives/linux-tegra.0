From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 10/10] gpu: host1x: Optionally block when acquiring
 channel
Date: Tue, 7 Nov 2017 18:29:30 +0300
Message-ID: <1b35ec93-167b-3436-0ff2-5e2e0886aea7@gmail.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
 <20171105110118.15142-11-mperttunen@nvidia.com>
 <9c5676eb-ba6f-c187-29e4-7b331bd3962f@gmail.com>
 <38340901-7016-3444-5ace-64159b32f1c7@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <38340901-7016-3444-5ace-64159b32f1c7@kapsi.fi>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07.11.2017 16:11, Mikko Perttunen wrote:
> On 05.11.2017 19:14, Dmitry Osipenko wrote:
>> On 05.11.2017 14:01, Mikko Perttunen wrote:
>>> Add an option to host1x_channel_request to interruptibly wait for a
>>> free channel. This allows IOCTLs that acquire a channel to block
>>> the userspace.
>>>
>>
>> Wouldn't it be more optimal to request channel and block after job's pining,
>> when all patching and checks are completed? Note that right now we have locking
>> around submission in DRM, which I suppose should go away by making locking fine
>> grained.
> 
> That would be possible, but I don't think it should matter much since contention
> here should not be the common case.
> 
>>
>> Or maybe it would be more optimal to just iterate over channels, like I
>> suggested before [0]?
> 
> Somehow I hadn't noticed this before, but this would break the invariant of
> having one client/class per channel.
> 

Yes, currently there is a weak relation of channel and clients device, but seems
channels device is only used for printing dev_* messages and device could be
borrowed from the channels job. I don't see any real point of hardwiring channel
to a specific device or client.

> In general since we haven't seen any issues downstream with the model
> implemented here, I'd like to try to go with this and if we have problems with
> channel allocation then we could revisit.
> 

I'd prefer to collect some real numbers first, will test it with our grate /
mesa stuff. Also, we should have a host1x_test, maybe something similar to
submission perf test but using multiple contexts.

> 
>>
>> [0]
>> https://github.com/cyndis/linux/commit/9e6d87f40afb01fbe13ba65c73cb617bdfcd80b2#commitcomment-25012960
>>
>>
>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>> ---
>>>  drivers/gpu/drm/tegra/drm.c  |  9 +++++----
>>>  drivers/gpu/drm/tegra/gr2d.c |  6 +++---
>>>  drivers/gpu/drm/tegra/gr3d.c |  6 +++---
>>>  drivers/gpu/host1x/channel.c | 40 ++++++++++++++++++++++++++++++----------
>>>  drivers/gpu/host1x/channel.h |  1 +
>>>  include/linux/host1x.h       |  2 +-
>>>  6 files changed, 43 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>>> index 658bc8814f38..19f77c1a76c0 100644
>>> --- a/drivers/gpu/drm/tegra/drm.c
>>> +++ b/drivers/gpu/drm/tegra/drm.c
>>> @@ -389,7 +389,8 @@ static int host1x_waitchk_copy_from_user(struct
>>> host1x_waitchk *dest,
>>>   * Request a free hardware host1x channel for this user context, or if the
>>>   * context already has one, bump its refcount.
>>>   *
>>> - * Returns 0 on success, or -EBUSY if there were no free hardware channels.
>>> + * Returns 0 on success, -EINTR if wait for a free channel was interrupted,
>>> + * or other error.
>>>   */
>>>  int tegra_drm_context_get_channel(struct tegra_drm_context *context)
>>>  {
>>> @@ -398,10 +399,10 @@ int tegra_drm_context_get_channel(struct
>>> tegra_drm_context *context)
>>>      mutex_lock(&context->lock);
>>>
>>>      if (context->pending_jobs == 0) {
>>> -        context->channel = host1x_channel_request(client->dev);
>>> -        if (!context->channel) {
>>> +        context->channel = host1x_channel_request(client->dev, true);
>>> +        if (IS_ERR(context->channel)) {
>>>              mutex_unlock(&context->lock);
>>> -            return -EBUSY;
>>> +            return PTR_ERR(context->channel);
>>>          }
>>>      }
>>>
>>> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
>>> index 3db3bcac48b9..c1853402f69b 100644
>>> --- a/drivers/gpu/drm/tegra/gr2d.c
>>> +++ b/drivers/gpu/drm/tegra/gr2d.c
>>> @@ -32,9 +32,9 @@ static int gr2d_init(struct host1x_client *client)
>>>      unsigned long flags = HOST1X_SYNCPT_HAS_BASE;
>>>      struct gr2d *gr2d = to_gr2d(drm);
>>>
>>> -    gr2d->channel = host1x_channel_request(client->dev);
>>> -    if (!gr2d->channel)
>>> -        return -ENOMEM;
>>> +    gr2d->channel = host1x_channel_request(client->dev, false);
>>> +    if (IS_ERR(gr2d->channel))
>>> +        return PTR_ERR(gr2d->channel);
>>>
>>>      client->syncpts[0] = host1x_syncpt_request(client->dev, flags);
>>>      if (!client->syncpts[0]) {
>>> diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
>>> index 279438342c8c..793a91d577cb 100644
>>> --- a/drivers/gpu/drm/tegra/gr3d.c
>>> +++ b/drivers/gpu/drm/tegra/gr3d.c
>>> @@ -42,9 +42,9 @@ static int gr3d_init(struct host1x_client *client)
>>>      unsigned long flags = HOST1X_SYNCPT_HAS_BASE;
>>>      struct gr3d *gr3d = to_gr3d(drm);
>>>
>>> -    gr3d->channel = host1x_channel_request(client->dev);
>>> -    if (!gr3d->channel)
>>> -        return -ENOMEM;
>>> +    gr3d->channel = host1x_channel_request(client->dev, false);
>>> +    if (IS_ERR(gr3d->channel))
>>> +        return PTR_ERR(gr3d->channel);
>>>
>>>      client->syncpts[0] = host1x_syncpt_request(client->dev, flags);
>>>      if (!client->syncpts[0]) {
>>> diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
>>> index 9d8cad12f9d8..eebcd51261df 100644
>>> --- a/drivers/gpu/host1x/channel.c
>>> +++ b/drivers/gpu/host1x/channel.c
>>> @@ -43,6 +43,7 @@ int host1x_channel_list_init(struct host1x_channel_list
>>> *chlist,
>>>      bitmap_zero(chlist->allocated_channels, num_channels);
>>>
>>>      mutex_init(&chlist->lock);
>>> +    sema_init(&chlist->sema, num_channels);
>>>
>>>      return 0;
>>>  }
>>> @@ -99,6 +100,8 @@ static void release_channel(struct kref *kref)
>>>      host1x_cdma_deinit(&channel->cdma);
>>>
>>>      clear_bit(channel->id, chlist->allocated_channels);
>>> +
>>> +    up(&chlist->sema);
>>>  }
>>>
>>>  void host1x_channel_put(struct host1x_channel *channel)
>>> @@ -107,19 +110,30 @@ void host1x_channel_put(struct host1x_channel *channel)
>>>  }
>>>  EXPORT_SYMBOL(host1x_channel_put);
>>>
>>> -static struct host1x_channel *acquire_unused_channel(struct host1x *host)
>>> +static struct host1x_channel *acquire_unused_channel(struct host1x *host,
>>> +                             bool wait)
>>>  {
>>>      struct host1x_channel_list *chlist = &host->channel_list;
>>>      unsigned int max_channels = host->info->nb_channels;
>>>      unsigned int index;
>>> +    int err;
>>> +
>>> +    if (wait) {
>>> +        err = down_interruptible(&chlist->sema);
>>> +        if (err)
>>> +            return ERR_PTR(err);
>>> +    } else {
>>> +        if (down_trylock(&chlist->sema))
>>> +            return ERR_PTR(-EBUSY);
>>> +    }
>>>
>>>      mutex_lock(&chlist->lock);
>>>
>>>      index = find_first_zero_bit(chlist->allocated_channels, max_channels);
>>> -    if (index >= max_channels) {
>>> +    if (WARN(index >= max_channels, "failed to find free channel")) {
>>>          mutex_unlock(&chlist->lock);
>>>          dev_err(host->dev, "failed to find free channel\n");
>>> -        return NULL;
>>> +        return ERR_PTR(-EBUSY);
>>>      }
>>>
>>>      chlist->channels[index].id = index;
>>> @@ -134,20 +148,26 @@ static struct host1x_channel
>>> *acquire_unused_channel(struct host1x *host)
>>>  /**
>>>   * host1x_channel_request() - Allocate a channel
>>>   * @device: Host1x unit this channel will be used to send commands to
>>> + * @wait: Whether to wait for a free channels if all are reserved
>>> + *
>>> + * Allocates a new host1x channel for @device. If all channels are in use,
>>> + * and @wait is true, does an interruptible wait until one is available.
>>>   *
>>> - * Allocates a new host1x channel for @device. May return NULL if CDMA
>>> - * initialization fails.
>>> + * If a channel was acquired, returns a pointer to it. Otherwise returns
>>> + * an error pointer with -EINTR if the wait was interrupted, -EBUSY
>>> + * if a channel could not be acquired or another error code if channel
>>> + * initialization failed.
>>>   */
>>> -struct host1x_channel *host1x_channel_request(struct device *dev)
>>> +struct host1x_channel *host1x_channel_request(struct device *dev, bool wait)
>>>  {
>>>      struct host1x *host = dev_get_drvdata(dev->parent);
>>>      struct host1x_channel_list *chlist = &host->channel_list;
>>>      struct host1x_channel *channel;
>>>      int err;
>>>
>>> -    channel = acquire_unused_channel(host);
>>> -    if (!channel)
>>> -        return NULL;
>>> +    channel = acquire_unused_channel(host, wait);
>>> +    if (IS_ERR(channel))
>>> +        return channel;
>>>
>>>      kref_init(&channel->refcount);
>>>      mutex_init(&channel->submitlock);
>>> @@ -168,6 +188,6 @@ struct host1x_channel *host1x_channel_request(struct
>>> device *dev)
>>>
>>>      dev_err(dev, "failed to initialize channel\n");
>>>
>>> -    return NULL;
>>> +    return ERR_PTR(err);
>>>  }
>>>  EXPORT_SYMBOL(host1x_channel_request);
>>> diff --git a/drivers/gpu/host1x/channel.h b/drivers/gpu/host1x/channel.h
>>> index e68a8ae9a670..1f5cf8029b62 100644
>>> --- a/drivers/gpu/host1x/channel.h
>>> +++ b/drivers/gpu/host1x/channel.h
>>> @@ -31,6 +31,7 @@ struct host1x_channel_list {
>>>      struct host1x_channel *channels;
>>>
>>>      struct mutex lock;
>>> +    struct semaphore sema;
>>>      unsigned long *allocated_channels;
>>>  };
>>>
>>> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
>>> index f931d28a68ff..2a34905d4408 100644
>>> --- a/include/linux/host1x.h
>>> +++ b/include/linux/host1x.h
>>> @@ -171,7 +171,7 @@ u32 host1x_syncpt_base_id(struct host1x_syncpt_base *base);
>>>  struct host1x_channel;
>>>  struct host1x_job;
>>>
>>> -struct host1x_channel *host1x_channel_request(struct device *dev);
>>> +struct host1x_channel *host1x_channel_request(struct device *dev, bool wait);
>>>  struct host1x_channel *host1x_channel_get(struct host1x_channel *channel);
>>>  void host1x_channel_put(struct host1x_channel *channel);
>>>  int host1x_job_submit(struct host1x_job *job);
>>>
>>
