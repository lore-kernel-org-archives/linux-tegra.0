Return-Path: <SRS0=4JQ8=EL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F2BC5517A
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 18:15:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 265CD20709
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 18:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="IyWaPau7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731821AbgKESPM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Nov 2020 13:15:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732222AbgKESPI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 13:15:08 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2D9C0613D2
        for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2020 10:15:07 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id i18so2319585ots.0
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2020 10:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2lVJy0oZJ1HKj/RNi/yGkNbXnVBFsYr/3+ED5ZMQfKw=;
        b=IyWaPau7ZYEzIkgrk5Vh4h4G9HhBgXbnf18iSExSSwD8Va8GOuKADUz4CytksalbiW
         MzScsBKf5oiY2HuZ1YhHj0f7X2yZf4RR6/ROIepItR8F8D/GCz6dcRvPz2s9Pv5dXK3q
         wNxzRh7wgI7g0lSub9uEkZLBBMgnB7KSZ/94o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2lVJy0oZJ1HKj/RNi/yGkNbXnVBFsYr/3+ED5ZMQfKw=;
        b=uXGowuR5dMTqPfRwyk5Md1Qh9ctPMfE37cC3RsnkFNnC3Y6LlZ4IKPNLwq8vTNObmq
         1rzjFzvrcvgynjXMfAskXSMCiaXgm/lbmowJY53Yokdwfddq2bPqkteSWe97WVVNUc0u
         hR9PpFGjO0HfdqU92FAScdPkX9QK8Vd17831gMPNOxtIPRMCP+MQlPda9A0S1ZSBrgzZ
         +eVu/hFPdnuL6PSG1m0Sx8ZoYaM4UlWMxnwZoheiEhyK014hGfKaDxNEsamsS+iljtpq
         Ff5YppQ0GKUe6BviEnyi81l8g9F5USy2cNNV7WpF4psAPyET3qM+ueyW9MWfEUQfv3F4
         TvkQ==
X-Gm-Message-State: AOAM530ZODnJljC02TqH7nxrk7jOo0MZbCBAUiJBUyCwvRSYnAEOV+N+
        zclv6kNTBt2UXmBo9P7OLTp9Tg/0WEcAhsMLlij70g==
X-Google-Smtp-Source: ABdhPJz6LySZvQ0VpbbSmLJZyloCrKQbelizcXBsEwRVJaITj+vGbbcw3XfkOTnXZG1mD1JdtddL+vEJaCj1UVIENNw=
X-Received: by 2002:a9d:3b4:: with SMTP id f49mr2710790otf.188.1604600105882;
 Thu, 05 Nov 2020 10:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105164841.GH485884@ulmo> <20201105181053.GP4488@dell>
In-Reply-To: <20201105181053.GP4488@dell>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 5 Nov 2020 19:14:54 +0100
Message-ID: <CAKMK7uEyW_KJ1qC3gLASDe4Qyk_5UMr+yCu7VVVdAq+Z0J6RwQ@mail.gmail.com>
Subject: Re: [PATCH 00/19] [Set 1] Rid W=1 warnings from GPU
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Christian Koenig <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        David Francis <David.Francis@amd.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Fabio Estevam <festevam@gmail.com>,
        Gareth Hughes <gareth@valinux.com>,
        Huang Rui <ray.huang@amd.com>, Jason Yan <yanaijie@huawei.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jingoo Han <jg1.han@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Lyude Paul <lyude@redhat.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <rob.clark@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 5, 2020 at 7:10 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Thu, 05 Nov 2020, Thierry Reding wrote:
>
> > On Thu, Nov 05, 2020 at 02:44:58PM +0000, Lee Jones wrote:
> > > This set is part of a larger effort attempting to clean-up W=1
> > > kernel builds, which are currently overwhelmingly riddled with
> > > niggly little warnings.
> > >
> > > There are 5000 warnings to work through.
> > >
> > > It will take a couple more sets.
> > >
> > > Lee Jones (19):
> > >   gpu: host1x: bus: Add missing description for 'driver'
> > >   gpu: ipu-v3: ipu-di: Strip out 2 unused 'di_sync_config' entries
> > >   gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as __always_unused
> > >   gpu: drm: omapdrm: omap_irq: Fix a couple of doc-rot issues
> > >   gpu: drm: selftests: test-drm_mm: Mark 'hole_end' as always_unused
> > >   gpu: drm: scheduler: sched_main: Provide missing description for
> > >     'sched' paramter
> > >   gpu: drm: scheduler: sched_entity: Demote non-conformant kernel-doc
> > >     headers
> > >   gpu: drm: omapdrm: dss: dsi: Rework and remove a few unused variables
> > >   gpu: drm: selftests: test-drm_framebuffer: Remove set but unused
> > >     variable 'fb'
> > >   gpu: drm: ttm: ttm_bo: Fix one function header - demote lots of
> > >     kernel-doc abuses
> > >   gpu: drm: panel: panel-simple: Fix 'struct panel_desc's header
> > >   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
> > >     'analogix_dp_write_byte_to_dpcd'
> > >   gpu: drm: ttm: ttm_tt: Demote kernel-doc header format abuses
> > >   gpu: drm: selftests: test-drm_dp_mst_helper: Place 'struct
> > >     drm_dp_sideband_msg_req_body' onto the heap
> > >   gpu: drm: radeon: radeon_drv: Remove unused variable 'ret'
> > >   gpu: drm: panel: panel-ilitek-ili9322: Demote non-conformant
> > >     kernel-doc header
> > >   gpu: drm: radeon: radeon_device: Fix a bunch of kernel-doc
> > >     misdemeanours
> > >   gpu: drm: amd: amdgpu: amdgpu: Mark global variables as __maybe_unused
> > >   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
> > >     'analogix_dp_start_aux_transaction'
> >
> > As commented on the other patches, the subject prefixes on most of these
> > look wrong, but it's generally a nice cleanup.
>
> The prefixes are automated.  I'll add this to my list of awkward
> subsystems and go through them all manually again tomorrow. :D

tbh for autmoation they look really good :-)

I'd say if you replace the intermediate ": " with just a / you'll be
perfectly in style for drivers/gpu. But really I think it's ok as-is,
imo no need to change since this is a giantic tree wide effort.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
