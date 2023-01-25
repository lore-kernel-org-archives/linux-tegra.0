Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAFDC54E94
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 09:42:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234911AbjAYJmA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:42:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234783AbjAYJl7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 04:41:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70253EC59
        for <linux-tegra@vger.kernel.org>; Wed, 25 Jan 2023 01:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674639668;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZiXmPj1TLICEH85h0g9ObpieXhmW8hbY1dyGTe1WVko=;
        b=Km6gExUB7q+SFkVkSURn+CyhaPLT6yTla50HLsl8iKD8VxS7MMwmWmSBiLC/G/JcsUSCk9
        KhK1bt2RopU1vxsA4uVAThRv2tIhysEDWxeCgBQl2ZSZcfMGlMv3Ya0Q4HwOdkuLd0+7Nf
        4wOFNqd+uqHuSWDWTj7GcD8F4aL7lg8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-LRpK0HtpMua5qkoDlrsODQ-1; Wed, 25 Jan 2023 04:41:06 -0500
X-MC-Unique: LRpK0HtpMua5qkoDlrsODQ-1
Received: by mail-wr1-f70.google.com with SMTP id v3-20020adfa1c3000000b002bdd6ce1358so3082147wrv.23
        for <linux-tegra@vger.kernel.org>; Wed, 25 Jan 2023 01:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiXmPj1TLICEH85h0g9ObpieXhmW8hbY1dyGTe1WVko=;
        b=tLA8dTxPQ5om/VymT7qrjleios53Z7ewFj/jHK749hbQFnMOJkueiGCvGF098np9/X
         1nq8c7sv1xin8t+JxGC83Mpt16VlphwzRNXUXaR4rA5lVcJPDcCBBxWF570gEXFCBGd+
         2Bnm5ThEEopVyb+55ZG7+WebIFqndnE/H7plHvWeuAB3cU/76HKpxQwB9aMKHgi55qFj
         Icdf3rLBi+MDi4MIe5T3pwZWUejdZkwSn64GbtTeFoBuD5KWVmD66BGrScvufU7pKsF9
         jqu9RtPWDVsnnL5ItJ9fHVs+GYH++zr1Cr9QOUPw7Zz5kgDXrfVYxvbDJqLaINrk2eVH
         r48Q==
X-Gm-Message-State: AFqh2krrUBtaNcQR/GEAYF4M8AdMAAWvf4GQfjUKV2TgivARH4+wwaVM
        YLefAZd6Vt7HqDotr+MFnpU4bsnyVEruBoEC9I2ACB42tlikEBCgZS53Xrs27BSjj24/5Z94Q7o
        Jq8t1OngClF0oM7SNr/vguMY=
X-Received: by 2002:a5d:5c0b:0:b0:2bd:15ef:fe7 with SMTP id cc11-20020a5d5c0b000000b002bd15ef0fe7mr27416465wrb.3.1674639665556;
        Wed, 25 Jan 2023 01:41:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXspvSYF5UcTCX9Syl/sB5Wttapk1TJmAOGMxlySA2rIPpJprAbwV2wYhJQSWjxg72A43lgFrQ==
X-Received: by 2002:a5d:5c0b:0:b0:2bd:15ef:fe7 with SMTP id cc11-20020a5d5c0b000000b002bd15ef0fe7mr27416452wrb.3.1674639665344;
        Wed, 25 Jan 2023 01:41:05 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id a18-20020a056000101200b002be25db0b7bsm4010247wrx.10.2023.01.25.01.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:41:04 -0800 (PST)
Message-ID: <66114220-d226-e0e9-bf09-707388ce98f3@redhat.com>
Date:   Wed, 25 Jan 2023 10:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 06/10] drm/fb-helper: Initialize fb-helper's preferred
 BPP in prepare function
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
 <20230124134010.30263-7-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Initialize the fb-helper's preferred_bpp field early from within
> drm_fb_helper_prepare(); instead of the later client hot-plugging
> callback. This simplifies the generic fbdev setup function.
> 
> No real changes, but all drivers' fbdev code has to be adapted.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

