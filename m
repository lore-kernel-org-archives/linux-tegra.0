Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366D5C47080
	for <linux-tegra@archiver.kernel.org>; Fri, 21 May 2021 21:22:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0104613F3
	for <linux-tegra@archiver.kernel.org>; Fri, 21 May 2021 21:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhEUVYQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 May 2021 17:24:16 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56465 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhEUVYO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 May 2021 17:24:14 -0400
Received: from mail-vs1-f71.google.com ([209.85.217.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lkCbY-000158-Hz
        for linux-tegra@vger.kernel.org; Fri, 21 May 2021 21:22:48 +0000
Received: by mail-vs1-f71.google.com with SMTP id a11-20020a67d30b0000b02902363051a2cbso7033938vsj.18
        for <linux-tegra@vger.kernel.org>; Fri, 21 May 2021 14:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jSKiGkFsHm8qeUwaLdynXEY7fptjk7YiH8pCxN+OTOM=;
        b=JBvsfL7xlDKtFESDCrXKO5pRx2WuauDKEuWnIYyTk7ryVo1iYPuZhb8PBTmoGuDbAX
         O4b6dGcFts+AlCEwj5MARCVNZOTfxm44OtL+kpAodXa8fMZEwIvkfUCNhdF/2vKIC99x
         XV3OYMy4aOsRFFAEqA5+j9bxVhJWEg4hl2xU88z7T2z63ohf6mq++WJ2gi5XIzluw1Bn
         3qGg0sXvuXsHCEA7umHu3iSweCshNJ3UiiVx2hJYq4ZmSh0k0CvdGdNHkc1xuVjdMQ2Q
         FddI54bT2D4tC63hSOH2urbUfOpefJKIr8f6bUW2TgSCVIBSxMdbEU30DvaTJw9ktpF0
         RbhA==
X-Gm-Message-State: AOAM5334edeiU4OhkXwMPVsJDUs+QRK3vFnduJwqd+tuat7sSFRtyjl0
        ve2aBPUNZzyQox+8V4GTijnf+tRLaHALjmkWSvdCSRclX0m8REFFwMEvbP9giGFelcTmbJVdbi8
        nBRj5miVgDwOYdpyL2aO8KjloayC02SxxX8gj29Y9
X-Received: by 2002:ab0:63d4:: with SMTP id i20mr11750978uap.21.1621632167734;
        Fri, 21 May 2021 14:22:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvQ2l1U8szglgOD1N+hyDpgNDWEMA/0qq5+dQBkcYT64fZxhNQR94GbFgCi0ec6pzhy1FOKA==
X-Received: by 2002:ab0:63d4:: with SMTP id i20mr11750968uap.21.1621632167595;
        Fri, 21 May 2021 14:22:47 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.5])
        by smtp.gmail.com with ESMTPSA id 39sm798548uaq.5.2021.05.21.14.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 14:22:47 -0700 (PDT)
Subject: Re: [PATCH v1 09/13] memory: tegra20-emc: Use
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
 <20210520230751.26848-10-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f24704bf-c9aa-1552-659f-a3eff9086ecc@canonical.com>
Date:   Fri, 21 May 2021 17:22:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520230751.26848-10-digetx@gmail.com>
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
> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 48 +++---------------------------
>  1 file changed, 4 insertions(+), 44 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
