Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B4BC433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 11:33:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9BEC61073
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 11:33:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236743AbhEQLeY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 07:34:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37271 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236740AbhEQLeV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 07:34:21 -0400
Received: from mail-vs1-f69.google.com ([209.85.217.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1libUe-0001SN-3A
        for linux-tegra@vger.kernel.org; Mon, 17 May 2021 11:33:04 +0000
Received: by mail-vs1-f69.google.com with SMTP id b24-20020a67d3980000b029022a610fc6f2so537781vsj.22
        for <linux-tegra@vger.kernel.org>; Mon, 17 May 2021 04:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kQXbZ0GBpMeIdKKjZ5TbypurkKvU8BrE/KZM5yWXMaQ=;
        b=CAB344MDUvh7/qHPWp1bCFbiU7sK2PqKQ5BZq+d3SnLmldpqzBeoXpTtaApWvoj/5W
         BYu9d9ssbsU1AHTXKRrrfccHTmMY53WzOCKhknch9H2YO+zf6KrgylxXCyxcX9ZVYTYq
         BaLDOnDSoOg6+T+X8FxJjcGLBsoP3dTrYQ7v67fcunCa6K8I+eGxxAG6Qv17OnblIRPn
         S5kVi5+R9b6TKpEffJzXdhFzurQg++Y95xvq/8M/NiXLO6N0XKjxfzvzClD02SkeIPCR
         rr1fqQQeze3q4gthxlTcYZaIPCOfxueA2Z2A07vIhHXhCV5SDbphTVVjwIWjtwlGGhUS
         jczw==
X-Gm-Message-State: AOAM533wfaMTyZrItRWkfKC7Pe9CgQ2pH4uea4QP7yOUSC8Z7Xp0r+DX
        2NfbzVrwE6kVmqZqiyMuq0lyCbqBNjSZh3+MhfIlrJl51XutniExJxMJwQeJRjmZeMovuhFJoOb
        Mu2IYr5sxFhTSxzrw1zSlaKHsXz7a6Et8NulVigsV
X-Received: by 2002:a05:6102:e08:: with SMTP id o8mr3024454vst.29.1621251183276;
        Mon, 17 May 2021 04:33:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBtUWKgqJWY8Y6YoYB0wyLexLSheMP3/JgQhAaRd52J6CsNhUccW8OwoEq2IRhuYNn6TOfjg==
X-Received: by 2002:a05:6102:e08:: with SMTP id o8mr3024443vst.29.1621251183070;
        Mon, 17 May 2021 04:33:03 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id b197sm2233859vke.24.2021.05.17.04.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 04:33:02 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] memory: tegra: Enable compile testing for all
 drivers
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20210516161214.4693-1-digetx@gmail.com>
 <20210516161214.4693-5-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <acafe8b2-e6c1-7864-5efc-cebaa2342856@canonical.com>
Date:   Mon, 17 May 2021 07:33:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210516161214.4693-5-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/05/2021 12:12, Dmitry Osipenko wrote:
> Enable compile testing for all Tegra memory drivers.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
This depends on clk/soc changes, so I am fine to take it via other tree:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
