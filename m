Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F6FC47082
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 19:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE0FF613F6
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 19:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCTqu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 15:46:50 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49495 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCTqt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 15:46:49 -0400
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lotH5-0006hv-Ky
        for linux-tegra@vger.kernel.org; Thu, 03 Jun 2021 19:45:03 +0000
Received: by mail-ej1-f71.google.com with SMTP id q7-20020a1709063607b02903f57f85ac45so2347055ejb.15
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 12:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bkatCSOblhJnW0MXA23OfZ+fFl/GArRo3ZEN7l5hv/Y=;
        b=ILj7Q7KsEVtlq2p/5KA+kN9Pjmcr9gy/qNtkWlvOgjOLRvBEIYPKRBm9LruiheAKUX
         4qUpgh5ZVdJPRYb2iC1CviGkaolpTeR9TKBGPFmwzXlVjelx3fCNas5521F+6h3ajcAD
         cd0Xg/MYgiBeqtw6HQ9ZtKtSe7uegqkLrkOvctiNZwQVb5jaHUC+H7ahrZm8p9Zi71V+
         i2Uyhm5Pzmydwo2T5wtji99IhisubTk7ISSQxTyfd+tnnBj2oez+PYZ/cDJhpgpoDmqX
         xKXV04U3a537dd7jSfMQEtQEocqB4qoM6Osx0TyNxtTF3UUY1VqU8Ko3tJw5kYj3cr9D
         EKLQ==
X-Gm-Message-State: AOAM532qgJpA5Nvoq9k2HToN+iPu6EzB1+PoI32Mwb5gnEfSfLuZC7Ks
        PN4rzs4cCBk9uiRPTfqg22FWp8CQ4lwnJ7T+/DANHnFTCyg4mqtB/WxQK1vkjpEaa/FC55Y7Zgb
        DpsyaRopMKscxzDyNxwzVv6xed+6Rpyj++kS6b94J
X-Received: by 2002:a17:906:b048:: with SMTP id bj8mr884405ejb.236.1622749503343;
        Thu, 03 Jun 2021 12:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6yvSwMykb7JWVrdKR3u7XQKJIwG1s3xs7STX7qqVVMu0IHevSNBS8K6H4wsGP/0U8wANWSw==
X-Received: by 2002:a17:906:b048:: with SMTP id bj8mr884393ejb.236.1622749503213;
        Thu, 03 Jun 2021 12:45:03 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id f6sm1867292eja.108.2021.06.03.12.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 12:45:02 -0700 (PDT)
Subject: Re: [PULL] memory: tegra: Changes for v5.14-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210603143739.787957-1-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <a4126d48-f5fa-d20c-9874-fc8ac78febb0@canonical.com>
Date:   Thu, 3 Jun 2021 21:45:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603143739.787957-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 03/06/2021 16:37, Thierry Reding wrote:
> Hi Krzysztof,
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-memory
> 
> for you to fetch changes up to b4f74b59b99fab61ab97fc0e506f349579d8fefc:
> 
>   memory: tegra30-emc: Use devm_tegra_core_dev_init_opp_table() (2021-06-03 14:24:03 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> memory: tegra: Changes for v5.14-rc1
> 
> This stable tag contains Dmitry's power domain work, including all the
> necessary dependencies from the regulator, clock and ARM SoC trees.
> 
> ----------------------------------------------------------------
> Dmitry Osipenko (18):
>       clk: tegra30: Use 300MHz for video decoder by default
>       clk: tegra: Fix refcounting of gate clocks
>       clk: tegra: Ensure that PLLU configuration is applied properly
>       clk: tegra: Halve SCLK rate on Tegra20
>       clk: tegra: Don't allow zero clock rate for PLLs
>       clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
>       clk: tegra: Mark external clocks as not having reset control
>       clk: tegra: Don't deassert reset on enabling clocks
>       regulator: core: Add regulator_sync_voltage_rdev()
>       soc/tegra: regulators: Bump voltages on system reboot
>       soc/tegra: Add stub for soc_is_tegra()
>       soc/tegra: Add devm_tegra_core_dev_init_opp_table()
>       soc/tegra: fuse: Add stubs needed for compile-testing
>       clk: tegra: Add stubs needed for compile-testing
>       memory: tegra: Fix compilation warnings on 64bit platforms
>       memory: tegra: Enable compile testing for all drivers
>       memory: tegra20-emc: Use devm_tegra_core_dev_init_opp_table()
>       memory: tegra30-emc: Use devm_tegra_core_dev_init_opp_table()
> 
> Thierry Reding (3):
>       Merge branch 'for-5.14/regulator' into for-5.14/soc
>       Merge branch 'for-5.14/clk' into for-5.14/memory
>       Merge branch 'for-5.14/soc' into for-5.14/memory
> 

Thanks, pulled.

Best regards,
Krzysztof
