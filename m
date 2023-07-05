Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712ABEB64DA
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 09:54:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbjGEJyJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbjGEJyI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 05:54:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA65171B
        for <linux-tegra@vger.kernel.org>; Wed,  5 Jul 2023 02:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688550803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DRNRYYR3em1ug3SJuQFxKqDHhttEDU94J84H5e4z6eY=;
        b=Ho0SRWiB1vsu8wtiBoIv1J/ktZAEtRJW6/va5NNGBrZXCOlai6iLJYoxKWLRgfB7umhcj0
        9lfN4aBXYXjg2M/qRRTEGsMYd52G5btIxArL2UPUtPC2vKVPmJofgjhC0DQ7YxKPcV0u2G
        rbU978q+lqBLjYBQ+sywpHwUASkdBRk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-6EYnYfoDOYCd4sgI1wdwGA-1; Wed, 05 Jul 2023 05:53:19 -0400
X-MC-Unique: 6EYnYfoDOYCd4sgI1wdwGA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4fb9087a677so5602331e87.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jul 2023 02:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688550798; x=1691142798;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRNRYYR3em1ug3SJuQFxKqDHhttEDU94J84H5e4z6eY=;
        b=atSA2QO/dzXTBbv4/rJp8D+HwbMuowEjc/q2SbO0dvmTD84hUO4jE8+5ZxYhLnGv4T
         SFpkPERaVF4AVuHpITeS0gNjGQsIt6HSZv0HkSFivKqdvgruJwuPiQfsFDVc9gWhcNnQ
         kKXYtHVfAsURqN5iktCXAF95XSg0qQunfJcWczL1S/T2IOvGXzsePe20nhnYNrO0j2OT
         N/xtFc16xa8yvNn9mo3sFI44IvmzWuWjC4l+SNJOFDpIvDL5nluQQ8ZrVhGbeuitPviq
         ZWSRdtZISXhNOYln9ziPuoCoyQwYfgX2xk5dFORVWdfsFmzShkkxX2J3DNEm4SpOPrzU
         CfEw==
X-Gm-Message-State: ABy/qLa0fRio1vvEAgm5bgQZ0ODcIyzUAGlfcrjuLoqsLrHBbdLOTz21
        QuQC6SKGE+em/979t/ggDtwj1zkd2rGrSrzOXJPZEw/qe3gEK9H/M6Z26h2erwKBr3emnJBzFQT
        R3P5EPmPax9BRlkKW8RNKzfg=
X-Received: by 2002:a05:6512:68c:b0:4fb:897e:21cc with SMTP id t12-20020a056512068c00b004fb897e21ccmr16115772lfe.67.1688550798485;
        Wed, 05 Jul 2023 02:53:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGfRPzFk83Dq4TRvBUdnBTYWW72Dkqa6fZSxS4fGVLTYvFLeND2XwmxN1ZysjO2uVZDU0mefw==
X-Received: by 2002:a05:6512:68c:b0:4fb:897e:21cc with SMTP id t12-20020a056512068c00b004fb897e21ccmr16115751lfe.67.1688550798187;
        Wed, 05 Jul 2023 02:53:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c220900b003fbdf8292a7sm1606487wml.46.2023.07.05.02.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 02:53:17 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 06/10] drm/exynos: Set fbdev flags
In-Reply-To: <a69f00d6-d6f9-377a-a4a6-fc6cc4bd6b7f@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-7-tzimmermann@suse.de>
 <87r0pmrbdn.fsf@minerva.mail-host-address-is-not-set>
 <a69f00d6-d6f9-377a-a4a6-fc6cc4bd6b7f@suse.de>
Date:   Wed, 05 Jul 2023 11:53:17 +0200
Message-ID: <877crer8fm.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 05.07.23 um 10:49 schrieb Javier Martinez Canillas:

[...]

>> 
>> The #define FBINFO_FLAG_DEFAULT	FBINFO_DEFAULT seems to be there since the
>> original v2.6.12-rc2 git import in commit 1da177e4c3f4, so is hard to know
>> why was introduced. FBINFO_DEFAULT is more used, I will just stick to that:
>
> Thanks for commenting on this issue. I didn't notice that.
>
> I think I'll just remove these _DEFAULT assignments from the patchset.
>
> And I think we should nuke them entirely everywhere. The _DEFAULT values 
> are just 0 after commit 376b3ff54c9a1. So there's no value in assigning 
> them at all.
>

Agreed.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

