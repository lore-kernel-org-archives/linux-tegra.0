Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C5BC7EE24
	for <linux-tegra@archiver.kernel.org>; Thu, 11 May 2023 09:02:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbjEKJC6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 May 2023 05:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236871AbjEKJC4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 May 2023 05:02:56 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0DA399
        for <linux-tegra@vger.kernel.org>; Thu, 11 May 2023 02:02:54 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bc25f0c7dso15103370a12.3
        for <linux-tegra@vger.kernel.org>; Thu, 11 May 2023 02:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683795773; x=1686387773;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97uBOFjQQzOvvB8u3OJcbV8ItVcsrJ5cxlVd2KHoK0k=;
        b=iz6Ud3fHc/LHQGwRDqEU/eUOlamVyRdaJ7jhbVrcRbUK0JylKteuX+Tguz4iQCHyHN
         PXotHmbMpKnRsrjsNuqaHVm9pWkhBe9us1wmZxGyXMG7RxCvOZ8pI1DBY2E8w3Q3bJdW
         W3cutSVgzIuXJIOf6CM3HFlvqIdYLTW87uW+VNnBCh6isbqucXDhoW5X75sutgHGFcNk
         RX3sZHa5f9M4GdLNJcaPnZBuncnRBq9mBdSwU+tPtX/C64mifxibEXcBhY03NouPmih+
         hXvCtHp/xc9noSP5SARD3xPheNQe56giFts7F2G1DEHMwdfBigpdwEK48OjyIWlkS0Sf
         htKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683795773; x=1686387773;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=97uBOFjQQzOvvB8u3OJcbV8ItVcsrJ5cxlVd2KHoK0k=;
        b=lJGiBkQ0HY/yoTgSYkN17MUkaRWW/x9WstYk1b9n8m7FODZN1Pg0xzHNoLIXOO3iYN
         M5ujeNBgD6/pkt/MZRLf0CbQR2mmAZOUadZ7gVj1s+ou/5VqoWP5JwH35ouRckRUfi1G
         7NtN28wqBrZcDvwTyNrhZH5MjMKizZJfw23/SSslE9mPFK2MpC9QaWBVUw2FGtx0lxn5
         5kcVu+BR8euc+HAxbmgBtB8tkgaS0Mw77kG86dDFNbfbLLpkKVaVQpBlqpN1oGbn0Rf+
         7K0f3x1NbPuO9Shm8TALQjZ11apLbeyKeD20+JBuz5Tu/f+8W6w/4jZBZtFjMROcYDNi
         HCyw==
X-Gm-Message-State: AC+VfDz7ubPmvDwtiWK6eeP9Hzs2twE5+I/3kh3A8e71cNR8kMW/EBFG
        2x9dcNc9WBU1wZLa7hnr9WGGlg==
X-Google-Smtp-Source: ACHHUZ6OK7ykSvjrrZ+YB4oNDuEFF+ghucDyBzdNtJncOI1RhXAGST8r7wzUqhoWVeznvurVkNy5HQ==
X-Received: by 2002:aa7:dd11:0:b0:50b:c11b:f00c with SMTP id i17-20020aa7dd11000000b0050bc11bf00cmr15314606edv.22.1683795773184;
        Thu, 11 May 2023 02:02:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e? ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id q17-20020a056402033100b00509dfb39b52sm2807668edw.37.2023.05.11.02.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:02:52 -0700 (PDT)
Message-ID: <e0613d65-145a-4a80-b1eb-2a0e2fd36729@linaro.org>
Date:   Thu, 11 May 2023 11:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] arm64: dts: tegra: smaug: add GPU power rail
 regulator
Content-Language: en-US
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230511083101.78516-1-diogo.ivo@tecnico.ulisboa.pt>
 <20230511083101.78516-2-diogo.ivo@tecnico.ulisboa.pt>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230511083101.78516-2-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/05/2023 10:31, Diogo Ivo wrote:
> Add the GPU power rail regulator node for the Pixel C.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> index e55bff859692..8973fcf1e219 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -1406,6 +1406,23 @@ max77621_cpu: max77621@1b {
>  			maxim,externally-enable;
>  		};
>  
> +		max77621_gpu: max77621@1c {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "maxim,max77621";
> +			reg = <0x1c>;
> +			interrupt-parent = <&gpio>;
> +			interrupts = <TEGRA_GPIO(A, 6) IRQ_TYPE_LEVEL_LOW>;
> +			regulator-min-microvolt = <840000>;
> +			regulator-max-microvolt = <1150000>;
> +			regulator-name = "PPVAR_GPU";
> +			regulator-ramp-delay = <12500>;
> +			maxim,dvs-default-state = <1>;
> +			maxim,enable-active-discharge;
> +			maxim,enable-bias-control;
> +			maxim,disable-etr;
> +			maxim,enable-gpio = <&pmic 6 0>;

Use defines for GPIO flags.

Best regards,
Krzysztof

