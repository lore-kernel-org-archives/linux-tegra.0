Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFEEC48BDF
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 16:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0A2661353
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 16:12:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhFVQOT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 12:14:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50374 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhFVQOS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 12:14:18 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82C49FE0;
        Tue, 22 Jun 2021 18:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624378320;
        bh=E1KjYBr0PRd//Rh/JFA2D9huXNngtbcIo60EYm6yjcM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hh92VDHFFFuGY+ij89Tk/0LAzaSW+kEr9dWfQrDPQQWsRe5C3zTHMpzJy9EtqmNe7
         fe8CwxVd7hReruVHlt2Vz9ofcwK7MrKI8+pkmwKvlFlKCjbjB5RjgHD9QUiLCULLa0
         YjXygLYAAbXJHyKajZ/6zxMhq99nKm9MtdEjklaw=
Date:   Tue, 22 Jun 2021 19:11:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
        hyun.kwon@xilinx.com, michal.simek@xilinx.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/22] Deprecate struct drm_device.irq_enabled
Message-ID: <YNILtLMkI3uoH7mJ@pendragon.ideasonboard.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thomas,

Thank you for the patches.

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

The list seems to be missing armada, rcar-du and vkms. It would also be
nice to address i915 if possible.

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

-- 
Regards,

Laurent Pinchart
