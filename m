From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC,v2,3/8] video: tegra: host: Add channel and client support
Date: Thu, 29 Nov 2012 12:46:54 +0200
Message-ID: <50B73D1E.5090600@nvidia.com>
References: <1353935954-13763-4-git-send-email-tbergstrom@nvidia.com> <50B7325F.20002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B7325F.20002-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 29.11.2012 12:01, Mark Zhang wrote:
>> +fail:
>> +	/* Add clean-up */
> 
> Yes, add "nvhost_module_deinit" here?

Sounds good.

>> +int nvhost_client_device_suspend(struct platform_device *dev)
>> +{
>> +	int ret = 0;
>> +	struct nvhost_device_data *pdata = platform_get_drvdata(dev);
>> +
>> +	ret = nvhost_channel_suspend(pdata->channel);
>> +	dev_info(&dev->dev, "suspend status: %d\n", ret);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return ret;
> 
> Minor issue: just "return ret" is OK. That "if" doesn't make sense.

Yes, must be some snafu when doing changes in code.

>> -struct nvhost_chip_support *nvhost_chip_ops;
>> +static struct nvhost_chip_support *nvhost_chip_ops;
>>  
> 
> All right, already fixed here. Sorry, so just ignore what I said about
> this in my reply to your patch 1.

I was wondering about this, because I thought I did make it static. But
it looks like I added that to the wrong commit. Anyway, this needs
rethinking.

>> +struct mem_handle *nvhost_dmabuf_get(u32 id, struct platform_device *dev)
>> +{
>> +	struct mem_handle *h;
>> +	struct dma_buf *buf;
>> +
>> +	buf = dma_buf_get(to_dmabuf_fd(id));
>> +	if (IS_ERR_OR_NULL(buf))
>> +		return (struct mem_handle *)buf;
>> +
>> +	h = (struct mem_handle *)dma_buf_attach(buf, &dev->dev);
>> +	if (IS_ERR_OR_NULL(h))
>> +		dma_buf_put(buf);
> 
> Return an error here.

Will do.

>> +	op->nvhost_dev.alloc_nvhost_channel = t20_alloc_nvhost_channel;
>> +	op->nvhost_dev.free_nvhost_channel = t20_free_nvhost_channel;
>> +
> 
> I recall in previous version, there is t30-related alloc_nvhost_channel
> & free_nvhost_channel. Why remove them?

I could actually refactor these all into one alloc channel. We already
store the number of channels in a data type, so a generic channel
allocator would be better than having a chip specific one.

>> +static int push_buffer_init(struct push_buffer *pb)
>> +{
>> +	struct nvhost_cdma *cdma = pb_to_cdma(pb);
>> +	struct nvhost_master *master = cdma_to_dev(cdma);
>> +	pb->mapped = NULL;
>> +	pb->phys = 0;
>> +	pb->handle = NULL;
>> +
>> +	cdma_pb_op().reset(pb);
>> +
>> +	/* allocate and map pushbuffer memory */
>> +	pb->mapped = dma_alloc_writecombine(&master->dev->dev,
>> +			PUSH_BUFFER_SIZE + 4, &pb->phys, GFP_KERNEL);
>> +	if (IS_ERR_OR_NULL(pb->mapped)) {
>> +		pb->mapped = NULL;
>> +		goto fail;
> 
> Return directly here. "goto fail" makes "push_buffer_destroy" get called.

Will do.

> 
>> +	}
>> +
>> +	/* memory for storing mem client and handles for each opcode pair */
>> +	pb->handle = kzalloc(NVHOST_GATHER_QUEUE_SIZE *
>> +				sizeof(struct mem_handle *),
>> +			GFP_KERNEL);
>> +	if (!pb->handle)
>> +		goto fail;
>> +
>> +	/* put the restart at the end of pushbuffer memory */
> 
> Just for curious, why "pb->mapped + 1K" is the end of a 4K pushbuffer?

pb->mapped is u32 *, so compiler will take care of multiplying by
sizeof(u32).

>> +unsigned int nvhost_cdma_wait_locked(struct nvhost_cdma *cdma,
>> +		enum cdma_event event)
>> +{
>> +	for (;;) {
>> +		unsigned int space = cdma_status_locked(cdma, event);
>> +		if (space)
>> +			return space;
>> +
>> +		/* If somebody has managed to already start waiting, yield */
>> +		if (cdma->event != CDMA_EVENT_NONE) {
>> +			mutex_unlock(&cdma->lock);
>> +			schedule();
>> +			mutex_lock(&cdma->lock);
>> +			continue;
>> +		}
>> +		cdma->event = event;
>> +
>> +		mutex_unlock(&cdma->lock);
>> +		down(&cdma->sem);
>> +		mutex_lock(&cdma->lock);
> 
> I'm newbie of nvhost but I feel here is very tricky, about the lock and
> unlock of this mutex: cdma->lock. Does it require this mutex is locked
> before calling this function? And do we need to unlock it before the
> code: "return space;" above? IMHO, this is not a good design and can we
> find out a better solution?

Yeah, it's not perfect and good solutions are welcome.
cdma_status_locked() must be called with a mutex. But, what we generally
wait for is for space in push buffer. The cleanup code cannot run if we
keep cdma->lock, so I release it.

The two ways to loop are because there was a race between two processes
waiting for space. One of them set cdma->event to indicate what it's
waiting for and can go to sleep, but the other has to keep spinning.

Terje
