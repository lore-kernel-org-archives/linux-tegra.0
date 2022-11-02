Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096FAC43217
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Nov 2022 09:41:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbiKBJlZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Nov 2022 05:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiKBJlX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Nov 2022 05:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE84422BE3
        for <linux-tegra@vger.kernel.org>; Wed,  2 Nov 2022 02:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667382020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BsLrquRWckXT1s1aby8jZXWvTG60TzDOu2w8x1+2PdY=;
        b=fUSRy8Zp8hL5ntlfmePj6zXKYgK0hNbpwaAPl4Rtr/L+NQKHNiQcaZetp03fJmOW/QFs+Q
        d44KFkqdGPiQPlcRHV2mBX8w0Ah9neKG1tBZadLpV9HHXYjDO0/SpMitiQ+nHz3fT7j2hH
        NBR7lAJaxX6PHFu1TleW+zbwALFhats=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-CmrdFY8nNE2EMFEQ9lWzhg-1; Wed, 02 Nov 2022 05:40:18 -0400
X-MC-Unique: CmrdFY8nNE2EMFEQ9lWzhg-1
Received: by mail-wm1-f71.google.com with SMTP id bg25-20020a05600c3c9900b003cf3ed7e27bso7726896wmb.4
        for <linux-tegra@vger.kernel.org>; Wed, 02 Nov 2022 02:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsLrquRWckXT1s1aby8jZXWvTG60TzDOu2w8x1+2PdY=;
        b=d7pEZcIYIp50VlNAJM3KNdwekdLXYRUApUaHeOsQmqNnoi1f/4gBPsA8bfeXvjWYTJ
         o6vxHkoONM8UUrb+mj8R+xYbo68oXu1i/cllWDAZfeJD2UzJBX2I5t2yNHDfR3LZGqBA
         Ig2/qR1pxcUQlgAiHT/6G/3nrzyY75Dvn+AmHN4hY7oGnGRQ5/OfcfpjmI+XfdjskvAd
         hLjkZZ4RKuOeEN4xWPz1Y0nR1k8V6KNGsKhCcnKx2v6HaY94jZpmy8QZQPM/QFeqE/Zs
         vH/EEgyawjYT/cY/Whl5nPSQQgCeRZcKJDCullzAGcgUnzRu/tNi1RonFfvWTQC6KDFm
         9+Hw==
X-Gm-Message-State: ACrzQf3PsWLIZXqr7FAS/WX/lKwXcAZHkOevz7bDBAKVsIfiytkYa17W
        MJUEzlOACoMYfbbUXfYzVN+ypJib8aaBoe5bil3IZx+gzOBCTyZlqLfti1w4MobTr4ctkbtDWxk
        Bbl00MftPLEYMBwGKB9taxIk=
X-Received: by 2002:adf:ba8f:0:b0:22c:def3:1179 with SMTP id p15-20020adfba8f000000b0022cdef31179mr14547803wrg.571.1667382017690;
        Wed, 02 Nov 2022 02:40:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5M29YlmTkXAEgNYduNYpaEq18eaSYaR/je5Gn7y2xNrovwH6Pttvb6rYpMLmmOPDm/qr+vag==
X-Received: by 2002:adf:ba8f:0:b0:22c:def3:1179 with SMTP id p15-20020adfba8f000000b0022cdef31179mr14547781wrg.571.1667382017447;
        Wed, 02 Nov 2022 02:40:17 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c191400b003b47e8a5d22sm1924445wmq.23.2022.11.02.02.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:40:16 -0700 (PDT)
Message-ID: <7ac0da2c-0a43-4c02-4199-f48a50347171@redhat.com>
Date:   Wed, 2 Nov 2022 10:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 19/21] drm/fb-helper: Always initialize generic fbdev
 emulation
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
 <20221024111953.24307-20-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-20-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Initialize the generic fbdev emulation even if it has been disabled
> on the kernel command line. The hotplug and mode initialization will
> fail accordingly.
> 
> The kernel parameter can still be changed at runtime and the emulation
> will initialize after hotplugging the connector.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

