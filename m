Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3202C433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 11:28:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5ADD4610CB
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 11:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236831AbhEQL37 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 07:29:59 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37160 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236849AbhEQL3w (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 07:29:52 -0400
Received: from mail-vs1-f70.google.com ([209.85.217.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1libQJ-0000yz-Bg
        for linux-tegra@vger.kernel.org; Mon, 17 May 2021 11:28:35 +0000
Received: by mail-vs1-f70.google.com with SMTP id f26-20020a67e09a0000b0290235a378d2f1so326174vsl.17
        for <linux-tegra@vger.kernel.org>; Mon, 17 May 2021 04:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=esNX7fYr4zGWw4UHT7I+6MGEmlUq84SLXsDfE2Xa3Xk=;
        b=kMzZh58jnjDHMpYWNBXc3zV7MY0npi/tG2Ss5f2QW5B3v8QXEwb0rkdw2IlbOk3ZJu
         S2Jmsy5PW12EQEuXnhsVbYMTtafrLZa+ofhNqjUgZbdRL0zM6zBBfhbQJag4ER/0NbeC
         dOeKkH71Tnv165V+V1TP4/s0FFlIPHt1dAfT924mAtQEV/g7U1ECDbKLneiGrxptWPPN
         zvU7UxF0Zumq6WBovbNEE8VVc90RkL/sSaSvxTjBCySRow451+WabkJ5k3hYP1ShR+Yc
         0eJvae2Ic5U6lsD4tCuc8bDKG4ZGv5+EuaoUgiBnNXXgtgKngyL7HdYozwbhKvcFhOkq
         Xd0w==
X-Gm-Message-State: AOAM530KBPqMYxG1ciZ2H6Tma3zYy/en6JpROY96p6F+lFA7A11QwQ3t
        P/RRaEKZ82O3GlENxntdzhEQWBZOay85yT9smgqfzzIFeLpu11bN3/s6pU0P6RG+YQkKVAHm85h
        DROdlrxW6I9oddoD7vJFIG1mpWq1j6JtoR8mPAt/3
X-Received: by 2002:a67:d11d:: with SMTP id u29mr51137834vsi.53.1621250914185;
        Mon, 17 May 2021 04:28:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyEUoip1vAtYB4Aouqa7f3RS7fz7TyAZiT6gOnYqGGai+Ao94jeqvyUi+347N5b1UOoQVndw==
X-Received: by 2002:a67:d11d:: with SMTP id u29mr51137821vsi.53.1621250914020;
        Mon, 17 May 2021 04:28:34 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id a201sm2224600vke.21.2021.05.17.04.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 04:28:33 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] memory: tegra124-emc: Fix compilation warnings on
 64bit platforms
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20210516161214.4693-1-digetx@gmail.com>
 <20210516161214.4693-4-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <936cfc7d-737e-a582-ea60-ad2ba5b4ca72@canonical.com>
Date:   Mon, 17 May 2021 07:28:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210516161214.4693-4-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/05/2021 12:12, Dmitry Osipenko wrote:
> Fix compilation warning on 64bit platforms caused by implicit promotion
> of 32bit signed integer to a 64bit unsigned value which happens after
> enabling compile-testing of the driver.
> 
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra124-emc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
> index 5699d909abc2..c9eb948cf4df 100644
> --- a/drivers/memory/tegra/tegra124-emc.c
> +++ b/drivers/memory/tegra/tegra124-emc.c
> @@ -272,8 +272,8 @@
>  #define EMC_PUTERM_ADJ				0x574
>  
>  #define DRAM_DEV_SEL_ALL			0
> -#define DRAM_DEV_SEL_0				(2 << 30)
> -#define DRAM_DEV_SEL_1				(1 << 30)
> +#define DRAM_DEV_SEL_0				(2u << 30)
> +#define DRAM_DEV_SEL_1				(1u << 30)

Why not using BIT()? This would make even this 2<<30 less awkard...

Best regards,
Krzysztof
