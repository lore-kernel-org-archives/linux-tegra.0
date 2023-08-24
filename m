Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694D7C7113B
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Aug 2023 12:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbjHXMIT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Aug 2023 08:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232697AbjHXMHt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Aug 2023 08:07:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F1CE7D;
        Thu, 24 Aug 2023 05:07:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D206A64348;
        Thu, 24 Aug 2023 12:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493D8C433C8;
        Thu, 24 Aug 2023 12:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692878866;
        bh=XGcUYxKeus/elTOoo1TjZur2p/AUG6A2tJIcsd6tkeY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rsSVe7TgROYG1eWOt5xc+RTZFGzWVP57WTUrt7RVc1v7xwhiWcgSchrbaVPEI+2tI
         n1Rh4UbOh+Ln4e6fL5ZMoOetp8KgWCwOiMLCOs+IylzDhL8RApvllbJXgiZ3GdpL8U
         i1Z2IbTVQmipwBnz/wmvTxRx68NKj7igKU3SNfFwkoxeaMxIB+khZboENPg/rHmz9K
         GBDYsOifsqOPM6DfahgDS1+TmELqmdew1kTvyVkejTiq4r9p540lLTO3unNGYRWzdT
         clXGNzTBHyFZYghbE3br+BXurpvs1+DgMi3cDunaFl0t2ZI2Kh5D2hn+HiySfUC00i
         pLn15gYif2/8g==
Date:   Thu, 24 Aug 2023 13:07:35 +0100
From:   Lee Jones <lee@kernel.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Mikko Perttunen <mperttunen@nvidia.com>,
        =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Shashank Sharma <shashank.sharma@amd.com>,
        Michal Simek <michal.simek@xilinx.com>,
        amd-gfx@lists.freedesktop.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Ben Skeggs <bskeggs@redhat.com>, linux-media@vger.kernel.org,
        Stanley Yang <Stanley.Yang@amd.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        linaro-mm-sig@lists.linaro.org, linux-tegra@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
        Jerome Glisse <glisse@freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Gourav Samaiya <gsamaiya@nvidia.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>
Subject: Re: [PATCH (set 1) 00/20] Rid W=1 warnings from GPU
Message-ID: <20230824120735.GS1380343@google.com>
References: <20230824073710.2677348-1-lee@kernel.org>
 <87wmxk4xt3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wmxk4xt3.fsf@intel.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 24 Aug 2023, Jani Nikula wrote:

> On Thu, 24 Aug 2023, Lee Jones <lee@kernel.org> wrote:
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> 
> The next question is, how do we keep it W=1 clean going forward?

My plan was to fix them all, then move each warning to W=0.

Arnd recently submitted a set doing just that for a bunch of them.

https://lore.kernel.org/all/20230811140327.3754597-1-arnd@kernel.org/

I like to think a bunch of this is built on top of my previous efforts.

GPU is a particularly tricky though - the warnings seem to come in faster
than I can squash them.  Maybe the maintainers can find a way to test
new patches on merge?

> Most people don't use W=1 because it's too noisy, so it's a bit of a
> catch-22.
> 
> In i915, we enable a lot of W=1 warnings using subdir-ccflags-y in our
> Makefile. For CI/developer use we also enable kernel-doc warnings by
> default.
> 
> Should we start enabling some of those warning flags in drm/Makefile to
> to keep the entire subsystem warning free?

That would we awesome!  We'd just need buy-in.

-- 
Lee Jones [李琼斯]
