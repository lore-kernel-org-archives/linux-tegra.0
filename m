Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C017BC6FA8F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Aug 2023 06:14:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238720AbjH3GOO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Aug 2023 02:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239836AbjH3GN7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Aug 2023 02:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD36CDC
        for <linux-tegra@vger.kernel.org>; Tue, 29 Aug 2023 23:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693375989;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zDMwjc1qeSKVKGNyVJYoF/wnSkEGcFh3a/TxjrwSsFM=;
        b=G5SwSKwlzrI6e0nCnZXIDI9qNFj0ipRIFOkqA3Ee1GXEveQZNFJJsRf89DrAYNxpmPhxFL
        zcyGUo9Cwpis5EHDXAkWHeaK+J6AAxBG5Vad1PcV5UUr37bFSF2FWfFFxKBSPeNEXSF0ta
        zKr44y8nRAanSlyGSj3WD3BWefTKNc8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-D1pQLO5GOPigijKKvMj9JA-1; Wed, 30 Aug 2023 02:13:07 -0400
X-MC-Unique: D1pQLO5GOPigijKKvMj9JA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-401db2550e0so6413775e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 29 Aug 2023 23:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693375986; x=1693980786;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDMwjc1qeSKVKGNyVJYoF/wnSkEGcFh3a/TxjrwSsFM=;
        b=F3SvlMxvMXnggOnEpZqTYumGw6Qa0aaJi+O1EDm9aH7soiEDdosLgCrWpkxfxQY9Ld
         pSIHrog9uFtB+8ysdpOKkLR0jV05C69KR4Um6Nf8InLsGqgYyBalq47LHqz9S7a/OgVf
         ZGRh6nU7WPBIEkpaHV7I1mfo21BkVDt2VeFNUza+pRWdWPyH455xT6Ps01tJPXs6XuGu
         tcyk3QNjBwz0K+WVQk5HGTSBBl3pe57Jax+JmPkSI1i8gjpCyMPGGcVfmGaR8VCNU2L3
         pIgk0h8nQITs5m95pwqhnc/5opGkAthCj7mR/ExVoRL/y3Nk65TuOigYzRRVyHlhGkX6
         AgLQ==
X-Gm-Message-State: AOJu0YySUqq0Fd6rc+LXigW6EUwldakkF10gXdbxJ8XCQtwWsxjFXm2p
        E7wsONOblTM97pY1fM2CPusUu+mLeSLy331bzuB0AyvW+q9H4ry5+Ntp93DTFttqSK6/roKzLpE
        RoHCVoLH6MN6DFb+9JDPW1TuLiF0sT/8=
X-Received: by 2002:a7b:cc8d:0:b0:3fa:934c:8360 with SMTP id p13-20020a7bcc8d000000b003fa934c8360mr1171877wma.8.1693375986503;
        Tue, 29 Aug 2023 23:13:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHvw3L5ADexsvF7N1c0MqO622OpsVqhuuyhkfctr5r7D+YcP0qanoW/QKryomKNyPwHppEpA==
X-Received: by 2002:a7b:cc8d:0:b0:3fa:934c:8360 with SMTP id p13-20020a7bcc8d000000b003fa934c8360mr1171860wma.8.1693375986147;
        Tue, 29 Aug 2023 23:13:06 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l9-20020a1c7909000000b003fe1c332810sm1101298wme.33.2023.08.29.23.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 23:13:05 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we
 support display
In-Reply-To: <20230825132229.1109445-1-thierry.reding@gmail.com>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
Date:   Wed, 30 Aug 2023 08:13:04 +0200
Message-ID: <87y1htawi7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thierry Reding <thierry.reding@gmail.com> writes:

Hello Thierry,

> From: Thierry Reding <treding@nvidia.com>
>
> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> not to remove any existing framebuffers in that case.
>

I see, this makes sense to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

A couple of comments below though:

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index b1e1a78e30c6..7a38dadbc264 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1220,9 +1220,11 @@ static int host1x_drm_probe(struct host1x_device *dev)
>  
>  	drm_mode_config_reset(drm);
>  
> -	err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
> -	if (err < 0)
> -		goto hub;
> +	if (drm->mode_config.num_crtc > 0) {

Maybe you can add a comment here explaining why the check is needed?

I also wonder if is worth to move the drm_num_crtcs() function from
drivers/gpu/drm/drm_crtc.c to include/drm/drm_crtc.h and use that helper
instead?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

