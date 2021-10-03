Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C5EC433EF
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 21:38:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEAF061373
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 21:38:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhJCVkJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 3 Oct 2021 17:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbhJCVkI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 3 Oct 2021 17:40:08 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61E4C0613EC;
        Sun,  3 Oct 2021 14:38:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id x27so62864460lfa.9;
        Sun, 03 Oct 2021 14:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zn+UA/HpK+hpWlX3zy+IAV9JmlIirTJpcyMiNSi1R4Y=;
        b=FJWjHSkzjCB8mcDwm4vxPJfzPPVAzbhEldMEZL7fC1n0JdkJ9iRsmDhlQhEMDIqV3B
         8RznKjgnLhc6izvUK8de3bcQwXvKoNKLVO3zGa2S0bWPvGABPkLa1rXt7nVOIfBotTH5
         oyDaP66F2p1plpc6bw8qMfo0YiS7EfbL3Gn2Q24JtXlnntLMCTuVQdiu/AQzzLaWPmax
         QU0k/gfxSQRz/J2ddGksD8xZh1dnH2mWgnYnLcdTmmhuzIUdFdZqdoHmqSGA3Wcxp/2x
         C3/5ikrnlGSdwKO9UezHmfIBR246LOXJYgPzFnNBQFLfwOzayjlIOqXc7Rlqp8iUMEYX
         5Pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zn+UA/HpK+hpWlX3zy+IAV9JmlIirTJpcyMiNSi1R4Y=;
        b=YcaXWRUmxAThYxXhJ2T4CuGcyLjfb9MYA6dWB1kuLHKymzGk+pasG7gxdq747NcTHm
         pcSqZ2+XTokkNNyQBja3qrW+vld+XeslJRkkJgPYaRGsj0Oq88H9lZQUz9YTRH3DWiuO
         iMxnKZizePfjfE5vsK0ofdSS2VwdRf477FGD4MNeOS/TAlh5Frs1AYnuv9xUy2w3g9SH
         voACCIS4FrtwbWLZML98+qptIB36oDMGUVTuNHAKcBgxEDVe4d2umviRQ/x1Qop3idU8
         za7yJbcKlSfeySo/eUMb4KpWOQ5wbjtJjZXlk41pWkhe0nCRrV/5ahtAcKT0q7tSJcgV
         2Sew==
X-Gm-Message-State: AOAM532LaIIGaAuaiejifd5js9QKI8KfQCxjPrhZ2iUKe79qrIDP6Gd6
        zA4Li4CQv1wZvXtP4hesWITWc3JGgrU=
X-Google-Smtp-Source: ABdhPJx95aJOOZiggNmynug6qTicHMpnGznsvr/Kbl9rA4k9Xr3Q+g8LyVWFdrJFdk+eg0E4HIpMbg==
X-Received: by 2002:a2e:801a:: with SMTP id j26mr12344701ljg.175.1633297099021;
        Sun, 03 Oct 2021 14:38:19 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id s17sm480254lfe.10.2021.10.03.14.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Oct 2021 14:38:18 -0700 (PDT)
Subject: Re: [PATCH] [v2] dt-bindings: clock: tegra: Fix USB controller nodes
 in examples
To:     David Heidelberg <david@ixit.cz>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>
References: <20211003192529.29615-1-david@ixit.cz>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cf255dce-4966-5288-2e82-219e9430d993@gmail.com>
Date:   Mon, 4 Oct 2021 00:38:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211003192529.29615-1-david@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.10.2021 22:25, David Heidelberg пишет:
> A subsequent patch will convert the USB controller device tree bindings
> to json-schema, which will cause the DT validation to point out various
> issues with the examples in the clock and reset controller bindings.
> 
> Fix these issues so that the subsequent patch will not cause validation
> warnings.
> 
> v2:
>  - add missing usb-ehci compatible (David)

The usb-ehci should be removed from Tegra device-trees, it's
incompatible with Tegra hardware.
