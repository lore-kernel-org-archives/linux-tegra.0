Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17FAC4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Sep 2022 11:13:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbiI3LNg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbiI3LNO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Sep 2022 07:13:14 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE4912F3E6
        for <linux-tegra@vger.kernel.org>; Fri, 30 Sep 2022 03:51:10 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id b24so4378098ljk.6
        for <linux-tegra@vger.kernel.org>; Fri, 30 Sep 2022 03:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=vctQn9qSs7FuCLhaQLDTmKpuEEYLPcLRtdcGf2Kulu8=;
        b=xQMgXQDX7Cbw+Y4w41fTe1Sm//2pCxed3mYlyy2Auw+7V2wjHYrk57k3NOl8Zigrui
         H588ZQZIgQ7JsqY6zUN8UU57Gv7MPyVVKzFckFckztxpGlQj/FGHEmKOqV4XtiBvjWJJ
         YdEQ5D+KMVFIppWrOa/aR58H2vFjRax45F236sHk6Ro2ocmjcoviP31915oW/SOIHpFv
         hG0wfWb8mj1XpZ9l+VaDgmBjN5a9l++rdkcNMnzhkM8b9NuRjPpDj5gHtzCmjfj0y+/u
         TSsY3Nc63VlX8tUINUCSRLeKvczWmipfQ3ILELQrgKQVPost0bbK9fzY/036UFdCMQLZ
         /nRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vctQn9qSs7FuCLhaQLDTmKpuEEYLPcLRtdcGf2Kulu8=;
        b=b6M4S0bkbPaFZBpV035ih43biTHFjXEL6GejhjaL/Krd2M0QIvnN6LJS3w3WLj+a4O
         9VyfVOolLi8vXzEK+887JXaUY86XUWhw9myM7fHeOgOohDD697H7x1E60qKFbPXcCfWA
         llSO/Ct7TEZKG1ExxODyn8NAxgnXkqKD+ig5A8F8LbZGv0+RmcCMvolkXs8qP1lGk5co
         eKokauovssoq97b00wT0fYuH+bgSB8W4fc/fnqaH+vBn6vtPWOBKIkLWUbj7MvVXvJrs
         zt/Lmh1J3C86MyHBFE+8iy0geBKNpdJ/1vaSOGcjDGPurFgMNl/C+0ORWBgCPQB+WzTR
         FbJw==
X-Gm-Message-State: ACrzQf2TeEEuh99OmqWQ+TzVDWtzcLsNkf9AojKkPJMWsrRnB5eunww0
        OYRv2Rg0YztQ7ux7NcPfIaNGaQ==
X-Google-Smtp-Source: AMsMyM7U0+RvpMpI946u7FIRiKfT/TPyCq1p54TSPJaH8GXCjHw/ftEk6RPODWpLAOZjysiQrhWClA==
X-Received: by 2002:a05:651c:19a6:b0:26c:4a66:aa42 with SMTP id bx38-20020a05651c19a600b0026c4a66aa42mr2970064ljb.231.1664535068835;
        Fri, 30 Sep 2022 03:51:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b004948497e07esm265561lfb.15.2022.09.30.03.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 03:51:08 -0700 (PDT)
Message-ID: <23bc38b8-ed67-d243-9739-f07b7411be3a@linaro.org>
Date:   Fri, 30 Sep 2022 12:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 4/4] arm64: dts: smaug: Add display panel node
Content-Language: en-US
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
        arnd@arndb.de, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29/09/2022 19:05, Diogo Ivo wrote:
> The Google Pixel C has a JDI LPM102A188A display panel. Add a
> DT node for it. Tested on Pixel C.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> index 20d092812984..271ef70747f1 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -31,6 +31,39 @@ memory {
>  	};
>  
>  	host1x@50000000 {
> +		dc@54200000 {
> +			status = "okay";

You should override by labels, not by full path.

> +		};
> +
> +		dsia: dsi@54300000 {
> +			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
> +			nvidia,boot-on;
> +			status = "okay";
> +
> +			link2: panel@0 {
> +				compatible = "jdi,lpm102a188a";
> +				reg = <0>;
> +			};
> +		};
> +
> +		dsib: dsi@54400000 {
> +			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
> +			nvidia,ganged-mode = <&dsia>;
> +			nvidia,boot-on;
> +			status = "okay";
> +
> +			link1: panel@0 {
> +				compatible = "jdi,lpm102a188a";
> +				reg = <0>;
> +				power-supply = <&pplcd_vdd>;
> +				ddi-supply = <&pp1800_lcdio>;
> +				enable-gpios = <&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
> +				link2 = <&link2>;
> +				backlight = <&backlight>;
> +			};
> +		};
> +
>  		dpaux: dpaux@545c0000 {
>  			status = "okay";
>  		};
> @@ -1627,6 +1660,37 @@ nau8825@1a {
>  			status = "okay";
>  		};
>  
> +		backlight: lp8557-backlight@2c {

Node names should be generic: backlight
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "ti,lp8557";
> +			reg = <0x2c>;
> +			power-supply = <&pplcd_vdd>;
> +			enable-supply = <&pp1800_lcdio>;
> +			bl-name = "lp8557-backlight";
> +			dev-ctrl = /bits/ 8 <0x01>;
> +			init-brt = /bits/ 8 <0x80>;
> +
> +			/* Full scale current, 20mA */
> +			rom_11h {

No underscores in node names, unless something requires it?

> +				rom-addr = /bits/ 8 <0x11>;
> +				rom-val = /bits/ 8 <0x05>;
> +			};

Best regards,
Krzysztof

