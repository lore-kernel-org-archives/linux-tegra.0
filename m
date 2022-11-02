Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA35C433FE
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Nov 2022 09:07:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbiKBJHi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Nov 2022 05:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbiKBJHA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Nov 2022 05:07:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB47286E2
        for <linux-tegra@vger.kernel.org>; Wed,  2 Nov 2022 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667379845;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XBlp2DOijU5hXQ9AriUwp9vEVLgfxcCQxHX+sSZSvOs=;
        b=OaN362jXxD0t4dOCZRX2dd3sbYT3c4rvUqGPjRzAoWlxVcQ3noz7A9mSZP0pqoPdGulVNu
        x5p0M4I/g4cWA41Qp5IJJfhZ1Lps8hWIf1sKOQSCu8AkcSSrLk/VhEeuar6dESGemzLLzD
        c1Om4CYhkuOD49/ikejseEpnQPzF5R8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-4ni4QRfeOtW-TSoD9aUxvw-1; Wed, 02 Nov 2022 05:04:01 -0400
X-MC-Unique: 4ni4QRfeOtW-TSoD9aUxvw-1
Received: by mail-wr1-f72.google.com with SMTP id u13-20020adfa18d000000b00236566b5b40so4589835wru.9
        for <linux-tegra@vger.kernel.org>; Wed, 02 Nov 2022 02:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XBlp2DOijU5hXQ9AriUwp9vEVLgfxcCQxHX+sSZSvOs=;
        b=NRSidlQlD68bVH6Ut7ye2viGhDpISN7Ip68l3EO5TQ1nMfc+kLll3r8LTxKftKPuQP
         6GW1dQ+Z8tAm7K+K4kTLJNonj1dbH7Ywvb1RHhCd7EUmq7gEPiNwmvLCh4+GBg06I1pS
         9cbp4NBEE/ZHIYIY+5BY862pKoqqoSQvk5+MduPGhd/8rbm0VUFxrMSjl5ji6oRXRwiO
         pz98RcBNyR6DK8YF01Djygambc0UGfxIfU3AGhez7qMJtij/HTQsfEFXRCVz6zXU7ZTL
         8hwRMTxBhEBj7/mRNma2S4hLIU9k01+nMlRCK4wKFyveWSWVDMuSYO8dQuNP+D1kTMe7
         PR/w==
X-Gm-Message-State: ACrzQf2y+5txiwFKfql99HC03adxJeesW+N6IyFAjv6Kw+zQBZSh63ky
        n+RzZQVdI4sw3W8d9sikfgK+wviNdSZgbvV7x9NoW7Gu83PhWDAeNDxflY0P2HXmVpL5Ml96LGa
        Nb1OwZNpGrVOxh91tFFSGIDs=
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id k9-20020a7bc409000000b003cf4c818936mr24380816wmi.38.1667379840253;
        Wed, 02 Nov 2022 02:04:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72ckpdUoZR+NwXtu1sv2+7NmgS+YMIWWHB7QdeKnWTKduGDRl7tg4bkpenTZv0mX1kFf34kw==
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id k9-20020a7bc409000000b003cf4c818936mr24380784wmi.38.1667379840046;
        Wed, 02 Nov 2022 02:04:00 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b13-20020a5d550d000000b002366b17ca8bsm14083933wrv.108.2022.11.02.02.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:03:59 -0700 (PDT)
Message-ID: <87284e5e-859e-3b1c-7142-28d4fa7a7939@redhat.com>
Date:   Wed, 2 Nov 2022 10:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 15/21] drm/fb-helper: Disconnect damage worker from
 update logic
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-16-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-16-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> The fbdev helpers implement a damage worker that forwards fbdev
> updates to the DRM driver. The worker's update logic depends on
> the generic fbdev emulation. Separate the two via function pointer.
> 
> The generic fbdev emulation sets struct drm_fb_helper_funcs.fb_dirty,
> a new callback that hides the update logic from the damage worker.
> It's not possible to use the generic logic with other fbdev emulation,
> because it contains additional code for the shadow buffering that
> the generic emulation employs.
> 
> DRM drivers with internal fbdev emulation can set fb_dirty to their
> own implementation if they require damage handling; although no such
> drivers currently exist.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

>  static void drm_fb_helper_damage_work(struct work_struct *work)
>  {
> -	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
> -						    damage_work);
> -	struct drm_device *dev = helper->dev;
> +	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);

This line is an unrelated code style change. But I guess it's OK.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

