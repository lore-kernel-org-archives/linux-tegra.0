Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0417DC48BE0
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 06:50:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA99061374
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 06:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbhFKGwx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 02:52:53 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48882 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231251AbhFKGwx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 02:52:53 -0400
Received: from mail-wm1-f70.google.com ([209.85.128.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lrb0I-0001No-QX
        for linux-tegra@vger.kernel.org; Fri, 11 Jun 2021 06:50:54 +0000
Received: by mail-wm1-f70.google.com with SMTP id g14-20020a05600c4eceb02901b609849650so4628803wmq.6
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 23:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MFwg4dzMT+GNp+7cUeqFsxComPsZ7z1fOjFQNUeqhI0=;
        b=CnhoU9/RyMFr92KgZYmHHUCRWA4H3z9mHco7XYOtbONZDUlR0A9H2HykEsZdZWgx2C
         kAcGWWhjsTqNa5rBuiUd77mn3+FXTSw4nc+OACJK6/X6Ku7FTmOOY9o1MaAFdNp9QziW
         vSDURoLmCeTFO7q8YKocUwV1dmJvFx9wDHfid5fwPkxvpCgwwtnG5VZ8XHbuJ+u1Xm68
         Nh579NVE5eEFQdt+4TEdVQ2Imz2j9H2sFnhfWqnve7SVBaWFk/mQBO0qsDILMqf4Lfxt
         WYmfsSAPtfkWZ2wUa6RzAKr6a4nC+Aw2ppZn2XyTTV0NSE9TQR1/rFW+px9OMUiSGmsd
         JIIA==
X-Gm-Message-State: AOAM533mfL2EgrJn4y5fjypked05QdZ+14arpTnr/ViVYQVOU/qMUECQ
        iFqMLr9z5NDftfiQPhp18TW0Mx0DPqDh7FZ0wsoFtEIiAMrJxNgRiBQsLg4jFF3tjQFJKAf2fZ1
        AOjuk2RI2kfiaQ4cP7kucIdTQAG8PlqOfgWS7H2YC
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr2174151wrn.117.1623394254111;
        Thu, 10 Jun 2021 23:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy31T/BcShcrMp6vqZMVXq+YF3HnLvUjMIbmy/dslDGjk5mBhfMArMfNaYMDS2ArUSnzgf7uw==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr2174138wrn.117.1623394254009;
        Thu, 10 Jun 2021 23:50:54 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id z5sm6045020wrv.67.2021.06.10.23.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 23:50:53 -0700 (PDT)
Subject: Re: [PATCH v1] of: reserved-memory: Add stub for
 RESERVEDMEM_OF_DECLARE()
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210610162313.20942-1-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <5f599a94-5977-981d-5271-3075be27c348@canonical.com>
Date:   Fri, 11 Jun 2021 08:50:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610162313.20942-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/06/2021 18:23, Dmitry Osipenko wrote:
> The reserved-memory Kconfig could be disabled when drivers are
> compile-tested. In this case RESERVEDMEM_OF_DECLARE() produces a
> noisy warning about the orphaned __reservedmem_of_table section.
> Add the missing stub that fixes the warning. In particular this is
> needed for compile-testing of NVIDIA Tegra210 memory driver which
> uses reserved-memory.
> 
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/linux/of.h              | 11 +++++++----
>  include/linux/of_reserved_mem.h |  8 ++++++--
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
