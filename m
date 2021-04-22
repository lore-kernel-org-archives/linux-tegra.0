Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A58C433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Apr 2021 00:06:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9BA361445
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Apr 2021 00:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241408AbhDVAG4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Apr 2021 20:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241393AbhDVAG4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Apr 2021 20:06:56 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3686CC06174A
        for <linux-tegra@vger.kernel.org>; Wed, 21 Apr 2021 17:06:20 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z8so49716734ljm.12
        for <linux-tegra@vger.kernel.org>; Wed, 21 Apr 2021 17:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=27m1UGNS+VcBWSBfuyVD6Ew+fGLpZ9TVYExhlN0sRMk=;
        b=d+yn47G7WUHyrplWRuTDQDwyM1XjpwUNxY3EQNiEqKouzVoz/aeYq7RR66SSu8NUCy
         TCLC0oahAomc5zvm64dlNj3xu8YFxYFrj8ZSeJq04T2GIDCKDBchJtrvMJiVAPX3PFpY
         H+lQ0xoqNNZkM/kkGP3a6SdYGc5sfmRQKocSDj99zOKfIDPGpOJHYOr8Z+Q7v9I7vRKu
         TBgT17wiZxSjxwBv519K0zCCTJiFEe/n1DvXi7wQiKm0rnw68QjrAToY66otN6cQ2cwI
         BurVIbOvaGkgeptxledJSXv5+NO08NV1G62DxsI/DEuJ+TH/69BU2H+tZmE8N0KMhBig
         MUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=27m1UGNS+VcBWSBfuyVD6Ew+fGLpZ9TVYExhlN0sRMk=;
        b=lBdj+Dc8iFsPjIXWD9IZULnrs4LRvdjdzz4sCfXbMQ8tug9S30HWCArRBtufTcG8O3
         H0u0WytEZnGIFWGTlsATqEm//PclwNwK/KInGnM0oWLVMyos/BCb+Pk5/La45FFwxUul
         gDtuK6xzcQwUel08T10pHTFfFJU0Do4CF7nYAdToai47pk4kqTYwfB6ESBdUdwPQGrih
         lzMzJQaQkTcM/4g5uUrgMgCiST8hhcQIoTpcABiU9msVe/pkY3UrJuK8/i4ujIX2tc8s
         u5Wnc1PxG/GiImlY8NixEHnwETUIwpy2ivrk3ZY/TS/xMGwx7io7QCuJ2F2Nk7Mbz8rx
         kzKg==
X-Gm-Message-State: AOAM5314vWztCe0I0XDSy+BwFYpX5KyBnNH+Z46GLD3s2H6wOrqfh1Ir
        /syGpgY4ow6Dfjy2qJxDsINZoUBOTsM=
X-Google-Smtp-Source: ABdhPJztXysMv0XqBMwBhsNXBcYtT3cOrd4rO/N9nc+U9I6rIIL4E/0t3GOrg8MP/Jfwnl19CiA5nQ==
X-Received: by 2002:a2e:a40e:: with SMTP id p14mr548210ljn.254.1619049978796;
        Wed, 21 Apr 2021 17:06:18 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-103.dynamic.spd-mgts.ru. [109.252.193.103])
        by smtp.googlemail.com with ESMTPSA id c4sm109839ljd.115.2021.04.21.17.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 17:06:18 -0700 (PDT)
Subject: Re: [PATCH 03/10] memory: tegra: Push suspend/resume into SoC drivers
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <20210420165237.3523732-4-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2a45a732-ff93-84f0-edf2-f9aa2e1504e6@gmail.com>
Date:   Thu, 22 Apr 2021 03:06:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420165237.3523732-4-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.04.2021 19:52, Thierry Reding пишет:
> -static int tegra_mc_suspend(struct device *dev)
> +static int __maybe_unused tegra_mc_suspend(struct device *dev)
>  {
>  	struct tegra_mc *mc = dev_get_drvdata(dev);
> -	int err;
>  
> -	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && mc->gart) {
> -		err = tegra_gart_suspend(mc->gart);
> -		if (err)
> -			return err;
> -	}
> +	if (mc->soc->ops && mc->soc->ops->suspend)
> +		return mc->soc->ops->suspend(mc);
>  
>  	return 0;
>  }
>  
> -static int tegra_mc_resume(struct device *dev)
> +static int __maybe_unused tegra_mc_resume(struct device *dev)
>  {
>  	struct tegra_mc *mc = dev_get_drvdata(dev);
> -	int err;
>  
> -	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && mc->gart) {
> -		err = tegra_gart_resume(mc->gart);
> -		if (err)
> -			return err;
> -	}
> +	if (mc->soc->ops && mc->soc->ops->resume)
> +		return mc->soc->ops->resume(mc);
>  
>  	return 0;
>  }

You added __maybe_unused, but haven't changed tegra_mc_pm_ops to use
SET_SYSTEM_SLEEP_PM_OPS(), so the functions are always used.
