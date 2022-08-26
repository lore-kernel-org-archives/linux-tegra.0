Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B32ECAAA6
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Aug 2022 17:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344700AbiHZRfk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Aug 2022 13:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344739AbiHZRfh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Aug 2022 13:35:37 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11413DF4C3
        for <linux-tegra@vger.kernel.org>; Fri, 26 Aug 2022 10:35:35 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bt10so2894917lfb.1
        for <linux-tegra@vger.kernel.org>; Fri, 26 Aug 2022 10:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ttMc37H8pH28vYwoV7jZJZLaqeNebCOygS3CZlC39l8=;
        b=E9ttpgovEiuYBamfXIDbqF7Jk/OED8nrstutjgPv1G3S/BdOc2olP41oKsPEEhdhjB
         uUoMWv4qJ415FPN9V3AbkA5qExNDp1Xj16U415iw/LhiOCQI/bCnl1nigjBn6f3Tnwa3
         2Epl+cwkJ4hCWWk2C3bi4uXJH7DgRSi0D8uetwUO3/EmAZBD7ynEcTKS9iUcXK2uLrbv
         UXuL5hXquxVc1q/j+0fuOuGIBM7C5rfTT42utxkcmRkSDe/9Txm8ETx43fI1DktKntMn
         UfdvTqeqP7XuhRmaHVuB+Q8xqC0yJsCbndfw2WqnEEc61ML30kKZiErVAuZepZ1OgrpX
         KQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ttMc37H8pH28vYwoV7jZJZLaqeNebCOygS3CZlC39l8=;
        b=tZIQq62oNYkRhFSlQRBIWx7clDwr0vdIdBrJxur5Q/uJcTyk3cFhPUEA0A6ZQ8+Qfk
         HAKWuA+BKjHCK/mJqFvegsBBPry1SDhYzsBMmX9KPUMxTF4ES383Gh/5acBNqcb2XR+X
         807mZTCMtISoAFhNX9+4xbWbD3NS+oZi4kBK/mkSZ//CA0LfPQg5yscQHJbVI4qZOOND
         659eVwYxWM53UsYmgictqc9+m1/wkW6QG9yPi46mQLKU7jzp3WVY+yGmvuTWylKGVw+V
         4frqa8a49vBkrUUgiIKBH5zpMuF5PUvq9UETO+aGf7zGtP24TeOHweIOX/FziESH4srP
         ztAQ==
X-Gm-Message-State: ACgBeo3p3SVqXRyTB4/zGuJHCVQy63/a1i8H9PL3xMe8KaQFQkcgCjCG
        kN16wYHiJVy4HuJ5KxbliidzwA==
X-Google-Smtp-Source: AA6agR6RZL5+Pi3SBjYBdT7S7bcodHI3WkiGTwF13HcbTIapK4GLd/ZR1lax4Hxv4ZLfJQSimaldXA==
X-Received: by 2002:a05:6512:2605:b0:492:dbb3:9b85 with SMTP id bt5-20020a056512260500b00492dbb39b85mr2614686lfb.669.1661535332804;
        Fri, 26 Aug 2022 10:35:32 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id a21-20020a05651c031500b0025e0bb97f8fsm523588ljp.116.2022.08.26.10.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 10:35:31 -0700 (PDT)
Message-ID: <eebef02c-e9b9-2ab0-5178-7996cb62a116@linaro.org>
Date:   Fri, 26 Aug 2022 20:35:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] arm64: tegra: Add user PWM support on Jetson Orin
Content-Language: en-US
To:     Sandipan Patra <spatra@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bbasu@nvidia.com, kyarlagadda@nvidia.com
References: <20220826121746.32003-1-spatra@nvidia.com>
 <20220826121746.32003-2-spatra@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220826121746.32003-2-spatra@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 26/08/2022 15:17, Sandipan Patra wrote:
> Enable in device tree and use it to drive the PWM controllers on
> 40 pin header of Orin dev-kit.
> 
> Signed-off-by: Sandipan Patra <spatra@nvidia.com>
> ---
>  .../arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
> index a85993c85e45..e76894574d32 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
> @@ -2,4 +2,18 @@
>  
>  / {
>  	compatible = "nvidia,p3737-0000";
> +
> +	bus@0 {
> +		pwm@3280000 {
> +			status = "okay";
> +		};

Overriding by node path is error-prone. You should override by label.

Best regards,
Krzysztof
