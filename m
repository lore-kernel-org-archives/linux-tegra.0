Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93DAC433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 15:25:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B386C61581
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 15:25:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236631AbhCXPZA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Mar 2021 11:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236643AbhCXPYe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Mar 2021 11:24:34 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B0AC061763;
        Wed, 24 Mar 2021 08:24:33 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id s17so30709333ljc.5;
        Wed, 24 Mar 2021 08:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WabpO9Jg+oYK8+rZmwUQlO8LiyhHGR6h2+8UibET5H8=;
        b=seZYZo2xYh6/QCouIHeuUEvwkrSF+uKZaCUDtKw8qvka2eFhR2n6rIANlEwcmC/eOJ
         B0jXE3PZ+2xNDy8kWrprJngg8a7MeX6HsDNCjP73pKw2JZAMvgGuA+j8WugMiy8QZNmi
         sgWdeJ6XhcMx68ItJIguD7vJ2/POS1xMfTupNutSELYYGLLZ4+/y5bWBTqip6FFt1CdK
         qDRL+/hN20Q59AX4dfsLwLaCJY27GQ9mm9VilnvUPSWYeiOsmOgXtOK15dg2O9fHsZ25
         ei1mfTKX6sXmhswYFDS0GFYCjNcqOoYKNb3N+zztt44X4YT99uxpKq10SF8hyw/KffaD
         mXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WabpO9Jg+oYK8+rZmwUQlO8LiyhHGR6h2+8UibET5H8=;
        b=q54u9gjwz3P+hSIRiSxiNbFVR4aJv3isUgLfWu4U6fWvKZIxcMENHo0kFX+CEGuGVP
         3RVkKV07Zeq99meYNfMBsM0P/JktlPXk6RyxLJxugyz74sCxefTmoetpD1Fa/a3vBKh6
         6OgCl9+l1JQ8OmSxu51UM+Rqnx5OzQc6j45k9vhCIkyoDBIfWXl6oVPAlUrrOrTsXiEd
         3CDhPeMF7bLyYZgzmom71gpfJOJqW3yPDiRUUEJnLZ2g4COsYdX6bYYm8d9NQG2wS7kx
         55Vf1xojBqv6QET5mc/3JjeskeTHO13ASDvuF0X5tXtY3NneErWKnDHzRTJQCg6Ys0Jo
         JYPA==
X-Gm-Message-State: AOAM532y253kIjGW2MfLhyHfKmq1Zi0/0WV/3IE+9aRdkUjvchqLHMpr
        pdvZsEiCMN2KxUIqREbDCKkXoxBRwQE=
X-Google-Smtp-Source: ABdhPJw1i+fkeXHRMsvwoEM81I6tbhhY3vUJAhZFC1jeb5ToJ4ldWHIUpjzljlX0WqxBH4KDdV31nQ==
X-Received: by 2002:a2e:9755:: with SMTP id f21mr2419817ljj.319.1616599471815;
        Wed, 24 Mar 2021 08:24:31 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id n5sm259268lfh.173.2021.03.24.08.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 08:24:31 -0700 (PDT)
Subject: Re: [PATCH v3 09/14] ARM: tegra: acer-a500: Rename avdd to vdda of
 touchscreen node
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210302121003.15058-1-digetx@gmail.com>
 <20210302121003.15058-10-digetx@gmail.com> <YFtWuoV4/Kiilbzb@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <479ad8da-2b70-786a-e08e-708c5ee26718@gmail.com>
Date:   Wed, 24 Mar 2021 18:24:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFtWuoV4/Kiilbzb@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

24.03.2021 18:11, Thierry Reding пишет:
> On Tue, Mar 02, 2021 at 03:09:58PM +0300, Dmitry Osipenko wrote:
>> Rename avdd supply to vdda of the touchscreen node. The old supply name
>> was incorrect.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This one didn't apply cleanly, but applying it manually was fine...

Great, thank you. This is the correct fix for this trouble.

>> diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
>> index 8a98e4a9d994..d852527db707 100644
>> --- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
>> +++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
>> @@ -449,7 +449,7 @@ touchscreen@4c {
>>  
>>  			reset-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
>>  
>> -			avdd-supply = <&vdd_3v3_sys>;
>> +			vdda-supply = <&vdd_3v3_sys>;
>>  			vdd-supply  = <&vdd_3v3_sys>;
>>  
>>  			atmel,wakeup-method = <ATMEL_MXT_WAKEUP_I2C_SCL>;
> 
> Looks like this line is not upstream. Did I miss a patch somewhere?

Indeed! I kept forgetting to rebase this patch properly, nevertheless
that line already got into -next a day ago [1].

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f0a77ed9080a39a75faecff53fa37b3328926421

This [1] patch should be in yours inbox.
