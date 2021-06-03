Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4969C47096
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 19:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A52160FDC
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 19:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCT6S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 15:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCT6R (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 15:58:17 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F912C06174A;
        Thu,  3 Jun 2021 12:56:32 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c11so8639050ljd.6;
        Thu, 03 Jun 2021 12:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xLmuqv8+VvAJd/tS7XYKE2iTRlHcCh362YCbtO8ZSLo=;
        b=MPX1By8AbYBxMjXMKuuuGLW44ZpG0+jFhsH5LxwO0sYy/r4S/R8EVFFDn2GxGokbDF
         SDuA8WLfEw+ol/lUEwHZJL9vL8920F63DGK4dzONLZhCefgDD9HvpBawJmioYvYvw1Tl
         uL38JDAW40/g65IghdTsZ8NU/KGJn83NsgyG/6kbL6dy2G3SgyPFzkbY2OYqMQJoTHW+
         2QlxJhbpmxHsH110wFhu6hHGescMOrtcQquEiYQzHyyDZqXTo8Pe9nZEBWqw/COjKVVz
         93eScpf93nFkz8yh80HpNllhqvCiXCUoKlMK4Q9yFsJPq+5iuJMucpiR2r9JfuREHQrl
         2lQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xLmuqv8+VvAJd/tS7XYKE2iTRlHcCh362YCbtO8ZSLo=;
        b=S9P5zPX9fgI5/1iA5O0faQW6DP5f27ZHyMzyhKLQdUWPJZuz+jySiFcw0/ng4+RUJA
         xaUR3EaMB/z/mIUylTPyGwqTRH+yZhW4T+urePZmNYJqKmXRARw8bi73DQ5b7gI0LrJG
         TqZ0V3hyuGRYpFxQV0fTUXptNnMutYg3w8aSTNBkrfXcvGAJoIc3WBfNrLXiuZp3Wf1a
         0MasmP4fSTl5qMwwr6X8hBg1Wd1dNn4DwYZG5d6U0ptAgOpn7fFiKDxgfilhB11O0q+w
         k/MYF9MFXL+Sxyvhdat4vT0ZUTlmaajuMAPyAW+5PMvpUNeDaCu20mwT90nrYWPIKs8Y
         O27g==
X-Gm-Message-State: AOAM530rw8JMUoAWIYsHuZVHxpbQA9v99hQkY0VXL2Np1YUNooc0upAr
        PxnLW2Vriuk971eWkwf5vjvo7m0u1ik=
X-Google-Smtp-Source: ABdhPJzwC/FXD4QJeAyc5932Jssx9f7OC1g9bE0aNqjUd9+QK6vYyAHwAPutgbkAEFL36lLfVD2CIw==
X-Received: by 2002:a2e:95d0:: with SMTP id y16mr746611ljh.140.1622750190687;
        Thu, 03 Jun 2021 12:56:30 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id z6sm24328lfs.64.2021.06.03.12.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 12:56:30 -0700 (PDT)
Subject: Re: [PULL] memory: tegra: Changes for v5.14-rc1
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210603143739.787957-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <772bf62a-fb09-cec4-ed4d-ddbfc2832e2b@gmail.com>
Date:   Thu, 3 Jun 2021 22:56:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603143739.787957-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.06.2021 17:37, Thierry Reding пишет:
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

This patch is a build dependency prerequisite for the "soc/tegra:
regulators: Support core domain state syncing" patch. Will you send a
new PR to Krzysztof with the remaining soc/tegra patches?
