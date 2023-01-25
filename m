Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256FBC27C76
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 09:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235126AbjAYJ0A (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:26:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbjAYJ0A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 04:26:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B523474D8
        for <linux-tegra@vger.kernel.org>; Wed, 25 Jan 2023 01:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674638710;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MJl0EBn4HtiAr3IA7OgQLEz430pat4/3/h3H46oRT3g=;
        b=KO/F8P4vq8StqgMN5WTrUy+yBRODcTmvXLkNdiWJbBvY+PrQxM152TJ52cTrRMGmJgp3hd
        Mq418D+5UWJW/g7TONCkcO1TCMq3/FrAUDBt9CPrkiXfrSZDdhtjHIFV6w17aWUi8qd2gu
        XGMkU581WKYiDI4LD9T4aRRWm3FgGkI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-246-QaNP-zQhOMC1CaHl_73W0Q-1; Wed, 25 Jan 2023 04:25:09 -0500
X-MC-Unique: QaNP-zQhOMC1CaHl_73W0Q-1
Received: by mail-wr1-f69.google.com with SMTP id v20-20020adfc5d4000000b002bdfcdb4c51so3013221wrg.9
        for <linux-tegra@vger.kernel.org>; Wed, 25 Jan 2023 01:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJl0EBn4HtiAr3IA7OgQLEz430pat4/3/h3H46oRT3g=;
        b=EKTfRmRLBgQ9QaP5ITh+GBeYsmakUj42Gkq0fooOIKfOc5f6J0sGnzjNb0KSuXUQ9O
         egdkSAddJ+iI0B1y0anlvK/nipUQKa5uo9/PgGXaOvWghL9xUe9Xc2t8jrdG36jnr3xZ
         jkBOvmG4xdGQAp7idR2jArx10UhVw04fCt55oVxtaJ2lCySM1g7AVbE5PaXefjL908L3
         AQTGYMK+5gXhBtf9sX6Yos9Hhs/9zOXZYEZB+bdox7uwaXt9rI8ZQIrbBXwzYbPKLNjg
         kiTCpX4HvzsuWnZWDe8lp/ttZMy+PRTg1INB4MiojvM+3PYdM9xL6Q8u2mRPIB5JjX99
         NRRg==
X-Gm-Message-State: AFqh2kpTY+ukNflOE+jNun74YitTcZh/GKHpcoAjk/oRWl0XWCiMJQR9
        g/8aNKw3v+vcb2E59xhfn4tLIwkUW3HQj+2/neXP++NKjp9O+AGChgNCRbLqGsaDbR4EktofwFM
        hKnPcrRyJpDMRi4I8s71CSjc=
X-Received: by 2002:adf:a38d:0:b0:2bf:9527:ce62 with SMTP id l13-20020adfa38d000000b002bf9527ce62mr13001325wrb.60.1674638707870;
        Wed, 25 Jan 2023 01:25:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvA3fpsEqb88MB1qU578so/hL+p+6J8snUbZz7AHyqAc1so8GvG1XEiL3HmPZITj9u0u/0ozg==
X-Received: by 2002:adf:a38d:0:b0:2bf:9527:ce62 with SMTP id l13-20020adfa38d000000b002bf9527ce62mr13001312wrb.60.1674638707672;
        Wed, 25 Jan 2023 01:25:07 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q8-20020adff788000000b002bfbda53b98sm534384wrp.35.2023.01.25.01.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:25:07 -0800 (PST)
Message-ID: <c0377e71-12b8-a545-dc48-704c223f344c@redhat.com>
Date:   Wed, 25 Jan 2023 10:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 04/10] drm/fbdev-generic: Initialize fb-helper
 structure in generic setup
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-5-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Initialize the fb-helper structure immediately after its allocation
> in drm_fbdev_generic_setup(). That will make it easier to fill it with
> driver-specific values, such as the preferred BPP.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> @@ -456,12 +454,12 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
>  	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
>  	if (!fb_helper)
>  		return;

Maybe add a new line here?

> +	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
>  

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

