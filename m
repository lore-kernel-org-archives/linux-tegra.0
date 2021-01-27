Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190E8C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 19:28:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1A3064DC4
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 19:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhA0T2G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 14:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbhA0T2F (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 14:28:05 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA391C061573;
        Wed, 27 Jan 2021 11:27:23 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id q12so4254427lfo.12;
        Wed, 27 Jan 2021 11:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eErsvLQOi70Fd3rG1vmBEBTaAjJEcb2LwVEepLIWATU=;
        b=R3RU1QwwcEqZkTI62T9Zu+9akNzecHJo/rRpmlVMMVi75QfqdlcLh+T6YNGtwZSEpV
         jriS1kM6s7uZQ3GMqCzCvRksku4Tffn/RZvSpVhlM8zDKeVQ5628A2cO/nR+7inzelm0
         TeFkaEo0sHqZ6jy540qbfaXwSfP3Sbco53m+vJO1lciYahutroc6pe6HUCoXrXCUwcFf
         1t2nNCj/z2mcpd0aqGhNPixH+eLrIqR1w1bO5Dvia4zhUz+xb84mB3jiKcz+SkICXE/a
         XNpyHJ1UPfxkC0JuiucalFDXTeeGXuKuqUNc9IdGTIQKktJlR8IYU0++OGmaYPIkShWA
         bCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eErsvLQOi70Fd3rG1vmBEBTaAjJEcb2LwVEepLIWATU=;
        b=CEE6g5LjwRwk6MXRvLNPJqFxZumm8V/CrnbSR/Egrp6zzmYPkwX8KT1iXk8KSO+J2M
         Q2OToAgb9/Y/uoPwuthSQqDZoEIOiCFzUsAH6mjCdbPZKi9d0otjXjvbS41YoJimJv9G
         TghyLtfOKyzGPj6WxPBszPibQIZZTc6s1qJxg+4kFUwzIo+hWy95/NSGizOTEDUonY6B
         OwW8RAWE7M6UgjAls2uySiNogI1dzKZ8d0vTi5cvcis025uAp0P+Iwmdzrg8LWsPAHwY
         HklG5M3KW8Jexn/OvUIvDl4HK+DhL9UQ7qnTNya5SbaYySHy+bMxdZM7Pt3NuvgSjSdk
         8LuQ==
X-Gm-Message-State: AOAM530j0lkl7u1Pu5fEgg8T37A2RRb648m48/8Tb/Ud/mgm+j77xbV9
        m33WTsmw1GydC1m0fnUTEZemsLXl0yg=
X-Google-Smtp-Source: ABdhPJzKwaHUxYryKtRRvgvSAFxMD9lHOCcbac8uoR2B9dEYSi+hKPtlCvODpMHeTl0qq0ePeVyppw==
X-Received: by 2002:a05:6512:79:: with SMTP id i25mr5617302lfo.549.1611775642080;
        Wed, 27 Jan 2021 11:27:22 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id o14sm707048lfi.257.2021.01.27.11.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 11:27:21 -0800 (PST)
Subject: Re: [PATCH] memory: tegra: Remove calls to dev_pm_opp_set_clkname()
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <0f22cc1791d8b88c50a9790c2dc19455b34ec7b0.1611742564.git.viresh.kumar@linaro.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7daaf77c-4ba0-0c69-1028-49518eb44d18@gmail.com>
Date:   Wed, 27 Jan 2021 22:27:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <0f22cc1791d8b88c50a9790c2dc19455b34ec7b0.1611742564.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

27.01.2021 13:16, Viresh Kumar пишет:
> There is no point calling dev_pm_opp_set_clkname() with the "name"
> parameter set to NULL, this is already done by the OPP core at setup
> time and should work as it is.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> ---
> V2: Update tegra124 as well.
> 
> Krzysztof, please take this through your tree, it doesn't have any
> dependency in the OPP tree.
> ---
>  drivers/memory/tegra/tegra124-emc.c | 13 ++-----------
>  drivers/memory/tegra/tegra20-emc.c  | 13 ++-----------
>  drivers/memory/tegra/tegra30-emc.c  | 13 ++-----------
>  3 files changed, 6 insertions(+), 33 deletions(-)

Ideally drivers should be able to ensure that OPP table received the
clk, IMO. But this is also almost fine with me since realistically
clk_get() shouldn't fail if it already succeeded a moment ago.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>

Could we please fix the _allocate_opp_table() to not ignore clk_get()
errors like -ENOMEM and etc?
