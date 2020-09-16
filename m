Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C09C35264
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:07:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B099206DB
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:07:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="dNYt3KSm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbgIPTHt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 15:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727365AbgIPRoz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 13:44:55 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C8DC0698C4
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 04:21:43 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a9so2592535wmm.2
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mUOAFu1Sstz+Y84HDrSYqg/SYf7AQiwgyxkdfcX2QWQ=;
        b=dNYt3KSmP2zoajuEOcpSRwKjslSpbjWRZP10ZdmvUDBODfNwzvcZciCjx0cVSGnRP/
         JUZRa+hP31+BJN/M1t7m9Ls/tiT5od6BnRGoXiiAJTdUcoTfR5J6SoK2kCHBNgd6JM9c
         NsxYbB5nxATvUhunbEGd6bVQp6IDhaI5uBozM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mUOAFu1Sstz+Y84HDrSYqg/SYf7AQiwgyxkdfcX2QWQ=;
        b=Zi2hC+wiFMWIVMnvQ71gsQ9cxmj/0txl4tLgiXPtL2Z7LgLYI9z2aiQLUujnm8i1/S
         6RVI+646cdY8qamQ/Kq66uhN12iU57ycQ5tSg4Xw6cAOTffF5aFxgeBW9Roz4Cw4GrXt
         pSXLYiOz/dCDCdkTdk98iL/XGG08pA2ENeoT+KPVcYgTPKnr8+A9mSg/w+bwOZOttsYe
         dg5xZT9wjMUILuNwtDYy91MmGgcwxWZOtNtA65MuyPte6K3rWBuEqQn6d4xLH2NfeAUm
         1bt4zmKvsxZUC+SxsiteJHeiL99tWDZVJ19URk6AwSkk/wA1+YpOe1VE4V4XXAlLr20j
         eeIA==
X-Gm-Message-State: AOAM531kw4jibq8WDTYO8HuCTEqtSAgDRSUxsPRb6yyK2UAmBFY2xZ1M
        0Mtmp8RyVovMCzEaAW/fJ2xUqg==
X-Google-Smtp-Source: ABdhPJxN4KFdG0OXvpCuI3UQDQSjm9d9naSAnHnzOZnbaecNO0ofucAiEdpaLFF0vBOBWzg3E9jOYA==
X-Received: by 2002:a05:600c:414e:: with SMTP id h14mr4127600wmm.2.1600255301791;
        Wed, 16 Sep 2020 04:21:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q186sm4894705wma.45.2020.09.16.04.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 04:21:40 -0700 (PDT)
Date:   Wed, 16 Sep 2020 13:21:36 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        l.stach@pengutronix.de, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
        tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
        heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
        tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
        andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
        xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com,
        sam@ravnborg.org, miaoqinglang@huawei.com,
        emil.velikov@collabora.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 03/21] drm/etnaviv: Introduce GEM object functions
Message-ID: <20200916112136.GG438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-4-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 15, 2020 at 04:59:40PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in etnaviv. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 13 -------------
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h |  1 -
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 19 ++++++++++++++++++-
>  3 files changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index a9a3afaef9a1..aa270b79e585 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -468,12 +468,6 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
>  	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>  };
>  
> -static const struct vm_operations_struct vm_ops = {
> -	.fault = etnaviv_gem_fault,
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -
>  static const struct file_operations fops = {
>  	.owner              = THIS_MODULE,
>  	.open               = drm_open,
> @@ -490,16 +484,9 @@ static struct drm_driver etnaviv_drm_driver = {
>  	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
>  	.open               = etnaviv_open,
>  	.postclose           = etnaviv_postclose,
> -	.gem_free_object_unlocked = etnaviv_gem_free_object,
> -	.gem_vm_ops         = &vm_ops,
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_pin      = etnaviv_gem_prime_pin,
> -	.gem_prime_unpin    = etnaviv_gem_prime_unpin,
> -	.gem_prime_get_sg_table = etnaviv_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table = etnaviv_gem_prime_import_sg_table,
> -	.gem_prime_vmap     = etnaviv_gem_prime_vmap,
> -	.gem_prime_vunmap   = etnaviv_gem_prime_vunmap,
>  	.gem_prime_mmap     = etnaviv_gem_prime_mmap,
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init       = etnaviv_debugfs_init,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> index 4d8dc9236e5f..914f0867ff71 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -49,7 +49,6 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  		struct drm_file *file);
>  
>  int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> -vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf);
>  int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
>  struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
>  void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index ea19f1d27275..312e9d58d5a7 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -171,7 +171,7 @@ int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>  	return obj->ops->mmap(obj, vma);
>  }
>  
> -vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
> +static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct drm_gem_object *obj = vma->vm_private_data;
> @@ -561,6 +561,22 @@ void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj)
>  	mutex_unlock(&priv->gem_lock);
>  }
>  
> +static const struct vm_operations_struct vm_ops = {
> +	.fault = etnaviv_gem_fault,
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
> +	.free = etnaviv_gem_free_object,
> +	.pin = etnaviv_gem_prime_pin,
> +	.unpin = etnaviv_gem_prime_unpin,
> +	.get_sg_table = etnaviv_gem_prime_get_sg_table,
> +	.vmap = etnaviv_gem_prime_vmap,
> +	.vunmap = etnaviv_gem_prime_vunmap,
> +	.vm_ops = &vm_ops,
> +};

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
>  	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
>  {
> @@ -595,6 +611,7 @@ static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
>  	INIT_LIST_HEAD(&etnaviv_obj->vram_list);
>  
>  	*obj = &etnaviv_obj->base;
> +	(*obj)->funcs = &etnaviv_gem_object_funcs;
>  
>  	return 0;
>  }
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
