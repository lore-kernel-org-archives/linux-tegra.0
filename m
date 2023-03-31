Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9842DC761A6
	for <linux-tegra@archiver.kernel.org>; Fri, 31 Mar 2023 20:19:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233029AbjCaUTF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 31 Mar 2023 16:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232996AbjCaUTE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Mar 2023 16:19:04 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5273CDCC
        for <linux-tegra@vger.kernel.org>; Fri, 31 Mar 2023 13:19:03 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id c9so19991736lfb.1
        for <linux-tegra@vger.kernel.org>; Fri, 31 Mar 2023 13:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680293942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Su+pv3KEV4L0sJclS8z/r/J7Y+uJUyzUN30/RZNfR14=;
        b=pYIWEbb/vzs3e5nsQX1DZsF6A5I2frJWr6fHCR22BtTKRdtbkHm2xCbajn4HuNELq+
         wakAJuy3XOIpx4PtsjUsR/izym02e/PTn4dzrNKIFbzfsyjDy6GhSISZ5O02aD90wugo
         KlKmyHJmd/UZc0LqLtGLn1YWYT3vRNeGLDhpwGegCm1/zVhoOlYRjaJ4ETaeIVMh5STy
         OLjSDpDfTeSoIdUrQnuWA2Gf68va6Emh5VgQAMx3FU+U7+3mpMpSid4FSUgtAsPS5ZQ9
         4uSD0iCzSUfF6Knw2UWv67bf134UPxSF//Ttix+XC+TsqEzEbOzJ40iwnVrRMXdAQVpo
         /0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680293942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Su+pv3KEV4L0sJclS8z/r/J7Y+uJUyzUN30/RZNfR14=;
        b=uKwxccG3yifSTt3J/Y2/xuIOeXaVw2pnyn5wkDnFehGBEGfq3BlfKM9mmW+4nhrORA
         2bIZzvx1dv6FC9G+65cs51Gh3OSvp3fVNVbBRK7mQZDiPF+RND7vcjZSS7cpGns+7SX3
         U2PcAiogf2lVO+O0MtesBpe/6DTwPWNt5OaxOvbhCnietRIPJtCEJHRxnvaiyJWXGwjx
         LyEnWtT5YmH/yEJ5dfO5zD+k+cxdRuzjHCNZXgIrHr5cPilQwPIKPx4c0bzP33UtqMA9
         doZkr/DKRLR9rzHznPY27jfkGg3Zt8Y+gH5RDEzh6tJ0pAWCLfFpDrTskoyrgTQZX7iN
         CGfQ==
X-Gm-Message-State: AAQBX9ezuSbIGZzNsI7jK+yPz7sVIgo+uLg6tUTm+T+X1f5ZoNVkym69
        wkWsH1bZPahOKAuLWndu+nxC6gHUhPMNPM8Bo2Q=
X-Google-Smtp-Source: AKy350YRb3y+o0hAghs5VC2YehBi+0YhlqLlfIJ0J3C0PuJCcqA75EYoBhvdJbgltsnsQOL7lCmm4Q==
X-Received: by 2002:ac2:52bb:0:b0:4b5:9b8f:cc82 with SMTP id r27-20020ac252bb000000b004b59b8fcc82mr7894997lfm.0.1680293942024;
        Fri, 31 Mar 2023 13:19:02 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c8-20020a05651221a800b004e80b23565bsm505250lft.198.2023.03.31.13.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 13:19:01 -0700 (PDT)
Message-ID: <3a8724bc-fb44-0080-fd24-c04e3841385e@linaro.org>
Date:   Fri, 31 Mar 2023 22:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/4] dt-bindings: Document additional Jetson Orin NX SKUs
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230331163159.17145-1-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331163159.17145-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31/03/2023 18:31, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Beyond the original 16 GiB SKU (0), additional SKUs exist, such as the 8
> GiB SKU (1) and an internal-only SKU (2) that comes with an equipeed SD

typo: equipped

> card slot.

Is there a point in documenting all of them if there is no DTS? Also,
size of storage (eMMC?) pretty often is runtime-detectable, so you do no
need a new DTS and new compatible.

Best regards,
Krzysztof

