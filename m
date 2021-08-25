Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FA0C4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 09:46:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3351961100
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 09:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236314AbhHYJqr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Aug 2021 05:46:47 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56394
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236638AbhHYJqr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Aug 2021 05:46:47 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DDBBC406F6
        for <linux-tegra@vger.kernel.org>; Wed, 25 Aug 2021 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629884759;
        bh=ZKJrI2d7Kv4sG35EVY46Fq8Zkkqpb2VHIDHfjL5pSXs=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=KsAOzZKl4IHxl6bDKVz8/un5xxQjFJ2hTob4JehAk5OLpX+sqY7DKWCn0E3pHoOF3
         WC6NSoTnFfdsINAT1c6DHxl4uTvLOxFF2JSD8ibRXUadLkEkdVxYaumTMItbR2Hzim
         40jn8KMuUFQXU5Jh1ID7vOrvcOiReeLLFKEI0gzh4VSRvUPdc8A19vaPDlkJWwcCtu
         BEAjk9LOKEjClVJQWiV7lXuUb7ACsagNwsfai3x9mEU928VLwBGOoduds8f/GFtbXG
         Kj4Cjhf4QN/Vj2xPSPtYufQERVAjAnnyL1uZeGG7u+93t152IU6a9BSioT9cv3KEkF
         cGbuQAwe0wbPw==
Received: by mail-wm1-f72.google.com with SMTP id p5-20020a7bcc85000000b002e7563efc4cso1747452wma.4
        for <linux-tegra@vger.kernel.org>; Wed, 25 Aug 2021 02:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZKJrI2d7Kv4sG35EVY46Fq8Zkkqpb2VHIDHfjL5pSXs=;
        b=b9yg2ptfqHSOj4OIgXrmdJ/ILSt5iba5tTfsGvEu4iJC3EZiUoaXe9aZEULBDI7oJp
         z2wrJ9sS5XlQUnCnZQBCVm+9TWLsHTnHf/Wfe6suKvNinYN/XsJBTCzyuLrbdChjWx++
         3gfh1O299FrkDIJku6crgg/TgpoD1mmO/4Y8CSCmu2OOdE19dE3OiXLHvfcFaCCK1oOF
         N21uxZ0lSvRh+B734zoGfQTettbZpCYLq9QSmCvK4HxoXwvwR74Ed3byhKKx3D0pUobF
         IgqxsU+WpUTxkQLUv5ntCuWLldV7yKCIS8f88QsvliYh0x0A7IV1+kqxO0N4KhXv+hta
         KSNg==
X-Gm-Message-State: AOAM532cYmXdkdAqQ8Ey82U5+Wy1rT4+EzruZHGyE672R7Tz5ZKeeqBM
        CuTNCVk0z0EYAbCLO6yr9HIdAxdYUoRN1Edr1NXZs/VEQfalCUcV6dc4fOTVPj4tlDLe8cpnWiq
        bHRpZ4YzgQtReVM443k4ior5OyA+joB7xmHYC4S/q
X-Received: by 2002:a5d:460a:: with SMTP id t10mr19281699wrq.147.1629884759429;
        Wed, 25 Aug 2021 02:45:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi1Ef7zjNIHRCkcaWZFpqJGa6Dbk4j07l8Fn4wmElE0lvaSyGoFBY+FREyB0j+C6Z0qYWiQA==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr19281686wrq.147.1629884759281;
        Wed, 25 Aug 2021 02:45:59 -0700 (PDT)
Received: from [192.168.0.103] ([79.98.113.31])
        by smtp.gmail.com with ESMTPSA id h11sm16195677wrx.9.2021.08.25.02.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 02:45:58 -0700 (PDT)
Subject: Re: [PATCH linux-next] memory:tegra210-emc-core: replace
 DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
To:     CGEL <cgel.zte@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Jing Yangyang <jing.yangyang@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
References: <20210825063739.70260-1-deng.changcheng@zte.com.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <344b7b12-4134-883c-1e0a-cdab7800067f@canonical.com>
Date:   Wed, 25 Aug 2021 11:45:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825063739.70260-1-deng.changcheng@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25/08/2021 08:37, CGEL wrote:
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
> 
> Fix the following coccicheck warning:
> ./drivers/memory/tegra/tegra210-emc-core.c:1665:0-23:WARNING
> tegra210_emc_debug_min_rate_fops should be defined
>  with DEFINE_DEBUGFS_ATTRIBUTE
> ./drivers/memory/tegra/tegra210-emc-core.c:1726:0-23:WARNING
> tegra210_emc_debug_temperature_fops should be defined
>  with DEFINE_DEBUGFS_ATTRIBUTE

Thanks for the patch.

One error message is enough. They are the same.

> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

Where is the report? We work here in a public, so if there is a report I
assume we can reach it? In case the report does not exist, anyone can
run checkpatch, coccinelle, smatch and sparse, so how does this differs
from me running checkpatch?


> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
> ---
>  drivers/memory/tegra/tegra210-emc-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
> index 06c0f17..3b8284c 100644
> --- a/drivers/memory/tegra/tegra210-emc-core.c
> +++ b/drivers/memory/tegra/tegra210-emc-core.c
> @@ -1692,7 +1692,7 @@ static int tegra210_emc_debug_max_rate_set(void *data, u64 rate)
>  	return 0;
>  }
>  
> -DEFINE_SIMPLE_ATTRIBUTE(tegra210_emc_debug_max_rate_fops,
> +DEFINE_DEBUGFS_ATTRIBUTE(tegra210_emc_debug_max_rate_fops,
>  			tegra210_emc_debug_max_rate_get,
>  			tegra210_emc_debug_max_rate_set, "%llu\n");
>  
> @@ -1723,7 +1723,7 @@ static int tegra210_emc_debug_temperature_set(void *data, u64 temperature)
>  	return 0;
>  }
>  
> -DEFINE_SIMPLE_ATTRIBUTE(tegra210_emc_debug_temperature_fops,
> +DEFINE_DEBUGFS_ATTRIBUTE(tegra210_emc_debug_temperature_fops,
>  			tegra210_emc_debug_temperature_get,
>  			tegra210_emc_debug_temperature_set, "%llu\n");
>  
> 


Best regards,
Krzysztof
