Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6141C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Feb 2022 17:07:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbiBXRIX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Feb 2022 12:08:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbiBXRHp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Feb 2022 12:07:45 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B447A88A0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 09:07:12 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j7so5016295lfu.6
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 09:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=N0jQLv1+zuQN7juoAXyJ+WWIVk1aqUcFAR93hnw7M9Y=;
        b=h4SyIOcr6gUDJDSMri5CABMlLmrTqmXTYoPBWmZ5Lsz6MfmMYMHjqQFLDrSWZEaPNm
         Mnq6Hz6mtjIlWlS1fbJ6a/izSvhS/6Uvomrp9DKrs3Fg3PrltiuwwR0ly1LWmYz22Ysr
         NsONJOkpJEmpXKKQBv4tu/bLVhIYOu3NXXkxOgGeCaqKoPoAd1eM25dodyz0EEIQKhf4
         gDbV7jZK2bRJdtz+aAKNWcFgh7lABpJJNGQ4UM4x0f3S8xGjlwoZsRPVDJvzmIa4DdrI
         5HIWkNKOK6TLHoEex2DuwVFllrkb02rq3ksmS4B2WP7brvQPdHO6pcIuSrWZH+SYgi8u
         A1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N0jQLv1+zuQN7juoAXyJ+WWIVk1aqUcFAR93hnw7M9Y=;
        b=LnKS/9K6UeJKVOCiOH9P+Q06RWFpzOgCBKyw0xtiRya9mvfXkvnbG5Nn7SdjVU5AOu
         1Qq7mcBglhbskHCEit1xROYzKPVND6YwB0Wjmkhs7sojxV5RJV2VzU3bFYRFRxod9EXJ
         AOgfVbPo4nwckbgwohlnoL6A0TBYQKRLKmuBgDYLF8uauEW+1/MMkSNbeY9QaIVYCQEZ
         78XFRAMNzfOcHChPJYHIycUalqbI6Lpf/Low6DLMhBp74qcudB/CyNo3a+yDIcJk25Nz
         Q4gAMAg5p3T+LSLKV/7wvzdCc49xbWiqBKToIYcpzuEvmw3Ig1SeHl6Rb2DBp/RmW+EV
         PRkg==
X-Gm-Message-State: AOAM532IPizqsl12GDLU+3XDDteYFPsvKuxmeidLLfh/uflbAexXOou3
        49Bt30UZFqPHWlSCTNeGJ4U=
X-Google-Smtp-Source: ABdhPJwByzbLPtYGX70Ak/KjjViiZSUd1OOgzHpWQYmN6ffI8my/q+YdLYlcaAtO3d6HUFEPBcq61g==
X-Received: by 2002:ac2:554d:0:b0:443:6539:a299 with SMTP id l13-20020ac2554d000000b004436539a299mr2456801lfk.552.1645722429067;
        Thu, 24 Feb 2022 09:07:09 -0800 (PST)
Received: from [192.168.2.145] (109-252-137-194.dynamic.spd-mgts.ru. [109.252.137.194])
        by smtp.googlemail.com with ESMTPSA id k11-20020a2e920b000000b002463777bbb9sm17962ljg.24.2022.02.24.09.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 09:07:08 -0800 (PST)
Message-ID: <50d71f43-ff35-7dba-8263-0891125984de@gmail.com>
Date:   Thu, 24 Feb 2022 20:07:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH libdrm v2 07/25] tegra: Make API more consistent
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
 <20220217191931.2534836-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220217191931.2534836-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.02.2022 22:19, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Most functions in libdrm_tegra take as first parameter the object that
> they operate on. Make the device and buffer object creation functions
> follow the same scheme.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  tegra/tegra.c           | 13 +++++++------
>  tegra/tegra.h           | 10 +++++-----
>  tests/tegra/openclose.c |  2 +-
>  3 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/tegra/tegra.c b/tegra/tegra.c
> index cf091c1d758f..6a51c43110e5 100644
> --- a/tegra/tegra.c
> +++ b/tegra/tegra.c
> @@ -66,7 +66,7 @@ static int drm_tegra_wrap(struct drm_tegra **drmp, int fd, bool close)
>      return 0;
>  }
>  
> -drm_public int drm_tegra_new(struct drm_tegra **drmp, int fd)
> +drm_public int drm_tegra_new(int fd, struct drm_tegra **drmp)

Does libdrm allow to break ABI?
