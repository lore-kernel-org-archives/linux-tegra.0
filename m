Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8089AC433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 11:32:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E4436105A
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 11:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236677AbhEQLdf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 07:33:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37257 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236689AbhEQLde (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 07:33:34 -0400
Received: from mail-vs1-f71.google.com ([209.85.217.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1libTt-0001Mt-Ib
        for linux-tegra@vger.kernel.org; Mon, 17 May 2021 11:32:17 +0000
Received: by mail-vs1-f71.google.com with SMTP id v15-20020a67c00f0000b029023607a23f3dso215132vsi.10
        for <linux-tegra@vger.kernel.org>; Mon, 17 May 2021 04:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e3FmcbAaz97i/0mGPm1xongWtwPhysb9DCbSOZdwmwA=;
        b=D8Po0KrIu7m5dBkqwM+zycnpyhWOrZp+4W/PVmcUITikOr5/N6x2hH7Swi52Ka7Vqx
         7sknkOdCfBdEUSndrET0fzKfFugqkxlF7jHTriidwCMtHsilcsEVsHP6N7hCzb/56lvd
         kkcdoY0EULzeRe/XbGGM/fVkdjUU/CSlPt6vPtnwK0rzSjOWFqouO6nhK5Ngkouer6G8
         TTgIlGoyygWBRV4HR2o0TBCIdcH0fRuKxIbzxV4g8TxjcTCsOTJgSeEtqv5lD4Js+Ovn
         ZjpjyDZqzEA8McbSUtSW/KTYyV1nLGXRMiO8oB8wguh2BgkMqHEtAsWdcScsQ0rMl9W5
         dJJA==
X-Gm-Message-State: AOAM531m6a2GOS9QvJw4lmn1azLatTAQbnkMfC6h3QUxS3zVWLtzZoX0
        X+R3JauKHYLsY05Wy4g+9RbnZOK9oUpp7E99cIRo/6INsPs2w+wo3WkT2mIcWgrICV1m8DzjF+Z
        CwwKzgQjxLNI8732a4ZvYjcTG9kDGWATLmu/QzEBh
X-Received: by 2002:a67:f5d8:: with SMTP id t24mr3528631vso.6.1621251136691;
        Mon, 17 May 2021 04:32:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxba69ETvN3lOnnrYg5F3n4HbkorzTagbIUTpFc4lICqYwpy05W0NIDtIzwmjmnSTcepezZTA==
X-Received: by 2002:a67:f5d8:: with SMTP id t24mr3528605vso.6.1621251136493;
        Mon, 17 May 2021 04:32:16 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id q22sm2660541uao.13.2021.05.17.04.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 04:32:16 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] Enable compile-testing of Tegra memory drivers
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
References: <20210516161214.4693-1-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2dfaf36f-481d-82bf-79b6-2e7b80cfbe0e@canonical.com>
Date:   Mon, 17 May 2021 07:32:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210516161214.4693-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/05/2021 12:12, Dmitry Osipenko wrote:
> This series enables compile-testing for all of NVIDIA Tegra memory
> drivers.
> 
> Changelog:
> 
> v2: - Added patch which should fix compilation warning of tegra124-emc driver
>       on 64bit platforms that was reported by kernel build robot. Thanks
>       to Nathan Chancellor for the suggested fix.
> 
>         memory: tegra124: Fix compilation warnings on 64bit platforms
> 
>     - Added missing stubs to the tegra-clk header in another new patch. This
>       was also reported by kernel build robot for v1.
> 
>         clk: tegra: Add stubs needed for compile-testing
> 
>     - The memory/tegra/Kconfig now uses `if TEGRA_MC`, which was suggested
>       by Krzysztof Kozlowski to v1. This makes Tegra Kconfig to look consistent
>       with the Exynos Kconfig.
> 

Hi Thierry,

The memory drivers part depends on soc and clk patches. There is also
another series from Dmitry (devm_tegra_core_dev_init_opp_table()) with
memory-soc dependency.  I guess it makes sense you take everything via
soc-tegra, but just in case, can you keep the memory drivers on
dedicated branch?


Best regards,
Krzysztof
