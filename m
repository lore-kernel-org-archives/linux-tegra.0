Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16735C4361B
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Dec 2020 07:33:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B17C7221FC
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Dec 2020 07:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbgLGHdv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Dec 2020 02:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLGHdv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Dec 2020 02:33:51 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E76FC0613D1
        for <linux-tegra@vger.kernel.org>; Sun,  6 Dec 2020 23:33:05 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id f17so8178948pge.6
        for <linux-tegra@vger.kernel.org>; Sun, 06 Dec 2020 23:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2pBx1FDKqYr7mMleextYOkYr//tDyniCmTiD8PorYSY=;
        b=I7HiLIUBizvzV5Hyzt3gyfmphCrc7Wrvp9AwcX74nKb4SCblx63ng8K2BSdDxkjRKC
         yraVUESuEQrT4tSmX+F7mlpVcMzWSgUOVQaJHYy9eeyzZOVsCkjcw4yihWtd3htsaOkx
         p40iP1ICwEIZYdUC2gsj0QeirjsB3D8SkwoO2/PSujMcXp79LcXFrLdmaBO9kGHQWcf5
         JmXHV1fB8+esp+YJ+Jy2A7bOjIIWYL4gWroE/1Bl77TS/QiFUnpR4+DdNLP0HfjKW5hP
         KVRNWuO5W9k6utI7b+64KdJRpB2CYrVMM79DAhC4HatKmW+5jPIqroqqithCTh/xh59+
         4wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2pBx1FDKqYr7mMleextYOkYr//tDyniCmTiD8PorYSY=;
        b=lqNhiPCk5O3y6n1b1QP3vcg92xz0F0VmxItAbC/yiw1DhphOI/tiKFHLPK5C6B7S3j
         GI0NB1gUxJy4dy9gOHmvTCeojKOD8xQZ//YfhVt44a//odbK68YA1aMU2xm4EFD1/n//
         My8cZW2vF3/Xh6ZQ5Vpd5XeHUj7pmUjvUH8Gf+80hgFp7H948nxlLYFaN9edM+TOmhkZ
         thf1FSCu+eYd2+piE93ljsiINxLuQ4Oa1LDPx7TF1S2THsnD2S1UYzY2tjXv4UvXIomk
         w4+cVgAuKV12v3lEd4cNXMSrTyueiVqEJevDqmRli5chH92EVTZsJr62NofXi4qShslN
         f5Zw==
X-Gm-Message-State: AOAM531QBwfZBET7Ly1XgjC9soxUjsixJ58wqh7YAoQyBD05koLFQkFP
        mdwrjmtqfyyBbo9dMF7rBeZoHQ==
X-Google-Smtp-Source: ABdhPJwpQw+i6ZfFXW3Kho5QgXjy35ocaPSdR4jbaxsoYu5lJ9r+gQuFOg5x+f2CTytJj98gBimeVA==
X-Received: by 2002:a17:902:aa8b:b029:da:ef22:8675 with SMTP id d11-20020a170902aa8bb02900daef228675mr5422380plr.15.1607326384551;
        Sun, 06 Dec 2020 23:33:04 -0800 (PST)
Received: from localhost ([122.172.136.109])
        by smtp.gmail.com with ESMTPSA id oc13sm9045541pjb.5.2020.12.06.23.33.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 23:33:03 -0800 (PST)
Date:   Mon, 7 Dec 2020 13:03:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [PATCH 0/4] CPUFREQ clean-ups for Tegra186 and Tegra194
Message-ID: <20201207073301.nar5vbqpgxbdgs5u@vireshk-i7>
References: <20201202091419.307192-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202091419.307192-1-jonathanh@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02-12-20, 09:14, Jon Hunter wrote:
> This series includes some clean-ups for the Tegra186 and Tegra194
> CPUFREQ drivers.
> 
> Jon Hunter (4):
>   cpufreq: tegra186: Fix sparse 'incorrect type in assignment' warning
>   cpufreq: tegra186: Simplify cluster information lookup
>   cpufreq: tegra194: Remove unnecessary frequency calculation
>   cpufreq: tegra194: Rename tegra194_get_speed_common function
> 
>  drivers/cpufreq/tegra186-cpufreq.c | 122 +++++++++++++----------------
>  drivers/cpufreq/tegra194-cpufreq.c |  12 +--
>  2 files changed, 57 insertions(+), 77 deletions(-)

Applied. Thanks.

-- 
viresh
