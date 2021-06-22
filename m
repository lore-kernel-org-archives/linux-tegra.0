Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7412DC48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 15:24:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60B9E600D3
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 15:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbhFVP0n (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 11:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhFVP0m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 11:26:42 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978B5C061756
        for <linux-tegra@vger.kernel.org>; Tue, 22 Jun 2021 08:24:26 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id a13so2358698wrf.10
        for <linux-tegra@vger.kernel.org>; Tue, 22 Jun 2021 08:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZeqWuXtX2BrYCzJWvhQ3y4KbulOq0QYwwBD94QW58/k=;
        b=ZlqWM+jail8wVe6yddVhoDkll94K1QcrO1qPfcnvA5ZgF7O5UWGiwgAoirgPr5VThQ
         PxLEoFhDthsBu11VLuKNyZ4t3jV2oXfE2AjGKpc2koo0GT0EP0wz7tBbPjapFZRbS4qF
         iL45agNDVjpfa14ecS7F0zPBWAmsGHIs8s5iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZeqWuXtX2BrYCzJWvhQ3y4KbulOq0QYwwBD94QW58/k=;
        b=pdeJwq8RsJAWvc6w2CdlXrLTNaa8zlrdwJ3GvxsrSI0j/UuE8oRDiUKo7xuZ0oXZKq
         oRQIWCk4lMwaCaX81wNTKAAqcXEK6vk0d4JVVJNMpdkh6ohynDa8N/CXA3mG/TVQxK2B
         P3Oura6aNCTNGEn6Y/xB42psDAq6P4e52FAuLywjx7geOMDBrNpKKByREwl67rDV+ooG
         gjl//0ZW9mwcBzFFdmNbth67BIuu5Rd7zBOFW56e1dUuJ5aYlRDXE5S6ZSCLIE/zUtH5
         um53dbrx5TubMu5bj72oo03RvZDrzsyuwtNhMQuiOTi+EIEQAZMn7pVQ971NKt4VzcKQ
         cNyw==
X-Gm-Message-State: AOAM531UCVieGV+9Ux7Qg4M1UTFSU/mt6f1leStlbfIatvcSd6nIpScI
        CIqaRevoE8BQ3a8b3fVAhBztfA==
X-Google-Smtp-Source: ABdhPJxIsS4KMhI+Y3KiogSWjdDWrVZYSvpp7dXLHAVjT9HzjIzI+eRKdkXYHvp6Rq+N7hy/RDRSKg==
X-Received: by 2002:a05:6000:128b:: with SMTP id f11mr5556353wrx.171.1624375465147;
        Tue, 22 Jun 2021 08:24:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a24sm2852645wmj.30.2021.06.22.08.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 08:24:24 -0700 (PDT)
Date:   Tue, 22 Jun 2021 17:24:21 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com,
        james.qian.wang@arm.com, liviu.dudau@arm.com,
        mihail.atanassov@arm.com, brian.starkey@arm.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
        tiantao6@hisilicon.com, john.stultz@linaro.org,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
        bskeggs@redhat.com, tomba@kernel.org, hjc@rock-chips.com,
        heiko@sntech.de, benjamin.gaignard@linaro.org,
        yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        wens@csie.org, jernej.skrabec@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/22] Deprecate struct drm_device.irq_enabled
Message-ID: <YNIApfAnFCsCHoYK@phenom.ffwll.local>
References: <20210622141002.11590-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 22, 2021 at 04:09:40PM +0200, Thomas Zimmermann wrote:
> Remove references to struct drm_device.irq_enabled from modern
> DRM drivers and core.
> 
> KMS drivers enable IRQs for their devices internally. They don't
> have to keep track of the IRQ state via irq_enabled. For vblanking,
> it's cleaner to test for vblanking support directly than to test
> for enabled IRQs.
> 
> This used to be a single patch, [1] but it's now a full series.
> 
> The first 3 patches replace instances of irq_enabled that are not
> required.
> 
> Patch 4 fixes vblank ioctls to actually test for vblank support
> instead of IRQs.
> 
> THe rest of the patchset removes irq_enabled from all non-legacy
> drivers. The only exception is omapdrm, which has an internal
> dpendency on the field's value. For this drivers, the state gets
> duplicated internally.
> 
> With the patchset applied, drivers can later switch over to plain
> Linux IRQ interfaces and DRM's IRQ midlayer can be declared legacy.
> 
> v2:
> 	* keep the original test for legacy drivers in
> 	  drm_wait_vblank_ioctl() (Daniel)
> 
> [1] https://lore.kernel.org/dri-devel/20210608090301.4752-1-tzimmermann@suse.de/

On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But I've only done a very light reading of this, so please wait for driver
folks to have some time to check their own before merging.

I think a devm_ version of drm_irq_install might be helpful in further
untangling here, but that's definitely for another series.
-Daniel

> 
> Thomas Zimmermann (22):
>   drm/amdgpu: Track IRQ state in local device state
>   drm/hibmc: Call drm_irq_uninstall() unconditionally
>   drm/radeon: Track IRQ state in local device state
>   drm: Don't test for IRQ support in VBLANK ioctls
>   drm/komeda: Don't set struct drm_device.irq_enabled
>   drm/malidp: Don't set struct drm_device.irq_enabled
>   drm/exynos: Don't set struct drm_device.irq_enabled
>   drm/kirin: Don't set struct drm_device.irq_enabled
>   drm/imx: Don't set struct drm_device.irq_enabled
>   drm/mediatek: Don't set struct drm_device.irq_enabled
>   drm/nouveau: Don't set struct drm_device.irq_enabled
>   drm/omapdrm: Track IRQ state in local device state
>   drm/rockchip: Don't set struct drm_device.irq_enabled
>   drm/sti: Don't set struct drm_device.irq_enabled
>   drm/stm: Don't set struct drm_device.irq_enabled
>   drm/sun4i: Don't set struct drm_device.irq_enabled
>   drm/tegra: Don't set struct drm_device.irq_enabled
>   drm/tidss: Don't use struct drm_device.irq_enabled
>   drm/vc4: Don't set struct drm_device.irq_enabled
>   drm/vmwgfx: Don't set struct drm_device.irq_enabled
>   drm/xlnx: Don't set struct drm_device.irq_enabled
>   drm/zte: Don't set struct drm_device.irq_enabled
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c         |  6 +++---
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c |  4 ----
>  drivers/gpu/drm/arm/malidp_drv.c                |  4 ----
>  drivers/gpu/drm/drm_irq.c                       | 10 +++-------
>  drivers/gpu/drm/drm_vblank.c                    | 13 +++++++++----
>  drivers/gpu/drm/exynos/exynos_drm_drv.c         | 10 ----------
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  3 +--
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c |  2 --
>  drivers/gpu/drm/imx/dcss/dcss-kms.c             |  3 ---
>  drivers/gpu/drm/imx/imx-drm-core.c              | 11 -----------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  6 ------
>  drivers/gpu/drm/nouveau/nouveau_drm.c           |  3 ---
>  drivers/gpu/drm/omapdrm/omap_drv.h              |  2 ++
>  drivers/gpu/drm/omapdrm/omap_irq.c              |  6 +++---
>  drivers/gpu/drm/radeon/radeon_fence.c           |  2 +-
>  drivers/gpu/drm/radeon/radeon_irq_kms.c         | 16 ++++++++--------
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c     |  6 ------
>  drivers/gpu/drm/sti/sti_compositor.c            |  2 --
>  drivers/gpu/drm/stm/ltdc.c                      |  3 ---
>  drivers/gpu/drm/sun4i/sun4i_drv.c               |  2 --
>  drivers/gpu/drm/tegra/drm.c                     |  7 -------
>  drivers/gpu/drm/tidss/tidss_irq.c               |  3 ---
>  drivers/gpu/drm/vc4/vc4_kms.c                   |  1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_irq.c             |  8 --------
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c             |  2 --
>  drivers/gpu/drm/zte/zx_drm_drv.c                |  6 ------
>  26 files changed, 30 insertions(+), 111 deletions(-)
> 
> 
> base-commit: 8c1323b422f8473421682ba783b5949ddd89a3f4
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> --
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
