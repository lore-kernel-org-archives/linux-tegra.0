Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758ECEB64DD
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 08:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjGEIYz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 04:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjGEIYy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 04:24:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC48CCA
        for <linux-tegra@vger.kernel.org>; Wed,  5 Jul 2023 01:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688545455;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HXRUz+auagzZsOaKQHNMqYO4qOJECVy27UGXYE5lEfo=;
        b=hcr4tcSgMb9P4THlW+l86ShoEc9oHnqygCGzKPOqnzUpS2ltqM/g9Xb03PrkwKRfuANrWA
        YcDDuQZXqc2Mc2RWH4LL8D2P7IDIyMpOoV5tvbTn9PWiSAAuj5SsX5KGluffrD2vFq30Ln
        tBWyuu0/jtKnA0gmGCJlNq4PyfuoiTY=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-CKm_Zad5PtKfFQPFz_R3tg-1; Wed, 05 Jul 2023 04:24:10 -0400
X-MC-Unique: CKm_Zad5PtKfFQPFz_R3tg-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2b6fdbd0caeso5081141fa.0
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jul 2023 01:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688545449; x=1691137449;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HXRUz+auagzZsOaKQHNMqYO4qOJECVy27UGXYE5lEfo=;
        b=aeOagUtdypjqKD0e2Bm1RtqaGdCrgqoNMK2BT5ae1T3+FfNzPOYPeRmQjj3/pTiCZs
         dVDe4Lp8KBLMHNeTzVxw079LixAB/gI0bxRRNCGaBbS1dNEwY5Oec3/uQH6rH25Vp5+Z
         wbbJ1IhYSHSgIib2ksE2DAa/QHYUDYv8C/e9Mk7FDuv++0J8uNe5ptHDkbFxaosuGcad
         akEOzMptqfb5p8+b0LOczeZaVAF7FKZMGerSw+9QxkMh++4Y79VxxN2Fx7KnjdIYZDRq
         b0sb5gWTBXZ729lz9B/tmgkMGgtdNPXT8oLw0lHPEA1Lkjr8XMYl/Ha/XLe94S+v0JY+
         Rs9g==
X-Gm-Message-State: ABy/qLYq4Kb2EQkjCQkR9G79Q4/3bVBnq6bf+fTrZzvQE5mUysXnMpM3
        ZvkEyRFEz+YkEuPnegNe0YfsldERg5nMmp9Sl1x9uCgT0MSFGbtY2xfmHnfUFuoPrZ4Hgbhz6MT
        vOrIvH62f0ScUh70GYX8NQAo=
X-Received: by 2002:a2e:90c2:0:b0:2b6:ac18:aaae with SMTP id o2-20020a2e90c2000000b002b6ac18aaaemr12062942ljg.11.1688545449236;
        Wed, 05 Jul 2023 01:24:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHoQycU00p6ugiTa1dDXde4hKV6yZxsdqHhYJgQjyIpKck2z33xRFZIUGg8lxMqFb6zKqgffQ==
X-Received: by 2002:a2e:90c2:0:b0:2b6:ac18:aaae with SMTP id o2-20020a2e90c2000000b002b6ac18aaaemr12062929ljg.11.1688545448949;
        Wed, 05 Jul 2023 01:24:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c26-20020a7bc01a000000b003f7f475c3bcsm1436708wmb.1.2023.07.05.01.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 01:24:08 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/10] drm/fbdev-dma: Use fbdev DMA helpers
In-Reply-To: <20230704160133.20261-3-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-3-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 10:24:07 +0200
Message-ID: <873522sr4o.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use fbdev's DMA helpers for fbdev-dma. They are equivalent to the
> previously used system-memory helpers, so no functional changes here.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

