Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA0BC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 21:13:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE8F1619C2
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 21:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbhC3VMh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 17:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbhC3VMI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 17:12:08 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B671C061574
        for <linux-tegra@vger.kernel.org>; Tue, 30 Mar 2021 14:12:06 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u20so21390456lja.13
        for <linux-tegra@vger.kernel.org>; Tue, 30 Mar 2021 14:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/QDZgYZJXyG2sgrbclvxHliZliBt5pR/K5tKY7peYII=;
        b=rto5zuAN1ZSPsZSS/28Y1jkyHbkdJRSW7XFLeCigJkUZbo4JYZ46iTqecXApHlgIDZ
         0Q2VD/jub5aI53H4idix7EhjHD+1VvriuYr31NRWku1mKYYTDhh4ehuAi/ViIE+zYbLI
         6B5w323EBWsf1Sye7s9W93iLOTSeYaHxqKZKbkn22hTXICMxiuOPUeyVT7S8AaEVDI4r
         +hBgHF6mmkWa3Z6VUf4zRRQP9q8Bm7/ZT5D+yxEKYbCx7szcyzcoWz7ruSzdM3hgMhiw
         jgJS9jR2qBWaIEGHyaEVYyerInHBTw47vMrli9zcLOhqqS4XlgC8HU917KXkWsd3l0xh
         rF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/QDZgYZJXyG2sgrbclvxHliZliBt5pR/K5tKY7peYII=;
        b=kh7jqynAIRNl1irs41vgFiyPfmDRxZEGjJ6WW3Y/fqr0egNESu6CozdrH+F3H4+56Y
         HBRKqzadBxhm9p8sekmY5SClt/eB8xRbMH+eP+IA8EnwBw7xEbtcHOsX6Bo6EOIQy6SS
         Vhk1srJbQVDFoDafIvK5ybzzSqSLrEPX8TCStAY83KmoS2wbIgNxIW4p/VY6jzvfWztG
         2G5KsQz+iS0OeH2QP8wjGXgupZYY0npXNkgY5Mid9F4o+fuJfKxx9Olg5OkkgpReQXf1
         tXfZMRHXXLo+w7uTncZKLCHsmymV8pP5QLhAp/qNtlemH6QNDRtOtrOpzmyZL9Gqy/ET
         tqMw==
X-Gm-Message-State: AOAM531Y+p1wvCaozl+f6dZUWeqKEQ+Yuk6o720+rjJHvZFXXhHGPynK
        9xLfwC/yuaKX+KZD2Y3zrxE=
X-Google-Smtp-Source: ABdhPJwmK+yMgmEL9da7mSBFIlaJhmeb2TuSyf5vGJEJf5dGqY5ltvL/42K1NXITsHjmGyANWIF6Qg==
X-Received: by 2002:a2e:b555:: with SMTP id a21mr70416ljn.69.1617138724520;
        Tue, 30 Mar 2021 14:12:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.googlemail.com with ESMTPSA id r27sm12lfm.188.2021.03.30.14.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 14:12:04 -0700 (PDT)
Subject: Re: [PATCH v6 06/10] gpu: host1x: Cleanup and refcounting for
 syncpoints
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
 <20210329133836.2115236-7-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0a75a45c-6e52-d303-621c-b2aaef9a18cf@gmail.com>
Date:   Wed, 31 Mar 2021 00:12:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210329133836.2115236-7-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.03.2021 16:38, Mikko Perttunen пишет:
> Add reference counting for allocated syncpoints to allow keeping
> them allocated while jobs are referencing them. Additionally,
> clean up various places using syncpoint IDs to use host1x_syncpt
> pointers instead.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v5:
> - Remove host1x_syncpt_put in submit code, as job_put already
>   puts the syncpoint.
> - Changes due to rebase in VI driver.
> v4:
> - Update from _free to _put in VI driver as well
> ---
>  drivers/gpu/drm/tegra/dc.c             |  4 +-
>  drivers/gpu/drm/tegra/drm.c            | 14 ++---
>  drivers/gpu/drm/tegra/gr2d.c           |  4 +-
>  drivers/gpu/drm/tegra/gr3d.c           |  4 +-
>  drivers/gpu/drm/tegra/vic.c            |  4 +-
>  drivers/gpu/host1x/cdma.c              | 11 ++--
>  drivers/gpu/host1x/dev.h               |  7 ++-
>  drivers/gpu/host1x/hw/cdma_hw.c        |  2 +-
>  drivers/gpu/host1x/hw/channel_hw.c     | 10 ++--
>  drivers/gpu/host1x/hw/debug_hw.c       |  2 +-
>  drivers/gpu/host1x/job.c               |  5 +-
>  drivers/gpu/host1x/syncpt.c            | 75 +++++++++++++++++++-------
>  drivers/gpu/host1x/syncpt.h            |  3 ++
>  drivers/staging/media/tegra-video/vi.c |  4 +-
>  include/linux/host1x.h                 |  8 +--
>  15 files changed, 98 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 5635fac01e3e..416d6036cf47 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -2141,7 +2141,7 @@ static int tegra_dc_init(struct host1x_client *client)
>  		drm_plane_cleanup(primary);
>  
>  	host1x_client_iommu_detach(client);
> -	host1x_syncpt_free(dc->syncpt);
> +	host1x_syncpt_put(dc->syncpt);
>  
>  	return err;
>  }
> @@ -2166,7 +2166,7 @@ static int tegra_dc_exit(struct host1x_client *client)
>  	}
>  
>  	host1x_client_iommu_detach(client);
> -	host1x_syncpt_free(dc->syncpt);
> +	host1x_syncpt_put(dc->syncpt);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 90709c38c993..ce5bdc58d315 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -174,7 +174,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  	struct drm_tegra_syncpt syncpt;
>  	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
>  	struct drm_gem_object **refs;
> -	struct host1x_syncpt *sp;
> +	struct host1x_syncpt *sp = NULL;
>  	struct host1x_job *job;
>  	unsigned int num_refs;
>  	int err;
> @@ -301,8 +301,8 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  		goto fail;
>  	}
>  
> -	/* check whether syncpoint ID is valid */
> -	sp = host1x_syncpt_get(host1x, syncpt.id);
> +	/* Syncpoint ref will be dropped on job release. */
> +	sp = host1x_syncpt_get_by_id(host1x, syncpt.id);
>  	if (!sp) {
>  		err = -ENOENT;
>  		goto fail;
> @@ -311,7 +311,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  	job->is_addr_reg = context->client->ops->is_addr_reg;
>  	job->is_valid_class = context->client->ops->is_valid_class;
>  	job->syncpt_incrs = syncpt.incrs;
> -	job->syncpt_id = syncpt.id;
> +	job->syncpt = sp;
>  	job->timeout = 10000;
>  
>  	if (args->timeout && args->timeout < 10000)
> @@ -383,7 +383,7 @@ static int tegra_syncpt_read(struct drm_device *drm, void *data,
>  	struct drm_tegra_syncpt_read *args = data;
>  	struct host1x_syncpt *sp;
>  
> -	sp = host1x_syncpt_get(host, args->id);
> +	sp = host1x_syncpt_get_by_id_noref(host, args->id);
>  	if (!sp)
>  		return -EINVAL;
>  
> @@ -398,7 +398,7 @@ static int tegra_syncpt_incr(struct drm_device *drm, void *data,
>  	struct drm_tegra_syncpt_incr *args = data;
>  	struct host1x_syncpt *sp;
>  
> -	sp = host1x_syncpt_get(host1x, args->id);
> +	sp = host1x_syncpt_get_by_id_noref(host1x, args->id);
>  	if (!sp)
>  		return -EINVAL;
>  
> @@ -412,7 +412,7 @@ static int tegra_syncpt_wait(struct drm_device *drm, void *data,
>  	struct drm_tegra_syncpt_wait *args = data;
>  	struct host1x_syncpt *sp;
>  
> -	sp = host1x_syncpt_get(host1x, args->id);
> +	sp = host1x_syncpt_get_by_id_noref(host1x, args->id);
>  	if (!sp)
>  		return -EINVAL;
>  
> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
> index adbe2ddcda19..de288cba3905 100644
> --- a/drivers/gpu/drm/tegra/gr2d.c
> +++ b/drivers/gpu/drm/tegra/gr2d.c
> @@ -67,7 +67,7 @@ static int gr2d_init(struct host1x_client *client)
>  detach:
>  	host1x_client_iommu_detach(client);
>  free:
> -	host1x_syncpt_free(client->syncpts[0]);
> +	host1x_syncpt_put(client->syncpts[0]);
>  put:
>  	host1x_channel_put(gr2d->channel);
>  	return err;
> @@ -86,7 +86,7 @@ static int gr2d_exit(struct host1x_client *client)
>  		return err;
>  
>  	host1x_client_iommu_detach(client);
> -	host1x_syncpt_free(client->syncpts[0]);
> +	host1x_syncpt_put(client->syncpts[0]);
>  	host1x_channel_put(gr2d->channel);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
> index b0b8154e8104..24442ade0da3 100644
> --- a/drivers/gpu/drm/tegra/gr3d.c
> +++ b/drivers/gpu/drm/tegra/gr3d.c
> @@ -76,7 +76,7 @@ static int gr3d_init(struct host1x_client *client)
>  detach:
>  	host1x_client_iommu_detach(client);
>  free:
> -	host1x_syncpt_free(client->syncpts[0]);
> +	host1x_syncpt_put(client->syncpts[0]);
>  put:
>  	host1x_channel_put(gr3d->channel);
>  	return err;
> @@ -94,7 +94,7 @@ static int gr3d_exit(struct host1x_client *client)
>  		return err;
>  
>  	host1x_client_iommu_detach(client);
> -	host1x_syncpt_free(client->syncpts[0]);
> +	host1x_syncpt_put(client->syncpts[0]);
>  	host1x_channel_put(gr3d->channel);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> index 77e128832920..72aea1cc0cfa 100644
> --- a/drivers/gpu/drm/tegra/vic.c
> +++ b/drivers/gpu/drm/tegra/vic.c
> @@ -214,7 +214,7 @@ static int vic_init(struct host1x_client *client)
>  	return 0;
>  
>  free_syncpt:
> -	host1x_syncpt_free(client->syncpts[0]);
> +	host1x_syncpt_put(client->syncpts[0]);
>  free_channel:
>  	host1x_channel_put(vic->channel);
>  detach:
> @@ -238,7 +238,7 @@ static int vic_exit(struct host1x_client *client)
>  	if (err < 0)
>  		return err;
>  
> -	host1x_syncpt_free(client->syncpts[0]);
> +	host1x_syncpt_put(client->syncpts[0]);
>  	host1x_channel_put(vic->channel);
>  	host1x_client_iommu_detach(client);
>  
> diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
> index e8d3fda91d8a..6e6ca774f68d 100644
> --- a/drivers/gpu/host1x/cdma.c
> +++ b/drivers/gpu/host1x/cdma.c
> @@ -273,15 +273,13 @@ static int host1x_cdma_wait_pushbuffer_space(struct host1x *host1x,
>  static void cdma_start_timer_locked(struct host1x_cdma *cdma,
>  				    struct host1x_job *job)
>  {
> -	struct host1x *host = cdma_to_host1x(cdma);
> -
>  	if (cdma->timeout.client) {
>  		/* timer already started */
>  		return;
>  	}
>  
>  	cdma->timeout.client = job->client;
> -	cdma->timeout.syncpt = host1x_syncpt_get(host, job->syncpt_id);
> +	cdma->timeout.syncpt = job->syncpt;
>  	cdma->timeout.syncpt_val = job->syncpt_end;
>  	cdma->timeout.start_ktime = ktime_get();
>  
> @@ -312,7 +310,6 @@ static void stop_cdma_timer_locked(struct host1x_cdma *cdma)
>  static void update_cdma_locked(struct host1x_cdma *cdma)
>  {
>  	bool signal = false;
> -	struct host1x *host1x = cdma_to_host1x(cdma);
>  	struct host1x_job *job, *n;
>  
>  	/* If CDMA is stopped, queue is cleared and we can return */
> @@ -324,8 +321,7 @@ static void update_cdma_locked(struct host1x_cdma *cdma)
>  	 * to consume as many sync queue entries as possible without blocking
>  	 */
>  	list_for_each_entry_safe(job, n, &cdma->sync_queue, list) {
> -		struct host1x_syncpt *sp =
> -			host1x_syncpt_get(host1x, job->syncpt_id);
> +		struct host1x_syncpt *sp = job->syncpt;
>  
>  		/* Check whether this syncpt has completed, and bail if not */
>  		if (!host1x_syncpt_is_expired(sp, job->syncpt_end)) {
> @@ -499,8 +495,7 @@ int host1x_cdma_begin(struct host1x_cdma *cdma, struct host1x_job *job)
>  		if (!cdma->timeout.initialized) {
>  			int err;
>  
> -			err = host1x_hw_cdma_timeout_init(host1x, cdma,
> -							  job->syncpt_id);
> +			err = host1x_hw_cdma_timeout_init(host1x, cdma);
>  			if (err) {
>  				mutex_unlock(&cdma->lock);
>  				return err;
> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
> index f781a9b0f39d..63010ae37a97 100644
> --- a/drivers/gpu/host1x/dev.h
> +++ b/drivers/gpu/host1x/dev.h
> @@ -37,7 +37,7 @@ struct host1x_cdma_ops {
>  	void (*start)(struct host1x_cdma *cdma);
>  	void (*stop)(struct host1x_cdma *cdma);
>  	void (*flush)(struct  host1x_cdma *cdma);
> -	int (*timeout_init)(struct host1x_cdma *cdma, unsigned int syncpt);
> +	int (*timeout_init)(struct host1x_cdma *cdma);
>  	void (*timeout_destroy)(struct host1x_cdma *cdma);
>  	void (*freeze)(struct host1x_cdma *cdma);
>  	void (*resume)(struct host1x_cdma *cdma, u32 getptr);
> @@ -261,10 +261,9 @@ static inline void host1x_hw_cdma_flush(struct host1x *host,
>  }
>  
>  static inline int host1x_hw_cdma_timeout_init(struct host1x *host,
> -					      struct host1x_cdma *cdma,
> -					      unsigned int syncpt)
> +					      struct host1x_cdma *cdma)
>  {
> -	return host->cdma_op->timeout_init(cdma, syncpt);
> +	return host->cdma_op->timeout_init(cdma);
>  }
>  
>  static inline void host1x_hw_cdma_timeout_destroy(struct host1x *host,
> diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/cdma_hw.c
> index 2f3bf94cf365..e49cd5b8f735 100644
> --- a/drivers/gpu/host1x/hw/cdma_hw.c
> +++ b/drivers/gpu/host1x/hw/cdma_hw.c
> @@ -295,7 +295,7 @@ static void cdma_timeout_handler(struct work_struct *work)
>  /*
>   * Init timeout resources
>   */
> -static int cdma_timeout_init(struct host1x_cdma *cdma, unsigned int syncpt)
> +static int cdma_timeout_init(struct host1x_cdma *cdma)
>  {
>  	INIT_DELAYED_WORK(&cdma->timeout.wq, cdma_timeout_handler);
>  	cdma->timeout.initialized = true;
> diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
> index 5eaa29d171c9..d4c28faf27d1 100644
> --- a/drivers/gpu/host1x/hw/channel_hw.c
> +++ b/drivers/gpu/host1x/hw/channel_hw.c
> @@ -86,8 +86,7 @@ static void submit_gathers(struct host1x_job *job)
>  
>  static inline void synchronize_syncpt_base(struct host1x_job *job)
>  {
> -	struct host1x *host = dev_get_drvdata(job->channel->dev->parent);
> -	struct host1x_syncpt *sp = host->syncpt + job->syncpt_id;
> +	struct host1x_syncpt *sp = job->syncpt;
>  	unsigned int id;
>  	u32 value;
>  
> @@ -118,7 +117,7 @@ static void host1x_channel_set_streamid(struct host1x_channel *channel)
>  static int channel_submit(struct host1x_job *job)
>  {
>  	struct host1x_channel *ch = job->channel;
> -	struct host1x_syncpt *sp;
> +	struct host1x_syncpt *sp = job->syncpt;
>  	u32 user_syncpt_incrs = job->syncpt_incrs;
>  	u32 prev_max = 0;
>  	u32 syncval;
> @@ -126,10 +125,9 @@ static int channel_submit(struct host1x_job *job)
>  	struct host1x_waitlist *completed_waiter = NULL;
>  	struct host1x *host = dev_get_drvdata(ch->dev->parent);
>  
> -	sp = host->syncpt + job->syncpt_id;
>  	trace_host1x_channel_submit(dev_name(ch->dev),
>  				    job->num_gathers, job->num_relocs,
> -				    job->syncpt_id, job->syncpt_incrs);
> +				    job->syncpt->id, job->syncpt_incrs);
>  
>  	/* before error checks, return current max */
>  	prev_max = job->syncpt_end = host1x_syncpt_read_max(sp);
> @@ -163,7 +161,7 @@ static int channel_submit(struct host1x_job *job)
>  		host1x_cdma_push(&ch->cdma,
>  				 host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
>  					host1x_uclass_wait_syncpt_r(), 1),
> -				 host1x_class_host_wait_syncpt(job->syncpt_id,
> +				 host1x_class_host_wait_syncpt(job->syncpt->id,
>  					host1x_syncpt_read_max(sp)));
>  	}
>  
> diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
> index f31bcfa1b837..ceb48229d14b 100644
> --- a/drivers/gpu/host1x/hw/debug_hw.c
> +++ b/drivers/gpu/host1x/hw/debug_hw.c
> @@ -204,7 +204,7 @@ static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
>  		unsigned int i;
>  
>  		host1x_debug_output(o, "\n%p: JOB, syncpt_id=%d, syncpt_val=%d, first_get=%08x, timeout=%d num_slots=%d, num_handles=%d\n",
> -				    job, job->syncpt_id, job->syncpt_end,
> +				    job, job->syncpt->id, job->syncpt_end,
>  				    job->first_get, job->timeout,
>  				    job->num_slots, job->num_unpins);
>  
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 82d0a60ba3f7..adbdc225de8d 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -79,6 +79,9 @@ static void job_free(struct kref *ref)
>  {
>  	struct host1x_job *job = container_of(ref, struct host1x_job, ref);
>  
> +	if (job->syncpt)
> +		host1x_syncpt_put(job->syncpt);
> +
>  	kfree(job);
>  }
>  
> @@ -674,7 +677,7 @@ EXPORT_SYMBOL(host1x_job_unpin);
>   */
>  void host1x_job_dump(struct device *dev, struct host1x_job *job)
>  {
> -	dev_dbg(dev, "    SYNCPT_ID   %d\n", job->syncpt_id);
> +	dev_dbg(dev, "    SYNCPT_ID   %d\n", job->syncpt->id);
>  	dev_dbg(dev, "    SYNCPT_VAL  %d\n", job->syncpt_end);
>  	dev_dbg(dev, "    FIRST_GET   0x%x\n", job->first_get);
>  	dev_dbg(dev, "    TIMEOUT     %d\n", job->timeout);
> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
> index 8da4bbce8b9d..7bb5de8c3d63 100644
> --- a/drivers/gpu/host1x/syncpt.c
> +++ b/drivers/gpu/host1x/syncpt.c
> @@ -90,6 +90,8 @@ struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
>  	else
>  		sp->client_managed = false;
>  
> +	kref_init(&sp->ref);
> +
>  	mutex_unlock(&host->syncpt_mutex);
>  	return sp;
>  
> @@ -383,7 +385,7 @@ int host1x_syncpt_init(struct host1x *host)
>   * host1x client drivers can use this function to allocate a syncpoint for
>   * subsequent use. A syncpoint returned by this function will be reserved for
>   * use by the client exclusively. When no longer using a syncpoint, a host1x
> - * client driver needs to release it using host1x_syncpt_free().
> + * client driver needs to release it using host1x_syncpt_put().
>   */
>  struct host1x_syncpt *host1x_syncpt_request(struct host1x_client *client,
>  					    unsigned long flags)
> @@ -394,20 +396,9 @@ struct host1x_syncpt *host1x_syncpt_request(struct host1x_client *client,
>  }
>  EXPORT_SYMBOL(host1x_syncpt_request);
>  
> -/**
> - * host1x_syncpt_free() - free a requested syncpoint
> - * @sp: host1x syncpoint
> - *
> - * Release a syncpoint previously allocated using host1x_syncpt_request(). A
> - * host1x client driver should call this when the syncpoint is no longer in
> - * use. Note that client drivers must ensure that the syncpoint doesn't remain
> - * under the control of hardware after calling this function, otherwise two
> - * clients may end up trying to access the same syncpoint concurrently.
> - */
> -void host1x_syncpt_free(struct host1x_syncpt *sp)
> +static void syncpt_release(struct kref *ref)
>  {
> -	if (!sp)
> -		return;
> +	struct host1x_syncpt *sp = container_of(ref, struct host1x_syncpt, ref);
>  
>  	mutex_lock(&sp->host->syncpt_mutex);
>  
> @@ -419,7 +410,23 @@ void host1x_syncpt_free(struct host1x_syncpt *sp)
>  
>  	mutex_unlock(&sp->host->syncpt_mutex);
>  }
> -EXPORT_SYMBOL(host1x_syncpt_free);
> +
> +/**
> + * host1x_syncpt_put() - free a requested syncpoint
> + * @sp: host1x syncpoint
> + *
> + * Release a syncpoint previously allocated using host1x_syncpt_request(). A
> + * host1x client driver should call this when the syncpoint is no longer in
> + * use.
> + */
> +void host1x_syncpt_put(struct host1x_syncpt *sp)
> +{
> +	if (!sp)
> +		return;
> +
> +	kref_put(&sp->ref, syncpt_release);
> +}
> +EXPORT_SYMBOL(host1x_syncpt_put);
>  
>  void host1x_syncpt_deinit(struct host1x *host)
>  {
> @@ -486,16 +493,48 @@ unsigned int host1x_syncpt_nb_mlocks(struct host1x *host)
>  }
>  
>  /**
> - * host1x_syncpt_get() - obtain a syncpoint by ID
> + * host1x_syncpt_get_by_id() - obtain a syncpoint by ID
> + * @host: host1x controller
> + * @id: syncpoint ID
> + */
> +struct host1x_syncpt *host1x_syncpt_get_by_id(struct host1x *host,
> +					      unsigned int id)
> +{
> +	if (id >= host->info->nb_pts)
> +		return NULL;
> +
> +	if (kref_get_unless_zero(&host->syncpt[id].ref))
> +		return &host->syncpt[id];
> +	else
> +		return NULL;
> +}
> +EXPORT_SYMBOL(host1x_syncpt_get_by_id);
> +
> +/**
> + * host1x_syncpt_get_by_id_noref() - obtain a syncpoint by ID but don't
> + * 	increase the refcount.
>   * @host: host1x controller
>   * @id: syncpoint ID
>   */
> -struct host1x_syncpt *host1x_syncpt_get(struct host1x *host, unsigned int id)
> +struct host1x_syncpt *host1x_syncpt_get_by_id_noref(struct host1x *host,
> +						    unsigned int id)
>  {
>  	if (id >= host->info->nb_pts)
>  		return NULL;
>  
> -	return host->syncpt + id;
> +	return &host->syncpt[id];
> +}
> +EXPORT_SYMBOL(host1x_syncpt_get_by_id_noref);
> +
> +/**
> + * host1x_syncpt_get() - increment syncpoint refcount
> + * @sp: syncpoint
> + */
> +struct host1x_syncpt *host1x_syncpt_get(struct host1x_syncpt *sp)
> +{
> +	kref_get(&sp->ref);
> +
> +	return sp;
>  }
>  EXPORT_SYMBOL(host1x_syncpt_get);
>  
> diff --git a/drivers/gpu/host1x/syncpt.h b/drivers/gpu/host1x/syncpt.h
> index 3aa6b25b1b9c..a6766f8d55ee 100644
> --- a/drivers/gpu/host1x/syncpt.h
> +++ b/drivers/gpu/host1x/syncpt.h
> @@ -11,6 +11,7 @@
>  #include <linux/atomic.h>
>  #include <linux/host1x.h>
>  #include <linux/kernel.h>
> +#include <linux/kref.h>
>  #include <linux/sched.h>
>  
>  #include "intr.h"
> @@ -26,6 +27,8 @@ struct host1x_syncpt_base {
>  };
>  
>  struct host1x_syncpt {
> +	struct kref ref;
> +
>  	unsigned int id;
>  	atomic_t min_val;
>  	atomic_t max_val;
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 7a09061cda57..7e0cb5529b49 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1131,8 +1131,8 @@ static void tegra_channel_host1x_syncpts_free(struct tegra_vi_channel *chan)
>  	int i;
>  
>  	for (i = 0; i < chan->numgangports; i++) {
> -		host1x_syncpt_free(chan->mw_ack_sp[i]);
> -		host1x_syncpt_free(chan->frame_start_sp[i]);
> +		host1x_syncpt_put(chan->mw_ack_sp[i]);
> +		host1x_syncpt_put(chan->frame_start_sp[i]);
>  	}
>  }
>  
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index 7137ce0e35d4..107aea29bccb 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -142,7 +142,9 @@ struct host1x_syncpt_base;
>  struct host1x_syncpt;
>  struct host1x;
>  
> -struct host1x_syncpt *host1x_syncpt_get(struct host1x *host, u32 id);
> +struct host1x_syncpt *host1x_syncpt_get_by_id(struct host1x *host, u32 id);
> +struct host1x_syncpt *host1x_syncpt_get_by_id_noref(struct host1x *host, u32 id);
> +struct host1x_syncpt *host1x_syncpt_get(struct host1x_syncpt *sp);
>  u32 host1x_syncpt_id(struct host1x_syncpt *sp);
>  u32 host1x_syncpt_read_min(struct host1x_syncpt *sp);
>  u32 host1x_syncpt_read_max(struct host1x_syncpt *sp);
> @@ -153,7 +155,7 @@ int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
>  		       u32 *value);
>  struct host1x_syncpt *host1x_syncpt_request(struct host1x_client *client,
>  					    unsigned long flags);
> -void host1x_syncpt_free(struct host1x_syncpt *sp);
> +void host1x_syncpt_put(struct host1x_syncpt *sp);
>  struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
>  					  unsigned long flags,
>  					  const char *name);
> @@ -221,7 +223,7 @@ struct host1x_job {
>  	dma_addr_t *reloc_addr_phys;
>  
>  	/* Sync point id, number of increments and end related to the submit */
> -	u32 syncpt_id;
> +	struct host1x_syncpt *syncpt;
>  	u32 syncpt_incrs;
>  	u32 syncpt_end;
>  
> 

Tested-by: Dmitry Osipenko <digetx@gmail.com>
