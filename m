Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B02C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Nov 2021 18:02:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0049B61053
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Nov 2021 18:02:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhKESFO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Nov 2021 14:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234525AbhKESFO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Nov 2021 14:05:14 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BED3C061714
        for <linux-tegra@vger.kernel.org>; Fri,  5 Nov 2021 11:02:34 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t30so14953970wra.10
        for <linux-tegra@vger.kernel.org>; Fri, 05 Nov 2021 11:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wxGKxEHljASS5rB7voToZN/AMD1KStDY75a5p4ffPiw=;
        b=en+3TI/Udn7dHS5mVo4zeHiPR4Z3SDUkMmKjZ8ZZdnvfwNqY+Pi6XKHHsxFJEuAGNY
         9vcecMNkSBJIyNBubF2ynEejPNlwjEAnQsmdmRseFesA47YZDrFZkFZ6bRgq3adRhDXi
         Ltm0Lk7y/jOtF1C9YJjWkS3hnUvZuVSuE+VJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wxGKxEHljASS5rB7voToZN/AMD1KStDY75a5p4ffPiw=;
        b=urRLt09B9DXiMfVyLlNJ547GtUbQcucA5Sm6A6bypOjgjP9Yf1qf4nDRgb2Dg02aUB
         DEM6HuaXmkZeREde4HJNiSkJ1RzSGjwLDtetBs0/whNZQ2edIptn1mwtNRSvHoDPCnF/
         qrtunKb/CRveHBuLPDrfOApcNVv6KUMQ4O8yGVRpYu+jZ/x1NoI9UUq41/1uJzQwtRLz
         gSvDGnk04zuXa9JNVPMPD/4B4iuwhXW3vOj6tyyUr94p3mGf2Q5htviTzdoxxi+7xbHL
         f3I0Z649bGj12QUocyZUyTwL9ccjfiaMf8/dEwI1rzcCzSWfX1119FChptXYqMa+lZsr
         9qSA==
X-Gm-Message-State: AOAM530C6cxrtk61ApyBLSfezbxxRN9AbXZjeTAWISXhxRoV0ascto1+
        cfY4bLydIDZQseM3FVlkij4TCg==
X-Google-Smtp-Source: ABdhPJz7oIITjgoNuO3Z02F9mYAjRiZ4aSy7oJTIbdlboc/KTkkVDnS5eI8MygYZXCQKElN/uBe9XA==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr66687298wrh.220.1636135352936;
        Fri, 05 Nov 2021 11:02:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s13sm12001028wmc.47.2021.11.05.11.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 11:02:32 -0700 (PDT)
Date:   Fri, 5 Nov 2021 19:02:30 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc:     Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
        Dom Cobley <dom@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH 02/13] drm/connector: Add helper to check if a mode
 requires scrambling
Message-ID: <YYVxtp9PZiR3ZOjp@phenom.ffwll.local>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-3-maxime@cerno.tech>
 <YYP+MX9gxZVafhKk@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYP+MX9gxZVafhKk@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 04, 2021 at 05:37:21PM +0200, Ville Syrjälä wrote:
> On Tue, Nov 02, 2021 at 03:59:33PM +0100, Maxime Ripard wrote:
> > --- a/include/drm/drm_modes.h
> > +++ b/include/drm/drm_modes.h
> > @@ -424,6 +424,21 @@ static inline bool drm_mode_is_stereo(const struct drm_display_mode *mode)
> >  	return mode->flags & DRM_MODE_FLAG_3D_MASK;
> >  }
> >  
> > +/**
> > + * drm_mode_hdmi_requires_scrambling - Checks if a mode requires HDMI Scrambling
> > + * @mode: DRM display mode
> > + *
> > + * Checks if a given display mode requires the scrambling to be enabled.
> > + *
> > + * Returns:
> > + * A boolean stating whether it's required or not.
> > + */
> > +static inline bool
> > +drm_mode_hdmi_requires_scrambling(const struct drm_display_mode *mode)
> > +{
> > +	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
> > +}
> 
> That's only correct for 8bpc. The actual limit is on the TMDS clock (or
> rather TMDS character rate as HDMI 2.0 calls it due to the 1/1 vs. 1/4
> magic for the actually transmitted TMDS clock).

Yeah we might need to add the bus format for the cable here too, to make
this complete.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
