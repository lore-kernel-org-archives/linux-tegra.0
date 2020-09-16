Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CE6C43461
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A292A20715
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="GUr+B+EI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgIPRiU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 13:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbgIPRhz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 13:37:55 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF3BC0698C8
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 04:24:30 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l15so2020526wmh.1
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 04:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+a06VRmEudn2VQsC3iRJVsBR9BGJLaW45iWLDadZyRI=;
        b=GUr+B+EIQnykYRecoS9xztPc0/dmBYz0juGXJQ+82bnH0XOFLeyGdR7DXoJWfQI/8v
         uV6cBfGWTv8GfGsnvr2MrJOMoG5UfSEg4lIignk/xv/qBGjiERDGzKpRftrrWz5Mz7Ds
         IxCKmFcqeMxhPaSpSYh1wxMK2TNY4jkQyjW+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+a06VRmEudn2VQsC3iRJVsBR9BGJLaW45iWLDadZyRI=;
        b=QVWn41JM/l/6Y/iHfASbFeYJ26Ay5vgzVxnkEN3SOQ7OGi2iml2fD+xm9LpLrlILEp
         1X6cFrVhMboMPTemVqujZnLndq9EN2dBqMmCb9hkHFvQIl6w/D+rLm78lYZAGQkQDvG1
         ag9twShgWGccoTtw3T3A+N/iIhBvEzm6KQWA2StzvJFIs24d2y02uYRHqzu2xspfd3qG
         P3DeIlX7w0PnKSSRLWgXQdsGVHC70ib/ZCAisvqdu1/LOaN5SwTzSxcTc49Vx/+ZWpfe
         Sq8h/qdbCyrE/zaKfHyWUUrgyWNu9ksdoq5FkEXfAOV/N7ghTtIeSEgLDBxa7/dooI1i
         Mr6A==
X-Gm-Message-State: AOAM533ugoKsUVD/znYXzy3evO/dmHbYy4V4jqKwcKTjDDu6bWafDiCp
        Q9xWGIExatT/W8LlOyL76ZS3bQ==
X-Google-Smtp-Source: ABdhPJz4UqL+lwqUdWSoHFY6s7qCiJkilQoTwwhfF2waks/JDm6PnP2Zfkj6hPwcgWm/ZWJDyyjL3w==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr3984516wmj.149.1600255468515;
        Wed, 16 Sep 2020 04:24:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h76sm5509546wme.10.2020.09.16.04.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 04:24:27 -0700 (PDT)
Date:   Wed, 16 Sep 2020 13:24:24 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, hamohammed.sa@gmail.com,
        airlied@linux.ie, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
        thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
        emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
        jy0922.shim@samsung.com, oleksandr_andrushchenko@epam.com,
        tomi.valkeinen@ti.com, linux-tegra@vger.kernel.org,
        linux@armlinux.org.uk, jonathanh@nvidia.com,
        linux-rockchip@lists.infradead.org, kgene@kernel.org,
        bskeggs@redhat.com, xen-devel@lists.xenproject.org,
        miaoqinglang@huawei.com, intel-gfx@lists.freedesktop.org,
        matthew.auld@intel.com, chunkuang.hu@kernel.org,
        andi.shyti@intel.com, linux-arm-msm@vger.kernel.org,
        marek.olsak@amd.com, tianci.yin@amd.com,
        etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
        linux-mediatek@lists.infradead.org, rodrigo.vivi@intel.com,
        matthias.bgg@gmail.com, evan.quan@amd.com, sean@poorly.run,
        linux-arm-kernel@lists.infradead.org,
        tvrtko.ursulin@linux.intel.com, amd-gfx@lists.freedesktop.org,
        laurent.pinchart@ideasonboard.com, hyun.kwon@xilinx.com,
        rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com,
        Felix.Kuehling@amd.com, xinhui.pan@amd.com, sw0312.kim@samsung.com,
        hjc@rock-chips.com, chris@chris-wilson.co.uk,
        kyungmin.park@samsung.com, nirmoy.das@amd.com,
        alexander.deucher@amd.com, Hawking.Zhang@amd.com,
        freedreno@lists.freedesktop.org, christian.koenig@amd.com
Subject: Re: [PATCH v2 04/21] drm/exynos: Introduce GEM object functions
Message-ID: <20200916112424.GH438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-5-tzimmermann@suse.de>
 <20200916100318.GF438822@phenom.ffwll.local>
 <fb1f5992-1642-5751-5672-486b89442e1c@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb1f5992-1642-5751-5672-486b89442e1c@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 16, 2020 at 12:36:28PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 16.09.20 um 12:03 schrieb Daniel Vetter:
> > On Tue, Sep 15, 2020 at 04:59:41PM +0200, Thomas Zimmermann wrote:
> >> GEM object functions deprecate several similar callback interfaces in
> >> struct drm_driver. This patch replaces the per-driver callbacks with
> >> per-instance callbacks in exynos. The only exception is gem_prime_mmap,
> >> which is non-trivial to convert.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 10 ----------
> >>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 15 +++++++++++++++
> >>  2 files changed, 15 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> index dbd80f1e4c78..fe46680ca208 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> >> @@ -75,11 +75,6 @@ static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
> >>  	file->driver_priv = NULL;
> >>  }
> >>  
> >> -static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
> >> -	.open = drm_gem_vm_open,
> >> -	.close = drm_gem_vm_close,
> >> -};
> >> -
> >>  static const struct drm_ioctl_desc exynos_ioctls[] = {
> >>  	DRM_IOCTL_DEF_DRV(EXYNOS_GEM_CREATE, exynos_drm_gem_create_ioctl,
> >>  			DRM_RENDER_ALLOW),
> >> @@ -124,16 +119,11 @@ static struct drm_driver exynos_drm_driver = {
> >>  	.open			= exynos_drm_open,
> >>  	.lastclose		= drm_fb_helper_lastclose,
> >>  	.postclose		= exynos_drm_postclose,
> >> -	.gem_free_object_unlocked = exynos_drm_gem_free_object,
> >> -	.gem_vm_ops		= &exynos_drm_gem_vm_ops,
> >>  	.dumb_create		= exynos_drm_gem_dumb_create,
> >>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
> >>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> >>  	.gem_prime_import	= exynos_drm_gem_prime_import,
> >> -	.gem_prime_get_sg_table	= exynos_drm_gem_prime_get_sg_table,
> >>  	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
> >> -	.gem_prime_vmap		= exynos_drm_gem_prime_vmap,
> >> -	.gem_prime_vunmap	= exynos_drm_gem_prime_vunmap,
> >>  	.gem_prime_mmap		= exynos_drm_gem_prime_mmap,
> >>  	.ioctls			= exynos_ioctls,
> >>  	.num_ioctls		= ARRAY_SIZE(exynos_ioctls),
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> >> index efa476858db5..69a5cf28b4ae 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> >> @@ -129,6 +129,19 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem *exynos_gem)
> >>  	kfree(exynos_gem);
> >>  }
> >>  
> >> +static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
> >> +	.open = drm_gem_vm_open,
> >> +	.close = drm_gem_vm_close,
> >> +};
> > 
> > Hm moving the drm_gem_cma_vm_ops into drm_gem.h or so and maybe calling
> > them drm_gem_simple_ops or so would remove a pile of these. But perhaps a
> > quick follow up series.
> 
> Good idea. Several interfaces use the term 'default' in their name, so
> something like drm_gem_default_vm_ops seems appropriate.

Default sounds like a fine naming choice too.

> BTW is there a reason why we have file operations like
> DEFINE_DRM_GEM_CMA_FOPS() in each module? It seems like this could also
> be provided by the rsp memory-manager library.

It's for the module reference counting of the underlying file. So
file_operations need this.
-Daniel


> 
> Best regards
> Thomas
> 
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> >> +
> >> +static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs = {
> >> +	.free = exynos_drm_gem_free_object,
> >> +	.get_sg_table = exynos_drm_gem_prime_get_sg_table,
> >> +	.vmap = exynos_drm_gem_prime_vmap,
> >> +	.vunmap	= exynos_drm_gem_prime_vunmap,
> >> +	.vm_ops = &exynos_drm_gem_vm_ops,
> >> +};
> >> +
> >>  static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *dev,
> >>  						  unsigned long size)
> >>  {
> >> @@ -143,6 +156,8 @@ static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *dev,
> >>  	exynos_gem->size = size;
> >>  	obj = &exynos_gem->base;
> >>  
> >> +	obj->funcs = &exynos_drm_gem_object_funcs;
> >> +
> >>  	ret = drm_gem_object_init(dev, obj, size);
> >>  	if (ret < 0) {
> >>  		DRM_DEV_ERROR(dev->dev, "failed to initialize gem object\n");
> >> -- 
> >> 2.28.0
> >>
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
