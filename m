Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9418EC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Nov 2021 15:37:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7659B611EE
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Nov 2021 15:37:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhKDPkU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 4 Nov 2021 11:40:20 -0400
Received: from mga18.intel.com ([134.134.136.126]:5996 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229770AbhKDPkU (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 4 Nov 2021 11:40:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="218630732"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; 
   d="scan'208";a="218630732"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 08:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; 
   d="scan'208";a="490000002"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
  by orsmga007.jf.intel.com with SMTP; 04 Nov 2021 08:37:22 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 04 Nov 2021 17:37:21 +0200
Date:   Thu, 4 Nov 2021 17:37:21 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 02/13] drm/connector: Add helper to check if a mode
 requires scrambling
Message-ID: <YYP+MX9gxZVafhKk@intel.com>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211102145944.259181-3-maxime@cerno.tech>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Nov 02, 2021 at 03:59:33PM +0100, Maxime Ripard wrote:
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -424,6 +424,21 @@ static inline bool drm_mode_is_stereo(const struct drm_display_mode *mode)
>  	return mode->flags & DRM_MODE_FLAG_3D_MASK;
>  }
>  
> +/**
> + * drm_mode_hdmi_requires_scrambling - Checks if a mode requires HDMI Scrambling
> + * @mode: DRM display mode
> + *
> + * Checks if a given display mode requires the scrambling to be enabled.
> + *
> + * Returns:
> + * A boolean stating whether it's required or not.
> + */
> +static inline bool
> +drm_mode_hdmi_requires_scrambling(const struct drm_display_mode *mode)
> +{
> +	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
> +}

That's only correct for 8bpc. The actual limit is on the TMDS clock (or
rather TMDS character rate as HDMI 2.0 calls it due to the 1/1 vs. 1/4
magic for the actually transmitted TMDS clock).

-- 
Ville Syrjälä
Intel
