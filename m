Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEA1EC8738
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Sep 2023 16:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbjIGQCR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234889AbjIGQA6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Sep 2023 12:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435F830EA
        for <linux-tegra@vger.kernel.org>; Thu,  7 Sep 2023 08:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694101038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BcKSRQ7c7HAQu4Or5q0ezdUK5yii8WLxMAITQoeqr8E=;
        b=dVeeTCjlKIsMNURWK/qdW5EB+aEVk8jFZ8SEAH6w1xJ/QWWxgP1NAW4EU6WGkBnMRd4D9g
        0PR0ByoFvSkAqvVHYoKK60FqgUjsxn+Bm/GvGBohiGfHMKamM3dusZkLytbIRvCmejl3IR
        GcW7wqeOw0pr5lJiLFGk943E82m5BZo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-QI4bVpfvPuSQipqb4drP6w-1; Thu, 07 Sep 2023 04:11:17 -0400
X-MC-Unique: QI4bVpfvPuSQipqb4drP6w-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-401e1c55ddcso5346985e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 07 Sep 2023 01:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694074276; x=1694679076;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BcKSRQ7c7HAQu4Or5q0ezdUK5yii8WLxMAITQoeqr8E=;
        b=ArxeNDkGF0m0WzTmoteZg/EfDeUnh4B170P159SKvnYeoXZB6lrlcuzdYJIvDV3Kpi
         2gmsUEWlQ9vmCrkkQjNVLVl3Dmqr3qtfYnbIkwm4h7IivE8JLu1tG4cC+EQaULrn6MI4
         KRkee171auHliSP5Id6WRLD4BM/MFCjqMtKN8J48XSsrEQGY9iUwG/fsegMXh3yRCYQ6
         r6eaKBOrDjhFe55IcLqcNY0K2NZ1zIESbVDP+Irb2hm/f3yZOXW9hhYCeVKy1KFjrsBe
         b7NEok3zCiK2RnS2b/6UqWuUbNZOb+jw3hRK6UA37ezBokBzje0BtryRILppfvvv9mxP
         hkEg==
X-Gm-Message-State: AOJu0YzCkGV59jr/941KBEmDlx1jSnmQ8R6EzEkzQEEMj5nZ49qO4+OG
        qiYsqaOWY76F7/vPD5byOQH3iDDqlszCVv9ULB5dePLHbhns65VvPTNmtTySlXEbQ6XPStFO8kM
        v8ftnNig9W/9fwMThKjXqu2I=
X-Received: by 2002:a05:600c:2409:b0:3fa:97ad:2ba5 with SMTP id 9-20020a05600c240900b003fa97ad2ba5mr4396553wmp.31.1694074276286;
        Thu, 07 Sep 2023 01:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE0w0khHfKvp0sEzGDKoRSGsjGPZ4Cz6RhTflL6GnLAlc8FN5WXx0baP2ZiRXWh1E8BESOFg==
X-Received: by 2002:a05:600c:2409:b0:3fa:97ad:2ba5 with SMTP id 9-20020a05600c240900b003fa97ad2ba5mr4396538wmp.31.1694074276014;
        Thu, 07 Sep 2023 01:11:16 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f7-20020a7bcd07000000b00401c595fcc7sm1749391wmj.11.2023.09.07.01.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 01:11:15 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>, daniel@ffwll.ch
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we
 support display
In-Reply-To: <ZPmCf4892gI88ZNc@orome>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <87y1htawi7.fsf@minerva.mail-host-address-is-not-set>
 <ZPmCf4892gI88ZNc@orome>
Date:   Thu, 07 Sep 2023 10:11:14 +0200
Message-ID: <87wmx22yjh.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thierry Reding <thierry.reding@gmail.com> writes:

Hello Thierry,

> On Wed, Aug 30, 2023 at 08:13:04AM +0200, Javier Martinez Canillas wrote:

[...]

>> I also wonder if is worth to move the drm_num_crtcs() function from
>> drivers/gpu/drm/drm_crtc.c to include/drm/drm_crtc.h and use that helper
>> instead?
>
> I've been looking at this, there's a few things that come to mind. It
> seems like we have a couple of different ways to get the number of CRTCs
> for a device. We have struct drm_device's num_crtcs, which is set during
> drm_vblank_init(), then we have struct drm_mode_config's num_crtc, which
> is incremented every time a new CRTC is added (and decremented when a
> CRTC is removed), and finally we've got the drm_num_crtcs() which
> "computes" the number of CRTCs registered by iterating over all CRTCs
> that have been registered.
>
> Are there any cases where these three can yield different values? Would
> it not make sense to consolidate these into a single variable?
>

I als was confused by that when looked at the implementation of the
mentioned helpers and couldn't find a reason why there are different
ways to calculate the number of CRTCs.

Maybe Sima or someone else can shed some light?

> Thierry

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

