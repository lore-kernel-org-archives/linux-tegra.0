Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5948EC54EED
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 09:45:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235174AbjAYJpv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjAYJpv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 04:45:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644793A99
        for <linux-tegra@vger.kernel.org>; Wed, 25 Jan 2023 01:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674639863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tz7iyPImvcUWB9Dn0OtZ/fnzXULpckXnCuNXHm7FVL4=;
        b=JVRoi+i7G4m9cWCbYRfo/0ASO62Wli7ClHFpO4pSXsMoLQtGHnyNGN0AgRSEsZvu/Felh5
        G9KlilfqGMhl1Jyx1sTuv1aLLCa5KkIWrUBLTIACJA02XUWrTlwkY6VLGYZj/xP7KbFYOP
        8UEtgeg8OHiaAOSzc0YI+HrCol0nY5Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-Ad5bJiY0PISaXh09ah_KTw-1; Wed, 25 Jan 2023 04:44:22 -0500
X-MC-Unique: Ad5bJiY0PISaXh09ah_KTw-1
Received: by mail-wm1-f69.google.com with SMTP id fl5-20020a05600c0b8500b003db12112fdeso10667063wmb.5
        for <linux-tegra@vger.kernel.org>; Wed, 25 Jan 2023 01:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tz7iyPImvcUWB9Dn0OtZ/fnzXULpckXnCuNXHm7FVL4=;
        b=7PLdHaedf2XUw4D/D56JY6das8CkmK94vtuqnMhFEqfLYBV044es4lzkalVVVC842l
         WWT5I6/QUWVlMxTHoRbuwF1nvb17mIXYrrBaSvn6AEX2G1o8yuzmzYcxqMtBILqarz//
         FfW90vif8o+SWozC+rBTYmuqsdoQpJqxXk1PApgAg1ecWv87HeIGieEgQ+mjX6ic6ZNO
         4ISqG2KtHMMq0c8rq67gt3ReTR5f/FxtzAEJOQjkfJOJ/QHrDN3W//hqrTfraj4y79LS
         xuclMUwkvhVerVfZli4w506yUfSSrVRBNilQs0gduS7ggcBIV35MlC2NORGZJHbMKJ3z
         Sc5g==
X-Gm-Message-State: AFqh2kqXegx6gHzSguE3Aonsxz5PbeK7NfTG+9okm2oUhBHzYDxzEdle
        ZrtUYkrvqF+R2St1Ebchqx/di6d1OUFFKy4jhbSAznOL7gp+s/GoU4HE3qm8wIrr+mqzr2vGXrm
        ljBHVTCRE5sI2/a5O+RAdp9c=
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id y25-20020a1c4b19000000b003dafb5c8754mr28002624wma.2.1674639860819;
        Wed, 25 Jan 2023 01:44:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/ZWxYog8h3iR/G4m+bOHxbXPWtvCX/ZVFIUBahKB+Crw5vqS3Y5d/LkCiQwFYvGuCaEiL4A==
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id y25-20020a1c4b19000000b003dafb5c8754mr28002601wma.2.1674639860545;
        Wed, 25 Jan 2023 01:44:20 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c314900b003c6f8d30e40sm1345518wmo.31.2023.01.25.01.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:44:20 -0800 (PST)
Message-ID: <13f04dbd-07f2-f01a-7d67-75a554374ddf@redhat.com>
Date:   Wed, 25 Jan 2023 10:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 07/10] drm/fbdev-generic: Minimize hotplug error
 handling
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
 <20230124134010.30263-8-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Call drm_fb_helper_init() in the generic-fbdev hotplug helper

drm_fb_helper_fini()

> to revert the effects of drm_fb_helper_init(). No full cleanup
> is required.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

