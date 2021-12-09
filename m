Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABADC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 19:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhLITkU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 14:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbhLITkT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 14:40:19 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB20C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 11:36:45 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id l7so10619875lja.2
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 11:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7px+GquIdd2Zoaa9ZFCzJ+pQIfzUD4c8V6pLGNOqVR0=;
        b=i40kXzAQyprl9fc+TVwsGbWK+ANCEj9xodDxReVto9GO8SDzGDkbJbnsAJsySnWDQM
         3M5j1z5IlNg7JtRO52nqfEK6AA4iqmdRDx6RTXq+3mfm5X4HCGAtUuZVQ0noPHYLT4gb
         bBST+Dg4DPl5bvrq36ezuGmNQQUPtnzvAYyieIO5BZAZL8vvlxsJAz9tsYZjAI6fBNmH
         tx15UQiu+Dtc9jSBNNw27nbiwnhn2lbqN4esGXCGqev9W7SlZ7iHWpr4CGvAfCcbQFst
         pKN/tNZh6UZgH0PYcdrcuE+W1W7xyn4BfB9tmJQx2dFarkSR62gFnpwwrpG5N7M+hJ6F
         5F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7px+GquIdd2Zoaa9ZFCzJ+pQIfzUD4c8V6pLGNOqVR0=;
        b=q5uxFXmGdd7JFhTLWtEENVbn/1NC9344khT4TJEFrh3g+Ii1cAxQZeWnsT3QABoBpr
         iehEr04NV+dyGsyqpVBuqNsqdFHX75OTOJFhLKz04c+mxHC2K/04B8b3ix+lPEvZDExp
         YPJWhU5JJHu0E0qNUDoXvHGYEXUJ/6f1HOVQsL7f/1dK+ujGEi4KZEocZ0oA+jlNLtMR
         wTKtMy4GH4riwtTepzCzHDd6XweqjEmFRpINIMXcpQCdAaKAhd3d7YtO/B9pUPTXSpkh
         TzKkC8mURXOfb2c6minSVpPqtdBPfKJUFfsk71RiExIP4a/EcQSV4BoI7QbUg0F/89Uu
         ZC7w==
X-Gm-Message-State: AOAM530kMpdAWYjfDQzCHVtun9SETqHHwzoUJiVI2c2tB86HwaKoku5l
        njTnaiPMJhWgc+z658BXjeqVGhAh5Is=
X-Google-Smtp-Source: ABdhPJxXfyzXism1yrIlsJQM/T25RNSzWSGXYOD8nXKKXn4wOuKD0Cu/sZl43ohw8KtXwzbPxM0j/g==
X-Received: by 2002:a05:651c:17a1:: with SMTP id bn33mr8821840ljb.479.1639078603993;
        Thu, 09 Dec 2021 11:36:43 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id bp36sm87884lfb.0.2021.12.09.11.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 11:36:43 -0800 (PST)
Subject: Re: [PATCH 06/25] ARM: tegra: Fix compatible string for Tegra30+
 timer
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-7-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d7989902-a42e-1fed-d85b-ade3e160400a@gmail.com>
Date:   Thu, 9 Dec 2021 22:36:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209173356.618460-7-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.12.2021 20:33, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The TKE (time-keeping engine) found on Tegra30 and later is not
> backwards compatible with the version found on Tegra20, so update the
> compatible string list accordingly.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra114.dtsi | 2 +-
>  arch/arm/boot/dts/tegra124.dtsi | 2 +-
>  arch/arm/boot/dts/tegra30.dtsi  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
> index 546272e396b4..328425dba023 100644
> --- a/arch/arm/boot/dts/tegra114.dtsi
> +++ b/arch/arm/boot/dts/tegra114.dtsi
> @@ -164,7 +164,7 @@ lic: interrupt-controller@60004000 {
>  	};
>  
>  	timer@60005000 {
> -		compatible = "nvidia,tegra114-timer", "nvidia,tegra30-timer", "nvidia,tegra20-timer";
> +		compatible = "nvidia,tegra114-timer", "nvidia,tegra30-timer";
>  		reg = <0x60005000 0x400>;
>  		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
> index 63a64171b422..f4ac0c327c2e 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -259,7 +259,7 @@ lic: interrupt-controller@60004000 {
>  	};
>  
>  	timer@60005000 {
> -		compatible = "nvidia,tegra124-timer", "nvidia,tegra30-timer", "nvidia,tegra20-timer";
> +		compatible = "nvidia,tegra124-timer", "nvidia,tegra30-timer";
>  		reg = <0x0 0x60005000 0x0 0x400>;
>  		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> index ae3df73c20a7..4c04b9c28484 100644
> --- a/arch/arm/boot/dts/tegra30.dtsi
> +++ b/arch/arm/boot/dts/tegra30.dtsi
> @@ -342,7 +342,7 @@ lic: interrupt-controller@60004000 {
>  	};
>  
>  	timer@60005000 {
> -		compatible = "nvidia,tegra30-timer", "nvidia,tegra20-timer";
> +		compatible = "nvidia,tegra30-timer";
>  		reg = <0x60005000 0x400>;
>  		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> 

What exactly is incompatible? IIRC, T30+ is a superset of T20. This
patch should be wrong, also see [1].

[1]
https://elixir.bootlin.com/linux/v5.16-rc4/source/drivers/clocksource/timer-tegra.c#L404
