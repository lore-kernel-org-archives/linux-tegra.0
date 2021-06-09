Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFF3C48BCF
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 13:20:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07E2B613C8
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 13:20:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233864AbhFINWu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 09:22:50 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42813 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233101AbhFINWt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 09:22:49 -0400
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lqy8b-0006fi-Qi
        for linux-tegra@vger.kernel.org; Wed, 09 Jun 2021 13:20:53 +0000
Received: by mail-wm1-f69.google.com with SMTP id n21-20020a7bcbd50000b02901a2ee0826aeso2533209wmi.7
        for <linux-tegra@vger.kernel.org>; Wed, 09 Jun 2021 06:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O/jeQfD/PRU7+ZLKVWo4kW6eSKyG/9GBLEURDHxDyzY=;
        b=d+KgMixlv7oNZZEu51KfyP10GaLLfP9DK8B70ygtQ+zlRMO0h5iNywMrBz7AgIjr07
         ZtB5ddkeL18cGtl/8gRnXH0UhtqiqbPubT2aCzALMmBnY8DHVces5EAFcdi4ljv0Xdmg
         sLfAQRp94jxXb1Hha9ty/EzwOohKQOdj6icFlEFqkTakOcxvLETaOU3YbbhGp4zFogQL
         QLSKlXW4vy2MZGI0qJ/IJtd7MWIDw+rN6xHYXcK1AamR11cggw4hp6zkSal62uxLACg9
         frCfvzfhuNJeh0Fv/fkBsrWCKXxF/ZgFwFin+C4/8R1TmUdrYobT3Ry2BkZa7tlo/LRM
         Km4Q==
X-Gm-Message-State: AOAM533J0NnIcvnxlTsXpuuRugwbCAo5l1hd0VrpDPNJS26UK5GvvmfY
        VWC28Url4Ga1baY7piL2r0zSf7Mjym6Tg6xzp1fepWPZXeeINnKyPS2N6nibpnef/spALHMDuUv
        Ur6lzzCZv3bZOMGUevqdNN9Bf/TLhzk5VXKQqOmkV
X-Received: by 2002:adf:e5c1:: with SMTP id a1mr28431596wrn.16.1623244853592;
        Wed, 09 Jun 2021 06:20:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPwIER/U8HjPgFdgQi+5438sNuC/K4BzQ7DUDd3BFdNyrQXv/3PhyC1zXgJG2F7mvCt819Hw==
X-Received: by 2002:adf:e5c1:: with SMTP id a1mr28431577wrn.16.1623244853437;
        Wed, 09 Jun 2021 06:20:53 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id v15sm2086058wrw.24.2021.06.09.06.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 06:20:53 -0700 (PDT)
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Osipenko <digetx@gmail.com>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <184b726d-fa8a-d708-df95-a0a7d1fcc58f@canonical.com>
Date:   Wed, 9 Jun 2021 15:20:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 07/06/2021 10:49, Krzysztof Kozlowski wrote:
> Hi Olof and Arnd,
> 
> Tegra memory controller driver changes with necessary dependency from Thierry
> (which you will also get from him):
> 1. Dmitry's power domain work on Tegra MC drivers,
> 2. Necessary clock and regulator dependencies for Dmitry's work.
> 

Hi Olof and Arnd,

Just FYI, the stable tag from Thierry which I pulled here (and you will
get from him as well) might cause COMPILE_TEST failures on specific
configurations. Regular defconfigs and allyes/allmod should not be affected.

I am giving heads up in case this lands in Linus later...

There will be two fixes for this, sent already by Thierry:
https://lore.kernel.org/lkml/20210609112806.3565057-1-thierry.reding@gmail.com/

1. reset controller stubs: going via reset tree,
2. reserved memory section: probably going via my tree later.


Best regards,
Krzysztof
