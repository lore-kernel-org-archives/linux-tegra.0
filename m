Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E9CC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 19:24:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbhLIT2D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 14:28:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbhLIT2D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 14:28:03 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A33C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 11:24:29 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 207so10496137ljf.10
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 11:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BZ2tGT9M8cB0HCGJHG+03QiiOm2x7MaAkyJy5gMxvXM=;
        b=co6up5KccrX2uFd8G62ItqN9gVhESx/mBgDUlvOLua8tESp5se4yoW6SZh5VgvsANS
         04ECY4rMEo6cOUDnviXUvvUi0Og3laPB/3z8D/wTtDfzwHuirIMnvSi4TYevp5SHJd2X
         pr56p/7b7coeGJDzfGsHRZvHlqsBLbsVOek97eX/PFaEb3VOUfhfnh1Sfyc5xPh4yXYh
         57VdGsR4c4mAfE6FN0Rb6E9BBzM1toiJRhwOerBK4LvOJlunb6UBJc+qYPM4TJua4B5i
         fgGTdiugOZyLJCjfHYNfrka9P5AMLp6784CwFNYOiAJ9A97it+DJVECdUR2IXgNoG/dy
         YGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BZ2tGT9M8cB0HCGJHG+03QiiOm2x7MaAkyJy5gMxvXM=;
        b=VkUDYp1qcAlC3bi4rOIoSoJ402rQmT7Zk5xiXT18TCeo8H4AxxJor/ehZtk35jyzmf
         OIVGegaGc/rC0t7Ei2Xwa+ZpKcA69Ut1vevNIZmA6LDbbLt26OoPhSiWbGJdG3BipsiM
         50MHXcLx/uCV2RLA673v1E6DSpdQs25eVCg9sBazPuNO2EOCxGk5yCZqWG7MxO/mVnxZ
         oDhmwUiyH96aOMLdUqvw9j1HhI8tluJ/85vIw6rVkwbv8IEWa8hfoXcvopvqGHwtcsI5
         nK+7ei5pLfknAFGHHmn884kFZR9ReVUVlvXyIuDxRY+zpmjauUeqAXxksl/YfF7WpFbD
         0/WA==
X-Gm-Message-State: AOAM532N8ZeiIwyNRE4WHCj6INx9zF7klUeDYKfBeI5OJ7UR46gRV2p+
        0u2EqRyD5Z9n7DYKUFuKqDRxSHXOM9U=
X-Google-Smtp-Source: ABdhPJzCrf5+91qowdKzAP1W92ZTOoAvr3pbHmFG7xRf2gLb2JyL1zYdi2Dt8eRaMggAqmpH3/zGVA==
X-Received: by 2002:a2e:9787:: with SMTP id y7mr8073123lji.228.1639077867294;
        Thu, 09 Dec 2021 11:24:27 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id x6sm74004lfe.201.2021.12.09.11.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 11:24:26 -0800 (PST)
Subject: Re: [PATCH 23/25] ARM: tegra: Remove stray #reset-cells property
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-24-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9b59ae8b-0c99-c59d-e837-aff49d78cbbc@gmail.com>
Date:   Thu, 9 Dec 2021 22:24:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209173356.618460-24-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.12.2021 20:33, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Ouya board specifies the #reset-cells property for the GPIO
> controller. Since the GPIO controller doesn't provide reset controls
> this is not needed, so they can be dropped.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra30-ouya.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
> index 4259871b76c9..fd64aadc472a 100644
> --- a/arch/arm/boot/dts/tegra30-ouya.dts
> +++ b/arch/arm/boot/dts/tegra30-ouya.dts
> @@ -70,7 +70,6 @@ hdmi@54280000 {
>  
>  	gpio: gpio@6000d000 {
>  		gpio-ranges = <&pinmux 0 0 248>;
> -		#reset-cells = <1>;
>  	};
>  
>  	pinmux@70000868 {
> 

Can we uncomment the gpio-ranges in tegra.dtsi? I reviewed and tested it
almost 3 years ago [1].

[1]
https://lore.kernel.org/linux-tegra/20180726154025.13173-2-stefan@agner.ch/
