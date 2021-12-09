Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7E4C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 20:30:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbhLIUeX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 15:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhLIUeW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 15:34:22 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD43DC061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 12:30:48 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 13so10726333ljj.11
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 12:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=COMQGmfHIAJqgSIdN/AE3DUzUc7/jkTw/Mi+cfQzJFk=;
        b=O75OUcrDGMgAcmsH3MGbJ4E/PXq49SWdHHCeKzYbvApj1sNFPeqisr2Sko+ebHNEiC
         0wWS5WxRA5fWIuq7HMVnUWYOlsf8gL6a6eA1sKPd/WijiZBTAdqOjzpZmzMvmbKzGVR8
         i7bAAH8vQwd1dBSiD5M3hYzx8Hw7At9nW5UMr02Z2c19TgfyxxEsGLNrfnGoiZZSiI5f
         NSIODaE9FaCYZiiUGmcyvx1dagEU/7J/l3nT6C8l8TKQkZXdPTHcWrfQAm3poOjmSjMa
         7GiHV4HYZMPoZkHR/EfNjVf3wkzrvaQJrPmy7razA1wHYCXGD/0iWVCoYzDO961Ne9sS
         plvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=COMQGmfHIAJqgSIdN/AE3DUzUc7/jkTw/Mi+cfQzJFk=;
        b=XDVkhdWB+coUF1GG7PY0rrR1LXMst4rzJxgn9esXCUAdOmF7OEY5N0aZGYeicsPCsZ
         VLgSnCg4Mh1HJy6Qb5PGh99jxzJUStnu34Z9Zht+bS9kZNkkJOj6RYFzeMybO5rkzwRn
         k99qWNg3fAO2O8C4YiuyK/Bh4LIZF1jf6NI8mRAkicYdzptZUqU5EtfIzYm1fKo2Z2FU
         zTrc+pBIurx8cMc7bfshFAdrPYp+NaNFYo3N91b0nI7m26qJpURSyqVA7VbPoXQHkYm0
         h0Nu/TzeU8macmz6Qro7QkSv+F1dSHvjqrtVmYwzt8HywImTWrp/VH3gLHw7b63gci+a
         gOUA==
X-Gm-Message-State: AOAM533F7N6LwKmHz6dM/ZxA7oWpusSOAvX0oU7qn2RS1sH729QFe97r
        L2HY3fwaI5ul0B2ZSsFeRICJDgKuXcM=
X-Google-Smtp-Source: ABdhPJyDKfRNV2ucl6KBWl2mI9DVJKDZ9Ek8XTLtqNHAlkCxNGmStJYrg4wNAX43RV1YXcTjTiwSwA==
X-Received: by 2002:a2e:7a06:: with SMTP id v6mr8415303ljc.198.1639081846974;
        Thu, 09 Dec 2021 12:30:46 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id w15sm84680ljo.97.2021.12.09.12.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 12:30:46 -0800 (PST)
Subject: Re: [PATCH 23/25] ARM: tegra: Remove stray #reset-cells property
To:     Thierry Reding <thierry.reding@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-24-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7a8ddff1-a926-07b2-8e9e-d07c28f4e3d3@gmail.com>
Date:   Thu, 9 Dec 2021 23:30:45 +0300
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

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
