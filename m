Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E4BC43219
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Nov 2022 10:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbiKDKir (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 4 Nov 2022 06:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbiKDKi0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Nov 2022 06:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44E12B255
        for <linux-tegra@vger.kernel.org>; Fri,  4 Nov 2022 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667558241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FvcSXdbTIY6j0RtoeMW2Oyvbsf0knEKyh2vmjeJsi+Y=;
        b=R2yQImMcAfIj5GEELIWTBsuK8hgSQmFxwHONeKVvbLNsoPnUuIooQaMHVa/KhRLCIH7r5a
        SCaPWvfexiteqzwdGc6NcedILUoKqMLUZ0NXk2nAw9stXpgMK2U85P+Z3QKQx3TEQy8gHF
        8m7WD5rw4DsgVTBWqQrCcuIJkg3C6Eo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-r8NwTcjRNieHLyWs9oWGdw-1; Fri, 04 Nov 2022 06:37:20 -0400
X-MC-Unique: r8NwTcjRNieHLyWs9oWGdw-1
Received: by mail-wm1-f71.google.com with SMTP id r187-20020a1c44c4000000b003c41e9ae97dso4041269wma.6
        for <linux-tegra@vger.kernel.org>; Fri, 04 Nov 2022 03:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvcSXdbTIY6j0RtoeMW2Oyvbsf0knEKyh2vmjeJsi+Y=;
        b=CNXXBSOYdOfqPKonhR0spG0N2UumC9D24kHnX5CWwEDV+tvLAy7la1JORRq0WdIixo
         F4U+W6I+FmBKUCxJ3VBxgH5xywpDkRoLmSaYVOx9SxG20ir64vXmgKtaJ2hZmPahH15u
         QZVDvU1egbz/ZMaC1yb6l/cqcVTdowLvjNzQKDVsd3RvDVK6Up7xo+4zoEgghlRfWhV7
         X5m6pT7wNu8dPgBdbzeopXl2s+WnuOqS8tOWA2gCJ7Zgm9swI1L/tU1RJ2rAHozlIipq
         Q9GMEYMPxg0ZIreBI7Dft+bHUwYHgd6mUIDFlKLKKACTGD1VlOFPf+aT6cDaAWxJTn6g
         F1bw==
X-Gm-Message-State: ACrzQf3wtTNmdtltfHKq0+eEBVhsei9ZYPh5k1d3h7+b/3XdwOH+C4Jr
        jaVOuGMMQB1Pga7gPPzGtqMxQFLOwFT7jfhF///NdU89GRBsj47GOzMjhFpcXnCTeHS7oYw0Ikg
        7+knkkbM9FEd+cw0kUKxllH0=
X-Received: by 2002:a05:600c:1e2a:b0:3c3:d770:1756 with SMTP id ay42-20020a05600c1e2a00b003c3d7701756mr23539586wmb.134.1667558239643;
        Fri, 04 Nov 2022 03:37:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LKXhwK5qh8ieFEkCSZgi7mblk9sJOfnr0awtpFbS+pIQGNE9IUSRaCOrs9CG3VpGFJY/xjQ==
X-Received: by 2002:a05:600c:1e2a:b0:3c3:d770:1756 with SMTP id ay42-20020a05600c1e2a00b003c3d7701756mr23539569wmb.134.1667558239379;
        Fri, 04 Nov 2022 03:37:19 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f15-20020a5d50cf000000b0022e36c1113fsm3031008wrt.13.2022.11.04.03.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 03:37:18 -0700 (PDT)
Message-ID: <ab8358a9-8450-0d49-627f-26afe7ba4f9d@redhat.com>
Date:   Fri, 4 Nov 2022 11:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 20/23] drm/fb-helper: Set flag in struct drm_fb_helper
 for leaking physical addresses
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org,
        spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221103151446.2638-1-tzimmermann@suse.de>
 <20221103151446.2638-21-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221103151446.2638-21-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/3/22 16:14, Thomas Zimmermann wrote:
> Uncouple the parameter drm_leak_fbdev_smem from the implementation by
> setting a flag in struct drm_fb_helper. This will help to move the
> generic fbdev emulation into its own source file, while keeping the
> parameter in drm_fb_helper.c. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

