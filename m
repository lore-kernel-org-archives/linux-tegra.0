From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Refactor/fix channel allocation code
Date: Thu, 18 May 2017 14:42:57 +0300
Message-ID: <71538e6d-f8f5-06e0-ca4e-42c7f33acacc@gmail.com>
References: <20170320184402.32723-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170320184402.32723-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 20.03.2017 21:44, Mikko Perttunen wrote:
> This is largely a rewrite of the Host1x channel allocation
> code in channel.c, bringing several changes:
> 
> - The previous code could deadlock due to an interaction
>   between the 'reflock' mutex and CDMA timeout handling.
>   This gets rid of the mutex.
> - In the future, per-user channel allocation will be
>   useful to have. This paves the way for that by allowing
>   host1x_channel_request to wait for a free channel, and
>   freeing channels when their refcount drops to zero.
> - Support for more than 32 channels, required for Tegra186
> - General refactoring, including better encapsulation
>   of channel ownership handling into channel.c
> 
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Ran though test suite at github.com/cyndis/host1x_test.
> Fixes the timeout test there.
> 
>  drivers/gpu/drm/tegra/gr2d.c       |   6 +-
>  drivers/gpu/drm/tegra/gr3d.c       |   6 +-
>  drivers/gpu/drm/tegra/vic.c        |   6 +-
>  drivers/gpu/host1x/cdma.c          |   2 +-
>  drivers/gpu/host1x/channel.c       | 154 +++++++++++++++++++++++--------------
>  drivers/gpu/host1x/channel.h       |  28 ++++---
>  drivers/gpu/host1x/debug.c         |  49 +++++-------
>  drivers/gpu/host1x/dev.c           |   6 +-
>  drivers/gpu/host1x/dev.h           |   8 +-
>  drivers/gpu/host1x/hw/channel_hw.c |  12 +--
>  include/linux/host1x.h             |   1 -
>  11 files changed, 155 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
> index 02cd3e37a6ec..936ce1a55987 100644
> --- a/drivers/gpu/drm/tegra/gr2d.c
> +++ b/drivers/gpu/drm/tegra/gr2d.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (c) 2012-2013, NVIDIA Corporation.
> + * Copyright (c) 2012-2017, NVIDIA Corporation.
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2 as
> @@ -38,7 +38,7 @@ static int gr2d_init(struct host1x_client *client)
>  
>  	client->syncpts[0] = host1x_syncpt_request(client->dev, flags);
>  	if (!client->syncpts[0]) {
> -		host1x_channel_free(gr2d->channel);
> +		host1x_channel_put(gr2d->channel);
>  		return -ENOMEM;
>  	}
>  
> @@ -57,7 +57,7 @@ static int gr2d_exit(struct host1x_client *client)
>  		return err;
>  
>  	host1x_syncpt_free(client->syncpts[0]);
> -	host1x_channel_free(gr2d->channel);
> +	host1x_channel_put(gr2d->channel);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
> index 13f0d1b7cd98..da02230c58ef 100644
> --- a/drivers/gpu/drm/tegra/gr3d.c
> +++ b/drivers/gpu/drm/tegra/gr3d.c
> @@ -1,6 +1,6 @@
>  /*
>   * Copyright (C) 2013 Avionic Design GmbH
> - * Copyright (C) 2013 NVIDIA Corporation
> + * Copyright (C) 2013-2017 NVIDIA Corporation
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2 as
> @@ -48,7 +48,7 @@ static int gr3d_init(struct host1x_client *client)
>  
>  	client->syncpts[0] = host1x_syncpt_request(client->dev, flags);
>  	if (!client->syncpts[0]) {
> -		host1x_channel_free(gr3d->channel);
> +		host1x_channel_put(gr3d->channel);
>  		return -ENOMEM;
>  	}
>  
> @@ -67,7 +67,7 @@ static int gr3d_exit(struct host1x_client *client)
>  		return err;
>  
>  	host1x_syncpt_free(client->syncpts[0]);
> -	host1x_channel_free(gr3d->channel);
> +	host1x_channel_put(gr3d->channel);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> index cd804e404a11..5a36adfc01f6 100644
> --- a/drivers/gpu/drm/tegra/vic.c
> +++ b/drivers/gpu/drm/tegra/vic.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (c) 2015, NVIDIA Corporation.
> + * Copyright (c) 2015-2017, NVIDIA Corporation.
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2 as
> @@ -182,7 +182,7 @@ static int vic_init(struct host1x_client *client)
>  free_syncpt:
>  	host1x_syncpt_free(client->syncpts[0]);
>  free_channel:
> -	host1x_channel_free(vic->channel);
> +	host1x_channel_put(vic->channel);
>  detach_device:
>  	if (tegra->domain)
>  		iommu_detach_device(tegra->domain, vic->dev);
> @@ -203,7 +203,7 @@ static int vic_exit(struct host1x_client *client)
>  		return err;
>  
>  	host1x_syncpt_free(client->syncpts[0]);
> -	host1x_channel_free(vic->channel);
> +	host1x_channel_put(vic->channel);
>  
>  	if (vic->domain) {
>  		iommu_detach_device(vic->domain, vic->dev);
> diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
> index 28541b280739..d7c1e269ed67 100644
> --- a/drivers/gpu/host1x/cdma.c
> +++ b/drivers/gpu/host1x/cdma.c
> @@ -1,7 +1,7 @@
>  /*
>   * Tegra host1x Command DMA
>   *
> - * Copyright (c) 2010-2013, NVIDIA Corporation.
> + * Copyright (c) 2010-2017, NVIDIA Corporation.
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
> index 8f437d924c10..819e97ccb00d 100644
> --- a/drivers/gpu/host1x/channel.c
> +++ b/drivers/gpu/host1x/channel.c
> @@ -1,7 +1,7 @@
>  /*
>   * Tegra host1x Channel
>   *
> - * Copyright (c) 2010-2013, NVIDIA Corporation.
> + * Copyright (c) 2010-2017, NVIDIA Corporation.
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -24,19 +24,36 @@
>  #include "job.h"
>  
>  /* Constructor for the host1x device list */
> -int host1x_channel_list_init(struct host1x *host)
> +int host1x_channel_list_init(struct host1x_channel_list *chlist,
> +			     unsigned int num_channels)
>  {
> -	INIT_LIST_HEAD(&host->chlist.list);
> -	mutex_init(&host->chlist_mutex);
> -
> -	if (host->info->nb_channels > BITS_PER_LONG) {
> -		WARN(1, "host1x hardware has more channels than supported by the driver\n");
> -		return -ENOSYS;
> +	chlist->channels = kcalloc(num_channels, sizeof(struct host1x_channel),
> +				   GFP_KERNEL);
> +	if (!chlist->channels)
> +		return -ENOMEM;
> +
> +	chlist->allocated_channels =
> +		kcalloc(BITS_TO_LONGS(num_channels), sizeof(unsigned long),
> +			GFP_KERNEL);
> +	if (!chlist->allocated_channels) {
> +		kfree(chlist->channels);
> +		return -ENOMEM;
>  	}
>  
> +	bitmap_zero(chlist->allocated_channels, num_channels);
> +
> +	mutex_init(&chlist->alloc_lock);
> +	sema_init(&chlist->alloc_sema, num_channels);
> +
>  	return 0;
>  }
>  
> +void host1x_channel_list_free(struct host1x_channel_list *chlist)
> +{
> +	kfree(chlist->allocated_channels);
> +	kfree(chlist->channels);
> +}
> +
>  int host1x_job_submit(struct host1x_job *job)
>  {
>  	struct host1x *host = dev_get_drvdata(job->channel->dev->parent);
> @@ -47,86 +64,107 @@ EXPORT_SYMBOL(host1x_job_submit);
>  
>  struct host1x_channel *host1x_channel_get(struct host1x_channel *channel)
>  {
> -	int err = 0;
> -
> -	mutex_lock(&channel->reflock);
> -
> -	if (channel->refcount == 0)
> -		err = host1x_cdma_init(&channel->cdma);
> +	kref_get(&channel->refcount);
>  
> -	if (!err)
> -		channel->refcount++;
> +	return channel;
> +}
> +EXPORT_SYMBOL(host1x_channel_get);
>  
> -	mutex_unlock(&channel->reflock);
> +/**
> + * host1x_channel_get_index() - Attempt to get channel reference by index
> + * @host: Host1x device object
> + * @index: Index of channel
> + *
> + * If channel number @index is currently allocated, increase its refcount
> + * and return a pointer to it. Otherwise, return NULL.
> + */
> +struct host1x_channel *host1x_channel_get_index(struct host1x *host,
> +						unsigned int index)
> +{
> +	struct host1x_channel *ch = &host->channel_list.channels[index];
>  
> -	return err ? NULL : channel;
> +	if (kref_get_unless_zero(&ch->refcount))
> +		return ch;
> +	else
> +		return NULL;
>  }
> -EXPORT_SYMBOL(host1x_channel_get);
>  
> -void host1x_channel_put(struct host1x_channel *channel)
> +static void release_channel(struct kref *kref)
>  {
> -	mutex_lock(&channel->reflock);
> +	struct host1x_channel *channel =
> +		container_of(kref, struct host1x_channel, refcount);
> +	struct host1x *host = dev_get_drvdata(channel->dev->parent);
> +	struct host1x_channel_list *chlist = &host->channel_list;
>  
> -	if (channel->refcount == 1) {
> -		struct host1x *host = dev_get_drvdata(channel->dev->parent);
> +	host1x_hw_cdma_stop(host, &channel->cdma);
> +	host1x_cdma_deinit(&channel->cdma);
>  
> -		host1x_hw_cdma_stop(host, &channel->cdma);
> -		host1x_cdma_deinit(&channel->cdma);
> -	}
> +	clear_bit(channel->id, chlist->allocated_channels);
>  
> -	channel->refcount--;
> +	up(&chlist->alloc_sema);
> +}
>  
> -	mutex_unlock(&channel->reflock);
> +void host1x_channel_put(struct host1x_channel *channel)
> +{
> +	kref_put(&channel->refcount, release_channel);
>  }
>  EXPORT_SYMBOL(host1x_channel_put);
>  
> +/**
> + * host1x_channel_request() - Allocate a channel
> + * @device: Host1x unit this channel will be used to send commands to
> + *
> + * Allocates a new host1x channel for @device. If there are no free channels,
> + * this will sleep until one becomes available. May return NULL if CDMA
> + * initialization fails.
> + */
>  struct host1x_channel *host1x_channel_request(struct device *dev)
>  {
>  	struct host1x *host = dev_get_drvdata(dev->parent);
> +	struct host1x_channel_list *chlist = &host->channel_list;
>  	unsigned int max_channels = host->info->nb_channels;
>  	struct host1x_channel *channel = NULL;
> -	unsigned long index;
> +	unsigned int index;
>  	int err;
>  
> -	mutex_lock(&host->chlist_mutex);
> +	down(&chlist->alloc_sema);
> +

It's a bit hard to follow lockings in the code, could you please explain why
you've added this semaphore? What problem it solves?

> +	mutex_lock(&chlist->alloc_lock);
>  
> -	index = find_first_zero_bit(&host->allocated_channels, max_channels);
> -	if (index >= max_channels)
> -		goto fail;
> +	index = find_first_zero_bit(chlist->allocated_channels, max_channels);
> +	if (index >= max_channels) {
> +		mutex_unlock(&chlist->alloc_lock);
> +		dev_err(dev, "failed to find free channel\n");
> +		return NULL;
> +	}
>  
> -	channel = kzalloc(sizeof(*channel), GFP_KERNEL);
> -	if (!channel)
> -		goto fail;
> +	set_bit(index, chlist->allocated_channels);
>  
> -	err = host1x_hw_channel_init(host, channel, index);
> -	if (err < 0)
> -		goto fail;
> +	mutex_unlock(&chlist->alloc_lock);
>  
> -	/* Link device to host1x_channel */
> +	channel = &chlist->channels[index];
> +
> +	kref_init(&channel->refcount);
> +	mutex_init(&channel->submit_lock);
> +	channel->id = index;
>  	channel->dev = dev;
>  
> -	/* Add to channel list */
> -	list_add_tail(&channel->list, &host->chlist.list);
> +	err = host1x_hw_channel_init(host, channel, index);
> +	if (err < 0)
> +		goto free;
>  
> -	host->allocated_channels |= BIT(index);
> +	err = host1x_cdma_init(&channel->cdma);
> +	if (err < 0)
> +		goto free;
>  
> -	mutex_unlock(&host->chlist_mutex);
>  	return channel;
>  
> -fail:
> -	dev_err(dev, "failed to init channel\n");
> -	kfree(channel);
> -	mutex_unlock(&host->chlist_mutex);
> -	return NULL;
> -}
> -EXPORT_SYMBOL(host1x_channel_request);
> +free:
> +	clear_bit(channel->id, chlist->allocated_channels);
> +	up(&chlist->alloc_sema);
>  
> -void host1x_channel_free(struct host1x_channel *channel)
> -{
> -	struct host1x *host = dev_get_drvdata(channel->dev->parent);
> +	dev_err(dev, "failed to initialize channel\n");
>  
> -	host->allocated_channels &= ~BIT(channel->id);
> -	list_del(&channel->list);
> -	kfree(channel);
> +	return NULL;
>  }
> -EXPORT_SYMBOL(host1x_channel_free);
> +EXPORT_SYMBOL(host1x_channel_request);
> diff --git a/drivers/gpu/host1x/channel.h b/drivers/gpu/host1x/channel.h
> index df767cf90d51..91a40f221415 100644
> --- a/drivers/gpu/host1x/channel.h
> +++ b/drivers/gpu/host1x/channel.h
> @@ -1,7 +1,7 @@
>  /*
>   * Tegra host1x Channel
>   *
> - * Copyright (c) 2010-2013, NVIDIA Corporation.
> + * Copyright (c) 2010-2017, NVIDIA Corporation.
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -20,27 +20,37 @@
>  #define __HOST1X_CHANNEL_H
>  
>  #include <linux/io.h>
> +#include <linux/kref.h>
>  
>  #include "cdma.h"
>  
>  struct host1x;
> +struct host1x_channel;
> +
> +struct host1x_channel_list {
> +	struct host1x_channel *channels;
> +
> +	/* Allows clients to wait for a free channel */
> +	struct semaphore alloc_sema;
> +	struct mutex alloc_lock;
> +	unsigned long *allocated_channels;
> +};
>  
>  struct host1x_channel {
> -	struct list_head list;
> +	struct kref refcount;
>  
> -	unsigned int refcount;
>  	unsigned int id;
> -	struct mutex reflock;
> -	struct mutex submitlock;
> +	struct mutex submit_lock;
>  	void __iomem *regs;
>  	struct device *dev;
>  	struct host1x_cdma cdma;
>  };
>  
>  /* channel list operations */
> -int host1x_channel_list_init(struct host1x *host);
> -
> -#define host1x_for_each_channel(host, channel)				\
> -	list_for_each_entry(channel, &host->chlist.list, list)
> +int host1x_channel_list_init(struct host1x_channel_list *chlist,
> +			     unsigned int num_channels);
> +void host1x_channel_list_free(struct host1x_channel_list *chlist);
> +struct host1x_channel *host1x_channel_get_index(struct host1x *host,
> +						unsigned int index);
>  
>  #endif
> diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
> index d9330fcc62ad..0e8b66fea29f 100644
> --- a/drivers/gpu/host1x/debug.c
> +++ b/drivers/gpu/host1x/debug.c
> @@ -2,7 +2,7 @@
>   * Copyright (C) 2010 Google, Inc.
>   * Author: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>   *
> - * Copyright (C) 2011-2013 NVIDIA Corporation
> + * Copyright (C) 2011-2017 NVIDIA Corporation
>   *
>   * This software is licensed under the terms of the GNU General Public
>   * License version 2, as published by the Free Software Foundation, and
> @@ -43,24 +43,19 @@ void host1x_debug_output(struct output *o, const char *fmt, ...)
>  	o->fn(o->ctx, o->buf, len);
>  }
>  
> -static int show_channels(struct host1x_channel *ch, void *data, bool show_fifo)
> +static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
>  {
>  	struct host1x *m = dev_get_drvdata(ch->dev->parent);
>  	struct output *o = data;
>  
> -	mutex_lock(&ch->reflock);
> +	mutex_lock(&ch->cdma.lock);
>  
> -	if (ch->refcount) {
> -		mutex_lock(&ch->cdma.lock);
> +	if (show_fifo)
> +		host1x_hw_show_channel_fifo(m, ch, o);
>  
> -		if (show_fifo)
> -			host1x_hw_show_channel_fifo(m, ch, o);
> +	host1x_hw_show_channel_cdma(m, ch, o);
>  
> -		host1x_hw_show_channel_cdma(m, ch, o);
> -		mutex_unlock(&ch->cdma.lock);
> -	}
> -
> -	mutex_unlock(&ch->reflock);
> +	mutex_unlock(&ch->cdma.lock);
>  
>  	return 0;
>  }
> @@ -94,28 +89,22 @@ static void show_syncpts(struct host1x *m, struct output *o)
>  	host1x_debug_output(o, "\n");
>  }
>  
> -static void show_all(struct host1x *m, struct output *o)
> +static void show_all(struct host1x *m, struct output *o, bool show_fifo)
>  {
> -	struct host1x_channel *ch;
> +	int i;
>  
>  	host1x_hw_show_mlocks(m, o);
>  	show_syncpts(m, o);
>  	host1x_debug_output(o, "---- channels ----\n");
>  
> -	host1x_for_each_channel(m, ch)
> -		show_channels(ch, o, true);
> -}
> -
> -static void show_all_no_fifo(struct host1x *host1x, struct output *o)
> -{
> -	struct host1x_channel *ch;
> -
> -	host1x_hw_show_mlocks(host1x, o);
> -	show_syncpts(host1x, o);
> -	host1x_debug_output(o, "---- channels ----\n");
> +	for (i = 0; i < m->info->nb_channels; ++i) {
> +		struct host1x_channel *ch = host1x_channel_get_index(m, i);
>  
> -	host1x_for_each_channel(host1x, ch)
> -		show_channels(ch, o, false);
> +		if (ch) {
> +			show_channel(ch, o, show_fifo);
> +			host1x_channel_put(ch);
> +		}
> +	}
>  }
>  
>  static int host1x_debug_show_all(struct seq_file *s, void *unused)
> @@ -125,7 +114,7 @@ static int host1x_debug_show_all(struct seq_file *s, void *unused)
>  		.ctx = s
>  	};
>  
> -	show_all(s->private, &o);
> +	show_all(s->private, &o, true);
>  
>  	return 0;
>  }
> @@ -137,7 +126,7 @@ static int host1x_debug_show(struct seq_file *s, void *unused)
>  		.ctx = s
>  	};
>  
> -	show_all_no_fifo(s->private, &o);
> +	show_all(s->private, &o, false);
>  
>  	return 0;
>  }
> @@ -216,7 +205,7 @@ void host1x_debug_dump(struct host1x *host1x)
>  		.fn = write_to_printk
>  	};
>  
> -	show_all(host1x, &o);
> +	show_all(host1x, &o, true);
>  }
>  
>  void host1x_debug_dump_syncpts(struct host1x *host1x)
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index a8234bb49403..f57ef45f75c9 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -1,7 +1,7 @@
>  /*
>   * Tegra host1x driver
>   *
> - * Copyright (c) 2010-2013, NVIDIA Corporation.
> + * Copyright (c) 2010-2017, NVIDIA Corporation.
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -189,7 +189,8 @@ static int host1x_probe(struct platform_device *pdev)
>  		host->iova_end = geometry->aperture_end;
>  	}
>  
> -	err = host1x_channel_list_init(host);
> +	err = host1x_channel_list_init(&host->channel_list,
> +				       host->info->nb_channels);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to initialize channel list\n");
>  		goto fail_detach_device;
> @@ -247,6 +248,7 @@ static int host1x_remove(struct platform_device *pdev)
>  	host1x_intr_deinit(host);
>  	host1x_syncpt_deinit(host);
>  	clk_disable_unprepare(host->clk);
> +	host1x_channel_list_free(&host->channel_list);
>  
>  	if (host->domain) {
>  		put_iova_domain(&host->iova);
> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
> index 1ee79dbd1882..a558e39bf7f5 100644
> --- a/drivers/gpu/host1x/dev.h
> +++ b/drivers/gpu/host1x/dev.h
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (C) 2012-2016 NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (C) 2012-2017 NVIDIA CORPORATION.  All rights reserved.
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -130,10 +130,8 @@ struct host1x {
>  	struct host1x_syncpt *nop_sp;
>  
>  	struct mutex syncpt_mutex;
> -	struct mutex chlist_mutex;
> -	struct host1x_channel chlist;
> -	unsigned long allocated_channels;
> -	unsigned int num_allocated_channels;
> +
> +	struct host1x_channel_list channel_list;
>  
>  	struct dentry *debugfs;
>  
> diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
> index 27dc78f4c400..286c81aad308 100644
> --- a/drivers/gpu/host1x/hw/channel_hw.c
> +++ b/drivers/gpu/host1x/hw/channel_hw.c
> @@ -138,13 +138,13 @@ static int channel_submit(struct host1x_job *job)
>  	}
>  
>  	/* get submit lock */
> -	err = mutex_lock_interruptible(&ch->submitlock);
> +	err = mutex_lock_interruptible(&ch->submit_lock);
>  	if (err)
>  		goto error;
>  
>  	completed_waiter = kzalloc(sizeof(*completed_waiter), GFP_KERNEL);
>  	if (!completed_waiter) {
> -		mutex_unlock(&ch->submitlock);
> +		mutex_unlock(&ch->submit_lock);
>  		err = -ENOMEM;
>  		goto error;
>  	}
> @@ -152,7 +152,7 @@ static int channel_submit(struct host1x_job *job)
>  	/* begin a CDMA submit */
>  	err = host1x_cdma_begin(&ch->cdma, job);
>  	if (err) {
> -		mutex_unlock(&ch->submitlock);
> +		mutex_unlock(&ch->submit_lock);
>  		goto error;
>  	}
>  
> @@ -190,7 +190,7 @@ static int channel_submit(struct host1x_job *job)
>  	completed_waiter = NULL;
>  	WARN(err, "Failed to set submit complete interrupt");
>  
> -	mutex_unlock(&ch->submitlock);
> +	mutex_unlock(&ch->submit_lock);
>  
>  	return 0;
>  
> @@ -202,10 +202,6 @@ static int channel_submit(struct host1x_job *job)
>  static int host1x_channel_init(struct host1x_channel *ch, struct host1x *dev,
>  			       unsigned int index)
>  {
> -	ch->id = index;
> -	mutex_init(&ch->reflock);
> -	mutex_init(&ch->submitlock);
> -
>  	ch->regs = dev->regs + index * HOST1X_CHANNEL_SIZE;
>  	return 0;
>  }
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index fd9b526486e0..921ec6465952 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -157,7 +157,6 @@ struct host1x_channel;
>  struct host1x_job;
>  
>  struct host1x_channel *host1x_channel_request(struct device *dev);
> -void host1x_channel_free(struct host1x_channel *channel);
>  struct host1x_channel *host1x_channel_get(struct host1x_channel *channel);
>  void host1x_channel_put(struct host1x_channel *channel);
>  int host1x_job_submit(struct host1x_job *job);
> 


-- 
Dmitry
