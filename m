Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CF0C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 08:40:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FF7461373
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 08:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbhJSIm3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Oct 2021 04:42:29 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50512
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234519AbhJSIm1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Oct 2021 04:42:27 -0400
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 503C73FFFE
        for <linux-tegra@vger.kernel.org>; Tue, 19 Oct 2021 08:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634632814;
        bh=Oor8RTrlmsEN48luONw/N1nWvDIt2v+vgwt+AyOlKOw=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=GvKfyAmf8aA4jbz+eXz9aJBhSx+dcIm52lg7fbV+gCVIUJ2KJLOTuwtCealo13gm7
         f7ccmNEX9Kjv+xJ67Iu5X2+7hLRDCWcMmzH4pdWhHCgQtuyXkxHjd8xkB9x9D21Iui
         rgLOsceubNzuAIIsETHq11L01NRK7hnGhSWD73Sa97vkeeHcAj7n3yjqI2724g3YGL
         nMobfiDJjqSnlr4IU5Pq3BUNrgkSWH+r/o+9lS3vKUKbrOrNr9RJisWvDltgfRdwLX
         d2ve0NtChcPQIy4yy4rGn1BqKmazhNBhqLrkL9/gmKzB1EEEcZnxReJtlvO0jq2tUK
         /JfKDwjhS55+A==
Received: by mail-lj1-f198.google.com with SMTP id t7-20020a2e7807000000b00210dad8b167so604188ljc.22
        for <linux-tegra@vger.kernel.org>; Tue, 19 Oct 2021 01:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Oor8RTrlmsEN48luONw/N1nWvDIt2v+vgwt+AyOlKOw=;
        b=XiqgLZBE10FseWxtZWa610keXbuxv7q2pqqTSFUohX47pU47LWDtVfI7j/PZADDiib
         0WDHyx1js59Q9mLaTzHY40/YUgzkwuAwU9DvbqkwfyhwG7uehj+88bpCEM8tKBiBnGZN
         4u9+FKEpm9T2tbnc6zQb11+YfMvH6kprzlufQrYvWT4fXP1D5/FmHyfwsa1fbD0IroYW
         1qOkplRu9rSTTHI9h7rPBu/LCfsFnzLllFtPjK1lZ/GUx4NDNfQ+WNz1p8DHypXTca0U
         fI1uFskK/4OFhgo5KZb+5Nobv7xWKuuPGy4OKqe+bzdok6ddYDmTfmZifd6EQ6Xm2I5B
         Gklw==
X-Gm-Message-State: AOAM5303uGSiYfg82did/CgQWtkWENL+L3Hnpd5oo4TbfzgPmHNsauic
        UgimjUr6xoODfCAzhKgy2nClLRRbJT8TTvNvAIHQNNbLiXRBvLahW1AoHB1/Db+cj2CTmvHNdu9
        33Ei0+9KmkZC0X9aXBz+qGkUhPwJonrXs1bycRbTr
X-Received: by 2002:a05:6512:2284:: with SMTP id f4mr4821163lfu.489.1634632813453;
        Tue, 19 Oct 2021 01:40:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/DCtam+TMmVk6rVhZw7QiHJeII0jI9LLFQfSbkNULeX7J1V2erkSiMc1YeZNWvHUyMMFxmQ==
X-Received: by 2002:a05:6512:2284:: with SMTP id f4mr4821147lfu.489.1634632813288;
        Tue, 19 Oct 2021 01:40:13 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id f6sm2001725ljo.36.2021.10.19.01.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:40:12 -0700 (PDT)
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <1634632294-27413-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH -next] memory: tegra20-emc: replace
 DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <46704f75-ce6c-0687-7d50-f3ff27de7baf@canonical.com>
Date:   Tue, 19 Oct 2021 10:40:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634632294-27413-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 19/10/2021 10:31, Yang Li wrote:
> Fix the following coccicheck warning:
> ./drivers/memory/tegra/tegra20-emc.c:915:0-23: WARNING:
> tegra_emc_debug_max_rate_fops should be defined with
> DEFINE_DEBUGFS_ATTRIBUTE
> ./drivers/memory/tegra/tegra20-emc.c:885:0-23: WARNING:
> tegra_emc_debug_min_rate_fops should be defined with
> DEFINE_DEBUGFS_ATTRIBUTE
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>

Where is the report? If it is not public, it's not reported-by.


> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

NAK, it's the 6th patch for DEFINE_SIMPLE_ATTRIBUTE in Tegra memory
controller drivers. Several folks from alibaba and zte.com.cn keep
sending patches replacing only one line each time. Leaving all others
not touched.

It's my mistake I actually accepted this, so this ends now.

This is not a warning, this is not a bug. It is rather a coding
convention, so sending such one-by-one is unnecessary churn. Pointless
patches...

Replace all of such patterns or don't send it.

Best regards,
Krzysztof
