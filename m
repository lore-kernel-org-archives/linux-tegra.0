Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326C8ECAAA1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Aug 2022 09:50:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiH3JuK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Aug 2022 05:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiH3JuJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Aug 2022 05:50:09 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594B33DF00
        for <linux-tegra@vger.kernel.org>; Tue, 30 Aug 2022 02:50:08 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z6so14744711lfu.9
        for <linux-tegra@vger.kernel.org>; Tue, 30 Aug 2022 02:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=2v5gr3EuoaAEuSb9CcBVwZKMWyYj0Ef79p2UK+9bBKo=;
        b=KF2dX+CvLFpRg9J23ANVR7KCb4VULoxeWuboROEmuS7MhUltPim3swe5eFY9EmBpxZ
         CmS3/XYpC+5Vd15RThF9gGCMveLEURCrW2q5qY+ZnUgD/k+ZUMzALZ1OKXI/90dyH+cb
         uVuF1B0/DbUvoN22Z9pmI7uMaVnp0bY1sDDPNU8c8FWVBoSaRlMWuLdK80EPYRdw6nr4
         +DQE5EEPiMSrseYy/k8y3aDwTrktBJ4vLxxkslTyJ4WChOMaAGED8KySJ5ugLwO6+iPT
         W37V+J/WDKT3vO8z4nn77WnDKPSbQ9eGpSQ2fwr4JZt6sTI/7hcDdGW+QM3rLZx8m95j
         J5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=2v5gr3EuoaAEuSb9CcBVwZKMWyYj0Ef79p2UK+9bBKo=;
        b=CXEwoG9+pHkp4LSgAMdKjNeYMo/HHP1EgqUcVzbOlwriajyzJBuEjxEOIwEwpEnMvu
         g9tDxGyp0QZWlM1B3J+zRlHuEQ/xefpaIbScafmBVNrAwgLgmjL7H8G6ZelAhfnfbIoF
         nT3i9qCnxCypKb87Y2D9TWc/MKmDbjfrinGJpWhhMiwXHX1bRis5TxZJVjtO+OWRiSZr
         zAXGA2dGI/ECuaantJqsreWrOf1tw66K6eXDViRbiqnJVKzpjfiCil/5Qmi94Vzwd/qa
         5m0Hzep9swHHigrN429rWMS+Y7QnwDougtT5ju9RRID6aRYb8t9MtofKv4j+VBrWaFj+
         eCSw==
X-Gm-Message-State: ACgBeo0l3Z9VgdCXcQy5aH6eX0PBEEMBA/xF1svx0Cd6qrPAzz2tZIfF
        fcNvArsDRFI51Z/jJ3gYVNpjKg==
X-Google-Smtp-Source: AA6agR6TpZaAj9tXPHMAn+/T/7/VYkwQ6zc3UCxUpGnbbDE1QWyw8vznJKQEwWQym5CGS+TYrqCY0g==
X-Received: by 2002:a05:6512:3409:b0:48a:ef20:ddb with SMTP id i9-20020a056512340900b0048aef200ddbmr8369276lfr.597.1661853006723;
        Tue, 30 Aug 2022 02:50:06 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id u15-20020ac258cf000000b004917a30c82bsm1555014lfo.153.2022.08.30.02.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:50:06 -0700 (PDT)
Message-ID: <4dfbf55b-744d-b0b6-0afd-530a45becba0@linaro.org>
Date:   Tue, 30 Aug 2022 12:50:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] arm64: tegra: Add PWM controllers on Tegra234
Content-Language: en-US
To:     Sandipan Patra <spatra@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bbasu@nvidia.com, kyarlagadda@nvidia.com
References: <20220829114432.19566-1-spatra@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829114432.19566-1-spatra@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29/08/2022 14:44, Sandipan Patra wrote:
> Tegra234 has eight single-channel PWM controllers, one of them in the
> AON block.
> 
> Signed-off-by: Sandipan Patra <spatra@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 84 ++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 81a0f599685f..c2dc651f0842 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -840,6 +840,90 @@
>  			#pwm-cells = <2>;
>  		};
>  
> +		pwm2: pwm@3290000 {
> +			compatible = "nvidia,tegra194-pwm",
> +				     "nvidia,tegra186-pwm";

This does not match bindings. Either DTS or bindings need to be fixed.

Best regards,
Krzysztof
