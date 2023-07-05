Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D66EB64DA
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 08:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbjGEIfc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 04:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbjGEIfb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 04:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A9B1717
        for <linux-tegra@vger.kernel.org>; Wed,  5 Jul 2023 01:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688546080;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MUOdZ4jqa/jKVAp7tf5tIQFJQKaJ8W9OX/5MST4+nx0=;
        b=WMq01wB/n4y/LeGf/yxaEOBLJrUnqIDRduv6wturpL0HDoMZLinl8MvgNYYhGBzxHgletn
        1vvNtY3eEqFQ0E7KgJWN9Y2c+A0CvEYVzHQ5vo3T2jERZHpX3sWvg5QgfPoPaxF1ygKBGy
        hHfXaXbkn3i3uo70AfGgOq8zdpDKa+s=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-8oU4UWxGOpOiVaCrptk-Vw-1; Wed, 05 Jul 2023 04:34:38 -0400
X-MC-Unique: 8oU4UWxGOpOiVaCrptk-Vw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4fb9087a677so5528040e87.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jul 2023 01:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688546077; x=1691138077;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUOdZ4jqa/jKVAp7tf5tIQFJQKaJ8W9OX/5MST4+nx0=;
        b=bNuBI8Ef7f/IPr3pIVHzLO4RYrvGKW0fhQinERK7lxo05J2IuB683dcUjvDLvcMLq8
         Klb5ZpqyWvDozX9mQEZg7ROBJXP30vqdGyuyDRjbnODkrTwwL4Z1MpDjVGgjoL0B9Tm3
         tzddRA+3bJP4gGV81kaMjJ5MipCis4mU7Z4bJ0+Ykwn9Zdp+xXIIduwvXeZP/dDvoSwY
         /Bu5ZBGrF27bunaremdqxwG7Hwyw/pBirImGJJQoxrYcA4sXmB1FYQxUl3vgW4vdg3fZ
         AJHQr13/wQ8vR7lmU6NlC4hg/eJD8rejhIWZ02B8kTkbCbk5L0/rxTGznj6/VWaRKV4B
         U2PQ==
X-Gm-Message-State: ABy/qLZNGVuVCFhamlwA1X8376qaide2fto6kZbQZL/BUtj0thqRFpgQ
        0f5JBdIT8bCf7q+04wsGUdUcVT5qeBRcb1srHb32PfGd50VeJCTcya2IicRqYDnONH1HzYFKapD
        tSCxF8hqNGkk+1AosBlwsBQU=
X-Received: by 2002:a19:5012:0:b0:4f9:567a:7a59 with SMTP id e18-20020a195012000000b004f9567a7a59mr12555433lfb.30.1688546076853;
        Wed, 05 Jul 2023 01:34:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlExsFBiiX6bb3J4q5RqDUoq+KcMvZbY+mbCkL7JfUUF8owQK16V9ABMtujWwpj0RBMM4IyVjA==
X-Received: by 2002:a19:5012:0:b0:4f9:567a:7a59 with SMTP id e18-20020a195012000000b004f9567a7a59mr12555416lfb.30.1688546076566;
        Wed, 05 Jul 2023 01:34:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id a15-20020adffacf000000b0031434c08bb7sm8537215wrs.105.2023.07.05.01.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 01:34:36 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH 04/10] drm/tegra: Set fbdev flags
In-Reply-To: <20230704160133.20261-5-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-5-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 10:34:35 +0200
Message-ID: <87wmzerc2s.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Set fbdev default flags FBNFO_DEFAULT and mark the framebuffer with
> FBINFO_VIRTFB. The framebuffer range is in DMA-able memory and should
> be accessed with the CPU's regular memory ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/fbdev.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
> index 82577b7c88da..8074430c52f1 100644
> --- a/drivers/gpu/drm/tegra/fbdev.c
> +++ b/drivers/gpu/drm/tegra/fbdev.c
> @@ -103,6 +103,8 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
>  		return PTR_ERR(info);
>  	}
>  
> +	info->flags = FBINFO_DEFAULT;
> +
>  	fb = tegra_fb_alloc(drm, &cmd, &bo, 1);
>  	if (IS_ERR(fb)) {
>  		err = PTR_ERR(fb);
> @@ -132,6 +134,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
>  		}
>  	}
>  
> +	info->flags |= FBINFO_VIRTFB;

I see that all fbdev drivers just do: info->flags = FBINFO_FLAG_DEFAULT | FBINFO_VIRTFB

Guess you are doing in two assignments to be consistent with drm_fbdev_dma.c ?
I was just curious about the rationale for setting the flags in two steps.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

