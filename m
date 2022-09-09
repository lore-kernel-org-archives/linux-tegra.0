Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E91FECAAD3
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Sep 2022 16:40:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbiIIQjz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Sep 2022 12:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbiIIQj2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Sep 2022 12:39:28 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720AD2EF
        for <linux-tegra@vger.kernel.org>; Fri,  9 Sep 2022 09:39:22 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id bq23so3640346lfb.7
        for <linux-tegra@vger.kernel.org>; Fri, 09 Sep 2022 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Af4zlABcQ7iyW/0hGd2YIxWtO+SJq7WH8x4IJPqk7j4=;
        b=Tz4BiYwXwq8pe/3/uLts5EMGxwbjsqrgFDL05nLLU9Vuk4Hcs2MXoWFgMbrS9UF6tx
         BUKobU5FFkpBRGVDugfk9qfK708lqbJxetwltNEIHTL7rK7az8gO5zp49foik8pc546U
         RlcBWBOf5bRjYH9KMHvmTdrs6Xv3yZeh2rPnQkic8iKpNFmadQw3jKUWGCWyfK19+oLi
         cnS4cAalg4E6Sy76tf46JaVkszWF/sTcOMJ3rlBhfc9fX3coyMLp+TvjDS8GitOfGjKa
         lEn6NAERwSNJ8oai2bLT6J1JWS6bqeK8CWp2ONZX71ALFUD+OotS2vl0HCzysVfweU63
         oHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Af4zlABcQ7iyW/0hGd2YIxWtO+SJq7WH8x4IJPqk7j4=;
        b=DgVrKhZmraa2rxfh+hBpwcL36W3c/dyMhH3TJ2klhx1Zlinmh2KQV2TpdK8Ne4cgvn
         4eSn1K6rNw2sBh+PBrTaKM4USUwen9QMYd0aIk9uPUM5XwNbObrrwg+jNJ3epkXQ+qJJ
         vk4NM6ghWv3njhVWI+Zg1ciW7wG6PywuaonIt6ENzOMftZHjrFHQUVJzGVti4MfXa/Pw
         x1p0+uyKYO3Yvyg1otuzDtnAMeST7p4RzvS6+lmzTv+u6p1SBl5UyBO7S94G18297EEw
         MzPfnHLjJwgdGQkbdbVaFGbbJYJcXvPQ32vPvuiBXPFheRMdeIosqmyMKn/QNvjvhGGR
         7vkw==
X-Gm-Message-State: ACgBeo02m9ss1Xd46KaWidpxD0dh7jst8a9RcuTvDqtPCGAu+AC4U/u3
        H8gZyxa7R2JM7s835uoO1TG1Cw==
X-Google-Smtp-Source: AA6agR5pyA/oh/zU7TqvcwHudEeiax77oGDyUrXHpUJjnbyOL2kcrbcs10pNE9iNmJTZ8GnrC0bNGA==
X-Received: by 2002:a05:6512:c1:b0:497:acd3:10cf with SMTP id c1-20020a05651200c100b00497acd310cfmr3965183lfp.484.1662741560395;
        Fri, 09 Sep 2022 09:39:20 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p9-20020a2e7409000000b0026be1de1500sm139385ljc.79.2022.09.09.09.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:39:19 -0700 (PDT)
Message-ID: <3882e496-3082-8db3-c730-1e14554bbcf8@linaro.org>
Date:   Fri, 9 Sep 2022 18:39:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/3] arm64: tegra: Add PWM controllers on Tegra234
Content-Language: en-US
To:     Sandipan Patra <spatra@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bbasu@nvidia.com, kyarlagadda@nvidia.com
References: <20220909155258.17908-1-spatra@nvidia.com>
 <20220909155258.17908-2-spatra@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909155258.17908-2-spatra@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 09/09/2022 17:52, Sandipan Patra wrote:
> Tegra234 has eight single-channel PWM controllers, one of them in the
> AON block.
> 
> Signed-off-by: Sandipan Patra <spatra@nvidia.com>
> ---
> V3: Update binding doc and fix compatible property.
> 
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 80 +++++++++++++++++++++++-
>  1 file changed, 78 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 81a0f599685f..d77ee9d81fb2 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -829,8 +829,7 @@
>  		};
>  
>  		pwm1: pwm@3280000 {
> -			compatible = "nvidia,tegra194-pwm",
> -				     "nvidia,tegra186-pwm";
> +			compatible = "nvidia,tegra194-pwm";

Where is the fallback?

Best regards,
Krzysztof
