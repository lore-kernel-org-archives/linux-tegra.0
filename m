Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21F2C64EC4
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Feb 2023 10:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbjBUK1z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Feb 2023 05:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233284AbjBUK1y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Feb 2023 05:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E8523C51
        for <linux-tegra@vger.kernel.org>; Tue, 21 Feb 2023 02:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676975224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hiLmjzvpE18Y20gNAl/hePHswT74MZjZpMb0h3yOJZI=;
        b=Z3Q2Zi10hlCQa8ofLpOaS/vu8JtkMnrh3kDnXKizOX/mg6G5FLLWq73mBvf6MGA7FhSMVj
        oiNBjAa3sBBpgRw2KWrBBOB4K/9Ji2bW4D0n/nKN0CMRPnIRUjSC/Fsydcvh8PU2ulluVK
        U6tGIbwjzWCNXaVxo6NRKHjlRHdwydQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-390-4nUdBnNQM-ekNwFlSpIvJA-1; Tue, 21 Feb 2023 05:27:03 -0500
X-MC-Unique: 4nUdBnNQM-ekNwFlSpIvJA-1
Received: by mail-wr1-f71.google.com with SMTP id n14-20020a5d67ce000000b002bfc2f61048so924571wrw.23
        for <linux-tegra@vger.kernel.org>; Tue, 21 Feb 2023 02:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiLmjzvpE18Y20gNAl/hePHswT74MZjZpMb0h3yOJZI=;
        b=HoXzlrGA1/mgxPAFwcj45QJPohi4/Ej7gUQWHWRNtCC9+ogWt2HrU1ztWxUtx/a81b
         5YI/2UvSnFtiH78HHW24VAuGrQfX0tGUuIEgIbUBn8Na2QYyRkBCRJiWQt780UBV6W8l
         y87ExXF02U2c61APGvfMYXGpj4qTwuZdM0QdVz32vKIxFDRyLfgcOcCYrxBBX7V0Kx/w
         G3RroIjjLEhRfztO0PQPAZ3r7f1+6M4bCxIl6hDwG5LSJMaSxjY2ym9hyUXCE97LUJwI
         A1uZp7AA33hNEGQZeILfMh7pBYZcukA39Iw+EyH1mwH6pqAIRJpfbcuhg0gJiUJrlroL
         uWzQ==
X-Gm-Message-State: AO0yUKW7hSo/8LQgxhfLJNXVEiVMt79QoBKxANhNfMCSezDcZrNikd2g
        fCUQMBK9kRyTqNRTWk0lCD8eOczH4a/JAoKwkh6QNYnmGmIEngV0QwXrAietjRI16n4iHJ89N8g
        ubUtTwse61wm1/8ZYBcbuggE=
X-Received: by 2002:a05:600c:1887:b0:3e2:918:ecd4 with SMTP id x7-20020a05600c188700b003e20918ecd4mr2997470wmp.37.1676975222125;
        Tue, 21 Feb 2023 02:27:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/cKnMX/kNp3d4wm95Jc/vSbL62QyA9ckz6jygZFZOsNWWFJ1UBaXn9HDaaIXMU9JLf5j495Q==
X-Received: by 2002:a05:600c:1887:b0:3e2:918:ecd4 with SMTP id x7-20020a05600c188700b003e20918ecd4mr2997460wmp.37.1676975221852;
        Tue, 21 Feb 2023 02:27:01 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c274100b003dfe549da4fsm4700968wmw.18.2023.02.21.02.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 02:27:01 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Remove drm_fb_helper_unprepare() from
 drm_fb_helper_fini()
In-Reply-To: <20230216140620.17699-1-tzimmermann@suse.de>
References: <20230216140620.17699-1-tzimmermann@suse.de>
Date:   Tue, 21 Feb 2023 11:27:00 +0100
Message-ID: <87y1orxqiz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Move drm_fb_helper_unprepare() from drm_fb_helper_fini() into the
> calling fbdev implementation. Avoids a possible stale mutex with
> generic fbdev code.
>
> As indicated by its name, drm_fb_helper_prepare() prepares struct
> drm_fb_helper before setting up the fbdev support with a call to
> drm_fb_helper_init(). In legacy fbdev emulation, this happens next
> to each other. If successful, drm_fb_helper_fini() later tear down
> the fbdev device and also unprepare via drm_fb_helper_unprepare().
>
> Generic fbdev emulation prepares struct drm_fb_helper immediately
> after allocating the instance. It only calls drm_fb_helper_init()
> as part of processing a hotplug event. If the hotplug-handling fails,
> it runs drm_fb_helper_fini(). This unprepares the fb-helper instance
> and the next hotplug event runs on stale data.
>
> Solve this by moving drm_fb_helper_unprepare() from drm_fb_helper_fini()
> into the fbdev implementations. Call it right before freeing the
> fb-helper instance.
>
> Fixes: 4825797c36da ("drm/fb-helper: Introduce drm_fb_helper_unprepare()")

I think this should be Fixes: 032116bbe152 ("drm/fbdev-generic: Minimize
client unregistering") instead? Because commit 4825797c36da just added a
wrapper function for mutex_destroy(&fb_helper->lock), but it was commit
032116bbe152 that made drm_fbdev_cleanup() to call that helper function.

> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

The change itself looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

