Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E50DC433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Dec 2021 19:30:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345208AbhLVTaK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Dec 2021 14:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237755AbhLVTaG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Dec 2021 14:30:06 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1273FC061574
        for <linux-tegra@vger.kernel.org>; Wed, 22 Dec 2021 11:30:06 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id r22so5341858ljk.11
        for <linux-tegra@vger.kernel.org>; Wed, 22 Dec 2021 11:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3awOsCST4+g47rPEVgo88KObMz2B+P12tyLx+M4nIJM=;
        b=V7qQdoEiwOg7U+n90SrXJJMGkfUeehJX46wJFmGZFezHE5O6gFWU5XWU9LDCEHGNm0
         bJK0EHxWrXvZzHebzpj5B2XLVFfsu9TYZ4iC9ehsOV8obQv1gfKWicEm130lihweY3x9
         ERJxrddLX556li/0rj8Hy3wCE+L5VndGohzveDogo+49umjeS71PGLX1JyOm57fcUbok
         hsKa6sAD/dP65w1UUcc5p5jSd8AUek0HC+TbhAtcVSIgEr/jxawcKVlpgtWzG1if5P4F
         pTd4hRkf6jbmRIk6BrUHoed1pTafM6pslhX5/mqlM5SwI82mNRFOme3u2eGg+7biOVP6
         qLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3awOsCST4+g47rPEVgo88KObMz2B+P12tyLx+M4nIJM=;
        b=uFZCeV4MS5bZW4ACsLjhacYv9cNjQYfF2EWbcGeToDwgAbo4kksMgI/aaOeQO+Jaa/
         ICrfRK6CWuyrkDIaV2f3105pT2w1OjwlffOJ3rBIvt3X+QTdoiF8mJUu7V99ok6jKGQw
         A0gCkHhlYjeZpsRrgsKmHch2z+5Es1phF9ZrLz24e0xUEV4fznLSRIe1HxSMsN/gotOW
         ClwQAk9ouKsfzN//d6EZn5pE7+DxUtpDUUc2JR/ArTnNm7/C2eFqnJR+w++O+3GtlHbX
         Cuz1RKSxVL7YyH/pdmbRAHNnvhPbM3HsXO2+ELqavi6G6aP05Se7apA6KBbCjVXmjtrK
         zyDw==
X-Gm-Message-State: AOAM530ZNMETwZUcvr19R2N7Hl9PtkUk3/OIu0lystud4vo95r9v0b1i
        URJA6px0H5SZsl1GQ+zYN6qJSA43DqQ=
X-Google-Smtp-Source: ABdhPJwF3ePMNH0QyyX1UYVYI4fQ/y/2tzqRqbqWVAbbMbXbQbnwooJ+2zCooeqHQapN/vkG/0cF3w==
X-Received: by 2002:a2e:9e85:: with SMTP id f5mr3057730ljk.90.1640201404214;
        Wed, 22 Dec 2021 11:30:04 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru. [46.138.43.24])
        by smtp.googlemail.com with ESMTPSA id v22sm265407ljh.129.2021.12.22.11.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 11:30:03 -0800 (PST)
Subject: Re: [PATCH 2/2] ARM: tegra: Move panels to AUX bus
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thomas Graichen <thomas.graichen@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <20211220104855.428290-3-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <47a01cd9-c3ee-912b-fa9d-73449990a7d9@gmail.com>
Date:   Wed, 22 Dec 2021 22:30:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220104855.428290-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.12.2021 13:48, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Move the eDP panel on Venice 2 and Nyan boards into the corresponding
> AUX bus device tree node. This allows us to avoid a nasty circular
> dependency that would otherwise be created between the DPAUX and panel
> nodes via the DDC/I2C phandle.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
>  3 files changed, 25 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
> index 1d2aac2cb6d0..fdc1d64dfff9 100644
> --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
> @@ -13,12 +13,15 @@ / {
>  		     "google,nyan-big-rev1", "google,nyan-big-rev0",
>  		     "google,nyan-big", "google,nyan", "nvidia,tegra124";
>  
> -	panel: panel {
> -		compatible = "auo,b133xtn01";
> -
> -		power-supply = <&vdd_3v3_panel>;
> -		backlight = <&backlight>;
> -		ddc-i2c-bus = <&dpaux>;
> +	host1x@50000000 {
> +		dpaux@545c0000 {
> +			aux-bus {
> +				panel: panel {
> +					compatible = "auo,b133xtn01";
> +					backlight = <&backlight>;
> +				};
> +			};
> +		};
>  	};
>  
>  	mmc@700b0400 { /* SD Card on this bus */
> diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze.dts b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
> index 677babde6460..abdf4456826f 100644
> --- a/arch/arm/boot/dts/tegra124-nyan-blaze.dts
> +++ b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
> @@ -15,12 +15,15 @@ / {
>  		     "google,nyan-blaze-rev0", "google,nyan-blaze",
>  		     "google,nyan", "nvidia,tegra124";
>  
> -	panel: panel {
> -		compatible = "samsung,ltn140at29-301";
> -
> -		power-supply = <&vdd_3v3_panel>;
> -		backlight = <&backlight>;
> -		ddc-i2c-bus = <&dpaux>;
> +	host1x@50000000 {
> +		dpaux@545c0000 {
> +			aux-bus {
> +				panel: panel {
> +					compatible = "samsung,ltn140at29-301";
> +					backlight = <&backlight>;
> +				};
> +			};
> +		};
>  	};
>  
>  	sound {
> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
> index 232c90604df9..6a9592ceb5f2 100644
> --- a/arch/arm/boot/dts/tegra124-venice2.dts
> +++ b/arch/arm/boot/dts/tegra124-venice2.dts
> @@ -48,6 +48,13 @@ sor@54540000 {
>  		dpaux@545c0000 {
>  			vdd-supply = <&vdd_3v3_panel>;
>  			status = "okay";
> +
> +			aux-bus {
> +				panel: panel {
> +					compatible = "lg,lp129qe";
> +					backlight = <&backlight>;
> +				};
> +			};
>  		};
>  	};
>  
> @@ -1080,13 +1087,6 @@ power {
>  		};
>  	};
>  
> -	panel: panel {
> -		compatible = "lg,lp129qe";
> -		power-supply = <&vdd_3v3_panel>;
> -		backlight = <&backlight>;
> -		ddc-i2c-bus = <&dpaux>;
> -	};
> -
>  	vdd_mux: regulator-mux {
>  		compatible = "regulator-fixed";
>  		regulator-name = "+VDD_MUX";
> 

You should add stable tag for 5.15 and also add separate patch to update
the new arch/arm/boot/dts/tegra124-nyan-big-fhd.dts which we have in
-next now.
