Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E434C761A6
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Mar 2023 11:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbjC3LqH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 30 Mar 2023 07:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbjC3Lps (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Mar 2023 07:45:48 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98FDBB84
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 04:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680176726; x=1711712726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=k/mv4rPn58080aiy/VkVwoYKI4gFKfYIxJEtnNThHLM=;
  b=E0zRsWn7KUpUVODCDBLqUkCAiUBPsTDLEhBt8GxnP9sfFF5DFJUYXpck
   DNcYdPvKud8vUH62/jujwa0sQrPLAgBDa79dOLv0y2aryFZJnp680ZAKC
   69NasHTgo1UCYC6d+MsETbZrFRgVj8NuvJ+9S080YV/7r3Z2LpgzD+GWm
   5IUUDhhQlGKSXqfLY0/zUrwHfFTminAs7gh8bn4qWDJk/Ut/6CPUFe1AK
   foyUgdMxIuUwPntwujQQqzLBJ3W7Xb5T84jMPo7j1n/ncb+jCtTL77Pde
   M40aSqKxCgBMvSb1lYkXSOA76HsjofTtw2ZmF9OpS+qdP9T3FKJD1+7PX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427419852"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="427419852"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="858890300"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="858890300"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
  by orsmga005.jf.intel.com with SMTP; 30 Mar 2023 04:45:03 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 30 Mar 2023 14:45:02 +0300
Date:   Thu, 30 Mar 2023 14:45:02 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     dri-devel@lists.freedesktop.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Emma Anholt <emma@anholt.net>, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/scdc-helper: Pimp SCDC debugs
Message-ID: <ZCV2Pge2+wdB5HEI@intel.com>
References: <20230329171402.2772-1-ville.syrjala@linux.intel.com>
 <20230330084404.5uku6p42rorcuhv2@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230330084404.5uku6p42rorcuhv2@penduick>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Mar 30, 2023 at 10:44:04AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Mar 29, 2023 at 08:14:02PM +0300, Ville Syrjala wrote:
> > diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
> > index c3ad4ab2b456..2b124152384c 100644
> > --- a/drivers/gpu/drm/display/drm_scdc_helper.c
> > +++ b/drivers/gpu/drm/display/drm_scdc_helper.c
> > @@ -26,6 +26,8 @@
> >  #include <linux/delay.h>
> >  
> >  #include <drm/display/drm_scdc_helper.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_device.h>
> >  #include <drm/drm_print.h>
> >  
> >  /**
> > @@ -140,6 +142,7 @@ EXPORT_SYMBOL(drm_scdc_write);
> >  
> >  /**
> >   * drm_scdc_get_scrambling_status - what is status of scrambling?
> > + * @connector: connector
> >   * @adapter: I2C adapter for DDC channel
> >   *
> >   * Reads the scrambler status over SCDC, and checks the
> > @@ -148,14 +151,17 @@ EXPORT_SYMBOL(drm_scdc_write);
> >   * Returns:
> >   * True if the scrambling is enabled, false otherwise.
> >   */
> > -bool drm_scdc_get_scrambling_status(struct i2c_adapter *adapter)
> > +bool drm_scdc_get_scrambling_status(struct drm_connector *connector,
> > +				    struct i2c_adapter *adapter)
> 
> Is there any driver where adapter isn't equal to connector->ddc?

I figured most of them since they all maintain their own ddc
pointer elsewhere. But looks like the drivers using the scdc
helper might all be setting connector->ddc for their HDMI
connectors despite that.

Even i915 does that apparently. My recollection was otherwise
since I have a branch waiting somewhere that changes the whole
driver to use connector->ddc.

I guess someone took a bunch of shortcuts to get connector->ddc
populated but then didn't finish the job by clearing out the
old pointers.

> 
> If not, there's no reason to pass both

Yeah, that did cross my mind. But left it out with in
the belief that it can't be done yet.

-- 
Ville Syrjälä
Intel
