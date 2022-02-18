Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536A8C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Feb 2022 13:04:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235428AbiBRNFN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Feb 2022 08:05:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233788AbiBRNFM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Feb 2022 08:05:12 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEC92B461A
        for <linux-tegra@vger.kernel.org>; Fri, 18 Feb 2022 05:04:55 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 727864003C
        for <linux-tegra@vger.kernel.org>; Fri, 18 Feb 2022 13:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645189488;
        bh=+odAnFUpRotjyHmxRngOmP1U54MSnL1E+iRodbsJpEQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=gI9K6l+YpdYDzkLSKf5zXWXXw1Bamq0+jHqL1mZdq8y59cRI2tlf6wQpGn9+1gAyi
         3b5LN871ELt1zS7JZRz8OAv8LNxHXPyJ86LZQshjGX+NpZ3ev/iH20QPU0YMMuVRai
         xSSFUYaK1puzi2kyoFf0nky7GGAp5CbywtzlINoUXXDInDnGYfB+Fkoa5l+u7SklJV
         q/KMDvrlwd+O8u+AeO1EEVBX0Dr+phVeAND9IUg4apVrEUqvgyIdlchGfZyD15F4IU
         ia6e15fNoj3n11DcLjv+QRUtWvA5Fk1KjfANZ5Cle7GpHQLzht3ulbHIU+IjTq/gdK
         ldXkLwezCFc+g==
Received: by mail-ej1-f72.google.com with SMTP id la22-20020a170907781600b006a7884de505so3037199ejc.7
        for <linux-tegra@vger.kernel.org>; Fri, 18 Feb 2022 05:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+odAnFUpRotjyHmxRngOmP1U54MSnL1E+iRodbsJpEQ=;
        b=D/m/192uwRhSqas1EVRPNadkBTOFojc7ytYZyxVu+91SMHaW0X+n5OaLZGSwWrQzqP
         yLPuK+D45gwJaw9jB6fOtuliBUCnVyRar1ztEWP02ZM3iCAyGaP0ytrv+m+wjSey12CR
         Edvi+x3KKZu9yb0sdD9PB70ghs5auqbV/BoQeNyKS+ezRmF9nT2iLBbUi6nnAsu0IzWc
         71v9YHrMyJlwvnqPI/A3JxrGiH1v6ByDwLzylUGpIRr6S1RH9IAI9VQ1o2dNQ8X5nRfK
         uMUiY57Tw7stKV7ihYienQ0WQZrLvDudKJKwI6lue7MaPUd1DW/J2uI9jATwQjYuF8IM
         KWPQ==
X-Gm-Message-State: AOAM532ttkyGkjsrsTHrFaj8v6ZYt5rYZA9etG31K5WFNZsnUOHJQ/Do
        mummVd0PWvmznyy9iUOCKjpxNeLLNrBso91WGarOqE46guK2JPxWo8MNHHCPmEhIFTAWr1JTpxb
        eVwJTnmCKso4NNoYz/iPXAjqC/WFJH2eqfZ4ZhHr5
X-Received: by 2002:a05:6402:1684:b0:410:bb26:eb0d with SMTP id a4-20020a056402168400b00410bb26eb0dmr8266804edv.449.1645189488082;
        Fri, 18 Feb 2022 05:04:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvXxpsh7iz0pdqJwwrlptZe6U4CiyjPefOD8G89XYUluWuRDjSANbzlcyjvg3sshclFXdY5Q==
X-Received: by 2002:a05:6402:1684:b0:410:bb26:eb0d with SMTP id a4-20020a056402168400b00410bb26eb0dmr8266780edv.449.1645189487873;
        Fri, 18 Feb 2022 05:04:47 -0800 (PST)
Received: from [192.168.0.115] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id pg26sm312856ejb.194.2022.02.18.05.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 05:04:47 -0800 (PST)
Message-ID: <028f766d-e5ba-fc12-665c-8f65d6bdf817@canonical.com>
Date:   Fri, 18 Feb 2022 14:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] memory: tegra: Add APE memory clients for Tegra234
Content-Language: en-US
To:     Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <1645186589-25118-1-git-send-email-spujar@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1645186589-25118-1-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18/02/2022 13:16, Sameer Pujar wrote:
> Add the memory clients on Tegra234 which are needed for APE
> DMA to properly use the SMMU.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  Please note that this patch depends on the DT binding patches of series
>  https://patchwork.kernel.org/project/alsa-devel/list/?series=609494&state=*.
>  So please consider this patch once Thierry picks up DT binding patches and
>  provides ACK on this.

I was not Cced on that patchset. Could you use
scripts/get_maintainers.pl for obtaining list of people and lists to Cc?

If Thierry picks up dt-bindings patch and I take this one, does it
compile? No, I don't think so. The order is screwed. This should be sent
together to make such dependencies obvious.

Anyway, I cannot take it so:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


>  drivers/memory/tegra/tegra234.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 


Best regards,
Krzysztof
