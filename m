Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D809CC432BE
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jul 2021 19:06:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D208960EB2
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jul 2021 19:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhGVSZh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Jul 2021 14:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbhGVSZg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jul 2021 14:25:36 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8479FC061575;
        Thu, 22 Jul 2021 12:06:10 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f30so10122893lfj.1;
        Thu, 22 Jul 2021 12:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8GPvH37U9AVvoiGmJTERSPwWA4hLKExZ+r0mnysiIKQ=;
        b=S9Jyqy/Ipy8FLlB5s5pAuzJqiNPbnjupcnP9ceUfVl93fXkd8RWb7Bq40hZUlOMQuh
         qQ02OwpX7b3NI83cJ6IRN5h2I8CUAjWahDKgZpMMjANg1IvvohEvN42FyTVM8sjcjoCd
         592mb7QI77NPaUl0DGMJ+cec8UfheprHADM/OuSzQu/2sLcYFfR30k2qaUvkn+ueVn6P
         2J/iMYNVCxrPaHKzjcH+F0bVq07J6waXvKgp+Tsxr2eA1Wba5rfKsYWgEkMDF2HsXCM4
         fjrW22d5ze2liYaAo6G9I3x/u9fRtDvy7F7XxRI1m40lEnu7ZUIHjwqRcXxL05bPaPPJ
         I1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8GPvH37U9AVvoiGmJTERSPwWA4hLKExZ+r0mnysiIKQ=;
        b=LFPYq/EqIu6RAMs18DZ5zAoQV8lBrzy4Mik07lDTElqNiy30Qm8fQKIZllR3t1cgQP
         +CN5K5po/x4tEBo0g6HNY1rk7/iXcQRJNzFNW3HbmD3KnpkJ1pa/xW3SCEKxrA7irxuK
         421H+ncqzi0CXsRqWCXSkGnxQWtm50FcvLxeR4TysY6/H8ylyV81lWXSZij3bQYfLx0S
         uBJwKQ+NMnnk/v6rIMNjyI8Sf3dhB3PyxpKfG/QjgLqJ8f4z2B4Oqoa8qIM40rzYe6hL
         W25Y+oxYPD+Vhe/ZdygyShCQdpaW/t/hUNMMyXJSzwov9ompatGXEIA0W8whiyhg7d91
         8vLw==
X-Gm-Message-State: AOAM531i6zonkxD//mmfnhNk5/sJ37hKaL/bZA0mR459i2ChHUeeQQHb
        sbDuNBXWnc/LTDn7ri/khb4=
X-Google-Smtp-Source: ABdhPJycaONyfZtb2bb6gvbyjCarSMAoz30Mds4KQ4Ple5uJp8eka4uoBoXi5io+pp0ChLAKQuCRPg==
X-Received: by 2002:ac2:5dc1:: with SMTP id x1mr560074lfq.87.1626980768961;
        Thu, 22 Jul 2021 12:06:08 -0700 (PDT)
Received: from [192.168.2.145] (79-139-184-182.dynamic.spd-mgts.ru. [79.139.184.182])
        by smtp.googlemail.com with ESMTPSA id p5sm1201778lfo.254.2021.07.22.12.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 12:06:08 -0700 (PDT)
Subject: Re: [PATCH v1] clk: tegra: Implement disable_unused() of
 tegra_clk_sdmmc_mux_ops
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>
References: <20210717112742.7196-1-digetx@gmail.com>
Message-ID: <3dcf5744-9e3d-b39b-fed7-1630c446bfeb@gmail.com>
Date:   Thu, 22 Jul 2021 22:06:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717112742.7196-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.07.2021 14:27, Dmitry Osipenko пишет:
> Implement disable_unused() callback of tegra_clk_sdmmc_mux_ops to fix
> imbalanced disabling of the unused MMC clock on Tegra210 Jetson Nano.
> 
> Fixes: c592c8a28f58 ("clk: tegra: Fix refcounting of gate clocks")
> Reported-by: Jon Hunter <jonathanh@nvidia.com> # T210 Nano
> Tested-by: Jon Hunter <jonathanh@nvidia.com> # T210 Nano
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Stephen, please feel free to take this patch for the rc3 fixes.
