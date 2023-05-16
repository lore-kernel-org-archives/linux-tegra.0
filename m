Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BCBC77B7F
	for <linux-tegra@archiver.kernel.org>; Tue, 16 May 2023 16:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbjEPQag (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 May 2023 12:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbjEPQaK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 12:30:10 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59671E4A
        for <linux-tegra@vger.kernel.org>; Tue, 16 May 2023 09:30:06 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bcb229adaso26131165a12.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 May 2023 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684254605; x=1686846605;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zs8DePhd2PINsPq4Z6VaoJ9+dlwdHGIeIrzanWWmBmg=;
        b=N8hSrPCfLd9veb1O+nZUU9R9ATcG7HQNY8svEJVFomeUMKPOffm8JDDqAAPG+THpeE
         jDiX3ETAFc+TtalG/pExEWsddNw2HbKeZHObg8jBkyScMMjVEOKWAHPinkjRc6M8UeL6
         eNB2l71QG3XEHaeibY9hjyvh8lQ99C24sY+5g+0EViDFie6nk2UEHBY5B1oAGF7dia5k
         5X/xEOt9fbUfz1/sHoczwEBljBxGz9I3IUhDGzyW2U5uvGyzAL/4dcTtlQ9m1OZcODty
         hrYWEETesE6m8XgjemCjgadmLtBXSg3nUYXeKk/nd2NX4M5uRn+jsvNfwB2bwcooUI3N
         DveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684254605; x=1686846605;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zs8DePhd2PINsPq4Z6VaoJ9+dlwdHGIeIrzanWWmBmg=;
        b=KbniuGYnuhvMuLhKBkl4qBjOXERSeSgjcBfVOb8cPMV5g6oNpLDb9a6JA33Z4RA5dM
         QUP0WPd4LedCUAAyEe91dwBRAPaBkSxkClCbossR2bnPNVKYcWnln3lwh+skcB1PwkHt
         UBP/brYDlT8HriTeuN/NsBg71INPnxmafgHpFfEvTXUtoYYnDGnLCSLhkZFtbBqEovXz
         T3/VJednOcGmPlhlqjyzp5BDlywjd9oVgZXg7vvHpb3wo2+eKdU9vAj/p8itsXmHYxT1
         8ozPDNcZGUrHLOmXsfISwD3Tkb7rfnvv8jq84NVZQg0ya1Kw175yBaTmFO5hfg/WGKxt
         0vpg==
X-Gm-Message-State: AC+VfDz0Y0G5xO7fAf42IeORzzX5ygQ1zFqrzEjti7IU4SzWhD0ZRpwe
        7E07lWOnM9C/QQgHdn/8GGRe0g==
X-Google-Smtp-Source: ACHHUZ7Mgj8BULw7N8UQv15kmE4LFmuOAsssu32COH+zykLy2IO9HUu054zb3wtDCpQAHz4rhUgAXQ==
X-Received: by 2002:a17:907:7f14:b0:94f:9acc:65c9 with SMTP id qf20-20020a1709077f1400b0094f9acc65c9mr34072842ejc.66.1684254604864;
        Tue, 16 May 2023 09:30:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id ev21-20020a17090729d500b00965b416585bsm11236402ejc.118.2023.05.16.09.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 09:30:04 -0700 (PDT)
Message-ID: <05d08314-2f6f-c91a-0e8e-74fbb4dfef46@linaro.org>
Date:   Tue, 16 May 2023 18:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: dts: tegra210: add missing cache properties
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230421223152.115285-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421223152.115285-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22/04/2023 00:31, Krzysztof Kozlowski wrote:
> As all level 2 and level 3 caches are unified, add required
> cache-unified property to fix warnings like:
> 
>   tegra210-p2371-0000.dtb: l2-cache: 'cache-unified' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Please take the patch via sub-arch SoC tree.

Hi, Thierry,

Can you grab this one?

Best regards,
Krzysztof

