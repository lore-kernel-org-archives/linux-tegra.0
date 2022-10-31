Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABA2FA3742
	for <linux-tegra@archiver.kernel.org>; Mon, 31 Oct 2022 13:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiJaN2U (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 31 Oct 2022 09:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiJaN2T (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 31 Oct 2022 09:28:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7F11005F
        for <linux-tegra@vger.kernel.org>; Mon, 31 Oct 2022 06:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667222838;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GwqNSS0OJIleR6uoXEXg4AgYpmJqcWP2KGT201SIVMg=;
        b=W0vqrJETrrXTqQoG3vpBmoqKSRrJS1/Jq7LTpPu+mO9deitZfgbdUDFUfCZ5bixBYlMIUZ
        GrDC02uosAahqXIn6bqCVSZB6T87vh0yNDdytr1uBX2vmgQpsTb5GxCpQz186gv0yM5s91
        Ju+RHUdGinbYv4UwP1yzMQLflk8HTSQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-34-qJJwOinpPn2XqvQiD1awoQ-1; Mon, 31 Oct 2022 09:27:17 -0400
X-MC-Unique: qJJwOinpPn2XqvQiD1awoQ-1
Received: by mail-wm1-f71.google.com with SMTP id 133-20020a1c028b000000b003cf6fce8005so460188wmc.9
        for <linux-tegra@vger.kernel.org>; Mon, 31 Oct 2022 06:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwqNSS0OJIleR6uoXEXg4AgYpmJqcWP2KGT201SIVMg=;
        b=rcUqThT23PNwTgzxxFHJHxg5U6SiBXsZk2+ug7JsTxR0Lj7yOsxfxMutZc1D8hE8PP
         9d2OQzZ+maSjjJNVSZ6m6sK8bOTl7Bt0lwivVtUxICEMDRdwDUI9uilHNnEvrhz5l7pq
         BL6jGIqH3GKsMsc3aArsR+bL5R8NAkaivlKEB6YCNILFP9dZoDsbArij0Y+jdo2mx+8n
         d+S1FmLzmyn7Y+DWQcWV1FvmOV20DXOAtSkG+J2BIQVZMHGUQQoiy6iRUGR3MKXBeuhk
         WJmJ7gvmKTs/6N0KphdCGq9degPtojcI6GrSkBuXNRog65OheRvoff/OdpzWGCXX5xT1
         3DYA==
X-Gm-Message-State: ACrzQf1D0EKU2KG+gOKmKqtOVnoZKlHC9AqLkQF70Dhstc+Z0OQ4Vv8A
        NUKhuSS61yC0vA+C9Y2Uin3DfQYKFry9yYVXVp6iIsrMHxk8YWWHBrBWf/ACidJy2PWz9f2iASf
        lPLmw8S6Wh+4f9ILTPtzKYR0=
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id z10-20020adfec8a000000b002365b80da83mr7858631wrn.509.1667222836006;
        Mon, 31 Oct 2022 06:27:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XoYVkE5jE7vlhuKQ/BuqMv6qQj/pE66jVA36/qVXv1WZdIDiMFN0/ixJs2zjwBzGxtBPgyA==
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id z10-20020adfec8a000000b002365b80da83mr7858599wrn.509.1667222835772;
        Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bg37-20020a05600c3ca500b003b477532e66sm25116881wmb.2.2022.10.31.06.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
Message-ID: <0fe3974c-de66-9eaa-b56a-ed1d07644e4c@redhat.com>
Date:   Mon, 31 Oct 2022 14:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 14/21] drm/fb-helper: Rename
 drm_fb_helper_unregister_fbi() to use _info postfix
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
 <20221024111953.24307-15-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-15-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Rename drm_fb_helper_unregister_fbi() to drm_fb_helper_unregister_info()
> as part of unifying the naming within fbdev helpers. Adapt drivers. No
> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

