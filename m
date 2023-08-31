Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFA2C83F2E
	for <linux-tegra@archiver.kernel.org>; Thu, 31 Aug 2023 08:04:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbjHaIEq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 31 Aug 2023 04:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234729AbjHaIEp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 31 Aug 2023 04:04:45 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF8D1A4
        for <linux-tegra@vger.kernel.org>; Thu, 31 Aug 2023 01:04:42 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5711d5dac14so139711eaf.0
        for <linux-tegra@vger.kernel.org>; Thu, 31 Aug 2023 01:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1693469081; x=1694073881; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eVDMUJusfvGNMe6U/cv080svMtDMV7FPoLJOG6+JEFs=;
        b=CtqTcQXUCYvseTqQZaWtNj09s5DEdkrW95V+eqb6KRYmLY5UpRLlBXtK2Y8ATUhlgN
         AFP5T+Q1ZUJfLZsAEIDyFeAQ3UaMAcXi7TKXI2JkVnIULCg/3yS8SYcJMxfvqpbZUVAJ
         T/bCgE8yvQ1xYWbHIbk1K3T+JPTaAlDYvpoBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693469081; x=1694073881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVDMUJusfvGNMe6U/cv080svMtDMV7FPoLJOG6+JEFs=;
        b=lM+vMOc8/9Z9+GcVHoRkbnVEhPzZ8OzIwy8NfUt6ePef9lbGFidOZz1OhwHIFV1C9R
         bO414YpIsPl0QdPS+jMCA+pkQfh3e2M27FduXDSYr5OMQBBOVQ1H1MqHqz10kz7TnpbP
         GL9YJ5joxlWZghut/fjjfPBGLTtNMDlV6Ae3d2MYXYOM4GJJgYGsIOrcu0EUD9WV7z8d
         F+YkvSMjTx+KagMW2CH4zlg9OVNNI/+gaWi7l763T/4x5iTiyYwU5L/JgVH5CaLlv3m+
         zEXAaOlO70Qs14/khVLNsEqZhgv+D73wS0EzJuhYIqVjjuhj7QPwEjL4UFN3xKNVuHiD
         Nl+A==
X-Gm-Message-State: AOJu0Yy73rfaNUUwnDjp9q9I73WK2CEQSwD0fQkrmE0Aaoz0IKdojZFY
        7qBe8W81lFdE0em/K45VVkHMLOUdXC8C3MMQSlamjQ==
X-Google-Smtp-Source: AGHT+IGWkMZOGIbYg6RTVpBdYwZ0wSp1dixetG9/GzXcL6XTQaOyBZFg8pRUTYx0QUQCxznHWIEgBIXfNBI6sha82yQ=
X-Received: by 2002:a05:6808:3c45:b0:3a9:e85d:b689 with SMTP id
 gl5-20020a0568083c4500b003a9e85db689mr5038337oib.0.1693469081676; Thu, 31 Aug
 2023 01:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de> <5f1bca1b-8deb-e677-521d-87d3848e22df@kapsi.fi>
In-Reply-To: <5f1bca1b-8deb-e677-521d-87d3848e22df@kapsi.fi>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 31 Aug 2023 10:04:29 +0200
Message-ID: <CAKMK7uFDn_R+c=YErf7gEHVW4pg+odYKVjrs0EofvpG544Po6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we support display
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 31 Aug 2023 at 08:33, Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
> On 8/30/23 13:19, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 25.08.23 um 15:22 schrieb Thierry Reding:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> >> not to remove any existing framebuffers in that case.
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >>   drivers/gpu/drm/tegra/drm.c | 8 +++++---
> >>   1 file changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> >> index b1e1a78e30c6..7a38dadbc264 100644
> >> --- a/drivers/gpu/drm/tegra/drm.c
> >> +++ b/drivers/gpu/drm/tegra/drm.c
> >> @@ -1220,9 +1220,11 @@ static int host1x_drm_probe(struct
> >> host1x_device *dev)
> >>       drm_mode_config_reset(drm);
> >> -    err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
> >> -    if (err < 0)
> >> -        goto hub;
> >> +    if (drm->mode_config.num_crtc > 0) {
> >
> > If you don't support the hardware, wouldn't it be better to return
> > -ENODEV if !num_crtc?
>
> While display is not supported through TegraDRM on Tegra234+, certain
> multimedia accelerators are supported, so we need to finish probe for those.

Ideally you also register the tegra driver without DRIVER_MODESET |
DRIVER_ATOMIC in that case, to avoid unecessary userspace confusion.
Most userspace can cope with a display driver without any crtc, but I
think xorg-modesettting actually falls over. Or at least I've seen
some hacks that the agx people added to make sure X doesn't
accidentally open the wrong driver.
-Sima

>
> Cheers,
> Mikko
>
> >
> > Best regards
> > Thomas
> >
> >> +        err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
> >> +        if (err < 0)
> >> +            goto hub;
> >> +    }
> >>       err = drm_dev_register(drm, 0);
> >>       if (err < 0)
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
