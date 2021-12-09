Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D613BC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 20:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhLIUKI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 15:10:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbhLIUKH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 15:10:07 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DD3C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 12:06:33 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id u3so14218514lfl.2
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 12:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O2Zhia1G8aaQ/ddT9CgIJhv0ta7u5KMNEsFfWkzNNvs=;
        b=LGjeXbEYbqPZPLh1nhFOHQSFWjr0NN5nElKEBb2IuWADCeCrOviSzEgWrFHjIAmS0m
         Oo5N/Lh7vQvNLS9C/2cfYGHnFXSAPRZTlEnmSIxQMarU5EtsNgpdviNQSrMGmZo2fr6k
         +sPR76ZSqH+Zo4Za2w7eSzpFAtywawEuph8soT3UBQGMvrChz8ROwgvYF2GZey/zk5az
         YCXqFOiMridvE3GUvDIkom/FQ/H+0iFd+mH4ZMPD+Ok5S89mkyJZnx8tSYovslS8RXS8
         xkLJlMp3RRGaPGl8duJ+3BXYbhZVQjfhdAvZ+mRk68gAEZ8gHeRnVKdnZ4von9ypyfGJ
         3Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O2Zhia1G8aaQ/ddT9CgIJhv0ta7u5KMNEsFfWkzNNvs=;
        b=NE7PFfQQv3XeGd1vKh99TKyNKXlto57XcTzIrXAH7+eDhYZ+d5/ZSRjADUWi+47JS+
         mRiRVWbn5Y7xW43qT87uHGWtjeYcfWHWD2Uj9Bntxso0hr4Y3ligNt+8IIdv3mKvKtAt
         UFf3H9ttsHRkGq9B1dc1UGr1XQjbmA6gRSqg3YBh8PiSGTLaPZLlP7i8/rIle7xZQt7w
         VKtidxEjGy11lv+d69j6dIv+TNgIMMkLN2rPQi3jRdeP/nfuCgBZ0ErC1uGhcDc/Q28U
         8zB58nzOpvKbBbFOwbwma6siGTjHvR/SYOFuZhTYdp3ahbWmKUVd0FZpn3tjk+yxOhUW
         9WhA==
X-Gm-Message-State: AOAM532x/0bqhzKyWn/vP/Mw0zmFZxCo4pC293hrnlNWYBexVM6oIHcE
        B65gT0rKfN7CuTw3Ee57NMbxpC9XEiM=
X-Google-Smtp-Source: ABdhPJwRWADnjtyQbK6lNNvYDsas4yWhJmyfpwNMT6PV13XNcTq0v8t1yCe7nWhecZ2UQIH3Q8dCYA==
X-Received: by 2002:a05:6512:104a:: with SMTP id c10mr8218675lfb.204.1639080390922;
        Thu, 09 Dec 2021 12:06:30 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id y2sm88513lfk.47.2021.12.09.12.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 12:06:30 -0800 (PST)
Subject: Re: [PATCH 11/25] ARM: tegra: Rename thermal zone nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-12-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ca6f962a-6ea4-2a4c-cddd-a49bf482be9f@gmail.com>
Date:   Thu, 9 Dec 2021 23:06:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209173356.618460-12-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.12.2021 20:33, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The DT schema requires that nodes representing thermal zones include a
> "-thermal" suffix in their name.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 6 +++---
>  arch/arm/boot/dts/tegra124-apalis.dtsi      | 6 +++---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts   | 6 +++---
>  arch/arm/boot/dts/tegra124.dtsi             | 8 ++++----
>  4 files changed, 13 insertions(+), 13 deletions(-)

Won't this break the soctherm driver? Looks like it relies on those
names. Have you tested this?
