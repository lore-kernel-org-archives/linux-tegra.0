Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE7DC07E96
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Jul 2021 15:27:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17E66613D9
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Jul 2021 15:27:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238677AbhGOPaT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Jul 2021 11:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbhGOPaT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Jul 2021 11:30:19 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADA9C06175F
        for <linux-tegra@vger.kernel.org>; Thu, 15 Jul 2021 08:27:25 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id b40so9368849ljf.12
        for <linux-tegra@vger.kernel.org>; Thu, 15 Jul 2021 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xN5nwQhQGUrXuksqSdFQcf0YAddDFXMs40qw1Ze2qr4=;
        b=LSXtlQAAcA25pZsvDm9c7ZsYvpTCN7Uk0glC10eflwx4ZqcYtuNCq6Zi7lgsHUm2su
         9KrEopTi8WodyfuMfA4DYBGM6X5UQXKX3AzgQIdp+eiAuAZCR8bWjC6RdwY8Isv/mAa2
         CJU2SDEj3SjfAX1wR27jmvZ6yXmegxRKY//wB8aUtzrfjkkc4EvzcLbVV871TFgYqpG0
         uVlR20FlLIJy95K6HJaX0OmUXzwLWfMVVQqSJ42DWPxbqRXzt8MP7JqB6Xlnzm8M/+Ej
         z2y6T17/fb5HDi80fi16pU0xDa2S1+DFsk19NLVK/XDZJNjFDH4XGCvDAGwVOjDpB0Lw
         Gysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xN5nwQhQGUrXuksqSdFQcf0YAddDFXMs40qw1Ze2qr4=;
        b=VQ4XOxC8VMeKhbDPMg9uXJ/r0dCVKtEQw2B+GvojQv/yScKuRE+Ibg8sRICYBEq6uw
         bWXY1xKkofa/J4y9vfjnNunKun5s08ZcoA8XlT2y5QoU2R/98eqFaBwieK/sQuThCzXR
         s8sSqJ1oRbNob46rMgH2TZcsRILzqPvg4XfMU2NJO1gxJ+HuJBegnzCwnnlysVmLAn+u
         9yoDTk/ObGreV++ko35d1ApQge9LmJhg/W/lagr5avvs/XnhqAUgxjbm8hpUKInolTmp
         QH93I34zNB/DnMUbiXgCehOEmFsBd/FecN2Lqs3UL2Zd0cFgZYOi9+MnnID0MKM9s9C2
         DwRA==
X-Gm-Message-State: AOAM532LcyMq4wemk0TOaWE6VDvZUkw39hgftERnv0NiJEWfbbeBYb7o
        yPEyZHjQHy0Tt3L9j62Zkfu4mj1VAKw=
X-Google-Smtp-Source: ABdhPJxnrw87zO1lePrRxNhXx2vfzzDY2UtMaEkyPPCNeRsT4ZW/JTpVdl6ADPqTQHcIAmzyJ4dfCA==
X-Received: by 2002:a2e:720f:: with SMTP id n15mr97549ljc.333.1626362843891;
        Thu, 15 Jul 2021 08:27:23 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id z10sm437313lfe.22.2021.07.15.08.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 08:27:23 -0700 (PDT)
Subject: Re: [PATCH v8 09/14] drm/tegra: Implement new UAPI
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
 <20210709193146.2859516-10-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c8999755-f47b-ae08-60fb-cc430b1fbad5@gmail.com>
Date:   Thu, 15 Jul 2021 18:27:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709193146.2859516-10-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.07.2021 22:31, Thierry Reding пишет:
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index cddee6425461..6ee08e49ec57 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -21,6 +21,7 @@
>  #include <drm/drm_prime.h>
>  #include <drm/drm_vblank.h>
>  
> +#include "uapi.h"
>  #include "drm.h"
>  #include "gem.h"

alphabet order
