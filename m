Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1F8C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Nov 2021 17:57:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AF4A61215
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Nov 2021 17:57:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbhKHSAb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Nov 2021 13:00:31 -0500
Received: from mga07.intel.com ([134.134.136.100]:8048 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232511AbhKHSAa (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 8 Nov 2021 13:00:30 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="295729626"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="295729626"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2021 09:55:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="499953121"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
  by fmsmga007.fm.intel.com with SMTP; 08 Nov 2021 09:55:01 -0800
Received: by stinkbox (sSMTP sendmail emulation); Mon, 08 Nov 2021 19:55:00 +0200
Date:   Mon, 8 Nov 2021 19:55:00 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
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
Message-ID: <YYlkdHzW4ir07Gtk@intel.com>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-3-maxime@cerno.tech>
 <YYP+MX9gxZVafhKk@intel.com>
 <YYVxtp9PZiR3ZOjp@phenom.ffwll.local>
 <YYV0bArjRbvYJ2K2@intel.com>
 <20211108155834.6zz236ll75bxwcrk@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211108155834.6zz236ll75bxwcrk@gilmour>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Nov 08, 2021 at 04:58:34PM +0100, Maxime Ripard wrote:
> On Fri, Nov 05, 2021 at 08:14:04PM +0200, Ville Syrjälä wrote:
> > On Fri, Nov 05, 2021 at 07:02:30PM +0100, Daniel Vetter wrote:
> > > On Thu, Nov 04, 2021 at 05:37:21PM +0200, Ville Syrjälä wrote:
> > > > On Tue, Nov 02, 2021 at 03:59:33PM +0100, Maxime Ripard wrote:
> > > > > --- a/include/drm/drm_modes.h
> > > > > +++ b/include/drm/drm_modes.h
> > > > > @@ -424,6 +424,21 @@ static inline bool drm_mode_is_stereo(const struct drm_display_mode *mode)
> > > > >  	return mode->flags & DRM_MODE_FLAG_3D_MASK;
> > > > >  }
> > > > >  
> > > > > +/**
> > > > > + * drm_mode_hdmi_requires_scrambling - Checks if a mode requires HDMI Scrambling
> > > > > + * @mode: DRM display mode
> > > > > + *
> > > > > + * Checks if a given display mode requires the scrambling to be enabled.
> > > > > + *
> > > > > + * Returns:
> > > > > + * A boolean stating whether it's required or not.
> > > > > + */
> > > > > +static inline bool
> > > > > +drm_mode_hdmi_requires_scrambling(const struct drm_display_mode *mode)
> > > > > +{
> > > > > +	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
> > > > > +}
> > > > 
> > > > That's only correct for 8bpc. The actual limit is on the TMDS clock (or
> > > > rather TMDS character rate as HDMI 2.0 calls it due to the 1/1 vs. 1/4
> > > > magic for the actually transmitted TMDS clock).
> > > 
> > > Yeah we might need to add the bus format for the cable here too, to make
> > > this complete.
> > 
> > I don't think we have a usable thing for that on the drm level, so
> > would need to invent something. Oh, and the mode->clock vs. 
> > mode->crtc_clock funny business also limits the usability of this
> > approach. So probably just easiest to pass in the the driver calculated
> > TMDS clock instead.
> 
> If we look at all (I think?) the existing users of scrambling in KMS as
> of 5.15, only i915 seems to use crtc_clock (which, in retrospect, seems
> to be the right thing to do), and only i915 and dw-hdmi use an output
> format, i915 rolling its own, and dw-hdmi using the mbus formats.
> 
> I think using the mbus format here makes the most sense: i915 already is
> rolling a whole bunch of other code, and we use the mbus defines for the
> bridge format enumeration as well which is probably going to have some
> interaction.
> 
> I'm not quite sure what to do next though. The whole point of that
> series is to streamline as much as possible the scrambling and TMDS
> ratio setup to avoid the duplication we already have in the drivers that
> support it, every one using the mostly-the-same-but-slightly-different
> logic to configure it.
> 
> The mode is fortunately stored in generic structures so it's easy to
> make that decision. Having to take into account the output format
> however makes it mandatory to move the bus format in the
> drm_connector_state(?) structure too.

I think involving state objects and the like is just going to make
it harder to share code between all drivers, if that is the goal.
Just a few tiny helpers I think is what would allow the broadest 
reuse. I guess you could build additional midlayer on top of those
for some drivers if you wish.

As for the bus_format stuff, that looks at the same time overkill,
and insufficiently documented. I guess its main purpose is to exactly
defines how some digtal bus works, which makes sense when you're
chaining a bunch of random chips together. But looks overly complicated
to me for defining what to output from a HDMI encoder. Looking at the
defines I wouldn't even know what to use for HDMI actually. All we
really want is RGB 4:4:4 vs. YCbCr 4:4:4 vs. YCbCr 4:2:2 vs. YCbCr 4:2:0.
Beyond that level of detail we don't care how each bit gets transferred
etc. Hence enum intel_output_format in i915.

-- 
Ville Syrjälä
Intel
