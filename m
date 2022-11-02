Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4877FC4332F
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Nov 2022 10:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiKBKET (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Nov 2022 06:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiKBKES (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Nov 2022 06:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2955E23EB8
        for <linux-tegra@vger.kernel.org>; Wed,  2 Nov 2022 03:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667383360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lYDm2f88uo7N+T5CuGh2kGVIDaWbYMjQLaRZ3nU/m+Y=;
        b=HRmeF9MxyxP3y5ZLImvT6N89T3NH/Gfgge0kBHsqMwERbdfcu0gUOSRvx4/qc7ZIAEExCC
        7lMLiOzHMrl0/qznpec0L+6lnCbU7bIBycE50HfudJNLQba2waGRy9tt0d73sJuDZPcE0a
        5mooMFkZH6EaXC/dkdxyfkhNO1vYUKc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-LxOswf3dN0uEmG_SWLq49w-1; Wed, 02 Nov 2022 06:02:31 -0400
X-MC-Unique: LxOswf3dN0uEmG_SWLq49w-1
Received: by mail-wr1-f72.google.com with SMTP id e21-20020adfa455000000b002365c221b59so4682277wra.22
        for <linux-tegra@vger.kernel.org>; Wed, 02 Nov 2022 03:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lYDm2f88uo7N+T5CuGh2kGVIDaWbYMjQLaRZ3nU/m+Y=;
        b=vKMELj6Zgw46RUpFBLE2z98QYdJ0Xyi3Se/50tdCBb0dsiiyJL5J97v3015mJskG2i
         mjznwi6M64BDuzyD+59mswX6kwRwUyc4j6mAZ2TBBUd9ePrUJNa3N8ufOEV8OfnocFlG
         BnblVBxXGk2HCGL7ssWCIl4B3FZl4Ls3e0vmP1r9vNfXdJ8MhFVALYqY5uFnaSu0NSJo
         MHkaTe5EzqXtPUVvd1Ol1OYBmtYpMkMnZNRMMlEnfSqDYMEvyApYDPwxNeX5yPu1pAj4
         gc8i73AwUDpnQEczixXaGOJ90cwsPETYz3UX3Bud6ZJiEHJvEzFs+qK4OvcKXMPOYWrR
         zDng==
X-Gm-Message-State: ACrzQf1gSZOL4ty0kQWu08j/KwwIyReZ++NS7SLYFiVu6un6vQyBHzOG
        GH0eTAC1J/dmVXLjmBmqjQ957KIW86QOwRmyhg9nfAzHQQVknh2RUoKmjnGz8jfckRBUt4RCz3b
        a9i5Z06mPYHXkeYn6yzMTDVk=
X-Received: by 2002:adf:f9cf:0:b0:236:6a26:c055 with SMTP id w15-20020adff9cf000000b002366a26c055mr14584877wrr.195.1667383350614;
        Wed, 02 Nov 2022 03:02:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6OHHkFmpcUlQhLx4VZSF/FNGP0hsrmpEExWtKIxFg2Jf6dmbAckk/gQVQTytU8dXpfU2B04w==
X-Received: by 2002:adf:f9cf:0:b0:236:6a26:c055 with SMTP id w15-20020adff9cf000000b002366a26c055mr14584846wrr.195.1667383350420;
        Wed, 02 Nov 2022 03:02:30 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id fn13-20020a05600c688d00b003a3170a7af9sm1564836wmb.4.2022.11.02.03.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 03:02:30 -0700 (PDT)
Message-ID: <68309442-ad39-36da-b1ec-680dd4129a7f@redhat.com>
Date:   Wed, 2 Nov 2022 11:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 21/21] drm/fb-helper: Remove unnecessary include
 statements
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
 <20221024111953.24307-22-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-22-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Remove include statements for <drm/drm_fb_helper.h> where it is not
> required (i.e., most of them). In a few places include other header
> files that are required by the source code.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

