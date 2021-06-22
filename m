Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBC9C48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 16:18:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A195A61289
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 16:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhFVQUp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 12:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhFVQUp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 12:20:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEBAC061574;
        Tue, 22 Jun 2021 09:18:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C99E10C5;
        Tue, 22 Jun 2021 18:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624378705;
        bh=VZRaHkXmbWt79g3HywVIeyxN42SRIqciWe7F8pv0Ohc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PAFCiMffBQrxmL9kbXF04+tAFxSNJSey1X3TgZSJElZPT76zpOsJr1VxvVuS+2pLs
         jEuQdHa3Te4yK0fbtauEH5RYNqkMlGX9ety09L1TcAb/y8wrcCehVwWI0z+5zEyTxS
         Ek7I/w21y8yHUPn5eB+PAvMDVy77oMs0oniYqpo4=
Date:   Tue, 22 Jun 2021 19:17:57 +0300
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
Message-ID: <YNINNfQjAd3R2H+0@pendragon.ideasonboard.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <YNILtLMkI3uoH7mJ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YNILtLMkI3uoH7mJ@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 22, 2021 at 07:11:33PM +0300, Laurent Pinchart wrote:
> Hi Thomas,
> 
> Thank you for the patches.
> 
> On Tue, Jun 22, 2021 at 04:09:40PM +0200, Thomas Zimmermann wrote:
> > Remove references to struct drm_device.irq_enabled from modern
> > DRM drivers and core.
> > 
> > KMS drivers enable IRQs for their devices internally. They don't
> > have to keep track of the IRQ state via irq_enabled. For vblanking,
> > it's cleaner to test for vblanking support directly than to test
> > for enabled IRQs.
> > 
> > This used to be a single patch, [1] but it's now a full series.
> > 
> > The first 3 patches replace instances of irq_enabled that are not
> > required.
> > 
> > Patch 4 fixes vblank ioctls to actually test for vblank support
> > instead of IRQs.
> > 
> > THe rest of the patchset removes irq_enabled from all non-legacy
> > drivers. The only exception is omapdrm, which has an internal
> > dpendency on the field's value. For this drivers, the state gets
> > duplicated internally.
> > 
> > With the patchset applied, drivers can later switch over to plain
> > Linux IRQ interfaces and DRM's IRQ midlayer can be declared legacy.
> > 
> > v2:
> > 	* keep the original test for legacy drivers in
> > 	  drm_wait_vblank_ioctl() (Daniel)
> > 
> > [1] https://lore.kernel.org/dri-devel/20210608090301.4752-1-tzimmermann@suse.de/
> > 
> > Thomas Zimmermann (22):
> >   drm/amdgpu: Track IRQ state in local device state
> >   drm/hibmc: Call drm_irq_uninstall() unconditionally
> >   drm/radeon: Track IRQ state in local device state
> >   drm: Don't test for IRQ support in VBLANK ioctls
> >   drm/komeda: Don't set struct drm_device.irq_enabled
> >   drm/malidp: Don't set struct drm_device.irq_enabled
> >   drm/exynos: Don't set struct drm_device.irq_enabled
> >   drm/kirin: Don't set struct drm_device.irq_enabled
> >   drm/imx: Don't set struct drm_device.irq_enabled
> >   drm/mediatek: Don't set struct drm_device.irq_enabled
> >   drm/nouveau: Don't set struct drm_device.irq_enabled
> >   drm/omapdrm: Track IRQ state in local device state
> >   drm/rockchip: Don't set struct drm_device.irq_enabled
> >   drm/sti: Don't set struct drm_device.irq_enabled
> >   drm/stm: Don't set struct drm_device.irq_enabled
> >   drm/sun4i: Don't set struct drm_device.irq_enabled
> >   drm/tegra: Don't set struct drm_device.irq_enabled
> >   drm/tidss: Don't use struct drm_device.irq_enabled
> >   drm/vc4: Don't set struct drm_device.irq_enabled
> >   drm/vmwgfx: Don't set struct drm_device.irq_enabled
> >   drm/xlnx: Don't set struct drm_device.irq_enabled
> >   drm/zte: Don't set struct drm_device.irq_enabled
> 
> The list seems to be missing armada, rcar-du and vkms. It would also be
> nice to address i915 if possible.

In addition to this, for all the existing patches,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> >  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c         |  6 +++---
> >  drivers/gpu/drm/arm/display/komeda/komeda_kms.c |  4 ----
> >  drivers/gpu/drm/arm/malidp_drv.c                |  4 ----
> >  drivers/gpu/drm/drm_irq.c                       | 10 +++-------
> >  drivers/gpu/drm/drm_vblank.c                    | 13 +++++++++----
> >  drivers/gpu/drm/exynos/exynos_drm_drv.c         | 10 ----------
> >  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  3 +--
> >  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c |  2 --
> >  drivers/gpu/drm/imx/dcss/dcss-kms.c             |  3 ---
> >  drivers/gpu/drm/imx/imx-drm-core.c              | 11 -----------
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  6 ------
> >  drivers/gpu/drm/nouveau/nouveau_drm.c           |  3 ---
> >  drivers/gpu/drm/omapdrm/omap_drv.h              |  2 ++
> >  drivers/gpu/drm/omapdrm/omap_irq.c              |  6 +++---
> >  drivers/gpu/drm/radeon/radeon_fence.c           |  2 +-
> >  drivers/gpu/drm/radeon/radeon_irq_kms.c         | 16 ++++++++--------
> >  drivers/gpu/drm/rockchip/rockchip_drm_drv.c     |  6 ------
> >  drivers/gpu/drm/sti/sti_compositor.c            |  2 --
> >  drivers/gpu/drm/stm/ltdc.c                      |  3 ---
> >  drivers/gpu/drm/sun4i/sun4i_drv.c               |  2 --
> >  drivers/gpu/drm/tegra/drm.c                     |  7 -------
> >  drivers/gpu/drm/tidss/tidss_irq.c               |  3 ---
> >  drivers/gpu/drm/vc4/vc4_kms.c                   |  1 -
> >  drivers/gpu/drm/vmwgfx/vmwgfx_irq.c             |  8 --------
> >  drivers/gpu/drm/xlnx/zynqmp_dpsub.c             |  2 --
> >  drivers/gpu/drm/zte/zx_drm_drv.c                |  6 ------
> >  26 files changed, 30 insertions(+), 111 deletions(-)
> > 
> > 
> > base-commit: 8c1323b422f8473421682ba783b5949ddd89a3f4
> > prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> > prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24

-- 
Regards,

Laurent Pinchart
