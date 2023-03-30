Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FAAC77B61
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Mar 2023 07:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjC3HoD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 30 Mar 2023 03:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjC3Hnz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Mar 2023 03:43:55 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164445266
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 00:43:50 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id by8so18636550ljb.12
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 00:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680162228;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eraa9sHuqgH7RyAn56efSAiZ+xk3KCr0GMWDHbp7zFg=;
        b=F1w7nkJdJBAGMj6EYTK0HtUKhTNFMC2n+8F1F3IOCG+0lCLVlF31C7gLy11+1C1i7M
         xtNZngxL1u1tebajBhuWph1yPmJOD/OGSDNzR5qvNtH6EIJTB2O2hvwYdGS/pcbTY9Yv
         Q6dC5JmKZTlFTNIhHdgVuNlUdh30REGc3defDMST4yNfS80/G6cxBNfyTT+5y5lrZARm
         t/b1LX5frzetdJT8KHvmk1krVJknvwWertKEYGe1exr9ZFFSukgWirarnbW13p4L7gMT
         feq/jjF+uGjReO6CT+FUfS5f4TweOiRH9nDTJ5XHkmEc9tHh3MSuK5ypp8cK0b6bO1Ut
         vxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680162228;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eraa9sHuqgH7RyAn56efSAiZ+xk3KCr0GMWDHbp7zFg=;
        b=K5w4q1vJ/mbSbNoIUkbP6QIku7p5nnJ+iDXFogjLD9YBRrOv4CTOE5z9ffX3OUVQhK
         k73exnkix3S7/UsJuiggbI4KuFHW3fusUgHgJypki3cr1mMqzBveJGFVxupj1I8r0LxO
         vivgT+RNR6/mHMbLdKr0Os5ZOkqv2F1wg/ESITxdkXamM5HVG/bc+7yPmYv98NPcqUBe
         Wtpy/t26O6etfnh65aSVJqK+Qcd8g4nETN5ogM+cruRn9VR573KycLOjmNuA5ZOIudhf
         1zQ/wrnl9jUSDnKEdar4wUA18glNaLjNA0fuxpO0yaunrlfSfug2r1MjrpIBv3gO3sLM
         KK8A==
X-Gm-Message-State: AAQBX9dk2xQoa7DYhIVHtJjAF0/DSGChE/JntkyG6509grRVZxVBBYDz
        sa5Z+VyuS7qgVsOU8BI7GqBt7g==
X-Google-Smtp-Source: AKy350beVQ5WDaefREEkkjIw8TIo67IX2cDXIpr+Jkv8cIQQ/TRItbmRQKRFZ6+jqNQ7RuV8XxayMA==
X-Received: by 2002:a2e:9210:0:b0:2a6:146:b121 with SMTP id k16-20020a2e9210000000b002a60146b121mr2872398ljg.7.1680162228358;
        Thu, 30 Mar 2023 00:43:48 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g27-20020a2eb0db000000b002935a8d9351sm5810006ljl.55.2023.03.30.00.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:43:48 -0700 (PDT)
Message-ID: <750fd054-e678-badf-c049-8471565d2b79@linaro.org>
Date:   Thu, 30 Mar 2023 09:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/4] dt-bindings: tegra: Document P3768+P3767 reference
 platform
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230329150710.773441-1-thierry.reding@gmail.com>
 <20230329150710.773441-3-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230329150710.773441-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29/03/2023 17:07, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the combination of the P3768 carrier board with the P3767
> (Jetson Orin NX) module.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

