Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3490C49EA7
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 10:48:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C93A761400
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 10:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbhFXKuz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Jun 2021 06:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbhFXKuz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Jun 2021 06:50:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16F0C061756;
        Thu, 24 Jun 2021 03:48:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 571A61254;
        Thu, 24 Jun 2021 12:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624531713;
        bh=fIk5wMEN1B7CMPOBGbKPIoyHWGb/NJbW3Q+hz7HFjMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OoLj5b8l/ofOHdX9hMnRB54xFpHcmL5qCdyqf0btt+Wqy//1J8rGXdoC24H1uq8n1
         048gJuhXofMiwBWBvQAq72XeLSOhwF8Jn/QOm5PZoqoyR+V/AZX9s6u3YYgXawYOjf
         yqs50G3bJBKCjDvGArnYQnXaHNQWu9PnXSCiArt0=
Date:   Thu, 24 Jun 2021 13:48:03 +0300
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
        jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
        linux@armlinux.org.uk, kieran.bingham+renesas@ideasonboard.com,
        rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
        hamohammed.sa@gmail.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 24/27] drm/vkms: Don't set struct
 drm_device.irq_enabled
Message-ID: <YNRi4yR6lQTix7ar@pendragon.ideasonboard.com>
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-25-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210624072916.27703-25-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thomas,

Thank you for the patch.

On Thu, Jun 24, 2021 at 09:29:13AM +0200, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in vkms.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 027ffe759440..496de38ad983 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -163,8 +163,6 @@ static int vkms_create(struct vkms_config *config)
>  		goto out_devres;
>  	}
>  
> -	vkms_device->drm.irq_enabled = true;
> -
>  	ret = drm_vblank_init(&vkms_device->drm, 1);
>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");

-- 
Regards,

Laurent Pinchart
