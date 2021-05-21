Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB58AC4707E
	for <linux-tegra@archiver.kernel.org>; Fri, 21 May 2021 21:23:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C971E61183
	for <linux-tegra@archiver.kernel.org>; Fri, 21 May 2021 21:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhEUVYp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 May 2021 17:24:45 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56511 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbhEUVYi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 May 2021 17:24:38 -0400
Received: from mail-ua1-f70.google.com ([209.85.222.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lkCbw-000198-KC
        for linux-tegra@vger.kernel.org; Fri, 21 May 2021 21:23:12 +0000
Received: by mail-ua1-f70.google.com with SMTP id v20-20020ab076940000b029020b0b4ada34so7963044uaq.4
        for <linux-tegra@vger.kernel.org>; Fri, 21 May 2021 14:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fROMD6BYmf3h06oRhpwPZGf5qSe1v9Tji/Vc0NCzaJs=;
        b=LVp6cTFoXCC2jcdjeN3T0bu3nEUvNqz3cf0phVTRN66HF/Z3o0f/LiUnj3r6EyMitN
         OcuCNqVxRRABxI+RYptlWbkX2wiCyX8xW/x6l/vvgwEiTazVDsS6ysLgCwEdICPIf4IX
         SfEEIOFq1Q8qnAbWIHF/f+w9tK3+AURKi3ReIszG074DODolaN0Ydpzj1EftP9p77XpM
         Gotzjz25e9WWcS4CwUSybfo0l+rP7xnbVhEosud3ctg+RDKy8qdFLLJPG1XiFQDMY3kx
         YFpNozaxRFODaRpB/xMEVmFe8T7cRjH98lTlvEum0XlHyaujvd9kYkBd+ooKQZGBGt8x
         tDqA==
X-Gm-Message-State: AOAM532toTcZqqWXe6k80FlbUZLbhEuENa8BCKZEqMRhJu26UikpLTGb
        4fHqCMr/AXgYKoD+Kdgbfw4DxNd/0lW5DqZcN24bzI1AGIw4dPpPcTn6jQqQDh548GOCAJCfugp
        jF2jyoPyCX6lHIF9tLRAEgG+wtwQ0Jhl/CxLWwP5z
X-Received: by 2002:a67:2c57:: with SMTP id s84mr13304952vss.32.1621632191789;
        Fri, 21 May 2021 14:23:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAkzP0vI6cvbwXWhDnOK8BKrtLOqAAl/3T8yacV2iIbe5gMjJbANDaWCWgPJfJiZWzKX/R1Q==
X-Received: by 2002:a67:2c57:: with SMTP id s84mr13304943vss.32.1621632191648;
        Fri, 21 May 2021 14:23:11 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.5])
        by smtp.gmail.com with ESMTPSA id r12sm825043uao.6.2021.05.21.14.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 14:23:11 -0700 (PDT)
Subject: Re: [PATCH v1 10/13] memory: tegra30-emc: Use
 devm_tegra_core_dev_init_opp_table()
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        =?UTF-8?Q?Nikola_Milosavljevi=c4=87?= <mnidza@outlook.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        linux-clk@vger.kernel.org
References: <20210520230751.26848-1-digetx@gmail.com>
 <20210520230751.26848-11-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <670d0d27-867a-7a1a-db58-692429ec30d6@canonical.com>
Date:   Fri, 21 May 2021 17:23:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520230751.26848-11-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/05/2021 19:07, Dmitry Osipenko wrote:
> Use common devm_tegra_core_dev_init_opp_table() helper for the OPP table
> initialization.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 48 +++---------------------------
>  1 file changed, 4 insertions(+), 44 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
