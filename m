Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467B7C74A5B
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Mar 2023 07:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbjCUHU7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Mar 2023 03:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjCUHU6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Mar 2023 03:20:58 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B840FF15
        for <linux-tegra@vger.kernel.org>; Tue, 21 Mar 2023 00:20:52 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r11so55955432edd.5
        for <linux-tegra@vger.kernel.org>; Tue, 21 Mar 2023 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679383251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1ju9SHjn0EjnX+WJqAHc/qHXQe1M1fQAhQ9irmoRLI=;
        b=G6ekUazE6TcVZTpMdj9FhFeFggQPVT2VFUWaVtSaXIXTASqF++fMNxdF9KK8E6jaSL
         ZxuQCYzENQ9eYwWdylaKVB8cU5qUsu4R5sIwD0IIrNZX+Oo0AX814EHrHOZ4nB7WYMax
         YUWo1MqBTLRXOMVVr9tYCNrgu923Xrw6URPxwNxkAEkDp7epE2F8hgxV4cZiji7lOREJ
         niygwQoFXhUPEUDsSetV6Edn47C9sgSWqXDTI3Dz/fCXVRaHBilN6IPoShYT9gKzSq2h
         v+dykiWM/hzx+RdJMIfdogOBRMX12snNrk7GfqZ43S8HyiNmdwkPfVFwvscVb/2iLiXG
         aCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679383251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1ju9SHjn0EjnX+WJqAHc/qHXQe1M1fQAhQ9irmoRLI=;
        b=JkGtHSzxOAq3akWV5kyvqtQy1HYsyFEqpS+uv23aoQu6DzgARu/GJvBaQkudBI9tpC
         OdbwpuwawlH6L4x4BivqRq7FTCbREWhr4LMfsqwe7t32b2QRTOy33gjFYaAlNdUwfWeH
         17bzqVVW6be7/QBUt+WIwlNGJKwRgSlJe5G/77NuaN8tQbiOt6EYuGXi3eXrhNnFgGTE
         7hvuSnlu0A7M6aUeQKLiVHHPUr6NgqciH0BJJK6oSgdGlYSzXnbNVGfwlkbLlhZaqmhf
         rIYP9OwMLY6m8172yi4iOYpkgN6bh3KXrffot5+cLUv1omxbMtT7YuaRXZlTORzpZwGw
         GQHA==
X-Gm-Message-State: AO0yUKVd5FbTHiQ1Y3TLm3XYSeKbsuE190FO3Njr3fg1OoTSwVdirjwk
        90YU60InsFO8NwjHg/8r8DQ9MQ==
X-Google-Smtp-Source: AK7set9ajV2h8MoJNZmNzFZ4RL5J57SDG8cMw8WnAC78cNBMYl3mTmrve+NyaqmHOj1gJroxcZnYrQ==
X-Received: by 2002:a17:906:607:b0:932:be78:a728 with SMTP id s7-20020a170906060700b00932be78a728mr1688168ejb.68.1679383251026;
        Tue, 21 Mar 2023 00:20:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id qn17-20020a170907211100b0093048a8bd31sm5385926ejb.68.2023.03.21.00.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 00:20:50 -0700 (PDT)
Message-ID: <cc45efa0-e2c6-525a-e3f3-7f87e8762e2e@linaro.org>
Date:   Tue, 21 Mar 2023 08:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: usb: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Al Cooper <alcooperx@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20230320233904.2920197-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320233904.2920197-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/03/2023 00:39, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

