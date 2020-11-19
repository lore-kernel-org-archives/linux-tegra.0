Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897E2C388F9
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 20:00:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1990022272
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 20:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTdDrYFg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgKSUA3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Nov 2020 15:00:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgKSUA3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Nov 2020 15:00:29 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A38C0613CF;
        Thu, 19 Nov 2020 12:00:29 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id h23so7551901ljg.13;
        Thu, 19 Nov 2020 12:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xyUZdu0ZJU5P0gq+OS7JtPav/E7AN+ciZnMKt67PIXM=;
        b=cTdDrYFgE14Tz6ISubYdqwMlRtBBTcPrUNZfEqcYmGuikLS7+zJyqr5Fuk0GNlfIKc
         UZ5hGr+eYlfx8JpsskdwD4EBQ/CEBfReCUly8z6sCSDO+BeJ5PHuvlukN73UvCYEJum4
         sjWQPGPfn9RM5OnYh9dtXZ7yOZzmE+oL9+vfQuq62CfJhYgnMcRdzIoqcLk+rH1bPJsp
         /NdCWp7xHrBk5LC99IOn8dS8/BjkxuhP4b7XCyOIFXfL1MvMGDghopX1UIWa8KhAPcH6
         VD4SVO3nTZDqGk0htYp51UkCP6+vzeDR4ZxBvc0f3b+/PIXIqchKBoL5k3f3rO7M2m18
         r4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xyUZdu0ZJU5P0gq+OS7JtPav/E7AN+ciZnMKt67PIXM=;
        b=LDuxBuuEv47UnMyXeDpkObdqB2NascIYq532yH3gHixLMlCeJAJDMr8ZbNrST/x7zn
         48zcZkJjIJUbbP4uOYy/ah9sAt1FbXKNnV7hnRw7/dD6tmRDVYJmdgUHn1qsCRT6hmbw
         U4Z4n11DkTx5E5TPoRm6fdV2HyUd0xZUJ/SBeGb+oAZMKsAj9/XHFpIl7myevssNKyAT
         vp8/3Jkz0kbJ2oRE1Ays1YCkrlzk/w54/Irv/pkM3q9LV1aTpkkH2PrPq2pfH3PGIz4o
         24ZgkbCKyokIC02oIdF/evPNMOukqcHGNr0cWnToxqzumYoAIDPAKHw4Kk314ayu7fvO
         zKcA==
X-Gm-Message-State: AOAM530E5UQIQv9z56HU4dDS2gRcpaOfRhnhVziBNZtefB5JH/yJe5XJ
        ZbRHzh82tC4hEmm/tf3tRG8=
X-Google-Smtp-Source: ABdhPJzSyYiX0z7UiLarrvsWeizaeZoiSsUE3mYh2VAUBGPh+GOO3vIG2ipAWyPBHkWgYTHfJpHoJQ==
X-Received: by 2002:a2e:a54a:: with SMTP id e10mr6162806ljn.148.1605816027498;
        Thu, 19 Nov 2020 12:00:27 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id s5sm73746lfd.58.2020.11.19.12.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 12:00:26 -0800 (PST)
Subject: Re: [PATCH] memory: tegra30-emc: Remove unnecessary of_node_put in
 tegra_emc_probe
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        clang-built-linux@googlegroups.com
References: <20201119195244.1517236-1-natechancellor@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c8b53ce5-4fb8-e634-d4a6-baf00ae2e6a8@gmail.com>
Date:   Thu, 19 Nov 2020 23:00:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201119195244.1517236-1-natechancellor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.11.2020 22:52, Nathan Chancellor пишет:
> Clang warns:
> 
> drivers/memory/tegra/tegra30-emc.c:1275:15: warning: variable 'np' is
> uninitialized when used here [-Wuninitialized]
>                 of_node_put(np);
>                             ^~
> drivers/memory/tegra/tegra30-emc.c:1269:24: note: initialize the
> variable 'np' to silence this warning
>         struct device_node *np;
>                               ^
>                                = NULL
> 1 warning generated.
> 
> There does not need to be an of_node_put call in this error handling
> block after the shuffling of the np assignment. Remove it so there is
> no use of uninitialized memory.
> 
> Fixes: 5e00fd90183a ("memory: tegra30-emc: Continue probing if timings are missing in device-tree")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1203
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
> index 3488786da03b..93f9002d32ad 100644
> --- a/drivers/memory/tegra/tegra30-emc.c
> +++ b/drivers/memory/tegra/tegra30-emc.c
> @@ -1271,10 +1271,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  	int err;
>  
>  	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
> -	if (!emc) {
> -		of_node_put(np);
> +	if (!emc)
>  		return -ENOMEM;
> -	}
>  
>  	emc->mc = devm_tegra_memory_controller_get(&pdev->dev);
>  	if (IS_ERR(emc->mc))
> 
> base-commit: 5e00fd90183ab0103b9f403ce73cb8407ebeb145
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
