Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7AFC48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 19:03:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 202F461350
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 19:03:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhFOTFO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 15:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbhFOTFN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 15:05:13 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745B6C061574
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 12:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=oU7nAl7/FGlILYkRQZaEEHERR9sEwQY1ljIo0epVCyA=; b=Y6QmSW9+sZXXbnZMcSGkDk90+g
        Bi1OHhB4TVC0n9bSi62mMwNI6CxAz//ESdYN0iI+NrTAa4E2f2501EZ84cgWL+rARWogglhR2Mxau
        h+S15pqpZDC017iVNmyAqAHPs639MvKATbsMIhU+04DQ3pEESbVm+v5y9IOgrU0+LXBTfTJNTHu9G
        MRa8e1iYN/63N81PoBeYXqQ6NWQEb6irY6IVqveZRwLljOrsLsuPY+iVGxQRMnPk0Vcmd553TRSQV
        CuuvVz4VooBoH/2nOf6j2/HRRzZoPYF86FIcPky47R6eLd8br71OUuWOyxlvk9hzGY930D+gve/M4
        7gucWAwg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1ltEL2-0004aP-Jk; Tue, 15 Jun 2021 22:03:04 +0300
Subject: Re: [PATCH v7 13/15] drm/tegra: Implement job submission part of new
 UAPI
To:     Jon Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, digetx@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-14-mperttunen@nvidia.com>
 <381d3d28-1daa-6b75-962c-53a1a3368beb@nvidia.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <da5b2f6a-609d-0f9b-2112-4859c82b3677@kapsi.fi>
Date:   Tue, 15 Jun 2021 22:03:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <381d3d28-1daa-6b75-962c-53a1a3368beb@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 6/15/21 10:00 PM, Jon Hunter wrote:
> 
> On 10/06/2021 12:04, Mikko Perttunen wrote:
>> Implement the job submission IOCTL with a minimum feature set.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v7:
>> * Allocate gather BO with DMA API to get page-aligned
>>    memory
>> * Add error prints to a few places where they were missing
>> v6:
>> * Remove sgt bypass path in gather_bo - this would cause
>>    cache maintenance to be skipped and is unnecessary in
>>    general.
>> * Changes related to moving to using syncpoint IDs
>> * Add syncobj related code
>> * Print warning on submit failure describing the issue
>> * Use ARCH_DMA_ADDR_T_64BIT to check if that is indeed
>>    the case
>> * Add support for relative syncpoint wait
>> * Use pm_runtime_resume_and_get
>> * Only try to resume engines that support runtime PM
>> * Removed uapi subdirectory
>> * Don't use "copy_err" variables for copy_from_user
>>    return value
>> * Fix setting of blocklinear flag
>> v5:
>> * Add 16K size limit to copies from userspace.
>> * Guard RELOC_BLOCKLINEAR flag handling to only exist in ARM64
>>    to prevent oversized shift on 32-bit platforms.
>> v4:
>> * Remove all features that are not strictly necessary.
>> * Split into two patches.
>> v3:
>> * Remove WRITE_RELOC. Relocations are now patched implicitly
>>    when patching is needed.
>> * Directly call PM runtime APIs on devices instead of using
>>    power_on/power_off callbacks.
>> * Remove incorrect mutex unlock in tegra_drm_ioctl_channel_open
>> * Use XA_FLAGS_ALLOC1 instead of XA_FLAGS_ALLOC
>> * Accommodate for removal of timeout field and inlining of
>>    syncpt_incrs array.
>> * Copy entire user arrays at a time instead of going through
>>    elements one-by-one.
>> * Implement waiting of DMA reservations.
>> * Split out gather_bo implementation into a separate file.
>> * Fix length parameter passed to sg_init_one in gather_bo
>> * Cosmetic cleanup.
>> ---
>>   drivers/gpu/drm/tegra/Makefile    |   2 +
>>   drivers/gpu/drm/tegra/drm.c       |   4 +-
>>   drivers/gpu/drm/tegra/gather_bo.c |  82 +++++
>>   drivers/gpu/drm/tegra/gather_bo.h |  24 ++
>>   drivers/gpu/drm/tegra/submit.c    | 549 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/tegra/submit.h    |  17 +
>>   6 files changed, 677 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/tegra/gather_bo.c
>>   create mode 100644 drivers/gpu/drm/tegra/gather_bo.h
>>   create mode 100644 drivers/gpu/drm/tegra/submit.c
>>   create mode 100644 drivers/gpu/drm/tegra/submit.h
> 
> ...
> 
>> +int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
>> +				   struct drm_file *file)
>> +{
>> +	struct tegra_drm_file *fpriv = file->driver_priv;
>> +	struct drm_tegra_channel_submit *args = data;
>> +	struct tegra_drm_submit_data *job_data;
>> +	struct drm_syncobj *syncobj = NULL;
>> +	struct tegra_drm_context *ctx;
>> +	struct host1x_job *job;
>> +	struct gather_bo *bo;
>> +	u32 i;
>> +	int err;
>> +
>> +	mutex_lock(&fpriv->lock);
>> +	ctx = xa_load(&fpriv->contexts, args->channel_ctx);
>> +	if (!ctx) {
>> +		mutex_unlock(&fpriv->lock);
>> +		pr_err_ratelimited("%s: %s: invalid channel_ctx '%d'", __func__,
>> +			current->comm, args->channel_ctx);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (args->syncobj_in) {
>> +		struct dma_fence *fence;
>> +
>> +		err = drm_syncobj_find_fence(file, args->syncobj_in, 0, 0, &fence);
>> +		if (err) {
>> +			SUBMIT_ERR(ctx, "invalid syncobj_in '%d'", args->syncobj_in);
>> +			goto unlock;
>> +		}
>> +
>> +		err = dma_fence_wait_timeout(fence, true, msecs_to_jiffies(10000));
>> +		dma_fence_put(fence);
>> +		if (err) {
>> +			SUBMIT_ERR(ctx, "wait for syncobj_in timed out");
>> +			goto unlock;
>> +		}
>> +	}
>> +
>> +	if (args->syncobj_out) {
>> +		syncobj = drm_syncobj_find(file, args->syncobj_out);
>> +		if (!syncobj) {
>> +			SUBMIT_ERR(ctx, "invalid syncobj_out '%d'", args->syncobj_out);
>> +			err = -ENOENT;
>> +			goto unlock;
>> +		}
>> +	}
>> +
>> +	/* Allocate gather BO and copy gather words in. */
>> +	err = submit_copy_gather_data(&bo, drm->dev, ctx, args);
>> +	if (err)
>> +		goto unlock;
>> +
>> +	job_data = kzalloc(sizeof(*job_data), GFP_KERNEL);
>> +	if (!job_data) {
>> +		SUBMIT_ERR(ctx, "failed to allocate memory for job data");
>> +		err = -ENOMEM;
>> +		goto put_bo;
>> +	}
>> +
>> +	/* Get data buffer mappings and do relocation patching. */
>> +	err = submit_process_bufs(ctx, bo, args, job_data);
>> +	if (err)
>> +		goto free_job_data;
>> +
>> +	/* Allocate host1x_job and add gathers and waits to it. */
>> +	err = submit_create_job(&job, ctx, bo, args, job_data,
>> +				&fpriv->syncpoints);
>> +	if (err)
>> +		goto free_job_data;
>> +
>> +	/* Map gather data for Host1x. */
>> +	err = host1x_job_pin(job, ctx->client->base.dev);
>> +	if (err) {
>> +		SUBMIT_ERR(ctx, "failed to pin job: %d", err);
>> +		goto put_job;
>> +	}
>> +
>> +	/* Boot engine. */
>> +	if (pm_runtime_enabled(ctx->client->base.dev)) {
>> +		err = pm_runtime_resume_and_get(ctx->client->base.dev);
>> +		if (err < 0) {
>> +			SUBMIT_ERR(ctx, "could not power up engine: %d", err);
>> +			goto unpin_job;
>> +		}
>> +	}
>> +
>> +	job->user_data = job_data;
>> +	job->release = release_job;
>> +	job->timeout = 10000;
>> +
>> +	/*
>> +	 * job_data is now part of job reference counting, so don't release
>> +	 * it from here.
>> +	 */
>> +	job_data = NULL;
>> +
>> +	/* Submit job to hardware. */
>> +	err = host1x_job_submit(job);
>> +	if (err) {
>> +		SUBMIT_ERR(ctx, "host1x job submission failed: %d", err);
>> +		goto unpin_job;
>> +	}
> 
> 
> If we fail here, it appears that we may leave rpm enabled. Should we be
> calling pm_runtime_put() for any failures from here on?

host1x_job_put will call the release callback, which will do the PM 
runtime put. So this should be taken care of.

thanks,
Mikko

> 
> Cheers
> Jon
> 
