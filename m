Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD2AC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Nov 2021 11:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236609AbhKYLvA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Nov 2021 06:51:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237410AbhKYLtA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Nov 2021 06:49:00 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D5EC0613A5;
        Thu, 25 Nov 2021 03:43:31 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id t26so15592912lfk.9;
        Thu, 25 Nov 2021 03:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bDXVYx5X81obSGfTLlaLT+GQEL0WeJIjOW6vbyLiEIY=;
        b=Ds59G03w1Vnbc4r3C/ctDco8l7MllxzeTm8/WKHZSxDwIzMP5jW1DiqINzqP3vD494
         +FkfeLnUOZqaEVrvi3hEDDSWw5X9AnACaklqj+SAAGPaD655qnmtAI3Xq51MgC6Let37
         oQ2w48Rdc8hakZcrTRmulpW7v7gHPl5KytSsU/AMiZi1m9I0bEuGuSam9qKjmQ8YWCAK
         vnuzkguNtGnHektjNtmblraZoMwFkA9Ep1uCl1SYYpoxJaMwBTNQlt54HENkmBSFvN28
         Hz6TiGOSfE1AYILSBQhQ4WICaXMmdNeALgAFZBx+gWTGdgkMrhqbhBebDiiGYDx3Y14J
         G1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bDXVYx5X81obSGfTLlaLT+GQEL0WeJIjOW6vbyLiEIY=;
        b=TZPXaIemDySyT1VPVOaxW+qanY9Hr0600WHWMO+5EJJsEKyijgH8ffCESRs8ytHLAQ
         Jjg6NP1leYH5VZ+yQ/kqaffvfUJbcwh5I5HDugfRs6KENRRnZmcNMz6BSvT5IINYDBn3
         YJSdErHwBNJ3tQ7IbHgbsEUDZEqd2wJtYYRPDeAWbUPjm4sArgE1nYwlUHtqUXnboJb9
         d+tzFBDFJre4/nWuGTATm1aHMfJNOB2cmXT0G1QQirMv/L0TtbIy11cJl7yp/z2ze9uQ
         2pbfz6wKdRfaR4jJOfOfkl28r+PO7xMLQY448jgox5UR6xIgxNU36nUehIhFZ+T9dD4U
         OxLA==
X-Gm-Message-State: AOAM531awP18LoqHYmqJNzzZ4fPugEjo9WGHo/mCY0wXyCZsLyUtqmEr
        PuOaBwsy7phzJXhHEZWdMKW3ClkJPEw=
X-Google-Smtp-Source: ABdhPJyG2BdjoNmTWcafcsMypZIAKd/rFtxtTYdkkGEr8bnVW9y8tdzQ7/Un1LStjvFQVYlQwjMe5g==
X-Received: by 2002:a05:6512:2246:: with SMTP id i6mr24042132lfu.24.1637840609979;
        Thu, 25 Nov 2021 03:43:29 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id v2sm216571ljg.46.2021.11.25.03.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 03:43:29 -0800 (PST)
Subject: Re: [PATCH v1 17/20] ARM: tegra: Add S/PDIF node to Tegra20
 device-tree
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-18-digetx@gmail.com>
Message-ID: <98072c48-31ca-aec1-b3a5-3d75d6892e9a@gmail.com>
Date:   Thu, 25 Nov 2021 14:43:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211124220057.15763-18-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.11.2021 01:00, Dmitry Osipenko пишет:
> Add S/PDIF node to Tegra20 device-tree. It's needed for enabling HDMI
> audio support.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index 63c2c2f8c0ce..799da7dc929b 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -197,6 +197,7 @@ hdmi@54280000 {
>  			reset-names = "hdmi";
>  			power-domains = <&pd_core>;
>  			operating-points-v2 = <&hdmi_dvfs_opp_table>;
> +			#sound-dai-cells = <0>;
>  			status = "disabled";
>  		};
>  
> @@ -396,6 +397,23 @@ tegra_ac97: ac97@70002000 {
>  		status = "disabled";
>  	};
>  
> +	tegra_spdif: spdif@70002400 {
> +		compatible = "nvidia,tegra20-spdif";
> +		reg = <0x70002400 0x200>;
> +		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>,
> +			 <&tegra_car TEGRA20_CLK_SPDIF_IN>;
> +		clock-names = "spdif_out", "spdif_in";
> +		resets = <&tegra_car 10>;
> +		dmas = <&apbdma 3>, <&apbdma 3>;
> +		dma-names = "rx", "tx";
> +		#sound-dai-cells = <0>;
> +		status = "disabled";
> +
> +		assigned-clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>;
> +		assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_A_OUT0>;
> +	};
> +
>  	tegra_i2s1: i2s@70002800 {
>  		compatible = "nvidia,tegra20-i2s";
>  		reg = <0x70002800 0x200>;
> 

@Thierry, this patch is made on top of [1].

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=271954
