Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F450C49EA5
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 12:36:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CCE0613FA
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 12:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhFXMjM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Jun 2021 08:39:12 -0400
Received: from mga02.intel.com ([134.134.136.20]:50568 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230028AbhFXMjL (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Jun 2021 08:39:11 -0400
IronPort-SDR: NKskzps/vnRV8A1x+hcB2zyqJNqZYwxT4TrnchspCpqrkH026ZBZmUZWFDs4tsnObi7DqgggEN
 TVw64wuWLE3A==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="194599216"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="194599216"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 05:36:51 -0700
IronPort-SDR: 9KysYK/2HzWxqWorwm4RDCvD9fzYUECjO+Kr/55Zbl/DRmlbCimO4edKqAHIWPRoPcJqgJVxQB
 +d0WGJ9B4vNg==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="487740905"
Received: from schulke-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.59.242])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 05:36:27 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
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
        wens@csie.org, jernej.skrabec@gmail.com, jonathanh@nvidia.com,
        jyri.sarha@iki.fi, emma@anholt.net,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com, rodrigo.vivi@intel.com,
        linux@armlinux.org.uk, kieran.bingham+renesas@ideasonboard.com,
        rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
        hamohammed.sa@gmail.com, linux-samsung-soc@vger.kernel.org,
        nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-rockchip@lists.infradead.org,
        linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
In-Reply-To: <YNR0m2DJsdIW3NAZ@orome.fritz.box>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210624072916.27703-1-tzimmermann@suse.de> <20210624072916.27703-5-tzimmermann@suse.de> <87im23u1ok.fsf@intel.com> <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de> <877dijtzl2.fsf@intel.com> <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de> <YNR0m2DJsdIW3NAZ@orome.fritz.box>
Date:   Thu, 24 Jun 2021 15:36:24 +0300
Message-ID: <87zgvfsalz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 24 Jun 2021, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Thu, Jun 24, 2021 at 11:07:57AM +0200, Thomas Zimmermann wrote:
>> Hi
>> 
>> Am 24.06.21 um 10:51 schrieb Jani Nikula:
>> > On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> > > Hi
>> > > 
>> > > Am 24.06.21 um 10:06 schrieb Jani Nikula:
>> > > > On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> > > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> > > > > index 3417e1ac7918..10fe16bafcb6 100644
>> > > > > --- a/drivers/gpu/drm/drm_vblank.c
>> > > > > +++ b/drivers/gpu/drm/drm_vblank.c
>> > > > > @@ -1748,8 +1748,16 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>> > > > >    	unsigned int pipe_index;
>> > > > >    	unsigned int flags, pipe, high_pipe;
>> > > > > -	if (!dev->irq_enabled)
>> > > > > -		return -EOPNOTSUPP;
>> > > > > +#if defined(CONFIG_DRM_LEGACY)
>> > > > > +	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY))) {
>> > > > > +		if (!dev->irq_enabled)
>> > > > > +			return -EOPNOTSUPP;
>> > > > > +	} else /* if DRIVER_MODESET */
>> > > > > +#endif
>> > > > > +	{
>> > > > > +		if (!drm_dev_has_vblank(dev))
>> > > > > +			return -EOPNOTSUPP;
>> > > > > +	}
>> > > > 
>> > > > Sheesh I hate this kind of inline #ifdefs.
>> > > > 
>> > > > Two alternate suggestions that I believe should be as just efficient:
>> > > 
>> > > Or how about:
>> > > 
>> > > static bool drm_wait_vblank_supported(struct drm_device *dev)
>> > > 
>> > > {
>> > > 
>> > > if defined(CONFIG_DRM_LEGACY)
>> > > 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
>> > > 
>> > > 		return dev->irq_enabled;
>> > > 
>> > > #endif
>> > > 	return drm_dev_has_vblank(dev);
>> > > 
>> > > }
>> > > 
>> > > 
>> > > ?
>> > > 
>> > > It's inline, but still readable.
>> > 
>> > It's definitely better than the original, but it's unclear to me why
>> > you'd prefer this over option 2) below. I guess the only reason I can
>> > think of is emphasizing the conditional compilation. However,
>> > IS_ENABLED() is widely used in this manner specifically to avoid inline
>> > #if, and the compiler optimizes it away.
>> 
>> It's simply more readable to me as the condition is simpler. But option 2 is
>> also ok.
>
> Perhaps do something like this, then:
>
> 	if (IS_ENABLED(CONFIG_DRM_LEGACY)) {
> 		if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
> 			return dev->irq_enabled;
> 	}
>
> 	return drm_dev_has_vblank(dev);
>
> That's about just as readable as the variant involving the preprocessor
> but has all the benefits of not using the preprocessor.

Looks like a winner to me. :)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
