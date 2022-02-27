Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AADC433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Feb 2022 18:55:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbiB0Szs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Feb 2022 13:55:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbiB0Szr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Feb 2022 13:55:47 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980845BD08
        for <linux-tegra@vger.kernel.org>; Sun, 27 Feb 2022 10:55:10 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d187so9112447pfa.10
        for <linux-tegra@vger.kernel.org>; Sun, 27 Feb 2022 10:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BUutuHj2Y4sBYwPZrJt3gLoK5iq9Xx8GjQfOHIMA2K4=;
        b=LssERTi7+6Oc9GsiOtykaNrIGp0U5bK2BuY/HFdPIvYfzS4lKrCtJPutZwYXtfGgi7
         NhOfUN4u5XVvksPllEuJM3X0YaL3u+W0zL2LSDOTflQEbi4ODxmT7SyggMv8NE08FghK
         6W81GWSdkfZbjNqYrry1cPcRifymCajTrSOyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BUutuHj2Y4sBYwPZrJt3gLoK5iq9Xx8GjQfOHIMA2K4=;
        b=Za/smz9Sk7F9W4h48pNErnV3xA0FdQZtXCDTQ2f6GYISqNim4lgFhAd/YowLeZXmc1
         Vp2S7ODuNdVNXQ0MsacKg5FMgFdBjZ9heBKh8ME32K98Dawy/FCnNwgf3AXCKHH2sTVP
         ELBAJxvnULENYHB14Aur2nW8P734+2GfPDAS1MGdjwDVHHDdvNNLMradwEHZ6iz9UeCo
         YEtk+0DIs52Z9sdZZa1H7fCzTpDu33LEr6NprzSJC2dmO0SOAt96x1wCucfUaQw1ngFT
         ukCb5gQTM70JKQZmW8GKZw7U21YJNBeoPWefW4GwH7EdMW+61AUKWKof08RVyfRxze5b
         tXIg==
X-Gm-Message-State: AOAM532uGAyhQwU1Kcvo9i898/KVi1LPU3WdqtJ46jgWN8YHD4cHezOK
        WgmTJldEA8bwwSOGdKZRVVJIjjD/OFh2mA==
X-Google-Smtp-Source: ABdhPJy00TjfcczrXbPQJOZnPgE7hz1pTHrH+oGIaH1lig5NQe0zrVzrE1l1NTv6ss5VmpjLSU6PFA==
X-Received: by 2002:a63:1350:0:b0:378:7fb4:63eb with SMTP id 16-20020a631350000000b003787fb463ebmr4139383pgt.457.1645988109770;
        Sun, 27 Feb 2022 10:55:09 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z12-20020aa7888c000000b004f3fc6d95casm2909273pfe.20.2022.02.27.10.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 10:55:09 -0800 (PST)
Date:   Sun, 27 Feb 2022 10:55:08 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Lyude Paul <lyude@redhat.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>, Dave Airlie <airlied@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
        Uma Shankar <uma.shankar@intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 0/2] drm/dp: Fix out-of-bounds reads
Message-ID: <202202271053.91D3CE109@keescook>
References: <20220225035610.2552144-1-keescook@chromium.org>
 <YhihqzqPW7qbYnB9@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhihqzqPW7qbYnB9@orome>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Feb 25, 2022 at 10:30:19AM +0100, Thierry Reding wrote:
> On Thu, Feb 24, 2022 at 07:56:08PM -0800, Kees Cook wrote:
> > Hi,
> > 
> > I'm sending these again, as they still need fixing. They have been
> > rebased due to the drm_dp_helper code being moved into a subdirectory.
> 
> Yeah, I noticed the other day that this had been partially reverted by
> the DP code move. I've applied this now, though it didn't apply cleanly,
> so I'll do a couple of test builds to make sure my resolution is correct
> and will push this out later on.

Awesome; thank you!

Yeah, I had based on drm/drm-next rather than drm-misc/drm-misc-next. I
wasn't sure which tree I needed to base on after the files moved.

FWIW, the resulting patches look good to me. Thanks for fixing them up!

-Kees

-- 
Kees Cook
