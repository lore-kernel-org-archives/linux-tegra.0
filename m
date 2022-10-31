Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6E2FA3740
	for <linux-tegra@archiver.kernel.org>; Mon, 31 Oct 2022 12:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbiJaMXx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 31 Oct 2022 08:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbiJaMXn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 31 Oct 2022 08:23:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8715BEE15
        for <linux-tegra@vger.kernel.org>; Mon, 31 Oct 2022 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667218912;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sz8PAZx0cLc5RAaRO0sQR4MZQyCy7VtrjJT7yq4jHuw=;
        b=dtQVGo+IZpIyUJY4zXXEG/jalqF9M1pfn2IdTmrz7mYYRpF87IBrQkBlR5B3RpuR3G+aTI
        k40MuyKuCdqnmW1jG7fFCXifOR3s3Ok4Quh2y1JHM0a5/wUppWpI1Ut0YG88m5KLySqOoG
        LhUFfBKyizj5dA8s/Vl8MiAhsJnE5hc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-388-YVSOUPsINeiF-dpJYfcI1w-1; Mon, 31 Oct 2022 08:21:51 -0400
X-MC-Unique: YVSOUPsINeiF-dpJYfcI1w-1
Received: by mail-wm1-f69.google.com with SMTP id h204-20020a1c21d5000000b003cf4e055442so5237087wmh.1
        for <linux-tegra@vger.kernel.org>; Mon, 31 Oct 2022 05:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sz8PAZx0cLc5RAaRO0sQR4MZQyCy7VtrjJT7yq4jHuw=;
        b=tYVbBaKChkxYWMGAl0Z0o4SMmWz0px5gSFFyKqktfRdUZ5hRQdss8s4vzdYE4gnUph
         gWYHKN+eEuA+l52AgmdI2LQqgiQ1OGSdLj0KsMmEjHURoB2r1qf2S2KjqagN4Nvv6Kwd
         oF3HvW8IGwHadoigYLBEumqnjQhgNOm7zzZNqyOjxkICMTT4iT5118QqBdP6vWONionO
         J8MXWbUn7SjVNUOiHSa9po1YI6pe0ktbm3Swo/WaaL1le55mplCSdnjrbrNo5/pf5au0
         O6btbqS1Cn/614A+PW/YjWvLK6WEiS+UWWWrxfePS8seLEYMlMbrwqukmJQkTl45P2aV
         g4VA==
X-Gm-Message-State: ACrzQf2kZ/G2Krr/T0UKfQ8xm4/CWEJHT22jFcUfOrczXKoLgeyRwvby
        jJpJV2fl6h2OLWmi95pOd5Rgx0udtfFHoCS78Dwpny4o26fO9CBdE/hiGukgqCxM/Nzpy9KPn9L
        ZJlBKRwr16/JsMjrlakc4wsI=
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id bg14-20020a05600c3c8e00b003b4d224ae27mr7935991wmb.187.1667218910340;
        Mon, 31 Oct 2022 05:21:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7kQh5/EvsJvI9K3W2EFLXezwgTMZr8BgFr4Dt+IxgUiTtboeKKAu1FK4Es/7ETyez8XSTV6g==
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id bg14-20020a05600c3c8e00b003b4d224ae27mr7935971wmb.187.1667218910155;
        Mon, 31 Oct 2022 05:21:50 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id i4-20020a05600c354400b003cf4c1e211fsm7421692wmq.38.2022.10.31.05.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:21:49 -0700 (PDT)
Message-ID: <e9192382-f04c-4ebd-ca1c-b2fceaa29f86@redhat.com>
Date:   Mon, 31 Oct 2022 13:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 09/21] drm/panel-ili9341: Include <linux/backlight.h>
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
 <20221024111953.24307-10-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-10-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Include <linux/backlight.h> for devm_of_find_backlight().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

