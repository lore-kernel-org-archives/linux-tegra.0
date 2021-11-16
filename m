Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA223C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Nov 2021 09:06:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C293561BF6
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Nov 2021 09:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbhKPJJY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Nov 2021 04:09:24 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53182
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232882AbhKPJI5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Nov 2021 04:08:57 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 32609405F2
        for <linux-tegra@vger.kernel.org>; Tue, 16 Nov 2021 09:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637053559;
        bh=3EPGy1bR5I7+w5vmVQBBHzbUVQueeAHQUR0k5ZLmF2k=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=JxuLGKcfNoepbflkKnlOzRbOgEXNEwPbuNZWarR82BIY7O0z2jMJf3VHaiYozrEfn
         TvlEFufdN83Y8VjUR1rmR47j8dJ/BnRhuHXuRd/6fuWCsRiNtxkgHncA8/y7/tipex
         09fEzfgelJyH0ltXQ/3SoBLkk6Yy9FUDTL4R4s2GRmK7MFv89xLEc1GBDvlOlW23OU
         Lay/1TO3oXO9AsuSs0enHM2um0O+KV1JDobWG/AajdFMCBLvSTEcLo0S8P/RY1hQKr
         xd3k2vehUJqh2BAQnsIGe+GWuPRb+vZCxy/qUqEQ4DIK3KZGwdig82u9czW8f+jo2/
         /78A0gc5vap4Q==
Received: by mail-lj1-f199.google.com with SMTP id q64-20020a2e2a43000000b00218c94eab9bso5979493ljq.18
        for <linux-tegra@vger.kernel.org>; Tue, 16 Nov 2021 01:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3EPGy1bR5I7+w5vmVQBBHzbUVQueeAHQUR0k5ZLmF2k=;
        b=JqJGuuOF3L6U2+BpGLxhyoJw8KisOzBFOasOVPf2pOofIXaEDUiDEtdTVbMe93daje
         iu3AU7qTCWhSH5m7A3FfWDaUJa2x7NEJI+QG8N6fuSYg7FNFLESzH3IAJTktbWyPXKBR
         7BGFOa5FY93ufoi1zWXZmL45g7YpJVOprdEXxieiM0X3VIQOEEOMCAy+nMQfjN+jXWug
         cHlOMbxkHEnLEG0rlOqE92WAgy34uJkYani/jBK+09UwWAizKi4MNxkPAVr2zQaGohFU
         5LGxiH7KwgqeT31R/hTeNuTKvmQYRNB7/edVK3tXxOZFDG/385RCsxevoPaEbkaq3JGa
         xLnA==
X-Gm-Message-State: AOAM531khCovXn6UetIML5R3+B41TvdiF2JONoayGryoHYo3qFs3icpq
        LGn6sss7aX1rBI1jHcUTEHCsU3rRUVzNd7+DWlbmpIyZ4BDEAeq0ZXDD2T8JuFAOzEOOdsZdxM9
        O8ntkfEXRKaEWbwNZuNL5RKJ23b7VQjhO0AmkpQli
X-Received: by 2002:a05:6512:604:: with SMTP id b4mr5087928lfe.198.1637053558633;
        Tue, 16 Nov 2021 01:05:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1d2VaCPAfQf1c8LsXwYWlnMEptk5KrYLaPB04zm7G3TJ+VPZBh3WhuNwnzf/aAfVjPcB72g==
X-Received: by 2002:a05:6512:604:: with SMTP id b4mr5087881lfe.198.1637053558157;
        Tue, 16 Nov 2021 01:05:58 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b12sm1165411lfb.146.2021.11.16.01.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 01:05:57 -0800 (PST)
Message-ID: <fec64d66-8019-ae14-fd11-9af88440c12a@canonical.com>
Date:   Tue, 16 Nov 2021 10:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] memory: tegra20-emc: Remove unnecessary print function
 dev_err()
Content-Language: en-US
To:     Xu Wang <vulab@iscas.ac.cn>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, digetx@gmail.com, dan.carpenter@oracle.com,
        cw00.choi@samsung.com, viresh.kumar@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20211116013925.1087-1-vulab@iscas.ac.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211116013925.1087-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/11/2021 02:39, Xu Wang wrote:
> The print function dev_err() is redundant because
> platform_get_irq() already prints an error.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
> index 497b6edbf3ca..b2107d16570e 100644
> --- a/drivers/memory/tegra/tegra20-emc.c
> +++ b/drivers/memory/tegra/tegra20-emc.c
> @@ -1207,10 +1207,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  	int irq, err;
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "please update your device tree\n");
> +	if (irq < 0)
>  		return irq;
> -	}

No, it's not redundant because it is a different error message.

Best regards,
Krzysztof
