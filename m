Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091F4C433C1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 17:21:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C95F361A01
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 17:21:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhCYRUz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 13:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhCYRUe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 13:20:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4915AC06174A;
        Thu, 25 Mar 2021 10:20:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 75so3671266lfa.2;
        Thu, 25 Mar 2021 10:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p1KeodbuGWMDyTs6ausZFxyrBcpgyG8oe8WdaIAVZPs=;
        b=h0k8p75+H2fkeOXitrFSXG3rb+8KB9COOng/LwUdtO1tGAoWANJ4F/v4HUiT007UwR
         PNwiwHnwcBPVVJqsQM9/p15w1PnxvB3CayUORBHlTphE1gjgM799B5JJKMdxOgUGlhPL
         u6U0QDqxA6F3LeAF6vADjVz7/FZ5EjkDWl1PmaBN/rxE0JAqd+fYSmqbGPewTAfcCASH
         Ypf2i8k4B5cdAZtkMde2pVXUTEWErNShkf04lr6JPOLJQqjPNRelhzFPJpt0TVUkm35W
         xC+fNi+bYDJBIZ0Yclp/NZu53gD77bICvvfgHmTh0qh/q1aiug1pqSpNuiCcmgsMd4QT
         TrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p1KeodbuGWMDyTs6ausZFxyrBcpgyG8oe8WdaIAVZPs=;
        b=eCqX8q+tel+kky5aXqxSfmap+AXsleZrSRPycC3sYkEHKP5F6In4t1na0jXjOtS4Gd
         Z9YJRUH8E9mGGLA5KJHr2I4wNJuhsL+XyImwzLHZgfCaRQdSc6QZQjX7Mu49dflhxOcu
         xdEynEpAakEpgcQfTvRYcE/TM337JEgtMMktqWurxiWII+uHeDxEkya6ZIifIGRRRv7F
         Pe0vVDB82sl5349zxy+34DQBtA+6FjX0yUiSYC/v4X/gOROXvQkwElxu9Omr+goPh0dz
         DtJmNUzhLuH/HptY/Fg2O+RGFxvQHSnjGk4sA8NErKA2l4/J+jmuUkmzZjp0c/cmVJlg
         zuDQ==
X-Gm-Message-State: AOAM533wOlAQS9xVUfLkuJ4RVTyCeX4aIvsbZWDwP0H2ZbwinjlmbmER
        nNqwm1NNVFQtT8jk8bwicES6s5NIDQI=
X-Google-Smtp-Source: ABdhPJyEeAMez5OVsm0Xv98iTg+rCo6MWO3Jq3trdKl35QrRfwaaDs6zrH3QCnm1cUolICCZ/qT7Jg==
X-Received: by 2002:a05:6512:3327:: with SMTP id l7mr5728175lfe.639.1616692832603;
        Thu, 25 Mar 2021 10:20:32 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id g7sm285491lfc.179.2021.03.25.10.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 10:20:32 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] memory: tegra20: Correct comment to MC_STAT
 registers writes
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210323210446.24867-1-digetx@gmail.com>
Message-ID: <799f54f6-6023-338f-4e8f-cc0dfbac30d8@gmail.com>
Date:   Thu, 25 Mar 2021 20:20:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323210446.24867-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

24.03.2021 00:04, Dmitry Osipenko пишет:
> The code was changed multiple times and the comment to MC_STAT
> registers writes became slightly outdated. The MC_STAT programming
> now isn't hardcoded to the "bandwidth" mode, let's clarify this in
> the comment.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
> index 14caf5b9324c..4659c0cea30d 100644
> --- a/drivers/memory/tegra/tegra20.c
> +++ b/drivers/memory/tegra/tegra20.c
> @@ -451,9 +451,8 @@ static void tegra20_mc_stat_gather(struct tegra20_mc_stat *stat)
>  	control_1 = tegra20_mc_stat_gather_control(&stat->gather1);
>  
>  	/*
> -	 * Reset statistic gathers state, select bandwidth mode for the
> -	 * statistics collection mode and set clocks counter saturation
> -	 * limit to maximum.
> +	 * Reset statistic gathers state, select statistics collection mode
> +	 * and set clocks counter saturation limit to maximum.
>  	 */
>  	mc_writel(mc, 0x00000000, MC_STAT_CONTROL);
>  	mc_writel(mc,  control_0, MC_STAT_EMC_CONTROL_0);
> 

Krzysztof, please feel free to squash these 2 minor follow up patches
into the original patch which added the the debug support, if you prefer
this way more. I happened to notice these small itches only after you
already picked up the previous patch.
