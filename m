Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C178C4361B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 16:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5928922509
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 16:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730557AbgLOQFL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 11:05:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730867AbgLOQE5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 11:04:57 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E13C06179C;
        Tue, 15 Dec 2020 08:04:17 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id v1so1466961pjr.2;
        Tue, 15 Dec 2020 08:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YGpQPgurGWPwNYjPnz49FvwMTbgi6JG+8HNnBDR9cn0=;
        b=KcHxqTRS2xBdz35q9yGDP3PpdY0OTH331s+62YKFWNYdYgImsdMxNWch6w6IrGB0BK
         ZF0OcwGbLioiNKVQcA0qtk0vfWCjtXicxrNtSWM2IHseL3JWhdkamvuGWxor0mGzxAHF
         a7iEodJxlUETHZ+bqF+MGvBP3KapPU8Z0OlgTGIIn+szPDQMkcARWmvoqcvdslhI/0Wu
         dhZt7pAexH8W/OsOuQA9sjtBWttUbxaVNajOu+dJTf8+gzbDNbbIdJq/4/CoDIoZH2aM
         F2SXguLCgvScBuVMqLgp8v+XUxrGBb4ApeyjSDmGaqm9sH2bLKydymbRedbDP3vmuJr6
         rLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YGpQPgurGWPwNYjPnz49FvwMTbgi6JG+8HNnBDR9cn0=;
        b=nqpUKr1sgEKtFGP9TMkoPsicNLqyN0RnngczKktaylOXHZZNrB9ZH2oLiPDBFuPkG+
         u9ASjGE0JW2FNj9eTssfixzYoBb11dIZyBFAWIoPHu66U7lps6Nl2hfqn8SsoVloZM8P
         0B9uB1TsSREdEEIvsS1z/GnEnItzu5PDjVKY9I5XaRKNpfi8/KlnFQGjmaiKnVSfqtWe
         UTm+rfHGGWxzUwEoocBWE6NK9r5h/WNLYxU8xH4bktxSdHPnc6N5bRJp0uUCNA+0kowz
         JYzxv99pLiDgEJgPqPJozaZYcK1q9W2E8/vwglaSDWWx4iryMLVle0GdtrgQM7rcNtUQ
         35tw==
X-Gm-Message-State: AOAM530UlNOMleTDVbAdq/Gp/iQO4Mtg7Isjx/3Ae7rMFFZ7fv44B+Qx
        8zaRhgDOb/qMYn+9prWlUaYhsHCjqtA=
X-Google-Smtp-Source: ABdhPJxsGCNrtM7Ct34Kte43eL723lSZoJhqtVZQipYw9cXbzXRBZYgtlUfJWOVWdu7IFiRqZIvPmQ==
X-Received: by 2002:a17:90a:e386:: with SMTP id b6mr30337438pjz.134.1608048256551;
        Tue, 15 Dec 2020 08:04:16 -0800 (PST)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.gmail.com with ESMTPSA id a26sm24978348pgd.64.2020.12.15.08.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 08:04:14 -0800 (PST)
Subject: Re: [PATCH v1] ARM: tegra: Fix misplaced tegra_uart_config in
 decompressor
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20201215135222.6899-1-digetx@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <980f70c6-8967-c110-1699-cb0da2f46cc0@gmail.com>
Date:   Tue, 15 Dec 2020 08:04:06 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215135222.6899-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 12/15/2020 5:52 AM, Dmitry Osipenko wrote:
> The tegra_uart_config of the DEBUG_LL code is now placed right at the
> start of the .text section after commit which enabled debug output in the
> decompressor. Tegra devices are not booting anymore if DEBUG_LL is enabled
> since tegra_uart_config data is executes as a code. Fix the misplaced
> tegra_uart_config storage by embedding it into the code.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2596a72d3384 ("ARM: 9009/1: uncompress: Enable debug in head.S")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/include/debug/tegra.S | 54 +++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 27 deletions(-)

Looks like arch/arm/include/debug/brcmstb.S would need the same
treatment since the implementation was copied from tegra.S.
-- 
Florian
