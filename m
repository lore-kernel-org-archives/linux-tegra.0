Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98050C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 12:34:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiJGMeD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 08:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiJGMeC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 08:34:02 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AEBC4C0E
        for <linux-tegra@vger.kernel.org>; Fri,  7 Oct 2022 05:34:00 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id bs18so5555323ljb.1
        for <linux-tegra@vger.kernel.org>; Fri, 07 Oct 2022 05:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HkOmdE+hZtMPQTiOZSsH7S2sa0ul444Iw/UaaGdANrc=;
        b=Or4uUZRyPfCNpCFenKV5qDSe38AGCsQ6lJR9TV5pLr5DipWB4odgPWTxVYtWPh+Pvc
         b8cYFZ51OqBPRkJwzGQpnnPJ+ZHjKWqZC9bRhXAiC36DcKHc1ujJtjuxKfJD+INGx/yi
         peye1G5IiXFREiiVd76wvOh6VwtZ6BX12QiBGyIDoEgSjXQdDK5WLfv1Psxlv6i9XC2I
         TGx8ZZjqsBo3C12vxFv6gOFACeZdSgE6o3F2Ni8eqgLbEAh4mkbAhassCuTVHBG0FRQQ
         /J/qJLBIrNnfid+aSepAO4nfua3ZKwIsb0fo6kZ3B+QvL2Qq9DjL9gemMNjoHj1UrXvz
         olwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HkOmdE+hZtMPQTiOZSsH7S2sa0ul444Iw/UaaGdANrc=;
        b=H0MUq/XSVkGWnWvAnkvVtNd6ifziKiFnZaBqyc2xUlo/bOZccRoinPFWMW+DOeMjaz
         yIQr8FEUOBR8wZyCo/p8TBUF7gIcju0PEKjPv1PG3boIjeOhAqsPel9B1bL4ndmc5FCU
         CVNaqqLIamM79SLLqdVWrSSOx0k3tgvimav9Xfp/ODkGr7sYRjB5AwMdC+BSfMLwLax8
         ckdRdUiP58oEAx7jD/LSm0Oyu511Uu8lAAzRB/Gw3Q/jGgEHfUANEmhAqnbgxo9xQ6Ne
         kxxGv3kZoz5gs/m7NgreK7tBqfYXjGSwem/H1TZ62QKDUUOrYSeJGkjLxMNLoG5d1Ny3
         pcXQ==
X-Gm-Message-State: ACrzQf0gE+rRkC2EIFKKJT2OXhii3Tc9Q2dAOHI7Bqz3b4FEzMp3+tGb
        Fi7qvm9r+ZOkRUm4C4lmRTDVUQ==
X-Google-Smtp-Source: AMsMyM4QjaDTmAAncZ6sOC0VRZ2SYXni2dM5ZSghqXwDA5ghu3Lt8IqZREKDQSWBQVOuxZrvujU9Ow==
X-Received: by 2002:a05:651c:4c9:b0:26c:79cd:2819 with SMTP id e9-20020a05651c04c900b0026c79cd2819mr1736770lji.159.1665146039325;
        Fri, 07 Oct 2022 05:33:59 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p6-20020a056512328600b004a03d5c2140sm278808lfe.136.2022.10.07.05.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 05:33:58 -0700 (PDT)
Message-ID: <80d046b9-ff8c-58dc-d149-e984d509fe5a@linaro.org>
Date:   Fri, 7 Oct 2022 14:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] arm64: tegra: Add Tegra234 SDMMC1 device tree node
Content-Language: en-US
To:     Prathamesh Shete <pshete@nvidia.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     smangipudi@nvidia.com, kyarlagadda@nvidia.com, anrao@nvidia.com
References: <20221007102605.15828-1-pshete@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007102605.15828-1-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 07/10/2022 12:26, Prathamesh Shete wrote:
> Add device tree node for Tegra234 SDMMC1 instance.
> Add and enable SD card instance in device tree.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |  7 +++
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 59 +++++++++++++++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
> index 9e4d72cfa69f..fe52810e5b9d 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
> @@ -55,6 +55,13 @@
>  			};
>  		};
>  
> +		mmc@3400000 {
> +			status = "okay";
> +			bus-width = <4>;
> +			cd-gpios = <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
> +			disable-wp;
> +		};
> +
>  		mmc@3460000 {
>  			status = "okay";
>  			bus-width = <8>;
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 0170bfa8a467..87f6b8be79a5 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/memory/tegra234-mc.h>
>  #include <dt-bindings/power/tegra234-powergate.h>
>  #include <dt-bindings/reset/tegra234-reset.h>
> +#include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>  
>  / {
>  	compatible = "nvidia,tegra234";
> @@ -895,6 +896,45 @@
>  			status = "disabled";
>  		};
>  
> +		mmc@3400000 {
> +			compatible = "nvidia,tegra194-sdhci", "nvidia,tegra234-sdhci";
> +			reg = <0x03400000 0x20000>;
> +			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&bpmp TEGRA234_CLK_SDMMC1>,
> +				 <&bpmp TEGRA234_CLK_SDMMC_LEGACY_TM>;
> +			clock-names = "sdhci", "tmclk";
> +			assigned-clocks = <&bpmp TEGRA234_CLK_SDMMC1>,
> +					<&bpmp TEGRA234_CLK_PLLC4_MUXED>;
> +			assigned-clock-parents =
> +					  <&bpmp TEGRA234_CLK_PLLC4_MUXED>,
> +					  <&bpmp TEGRA234_CLK_PLLC4_VCO_DIV2>;
> +			resets = <&bpmp TEGRA234_RESET_SDMMC1>;
> +			reset-names = "sdhci";
> +			interconnects = <&mc TEGRA234_MEMORY_CLIENT_SDMMCRA &emc>,
> +					<&mc TEGRA234_MEMORY_CLIENT_SDMMCWA &emc>;
> +			interconnect-names = "dma-mem", "write";
> +			iommus = <&smmu_niso1 TEGRA234_SID_SDMMC1A>;
> +			pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
> +			pinctrl-0 = <&sdmmc1_3v3>;
> +			pinctrl-1 = <&sdmmc1_1v8>;
> +			nvidia,pad-autocal-pull-up-offset-3v3-timeout =
> +								      <0x07>;
> +			nvidia,pad-autocal-pull-down-offset-3v3-timeout =
> +									<0x07>;
> +			nvidia,pad-autocal-pull-up-offset-1v8-timeout = <0x06>;
> +			nvidia,pad-autocal-pull-down-offset-1v8-timeout =
> +									<0x07>;
> +			nvidia,pad-autocal-pull-up-offset-sdr104 = <0x00>;
> +			nvidia,pad-autocal-pull-down-offset-sdr104 = <0x00>;
> +			nvidia,default-tap = <14>;
> +			nvidia,default-trim = <0x8>;
> +			sd-uhs-sdr25;
> +			sd-uhs-sdr50;
> +			sd-uhs-ddr50;
> +			sd-uhs-sdr104;
> +			status = "disabled";
> +		};
> +
>  		mmc@3460000 {
>  			compatible = "nvidia,tegra234-sdhci", "nvidia,tegra186-sdhci";
>  			reg = <0x03460000 0x20000>;
> @@ -1541,6 +1581,25 @@
>  
>  			#interrupt-cells = <2>;
>  			interrupt-controller;
> +			sdmmc1_3v3: sdmmc1-3v3 {
> +				pins = "sdmmc1-hv";
> +				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
> +			};
> +
> +			sdmmc1_1v8: sdmmc1-1v8 {
> +				pins = "sdmmc1-hv";
> +				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
> +			};
> +			sdmmc3_3v3: sdmmc3-3v3 {
> +				pins = "sdmmc3-hv";
> +				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
> +			};
> +
> +			sdmmc3_1v8: sdmmc3-1v8 {
> +				pins = "sdmmc3-hv";
> +				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
> +			};
> +

Wrong conflict resolution... blank line went into the wrong place.

>  		};
>  
>  		aon-fabric@c600000 {

Best regards,
Krzysztof

