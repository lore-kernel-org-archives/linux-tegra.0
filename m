Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6056BCCA47C
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Jun 2022 06:34:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbiF2Ger (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Jun 2022 02:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiF2Gen (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Jun 2022 02:34:43 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C4C2BB0A
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jun 2022 23:34:41 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id fi2so30452083ejb.9
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jun 2022 23:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EmERg3nlw3fI08RWFRLas0/UbKz83F820Tzvq+AS7+Y=;
        b=vyh694gOH4oD+ETeT3V6t7TbZoq5lHvVgMW/SAG0AD4uAJHGkAGGjz1EQWtgruTKs0
         B91/7vVz1B2C4Kbgrk3wWrBjiDaTaH1AfgO2bdEgGiYbv/d0hwyOo40tIk/M4NS/fSsO
         pAlllgZEgk66o1ZCA7J4NllsI6HkmwU7W5QiYQqDpMBgXFwbF97BxIzFBaCXMhiktt9Q
         Gs98YDea9tygoQCxqTZ1KIUg9FLFpeHv5zkG2ec0CiPY3I6EcFWCLYb4aoEVQEemjU8b
         JE2tGPVWGejZAbwv0GGRnZj5Im8lPzQqNHu3fdvh0OQkYdjgX9qvvT/g5QRjYZrpmT5U
         nH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EmERg3nlw3fI08RWFRLas0/UbKz83F820Tzvq+AS7+Y=;
        b=Kijdo5OgC1gp/Kdm8/ewx3yWltD5nnaHVY0G8udL6GUb07+gHg5gpkMwEd9TGJzbH6
         RbHU7AJV99plswcg7N559J9JgiDfxiAMfTPmbb59TdjN8Y6YBO1c2Fehhd0nbbdtLPTC
         U0DuEqwuOz+SXbCzgOz67tYYaQ8/E107rRGVfB/QtVqMFXban2nlX7OPdgzgR6Uw3+MN
         gvnxgPq604gCMrV7sqQLY40FmY9CQHrNdr5zFYuMGcMWTQ744TtRoR+dLHnilm+zed2K
         aFA+fhdl2e2GMCE78HM+hz86GVIK0ym79wk+FMnGZLfC0joZhuVpqjIeOMNlrQCv1obX
         Z76A==
X-Gm-Message-State: AJIora+KMSjS3ThOO7aE9LdwR4TGiaQL+a7grE7U3/I9MU/vrryHybxY
        8nLFlb/ncxw1Owe/+aQuLfxEFQ==
X-Google-Smtp-Source: AGRyM1uFIbKAyhcok94Ie/62FVbVNJ8GIeKit7vF4RsjLCPSfb0Lp5f0QUVqbru1QAGPf/Y60DXxFA==
X-Received: by 2002:a17:907:d89:b0:726:9d87:e4c0 with SMTP id go9-20020a1709070d8900b007269d87e4c0mr1732632ejc.216.1656484480272;
        Tue, 28 Jun 2022 23:34:40 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z4-20020a1709060f0400b00722f069fd40sm7248744eji.159.2022.06.28.23.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 23:34:39 -0700 (PDT)
Message-ID: <291c1ff5-f864-3a8b-d151-d2ec805c8e5d@linaro.org>
Date:   Wed, 29 Jun 2022 08:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH V3 05/11] arm64: tegra: Add regulators required for PCIe
Content-Language: en-US
To:     Vidya Sagar <vidyas@nvidia.com>, bhelgaas@google.com,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     kishon@ti.com, vkoul@kernel.org, kw@linux.com,
        p.zabel@pengutronix.de, mperttunen@nvidia.com,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, kthota@nvidia.com,
        mmaddireddy@nvidia.com, sagar.tv@gmail.com
References: <20220629060435.25297-1-vidyas@nvidia.com>
 <20220629060435.25297-6-vidyas@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629060435.25297-6-vidyas@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29/06/2022 08:04, Vidya Sagar wrote:
> Add regulator supplies required for PCIe functionality. The supplies
> include 1.8V, 3.3V and 12V.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> V3:
> * New patch in this series
> 
>  .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  | 24 +++++++++++++++++++
>  .../boot/dts/nvidia/tegra234-p3737-0000.dtsi  | 23 ++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
> index 798de9226ba5..d53901ba45f6 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
> @@ -6,6 +6,30 @@
>  	model = "NVIDIA Jetson AGX Orin";
>  	compatible = "nvidia,p3701-0000", "nvidia,tegra234";
>  
> +	fixed-regulators {
> +		compatible = "simple-bus";
> +		device_type = "fixed-regulators";
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;

This is not a bus, fixed regulators are not part of some bus.

> +
> +		p3701_vdd_1v8_ls: regulator@3 {
> +			compatible = "regulator-fixed";
> +			reg = <3>;

This fails schema. No.

> +			regulator-name = "vdd-1v8-ls-sw5";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-always-on;
> +		};

Missing blank line.

> +		p3701_vdd_AO_1v8: regulator@5 {
> +			compatible = "regulator-fixed";
> +			reg = <5>;
> +			regulator-name = "vdd-AO-1v8-sw2";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-always-on;
> +		};
> +	};
> +
>  	bus@0 {
>  		spi@3270000 {
>  			status = "okay";
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
> index a85993c85e45..bb503643dd38 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
> @@ -2,4 +2,27 @@
>  
>  / {
>  	compatible = "nvidia,p3737-0000";
> +
> +	fixed-regulators {
> +		p3737_vdd_3v3_pcie: regulator@105 {
> +			compatible = "regulator-fixed";
> +			reg = <105>;
> +			regulator-name = "vdd-3v3-pcie";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			gpio = <&gpio TEGRA234_MAIN_GPIO(Z, 2) 0>;
> +			enable-active-high;
> +			regulator-boot-on;
> +		};

Same comments.

> +		p3737_vdd_12v_pcie: regulator@114 {
> +			compatible = "regulator-fixed";
> +			reg = <114>;
> +			regulator-name = "vdd-12v-pcie";
> +			regulator-min-microvolt = <12000000>;
> +			regulator-max-microvolt = <12000000>;
> +			gpio = <&gpio TEGRA234_MAIN_GPIO(A, 1) 1>;
> +			regulator-boot-on;
> +			enable-active-low;
> +		};
> +	};
>  };


Best regards,
Krzysztof
