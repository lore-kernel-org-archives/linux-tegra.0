Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B6DC4332F
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Nov 2022 12:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiKOMQr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Nov 2022 07:16:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238078AbiKOMQ2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Nov 2022 07:16:28 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F12012018C
        for <linux-tegra@vger.kernel.org>; Tue, 15 Nov 2022 04:16:26 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id j16so24074332lfe.12
        for <linux-tegra@vger.kernel.org>; Tue, 15 Nov 2022 04:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rw1sjbR71GpDX4+lhHk1yLaScEbbe6ryeafI3CiJP10=;
        b=tR3w+a+JPTo0vZAk4sSj/mNTKv+ZhOTcOtCx2+3qEkMteQ3XTVzYbbKnLZLDmXNQZm
         EpWwiKYR7wHiNnFffVMVMw6i/SIXUy6yohd81DoWzdGvds6PL3NO/qTsBfqLMYhwbcPv
         +sLgujjc/1qTpymQnm2VbB4NjDWm6oZP7PTKtPAGtlgIFU1P3IotJ+Yg720TvfvWK5LY
         So997eksu3gD1Yrl5CpB2+flKWypWap7lE2wGRgW5DGu26fYiFHytTfTK5NYRcUtI4Rt
         OndCqUCzEim7UJBrC8EzWWZ93vwXJ8uYvAvn6KlHwiXbfEJU14Zda6YMkqNoUA5y05u3
         YGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw1sjbR71GpDX4+lhHk1yLaScEbbe6ryeafI3CiJP10=;
        b=wYthNIFn/3DOvlcYuba4F9dKTrRBjyU+UReKFja1rO6HaZteuOQTWJIoLjSxH5/Cjf
         IQOuiCnlu5n8FJ6p0gY/9F2UmP7HiO6TDOoFtRzA6NpEjGlkAmre1YCLrmKImT7h/LkI
         arMsgqTeMLGBSQgDlGDqqZ94DOIPP3/iiQYfjX5mM1VhtM1Y5CgcLscOg1Aamh24W87g
         0RjWViSvppSb8EPVWbbKWPwPWDaa1hQPlevshsIxRKP9jVC47t2XK5/Q8mZR02dmYzS5
         qiS+DVCptXGNOV2NJhIyMKRCWafrtkEhWrOWYlY5HzFpuC/CAtOZWdq8Y8F68DoyDz8F
         FLHg==
X-Gm-Message-State: ANoB5pma1S7qzFG5XhK3SitmWaX16kQhWXENNsPXXdqMzvRgbeKXEZag
        O5zaTdQDIq4DXKyZiPZA++KzgA==
X-Google-Smtp-Source: AA0mqf7VWxyl1RZKscxhjDznC/kqYEwrVwdbg5fIWlrY+D8kHURt5sGT6UffK1OwKrikT7PXoa0dPA==
X-Received: by 2002:ac2:47ea:0:b0:4b4:1324:6ed3 with SMTP id b10-20020ac247ea000000b004b413246ed3mr5262252lfp.19.1668514585345;
        Tue, 15 Nov 2022 04:16:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u11-20020a2eb80b000000b0026dc7b59d8esm2482225ljo.22.2022.11.15.04.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 04:16:24 -0800 (PST)
Message-ID: <35bb9f38-d89b-77c6-a546-f575da5a79f5@linaro.org>
Date:   Tue, 15 Nov 2022 13:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 03/23] ARM: dts: tegra20: add label to nvidia,tegra20-vi
 node
Content-Language: en-US
To:     luca.ceresoli@bootlin.com, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
 <20221109141852.729246-4-luca.ceresoli@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109141852.729246-4-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 09/11/2022 15:18, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Useful to enable it from a board DTS.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Adding unused labels is not useful at all.

Best regards,
Krzysztof

