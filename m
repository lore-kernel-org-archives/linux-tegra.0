Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35BCC433E2
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 21:08:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54C66206DB
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 21:08:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="FINC2Lpm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgIPVID (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 17:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgIPQDj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 12:03:39 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9861FC035433
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 05:04:30 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k15so6621625wrn.10
        for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2020 05:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=96pn97vudIqUOy40qtVSGKAMicUxOYMMyH8l1R/+468=;
        b=FINC2LpmrXDkMJm5Mgra7waQhpVoOUvOK/XivYRsgqJPi1t7MwreTsEe5qPaJMSnnc
         bGLtUyOPhYe9Fwl6sFIaVos0Od9CqjRDqHzdWl2Mik+v6ih5KJgBn7LXGOWKxnCdsRrY
         i97BOGnSpY1lJ1zlegmw5oCEcpE/Q74wyRPDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=96pn97vudIqUOy40qtVSGKAMicUxOYMMyH8l1R/+468=;
        b=R7sZn50t268Ds9NULqICGQ0hRodwLaAPYfdc5E1VRUTqC7/8W+fhy1VMOJayQ+lOcd
         SjctVABjkPCT0cKyyLuRtSktxRVg/OX+fD1hpGTjUpGrhISaVAgWVMbBl/RMX4VzN58x
         0Td0u2SKw+AdOhEtP3A1YJiw1Ri/VIBnJkvu9BnlNlDg92KDCrtAPt0KMqFX/icoCwW0
         iDKspLtcRmYvp0lhyVFXCfUxmPlv1Bk2QVBFMM0cwo4T2UCsUPf191ko9W66r0O50g3j
         JWz1hJ/yIpEyNaSb0volAdLexZMiTdIRChcIhP+4NzgmiCTKTxWVirD6RDr/C+rUjluZ
         OxUw==
X-Gm-Message-State: AOAM531Thu+hoCK490Ot7ncKCnC5gjtHAT2W2fg8M5+q2qe3pwgf3aGb
        NMmXPlpZFfOo1/bo+l1xlYfSjA==
X-Google-Smtp-Source: ABdhPJzFyWPidEyBuJrzSJ1sZ5B58ttVLzyD39jTNflICGMYf35qmzZyXrhAzHarWd23ksw0UuQHDw==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr3019661wrp.390.1600257868941;
        Wed, 16 Sep 2020 05:04:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z11sm33234891wru.88.2020.09.16.05.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 05:04:27 -0700 (PDT)
Date:   Wed, 16 Sep 2020 14:04:24 +0200
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
Subject: Re: [PATCH v2 09/21] drm/nouveau: Introduce GEM object functions
Message-ID: <20200916120424.GM438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-10-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 15, 2020 at 04:59:46PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in nouveau.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Hm ttm and gem mmap world still quite disjoint ... Anyway that's an
entirely different thing.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |  9 ---------
>  drivers/gpu/drm/nouveau/nouveau_gem.c   | 13 +++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_gem.h   |  2 ++
>  drivers/gpu/drm/nouveau/nouveau_prime.c |  2 ++
>  4 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 42fc5c813a9b..72640bca1617 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1207,16 +1207,7 @@ driver_stub = {
>  
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_pin = nouveau_gem_prime_pin,
> -	.gem_prime_unpin = nouveau_gem_prime_unpin,
> -	.gem_prime_get_sg_table = nouveau_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table = nouveau_gem_prime_import_sg_table,
> -	.gem_prime_vmap = nouveau_gem_prime_vmap,
> -	.gem_prime_vunmap = nouveau_gem_prime_vunmap,
> -
> -	.gem_free_object_unlocked = nouveau_gem_object_del,
> -	.gem_open_object = nouveau_gem_object_open,
> -	.gem_close_object = nouveau_gem_object_close,
>  
>  	.dumb_create = nouveau_display_dumb_create,
>  	.dumb_map_offset = nouveau_display_dumb_map_offset,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 89adadf4706b..28e0cbb00876 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -169,6 +169,17 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
>  	ttm_bo_unreserve(&nvbo->bo);
>  }
>  
> +const struct drm_gem_object_funcs nouveau_gem_object_funcs = {
> +	.free = nouveau_gem_object_del,
> +	.open = nouveau_gem_object_open,
> +	.close = nouveau_gem_object_close,
> +	.pin = nouveau_gem_prime_pin,
> +	.unpin = nouveau_gem_prime_unpin,
> +	.get_sg_table = nouveau_gem_prime_get_sg_table,
> +	.vmap = nouveau_gem_prime_vmap,
> +	.vunmap = nouveau_gem_prime_vunmap,
> +};
> +
>  int
>  nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
>  		uint32_t tile_mode, uint32_t tile_flags,
> @@ -186,6 +197,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
>  	if (IS_ERR(nvbo))
>  		return PTR_ERR(nvbo);
>  
> +	nvbo->bo.base.funcs = &nouveau_gem_object_funcs;
> +
>  	/* Initialize the embedded gem-object. We return a single gem-reference
>  	 * to the caller, instead of a normal nouveau_bo ttm reference. */
>  	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
> index 978e07591990..b35c180322e2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
> @@ -5,6 +5,8 @@
>  #include "nouveau_drv.h"
>  #include "nouveau_bo.h"
>  
> +extern const struct drm_gem_object_funcs nouveau_gem_object_funcs;
> +
>  static inline struct nouveau_bo *
>  nouveau_gem_object(struct drm_gem_object *gem)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index b2ecb91f8ddc..a8264aebf3d4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -77,6 +77,8 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
>  
>  	nvbo->valid_domains = NOUVEAU_GEM_DOMAIN_GART;
>  
> +	nvbo->bo.base.funcs = &nouveau_gem_object_funcs;
> +
>  	/* Initialize the embedded gem-object. We return a single gem-reference
>  	 * to the caller, instead of a normal nouveau_bo ttm reference. */
>  	ret = drm_gem_object_init(dev, &nvbo->bo.base, size);
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
