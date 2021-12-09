Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C41AC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 19:14:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbhLITRe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 14:17:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhLITRe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 14:17:34 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2FDC061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 11:14:00 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id v15so10575767ljc.0
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 11:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8K8sjABFf8qjPQHQ/RHkMNNitiF9t1dNpNCnBdW14LE=;
        b=ZhlrXoUzm0uH6PzaAATKTqBnmd/BBJQC/1IphyY0TN/dFsR7Xp3fjxjsrJOdF3MZpv
         A8lnF1K0BBTJvMRC0n2RQOifhYSzog/Bvz/fT5Phj+rF4vTpTfYLVziFJtD221yy9hPA
         Zi1kZNUMebfP7z9WGrOD7IIiTmIq4npXxhNh5RpzyvJ6wLF/1MkTpW1CidGeJggWiQT8
         WnslAXXITgE7C7aToVCZbtRmmfq4uY+5nGkthzcuL8lGEi0Xs4FOWl8RktETIBs/Ae4W
         j+pGFFKjS4hyxdxTt0qjLuWtwRxe6pnQPfyC3aKfrGF22r30TeEcZTjUiEFdfL1pd+Qj
         peCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8K8sjABFf8qjPQHQ/RHkMNNitiF9t1dNpNCnBdW14LE=;
        b=StwECvPuIk7I6+IDpYSJ8Ydh6cUdvdTuK5rpUsF0+4+mGSifitJp5HpXcNSmwocYcs
         A7VwyEWmjrw+ed5oXUlmWeCX0KxG4n7zk2ponkyc2BGrN6BC6Wn1w1emearzkBaBcBQ8
         wGEjYst0J3Lu6vir8MpRzWJ0+mB7Hsrpde9dFv/hjW3LykRi/Nwc5SM3bP2TKotxDiap
         3VLsUV51VRLrEmmW6C/3dTIeXxg+Y/Oopi9AZfXFtrvs7vf+wvxGqgWmWfcSxUCZMopy
         QumBhuw0kzC5vmLkDfKN8x+CdOqRSiV/3Lm6xlEawdq4Uruk2AYotJ3iAeVGK1/QzWm2
         whmQ==
X-Gm-Message-State: AOAM532LQkdKlWvYGVQAoMkuXj/xHvgiFgOKM1NZvmePukZdg5+w9Bia
        yGPojQcfSb4reh8t87s/xw54q3dbKFA=
X-Google-Smtp-Source: ABdhPJzcUR/JfrRC8Da5HW2Mrpf4jx3T7JFb5IYuB5Q8CP8avjkAvvLaG6pq8Nm5jozcFJWtkYoKBg==
X-Received: by 2002:a2e:8090:: with SMTP id i16mr8140709ljg.125.1639077238071;
        Thu, 09 Dec 2021 11:13:58 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id r14sm69568lfp.305.2021.12.09.11.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 11:13:57 -0800 (PST)
Subject: Re: [PATCH 16/25] ARM: tegra: Avoid pwm- prefix in pinmux nodes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-17-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <169a140b-7cf6-7a60-fc1d-e3a9574604a7@gmail.com>
Date:   Thu, 9 Dec 2021 22:13:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209173356.618460-17-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.12.2021 20:33, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The "pwm-" prefix currently matches the DT schema for PWM controllers
> and throws an error in that case. This is something that should be fixed
> in the PWM DT schema, but in this case we can also preempt any such
> conflict by naming the nodes after the pins like we do for many others
> of these nodes.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra20-colibri-eval-v3.dts | 4 ++--
>  arch/arm/boot/dts/tegra20-colibri-iris.dts    | 4 ++--
>  arch/arm/boot/dts/tegra20-colibri.dtsi        | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
> index a05fb3853da8..d2a3bf9d28bd 100644
> --- a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
> +++ b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
> @@ -70,11 +70,11 @@ mmccd {
>  				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>  			};
>  
> -			pwm-a-b {
> +			sdc {
>  				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>  			};
>  
> -			pwm-c-d {
> +			sdb_sdd {
>  				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>  			};
>  
> diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
> index 425494b9ed54..00ecbbd5e9e1 100644
> --- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
> +++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
> @@ -70,11 +70,11 @@ mmccd {
>  				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>  			};
>  
> -			pwm-a-b {
> +			sdc {
>  				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>  			};
>  
> -			pwm-c-d {
> +			sdb_sdd {
>  				nvidia,tristate = <TEGRA_PIN_DISABLE>;
>  			};
>  
> diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
> index 80e439003a6d..2350fda3be6a 100644
> --- a/arch/arm/boot/dts/tegra20-colibri.dtsi
> +++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
> @@ -113,7 +113,7 @@ bl-on {
>  			};
>  
>  			/* Colibri Backlight PWM<A>, PWM<B> */
> -			pwm-a-b {
> +			sdc {
>  				nvidia,pins = "sdc";
>  				nvidia,function = "pwm";
>  				nvidia,tristate = <TEGRA_PIN_ENABLE>;
> @@ -242,7 +242,7 @@ cif {
>  			};
>  
>  			/* Colibri PWM<C>, PWM<D> */
> -			pwm-c-d {
> +			sdb_sdd {
>  				nvidia,pins = "sdb", "sdd";
>  				nvidia,function = "pwm";
>  				nvidia,tristate = <TEGRA_PIN_ENABLE>;
> 

Should be a bit nicer to add the 'pin-' prefix, like I suggested to
David [1] sometime ago.

[1]
https://github.com/okias/linux/commit/53ba2d29981502790a5f64126f68926b51da0d8c
