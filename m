Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12D9C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 19:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhLITEp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 14:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhLITEm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 14:04:42 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1652EC0617A1
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 11:01:08 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id m27so13766798lfj.12
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WUItKxTAg7ul0XxytZmwcHynqXnLGvFftIiZfY1iNng=;
        b=ns+l5JnwnyMmVIJmPoWefzpRqLq64T6edljMrW7unbKR7SY8deqNDPa8TPsuSpXGyB
         PSRPxDeCISo+ytSGDfywyRhPBF2MaFFV8SPKq4AJKhkjI6ShSwciEWWQru2CgHbfArGp
         p+rP+VIldZmDGRTk7sVvkI0W7Q9PoWYaTSH57fd/3UNRtCcZiRMYkREpLVc6oqqCoPa6
         x1Da+LFNw8PJ2ZHTG896wbTTJ/z2hy5sm2F1VCq/UtuvkRGaHKa1KbhXELcxYvOXJHiJ
         /RVBQN2YM0FhPZknsjimeWeuApHeL7JCSpHVMcx5xPC3yLBlpGZmM60thNYfbCObhMI2
         m2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WUItKxTAg7ul0XxytZmwcHynqXnLGvFftIiZfY1iNng=;
        b=rkD/dbi+LDyJ6DS7qzZyrs8VAf59L3jU5FKMVgCUBZieVXUYyvEvMN2zp8IolaXgUB
         lngjaa9BqaUhDWRBq56gK1XYtTVZ8Ozhb5/qvTQrs3u9vT6R2P+LB+GGDpW/uIGMBG4C
         Zai131WCB4DxByxVWt6jUweVOXxYTX2XcultXdGu01dc2U5yxzIaTE2ZX7atri37KvXu
         t6Rdky+Bnaa3RY328HOUVI8x478zAnBH8VORAa62F8qRBzAZEyWrNOgKfBbBB+hPx+M+
         hPSOLqmC87knrCtwo1dc69bfWgKG00K59LPap2/rbiygvY9eGYt4vDeYAXJW3i4MrL6S
         nipg==
X-Gm-Message-State: AOAM530n6zOEjx4zvawm/yz8DbSm8VctTxznSOxS0fZ7Tq6TgNFN8gwB
        MyED/bi0PVeSUALusllw0TguxC+SkF0=
X-Google-Smtp-Source: ABdhPJwe/eqEK7I8pAJnLsrb58unEsp2v2etygRzpdRjxP7vlTYbNbF1ratCo4s1Xdxh3VkKqpqePQ==
X-Received: by 2002:ac2:5d28:: with SMTP id i8mr7578317lfb.394.1639076464635;
        Thu, 09 Dec 2021 11:01:04 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id u23sm68782lfo.35.2021.12.09.11.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 11:01:04 -0800 (PST)
Subject: Re: [PATCH 10/25] ARM: tegra: Drop reg-shift for Tegra HS UART
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-11-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <03da037c-4bd2-2405-f665-10cb89faabb0@gmail.com>
Date:   Thu, 9 Dec 2021 22:01:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209173356.618460-11-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.12.2021 20:33, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> When the Tegra High-Speed UART is used instead of the regular UART, the
> reg-shift property is implied from the compatible string and should not
> be explicitly listed.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi               | 3 +++
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 ++
>  arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 ++
>  arch/arm/boot/dts/tegra30-colibri.dtsi                    | 2 ++
>  4 files changed, 9 insertions(+)

Again?
