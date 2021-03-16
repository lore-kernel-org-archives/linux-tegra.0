Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA377C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 23:50:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBC8564F18
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 23:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbhCPXuU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Mar 2021 19:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhCPXuK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 19:50:10 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670A0C06174A;
        Tue, 16 Mar 2021 16:50:10 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id d3so193322lfg.10;
        Tue, 16 Mar 2021 16:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oXB6+xyPHDZii/8O9jaaLZrloHiccp9uG7TidAIdX0k=;
        b=kRHoWji8jQln8q8Emkhm9fn17e4lS/p8UsvjfB5cvTetb/Da63gDE39WRgw7dvhu1Y
         gy9nj9oRpezB2IaqX5GzqvU2ADGDh4HIKqVzPI4WY7cpZl+FguNoXGiiJaeK8d50sht4
         +w+h2GLqWvKcPGtM2SMGz7s9oNORggO/J2jqjO2PimXt69AEeXMWM0lresu3Jl/eLVEO
         EveER/6JmJfTjne35NEzUHAecHg2u6oiAruMfEs5YZu57FHHmPCgrkc96jOCUCCUF7TQ
         ZQvuHF6AT/9HBL4yYzDXgC+fJWbw/UUPh7Z2EfPix4qSYjWCxJJCxz//DoP99uWiJeVS
         Dv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oXB6+xyPHDZii/8O9jaaLZrloHiccp9uG7TidAIdX0k=;
        b=M63n9gTl8ymHB8ulXhh+XEFGljlD5dz/lcsNZ59Jnlv4jFcjNNaUanfQNekcM22xbF
         FACVR93MstWHUMnjPVmevaNjQyVUlCc/g15d0EpcO6WWXjCE4uNjhLYKpTMG3HRSNnDS
         S6ISZc8tzoqu2SSKJe2P/G6g+aFfxodMFxml/UOaopmWMup0KtOJqUKIBGS0LU5k14Vw
         It0vkGXxNW/ytiMZFjgItkr7Kbu/KY7p6o4klhkcqZjI8hFM+yuabjMxiezoH2dNYMss
         vOqu3KD2sIUwcnNRg86qsk2Y5tpOA58gqQDMWxGsu/ByPsCSjqMx01xIQZmdyo+0fSiZ
         6gNQ==
X-Gm-Message-State: AOAM531d37Pf+o1vpIhnt7lmTG8zKSEZy88IgXQfgwp7FY+3poIyEMVU
        W8nzDOwHBd1UEHj001FdBmNZxkM/doY=
X-Google-Smtp-Source: ABdhPJxOjUQ/S1fQWKKSlk4V0vmyKUunbtYbvY0y9KlqnwZngvig7Kfff6LvYs+wNYWkZY8F4UebjQ==
X-Received: by 2002:a05:6512:3709:: with SMTP id z9mr628448lfr.557.1615938608636;
        Tue, 16 Mar 2021 16:50:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id g21sm3170038lfr.212.2021.03.16.16.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 16:50:08 -0700 (PDT)
Subject: Re: [PATCH v5] iommu/tegra-smmu: Add pagetable mappings to debugfs
To:     Thierry Reding <thierry.reding@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20210315203631.24990-1-nicoleotsuka@gmail.com>
 <YFCTmwpg9pMQqcSu@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d338d407-8e0a-a94a-dcff-80556174492e@gmail.com>
Date:   Wed, 17 Mar 2021 02:50:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFCTmwpg9pMQqcSu@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.03.2021 14:16, Thierry Reding пишет:
>> +	seq_puts(s, "}\n");
>> +	seq_printf(s, "Total PDE count: %u\n", pde_count);
>> +	seq_printf(s, "Total PTE count: %llu\n", pte_count);
> Some of the above looks like it wouldn't be very easily consumed by
> scripts. Is that something we want to do? Or is this targetted primarily
> at human consumption?

Output should be parsable using a simple regex. Could you please clarify
what exactly isn't easy?
