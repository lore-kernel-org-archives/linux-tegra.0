Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB332C32771
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Sep 2022 07:21:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbiIUHVq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Sep 2022 03:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiIUHVp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Sep 2022 03:21:45 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5277CB48
        for <linux-tegra@vger.kernel.org>; Wed, 21 Sep 2022 00:21:44 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id y136so5078164pfb.3
        for <linux-tegra@vger.kernel.org>; Wed, 21 Sep 2022 00:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=rLSD+s3AtoAhTykAnBDp3VaF0vmhBI25r5yoFG98O10=;
        b=a8vOg0xmi96GfdYXlwzyHp5SAUlD0cl20VIGBCY0PNVuL4cni9gLb5JpcO3RB3wBEC
         j9HDJuuLYHfcdoQNPl+rhk7Mq7j1O0aZA1eZj5wp1gMdAeTIuNFnYQmchC7n3Gxkha+w
         ho5YxzLx/6DFfcDvYHYacFEkGt7QGxaRguaaJS9Wjgzr4jCaK9U76HuOnc0f+sb1UhKI
         r4W2FKnxGtyBlB0MglyJ6EE+6SXE/z/vMCP9bmrM9elUlE2YQgvdpp7FAYsOUZNcQdtc
         WxmKw3zBNwIdKUnbIpjf0TZf5jEWhrUDAFt2qAyLbjIWwbq0qBw9ZXCkMk8iThyfva3h
         CnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=rLSD+s3AtoAhTykAnBDp3VaF0vmhBI25r5yoFG98O10=;
        b=mDK3G83obh1Z6EMHVffA/6owWvwd1RzNrwEXJdCxx9D7ZGM9dpBGEwHU+OrVf2hUBh
         UHxstbXkr7ZoXpa7KivETv8XW5KiPWZY9TVTCKvtm2hkPLmE0GoDpquAwR3c4nrYOEZj
         V4SVcUEuu7tACa6hCe7l4gs0hnUzZm2GoRpPS8xvwCW4JSUwzo+ROY0M4zLiShNEFGql
         kw0tM/zYfB0yb1aOn0X0SKHlKneqfb2ATMh7eeudhBH6tJhuLfDgUEArigqz75YygH8V
         L759l7hoFBhzjM4jy16wgEBx0gD4UZvqZkXHWZVpoH9H2XYXBaJLXwjfrk+I0BFiSU4w
         5LdA==
X-Gm-Message-State: ACrzQf3ZfAIpKurYa/uZeEVrm+pIKYsl8gbEXWKkLqBijYskxdghtqQX
        4ZRjxXGi4GIUXF5khr0KQgsbCw==
X-Google-Smtp-Source: AMsMyM6JWB4xvLIKLq6kbBnTrxd49X8BdV/PHGE6O0Ms9IZij9SaC4WvwVNigoFQ2TSXM6yYkx7EtA==
X-Received: by 2002:a63:e709:0:b0:438:98e8:d1c with SMTP id b9-20020a63e709000000b0043898e80d1cmr23605293pgi.403.1663744903768;
        Wed, 21 Sep 2022 00:21:43 -0700 (PDT)
Received: from localhost ([122.171.20.238])
        by smtp.gmail.com with ESMTPSA id t8-20020a170902e84800b001753654d9c5sm1212384plg.95.2022.09.21.00.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:21:43 -0700 (PDT)
Date:   Wed, 21 Sep 2022 12:51:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     rafael@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, bbasu@nvidia.com, sanjayc@nvidia.com,
        ksitaraman@nvidia.com
Subject: Re: [Patch v2] cpufreq: tegra194: Add support for Tegra239
Message-ID: <20220921072141.cye3zklnw4c7djjs@vireshk-i7>
References: <20220920110646.27837-1-sumitg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920110646.27837-1-sumitg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20-09-22, 16:36, Sumit Gupta wrote:
> Adding support for Tegra239 SoC which has eight cores in
> a single cluster. Also, moving num_clusters to SoC data
> to avoid over allocating memory for four clusters always.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
> v1 -> v2:
> - updated subject line and commit message.
> - changed type for 'num_clusters' from 'size_t' to 'unsigned int'.
> 
>  drivers/cpufreq/tegra194-cpufreq.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)

Applied. Thanks.

-- 
viresh
