Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A8DC83F17
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Aug 2023 08:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232145AbjHZI52 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Aug 2023 04:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbjHZI5E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Aug 2023 04:57:04 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6787198
        for <linux-tegra@vger.kernel.org>; Sat, 26 Aug 2023 01:56:59 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50078e52537so2529051e87.1
        for <linux-tegra@vger.kernel.org>; Sat, 26 Aug 2023 01:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693040218; x=1693645018;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7yGXBVcB5RgIvR3q2K2OKjd17MwrMmfxUPp5m1Q3U6U=;
        b=O8/tV3d+PU+KQonm+fa1RT4kWPTirjw72aePQSJKw29KICS8rHEoXfEPgsamAXweRh
         4GzPmu+OUe9M9fn6X8xDhHhw5YYSYkQgEHWYhErCtGNKBNfOM440ypHxcpMe+ZzjyiHZ
         syGStyvWB6ab6ySnXRKw+uNTgJ62cignepIJ0pkzG03awsZBNAMBYlO/AUhAKP+NNMvv
         bqL2Gy9vxU3xLkGb84jL+t5eq1/D5Ag6RN7cPsa2CoXOTPyWeqWY8c2kQQ3rWAznRLeF
         +UUipb+ZFGGET/0hARFoetuZgt/5Bu8OdgMk6YWZW2JCDpmMCZnsL/NhBGJ4oE3zkipu
         uYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693040218; x=1693645018;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yGXBVcB5RgIvR3q2K2OKjd17MwrMmfxUPp5m1Q3U6U=;
        b=jsXtOOgch6dSRYxdXHqiBdrJCPt+f4UlIv4tBDrOhWLPIYNTCRfYYxvj4soUYYh+40
         WU5Unq4mRv+tbeOU9HjzBbCJ1pmm/Rb82GAKCBNKkYRbP330d87Lcta2mUhAcRpqE2OP
         anpLuYEJulZk5PdEMlKVrrMRiqGJhMmOPGXDlWCVa7Nea1TSGP35NELpV44ZQUcgggV+
         l7flxltydLXQvH4Yccd/KZ6x0KgfythUyQRD8PwAwY1cTomeB6mupDk3EV74EW0tlMDK
         0WrMZ3l1yZ3IpSpcZF4LOkIkQh4bMlKXa34sNjgijEAwGD9GMf7IqILquB2CLyQihZop
         YqxQ==
X-Gm-Message-State: AOJu0YwA47/t991w+UnnssWkCmBWe1r1vY8+KSnLTr/66OYmf4PJzPKz
        yXTiqaNTz/6msLgody2/hO4qqg==
X-Google-Smtp-Source: AGHT+IHvpksc/T0dDbtHLsxsdzmiLQ+zqP/zITpPHVj1AB5lTzNQAw5NjqmaRus9ritM1INyoRW28A==
X-Received: by 2002:ac2:4a6e:0:b0:4fd:fedc:2ce5 with SMTP id q14-20020ac24a6e000000b004fdfedc2ce5mr14964274lfp.36.1693040217821;
        Sat, 26 Aug 2023 01:56:57 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id q3-20020aa7d443000000b00525c01f91b0sm1893154edr.42.2023.08.26.01.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 01:56:57 -0700 (PDT)
Message-ID: <7595f0d3-7a59-9837-ef6b-627be3688667@linaro.org>
Date:   Sat, 26 Aug 2023 10:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V2 2/4] dt-bindings: hwmon: ina3221: Add summation-bypass
Content-Language: en-US
To:     Ninad Malwade <nmalwade@nvidia.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230825164249.22860-1-nmalwade@nvidia.com>
 <20230825164249.22860-3-nmalwade@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825164249.22860-3-nmalwade@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25/08/2023 18:42, Ninad Malwade wrote:
> The INA3221 has a critical alert pin that can be controlled by the
> summation control function. This function adds the single
> shunt-voltage conversions for the desired channels in order to
> compare the combined sum to the programmed limit. The Shunt-Voltage
> Sum Limit register contains the programmed value that is compared
> to the value in the Shunt-Voltage Sum register in order to
> determine if the total summed limit is exceeded. If the
> shunt-voltage sum limit value is exceeded, the critical alert pin
> pulls low.
> 
> For the summation limit to have a meaningful value, it is necessary
> to use the same shunt-resistor value on all included channels. Add a
> new property, 'summation-bypass', to allow specific channels to be
> excluded from the summation control function if the shunt resistor
> is different to other channels.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
> ---
>  .../devicetree/bindings/hwmon/ti,ina3221.yaml  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> index 0c6d41423d8c..20c23febf575 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> @@ -55,6 +55,24 @@ patternProperties:
>        shunt-resistor-micro-ohms:
>          description: shunt resistor value in micro-Ohm
>  
> +      summation-bypass:

What is the type? There is no vendor prefix here, so you added it as a
generic property. Which other devices use or can use it?

> +        description: |
> +          The INA3221 has a critical alert pin that can be controlled by the
> +          summation control function. This function adds the single
> +          shunt-voltage conversions for the desired channels in order to
> +          compare the combined sum to the programmed limit. The Shunt-Voltage
> +          Sum Limit register contains the programmed value that is compared
> +          to the value in the Shunt-Voltage Sum register in order to
> +          determine if the total summed limit is exceeded. If the
> +          shunt-voltage sum limit value is exceeded, the critical alert pin
> +          pulls low.
> +
> +          For the summation limit to have a meaningful value, it is necessary
> +          to use the same shunt-resistor value on all included channels. If
> +          this is not the case for specific channels, then the
> +          'summation-bypass' can be populated for a specific channel to
> +          exclude from the summation control function.

I don't understand what this property does. You described feature in the
device, that's good, but how does it map to the property? Bypass means
disable?

> +
>      additionalProperties: false
>  
>      required:

Best regards,
Krzysztof

