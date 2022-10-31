Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9A7C38A02
	for <linux-tegra@archiver.kernel.org>; Mon, 31 Oct 2022 12:00:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbiJaMAN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 31 Oct 2022 08:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbiJaMAB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 31 Oct 2022 08:00:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AF21102
        for <linux-tegra@vger.kernel.org>; Mon, 31 Oct 2022 04:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667217533;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NYUZwRg+lRYohe3+hrEekpmCQsb4LiBLuZ4BzJljYVc=;
        b=fMoK+kHtzzY7KjOTM9AC/N3CzTwZETMX5FM/XwMkPqq9s6gvRElNeQi+gj+wilgENLP2t1
        +drY1QYH/1fMmV1kxZOJlaa+tPjNk/bebIdnwv5CWbTanFRUL1jGraLSKdF410FWAesppt
        7J6pL7+1IhzC1m/F70sk3IAfyCsYKa4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-hT2nui8uNdWLIa1qKnB-lg-1; Mon, 31 Oct 2022 07:58:52 -0400
X-MC-Unique: hT2nui8uNdWLIa1qKnB-lg-1
Received: by mail-wr1-f70.google.com with SMTP id u13-20020adfa18d000000b00236566b5b40so2974413wru.9
        for <linux-tegra@vger.kernel.org>; Mon, 31 Oct 2022 04:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYUZwRg+lRYohe3+hrEekpmCQsb4LiBLuZ4BzJljYVc=;
        b=3jffYufpFxcViPTrc0J7QPv5fJa46l1RgMdQjTlaY6ioERvdS3txGYabNEZuY/x60b
         Slas3uI2fhmcwXa/QLsofoO4fw51LZpMZtJiiolIurLjRnVAhDnwFKszFQFAao97rN2z
         yn1z7V5Ery/gKi2G5Do5pU3LRmCOqecbwuJeK/jVqKqcYQJznEVeqdXzzK0wsTnt6cIY
         dr83SgpWId88WTwOd4r888wEgZ7jBnJfQwZtuPDGA9UvlXHF6B6DT+Slb2bT0bfHYDMe
         PEv2v/TW4biIHesUz0NNrEU0h/uCLkYVD9cWG+f9WsLOqQ0vjlL/5DFo9BPQrtafmM1i
         yyDw==
X-Gm-Message-State: ACrzQf2zPW1mdzNfJ+k/RJGKK0ilppwe2s8zuVvivLrsgli3aLFsMWNE
        li9hWmJEt+r9Aqq4bfVYrEAhbX4Pggc95drA3IPDhkt8jkY6kIDULRkHp0op69Liiopp7pX03CC
        bwEMAqVXBVg3kDa9HxTwp/mg=
X-Received: by 2002:adf:ee46:0:b0:236:57e4:60d9 with SMTP id w6-20020adfee46000000b0023657e460d9mr7712410wro.208.1667217531292;
        Mon, 31 Oct 2022 04:58:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5NlG/EcNgth7sygR/Y2wmF3YkVg5o1INpxQYpcg5X49eIhA0omsq50HY00GhqtS98H3T4hUQ==
X-Received: by 2002:adf:ee46:0:b0:236:57e4:60d9 with SMTP id w6-20020adfee46000000b0023657e460d9mr7712386wro.208.1667217531117;
        Mon, 31 Oct 2022 04:58:51 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id cc14-20020a5d5c0e000000b00228d67db06esm7103664wrb.21.2022.10.31.04.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 04:58:50 -0700 (PDT)
Message-ID: <365e1467-7dc2-42b4-b985-53323741dea8@redhat.com>
Date:   Mon, 31 Oct 2022 12:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 01/21] drm/komeda: Don't set struct
 drm_driver.lastclose
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
 <20221024111953.24307-2-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.lastclose. It's used to restore the
> fbdev console. But as komeda uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See
> the call to drm_client_dev_restore() in drm_lastclose().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

