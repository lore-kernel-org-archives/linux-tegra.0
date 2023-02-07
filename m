Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE14C636CC
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Feb 2023 15:33:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbjBGPdr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Feb 2023 10:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbjBGPdq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Feb 2023 10:33:46 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B3630B00
        for <linux-tegra@vger.kernel.org>; Tue,  7 Feb 2023 07:33:45 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id g6so5961401wrv.1
        for <linux-tegra@vger.kernel.org>; Tue, 07 Feb 2023 07:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PTnY0wGmTO1uqiMJf9qy9bUafhmq6LzH9wwHhH9NEok=;
        b=xuiCfwYjBYOISV3VyvsuSIpS/9F7mNBcjbuEmnfneAYJ0l8iXURunS/AaF0fnr/8ll
         QYMtWG4JtV343LYmf5CSEDEY3JnIgsKTkKRdZWJ0q/hsqFT2mLvuHb5BNr4boZ+dzDGX
         EJ3A7F9jpJuPYVKjTH8wMcrMpv4lg2k4KR7f5gEwJEPF7QWzuh6fbscYqX7dvSlh+5+g
         HY9euVHuxVs5j4Z9SlFcQ7eB+5iN6VG2+2/plEDlPL4/l+D4Z36olwdG9AqF+6ggN6aq
         F+YKnUi5Q20oUGHlA9f7Hl+aWqgxjB17JN+C9D5p6zOzZ4VmBwlyHaf/yxsSrix9wYpy
         6MuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTnY0wGmTO1uqiMJf9qy9bUafhmq6LzH9wwHhH9NEok=;
        b=TAP93f8PlNSZPwU94wcfBCCWhjuTO99H1w84oxgNfpT0Elw4bNCtGPzjgWFAKmOHOo
         UX4OPSmiYLdL8ZFlWFas5hZ/zr5k5naSz7XFIeD4yvBPDPUtDGpWtiYwhrHPdzrVhLq9
         iEN0Zk+mcDc9uI7NlnAWreergVUqXTlAx4NFsOyM9WICcHOVjluglviUmN28OiRCrY+Z
         063HJF/QAg1rko0Yy4V4Yk57CMsqbtQReU+sp7CsERpPHf/NW/S1lZvqNkfdVgX+YHqt
         pJHsn5ymgO/XF0QfWT6Fgtf2Nz9MsDE5eSke9EXfHFNalzampD8iq8qWKONDlZpJA+NA
         8TTg==
X-Gm-Message-State: AO0yUKULF6jFyh04d/R0RQZGVouTScfLWqSWkdjzdcu274xJzLpto+b4
        iXAnicR6BkkWpZmtG8lgTB3ZQw==
X-Google-Smtp-Source: AK7set/49aX7LC3tNb/jBWKWFYYtSGRExKUvmpYmP8IdPPbiYRpLqUVNC1SO9TRuJd40mrBTJ571Cw==
X-Received: by 2002:adf:f18a:0:b0:2c3:24f3:8b47 with SMTP id h10-20020adff18a000000b002c324f38b47mr3401668wro.31.1675784024026;
        Tue, 07 Feb 2023 07:33:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d16-20020adffbd0000000b002c3ea5ebc73sm4908655wrs.101.2023.02.07.07.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 07:33:43 -0800 (PST)
Message-ID: <f0d58e5b-74df-26cf-592e-302a00d08eee@linaro.org>
Date:   Tue, 7 Feb 2023 16:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] arm64: tegra: Add Tegra234 pinmux device
Content-Language: en-US
To:     Prathamesh Shete <pshete@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     smangipudi@nvidia.com
References: <20230207115617.12088-1-pshete@nvidia.com>
 <20230207115617.12088-3-pshete@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207115617.12088-3-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 07/02/2023 12:56, Prathamesh Shete wrote:
> This change adds pinmux node for Tegra234.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index eaf05ee9acd1..c91b88bc56d1 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -701,6 +701,13 @@
>  			interrupt-controller;
>  			#gpio-cells = <2>;
>  			gpio-controller;
> +			gpio-ranges = <&pinmux 0 0 164>;
> +		};
> +
> +		pinmux: pinmux@2430000 {
> +			compatible = "nvidia,tegra234-pinmux";
> +			reg = <0x2430000 0x19100>;
> +			status = "okay";

Why? Anything disabled it?

>  		};
>  
>  		mc: memory-controller@2c00000 {
> @@ -1664,6 +1671,13 @@
>  			interrupt-controller;
>  			#gpio-cells = <2>;
>  			gpio-controller;
> +			gpio-range = <&pinmux_aon 0 0 32>;
> +		};
> +
> +		pinmux_aon: pinmux@c300000 {
> +			compatible = "nvidia,tegra234-pinmux-aon";
> +			reg = <0xc300000 0x4000>;
> +			status = "okay";

Also why?

>  		};
>  
>  		pwm4: pwm@c340000 {

Best regards,
Krzysztof

