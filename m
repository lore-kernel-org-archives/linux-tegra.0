Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DECC433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 08:49:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48CFE60233
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 08:49:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbhDZIug (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 04:50:36 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42507 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbhDZIug (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 04:50:36 -0400
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lawwD-0005Fa-Ul
        for linux-tegra@vger.kernel.org; Mon, 26 Apr 2021 08:49:53 +0000
Received: by mail-wm1-f69.google.com with SMTP id c2-20020a1cb3020000b029013850c82dbcso2823797wmf.5
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 01:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vDx/pF71DRswA0Vh9il3llHlvDpc9DTJuzBlhZnkZOs=;
        b=gZD+lqFYekbnsKGXIOH2Q9pm0ikZPa3WNFzWbWOs+hOST4ldfni5gUd0ppsLFysNHH
         Y5Va2w04bOEJP/gmWr67cXc59mlxZ8G7FdEmVROqCSfv/HmRxcGjtEjsD9PTlTX4UOBX
         aF6x9vq6CY5IyXnkpBpuoiOn+vQIjCxQYmPMOSWcuyu7qXgTgeCZk4hyZDNaoNYhCUBq
         GVmsR4DAt+EVgCluRX2muvl1WcydH2cLs2qq29KzjwFcupdc1uE5R2sOtSAYvbPlMAnd
         +ZOJTH6PuIfzlDI4dl7kw3W+ldwI4RSADRmgcA1035ENPKKoxG8f5tqwUxhRgrIx34bT
         +kWg==
X-Gm-Message-State: AOAM533YkflNNsruJcbx3nqfxoY9UlfivZOkcDQq0LH38wAQVPnDG3m/
        2isH1sjuvGlya1v5v5NZfUmnSNr0rGsyrQz8ZXJJMo3k2mCgxrDTfWmy1MKk/l6MQHjG2nYMqJK
        5oAtc2shgt30kSZL/wqpMpSexqRy/8SuYK/c9Q0eH
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr21998720wrs.154.1619426993715;
        Mon, 26 Apr 2021 01:49:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMwlN7+/AG4RI2IBH83KYW2oysNRElSUN7qKGgzFn8jjG1AiNldJEiHnmlYdChvppLW2Jt9g==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr21998707wrs.154.1619426993622;
        Mon, 26 Apr 2021 01:49:53 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id s14sm19145030wrm.51.2021.04.26.01.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 01:49:53 -0700 (PDT)
Subject: Re: [PATCH 04/10] memory: tegra: Make per-SoC setup more generic
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <20210420165237.3523732-5-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <200ebdd4-bee0-caf3-e0b6-f4ba5e55b0e6@canonical.com>
Date:   Mon, 26 Apr 2021 10:49:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420165237.3523732-5-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/04/2021 18:52, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The current per-SoC setup code runs at a fairly arbitrary point during
> probe, thereby making it less flexible for other SoC generations. Move
> the call around slightly, which will allow it to be used for other
> implementations.

You moved from one arbitrary point to another - please therefore explain
the rationale of new arbitrary point a little bit more (e.g. after clock
initialization? before HW access?) and put it next to struct tegra_mc_ops.


Best regards,
Krzysztof
