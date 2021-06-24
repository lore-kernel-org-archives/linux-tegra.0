Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87521C49EA5
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 08:08:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68CE6613C1
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 08:08:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbhFXILB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Jun 2021 04:11:01 -0400
Received: from mga01.intel.com ([192.55.52.88]:50494 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231699AbhFXILA (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Jun 2021 04:11:00 -0400
IronPort-SDR: JHe49jnVQ3dRp3ZMzMv9Y+W8piGZpDkaEdi5VhqVKhgEQ/bbGDofRFqUyjsRA96DiEWU53yksQ
 KX8akdVEd4Dw==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="229008620"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="229008620"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 01:08:42 -0700
IronPort-SDR: v1mHNk7YTLq4tjD5PLpygsJp7Fqze5GXwAn13Kp5Vz0yOGXKTgtBHR0yr5kpfQ465GdrghRoVP
 Wpn21FG3jdhg==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="453335994"
Received: from schulke-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.59.242])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 01:08:19 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@linux.ie, alexander.deucher@amd.com,
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
        michal.simek@xilinx.com, rodrigo.vivi@intel.com,
        linux@armlinux.org.uk, kieran.bingham+renesas@ideasonboard.com,
        rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
        hamohammed.sa@gmail.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 06/27] drm/i915: Track IRQ state in local device state
In-Reply-To: <20210624072916.27703-7-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210624072916.27703-1-tzimmermann@suse.de> <20210624072916.27703-7-tzimmermann@suse.de>
Date:   Thu, 24 Jun 2021 11:08:16 +0300
Message-ID: <87fsx7u1lb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Replace usage of struct drm_device.irq_enabled with the driver's
> own state field struct drm_i915_private.irq_enabled. The field in
> the DRM device structure is considered legacy and should not be
> used by KMS drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

and ack for merging through drm-misc-next or whatever you think is best.

> ---
>  drivers/gpu/drm/i915/i915_drv.h | 2 ++
>  drivers/gpu/drm/i915/i915_irq.c | 8 ++++----
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 01e11fe38642..48c1835bd54b 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1134,6 +1134,8 @@ struct drm_i915_private {
>  	/* For i915gm/i945gm vblank irq workaround */
>  	u8 vblank_enabled;
>  
> +	bool irq_enabled;
> +
>  	/* perform PHY state sanity checks? */
>  	bool chv_phy_assert[2];
>  
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index a11bdb667241..987211f21761 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -4488,14 +4488,14 @@ int intel_irq_install(struct drm_i915_private *dev_priv)
>  	 */
>  	dev_priv->runtime_pm.irqs_enabled = true;
>  
> -	dev_priv->drm.irq_enabled = true;
> +	dev_priv->irq_enabled = true;
>  
>  	intel_irq_reset(dev_priv);
>  
>  	ret = request_irq(irq, intel_irq_handler(dev_priv),
>  			  IRQF_SHARED, DRIVER_NAME, dev_priv);
>  	if (ret < 0) {
> -		dev_priv->drm.irq_enabled = false;
> +		dev_priv->irq_enabled = false;
>  		return ret;
>  	}
>  
> @@ -4521,10 +4521,10 @@ void intel_irq_uninstall(struct drm_i915_private *dev_priv)
>  	 * intel_modeset_driver_remove() calling us out of sequence.
>  	 * Would be nice if it didn't do that...
>  	 */
> -	if (!dev_priv->drm.irq_enabled)
> +	if (!dev_priv->irq_enabled)
>  		return;
>  
> -	dev_priv->drm.irq_enabled = false;
> +	dev_priv->irq_enabled = false;
>  
>  	intel_irq_reset(dev_priv);

-- 
Jani Nikula, Intel Open Source Graphics Center
