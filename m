Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2FCC48BDF
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 08:52:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C350613EC
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 08:52:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhFXIy0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Jun 2021 04:54:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:35036 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229796AbhFXIy0 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Jun 2021 04:54:26 -0400
IronPort-SDR: h7r+kg2UMWRzx6G9i04jpQ3S2olC60hXE+XI20qN+cImh0dZegB3kxEeg3Ir2KZhjOHoFvexuQ
 LOzg3RshuRcA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="194568609"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="194568609"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 01:52:05 -0700
IronPort-SDR: b2WPW20xI/GJO29ic6WIfxIMz72rLAtb0USOd7lNI7J+Sgm2+3/EG1ErQrLUO2vnU20Qh+TbCW
 rzKM1urai8Fg==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="487681787"
Received: from schulke-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.59.242])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 01:51:41 -0700
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
Cc:     linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-tegra@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
In-Reply-To: <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210624072916.27703-1-tzimmermann@suse.de> <20210624072916.27703-5-tzimmermann@suse.de> <87im23u1ok.fsf@intel.com> <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de>
Date:   Thu, 24 Jun 2021 11:51:37 +0300
Message-ID: <877dijtzl2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 24.06.21 um 10:06 schrieb Jani Nikula:
>> On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>>> index 3417e1ac7918..10fe16bafcb6 100644
>>> --- a/drivers/gpu/drm/drm_vblank.c
>>> +++ b/drivers/gpu/drm/drm_vblank.c
>>> @@ -1748,8 +1748,16 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>>>   	unsigned int pipe_index;
>>>   	unsigned int flags, pipe, high_pipe;
>>>   
>>> -	if (!dev->irq_enabled)
>>> -		return -EOPNOTSUPP;
>>> +#if defined(CONFIG_DRM_LEGACY)
>>> +	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY))) {
>>> +		if (!dev->irq_enabled)
>>> +			return -EOPNOTSUPP;
>>> +	} else /* if DRIVER_MODESET */
>>> +#endif
>>> +	{
>>> +		if (!drm_dev_has_vblank(dev))
>>> +			return -EOPNOTSUPP;
>>> +	}
>> 
>> Sheesh I hate this kind of inline #ifdefs.
>> 
>> Two alternate suggestions that I believe should be as just efficient:
>
> Or how about:
>
> static bool drm_wait_vblank_supported(struct drm_device *dev)
>
> {
>
> if defined(CONFIG_DRM_LEGACY)
> 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
>
> 		return dev->irq_enabled;
>
> #endif
> 	return drm_dev_has_vblank(dev);
>
> }
>
>
> ?
>
> It's inline, but still readable.

It's definitely better than the original, but it's unclear to me why
you'd prefer this over option 2) below. I guess the only reason I can
think of is emphasizing the conditional compilation. However,
IS_ENABLED() is widely used in this manner specifically to avoid inline
#if, and the compiler optimizes it away.

BR,
Jani.


>
> Best regards
> Thomas
>
>> 
>> 1) The more verbose:
>> 
>> #if defined(CONFIG_DRM_LEGACY)
>> static bool drm_wait_vblank_supported(struct drm_device *dev)
>> {
>> 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
>> 		return dev->irq_enabled;
>> 	else
>> 		return drm_dev_has_vblank(dev);
>> }
>> #else
>> static bool drm_wait_vblank_supported(struct drm_device *dev)
>> {
>> 	return drm_dev_has_vblank(dev);
>> }
>> #endif
>> 
>> 2) The more compact:
>> 
>> static bool drm_wait_vblank_supported(struct drm_device *dev)
>> {
>> 	if  (IS_ENABLED(CONFIG_DRM_LEGACY) && unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
>> 		return dev->irq_enabled;
>> 	else
>> 		return drm_dev_has_vblank(dev);
>> }
>> 
>> Then, in drm_wait_vblank_ioctl().
>> 
>> 	if (!drm_wait_vblank_supported(dev))
>> 		return -EOPNOTSUPP;
>> 
>> The compiler should do the right thing without any explicit inline
>> keywords etc.
>> 
>> BR,
>> Jani.
>> 
>>>   
>>>   	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
>>>   		return -EINVAL;
>>> @@ -2023,7 +2031,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>>   		return -EOPNOTSUPP;
>>>   
>>> -	if (!dev->irq_enabled)
>>> +	if (!drm_dev_has_vblank(dev))
>>>   		return -EOPNOTSUPP;
>>>   
>>>   	crtc = drm_crtc_find(dev, file_priv, get_seq->crtc_id);
>>> @@ -2082,7 +2090,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>>   		return -EOPNOTSUPP;
>>>   
>>> -	if (!dev->irq_enabled)
>>> +	if (!drm_dev_has_vblank(dev))
>>>   		return -EOPNOTSUPP;
>>>   
>>>   	crtc = drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
