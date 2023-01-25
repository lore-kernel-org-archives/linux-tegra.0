Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D9DC54E94
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 09:53:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234005AbjAYJx7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:53:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233965AbjAYJx6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 04:53:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24645BA0
        for <linux-tegra@vger.kernel.org>; Wed, 25 Jan 2023 01:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674640374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c6cPchqoXvC7fz4HOb1ChIaitTq8x3iNoLBlJaQ4TwQ=;
        b=ajymRgqzesHlDyjRtzzf4GoaDIEkCmdhsEAHLfvxU30Iq0plKkALI48ljdmHbkf8KJa0WC
        b0DSPIeD5BSMwNNH+o+IMUoQcjOW/qEexMzUIB8w7mc3ULi00xehGooHi/kaqxwglUJc0x
        YrCFZvTz2WbuHPXgkoHdeP9zB6tAD5Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-8kgs4CS9PaOV6j_ChXtlCw-1; Wed, 25 Jan 2023 04:52:51 -0500
X-MC-Unique: 8kgs4CS9PaOV6j_ChXtlCw-1
Received: by mail-wr1-f69.google.com with SMTP id j30-20020adfb31e000000b002be008be32cso3095780wrd.13
        for <linux-tegra@vger.kernel.org>; Wed, 25 Jan 2023 01:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6cPchqoXvC7fz4HOb1ChIaitTq8x3iNoLBlJaQ4TwQ=;
        b=elB5P6HbRnIqIYHpa5GaxYvOIR5eZCyZl19MS2dbe3aoGgbIMkrMp9AGPuMQPhXFf7
         vSGFbyxo8MdpcJzL4TRFXXuqhIyRWzuwDHsDkmOKFP96L0W0sX9EBM+cbLrCxqcmZz7Z
         ebHjL4+akqLJWiCZK7nnMTD2m0+j6JwcKCTKiqnD1TGNDFuqhdsIoBpocKdmrYF/Ym+U
         TtpCeDmu68HwRWO+DbQOLd49bhtkyO+kAud6m4cs5UvGT3V63vitQf/zvGGSNB1w8ggz
         fZ6MaPvvQe9GWBG2iqG8nOuFbkJ5nEDLB0lODZi0PxXvdMk56scZq42RWdLEJ/euz98j
         liBQ==
X-Gm-Message-State: AFqh2krSM2CXJcj0QyYC76s9b3PvE3NokGJBklXVp4vIuzE0PVmZ9jQq
        5vCDOgrkiXruE1xFeYGjbMOgbLSu4eICfrBdwF3A338QjD70Be1miKU7D6HzqbSEw4JcM1lDMiN
        EIUa4kAmVdYtvmAjVoWjX6vU=
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id y16-20020adfdf10000000b002bbe8911829mr26349579wrl.4.1674640370487;
        Wed, 25 Jan 2023 01:52:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuvmq2QmH2lib1EOjSoV1HyQPmQn7B/0nRysa3FFY81sXz4YqkvR1qkRuVsXj3rXTMZ7umf1Q==
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id y16-20020adfdf10000000b002bbe8911829mr26349557wrl.4.1674640370241;
        Wed, 25 Jan 2023 01:52:50 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q14-20020adff78e000000b002be07cbefb2sm4747862wrp.18.2023.01.25.01.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:52:49 -0800 (PST)
Message-ID: <8e5bb4ed-11fb-272d-4d70-f25252a0c5c5@redhat.com>
Date:   Wed, 25 Jan 2023 10:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 09/10] drm/fbdev-generic: Inline clean-up helpers into
 drm_fbdev_fb_destroy()
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
 <20230124134010.30263-10-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-10-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> The fbdev framebuffer cleanup in drm_fbdev_fb_destroy() calls
> drm_fbdev_release() and drm_fbdev_cleanup(). Inline both into the
> caller. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

