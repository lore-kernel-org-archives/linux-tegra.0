Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150F3C433E6
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 08:02:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D573F64F1A
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 08:02:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234896AbhCDICG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 4 Mar 2021 03:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235130AbhCDIB4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Mar 2021 03:01:56 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D356AC061756
        for <linux-tegra@vger.kernel.org>; Thu,  4 Mar 2021 00:01:15 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id u125so8649093wmg.4
        for <linux-tegra@vger.kernel.org>; Thu, 04 Mar 2021 00:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aOAxJBlKBYcN64lRAiG4sf6vUj/R/Ju5OzGJfr7r2WM=;
        b=gaQZC+ID7+pejJoHhflPtHEPNavxraFBogdPdNYeti1ZPmzj6NntxgPy7vsCDYP74D
         KTNvgEdjw3VgLlm4KNcvVT/WmfBUJa2o/f3jaRTrxyEAtKsvMVOKM8qEln+CQcOoEZNY
         Efq+5rwnKGazx0Q0aO/rNJWix7llJzyw6ZrLTatWbh3XUCk4h81xRcowcwqfPuNL0Bdc
         b3A8lWe52D5AiWkM5vP8R74sg7rY54rd1k2SwbDJiI+r4yn54jt0WsSJMDRT07tmkzn/
         N2YAUYcPbZ7I1BjOJfjmRM+SCX48iAfrUHszJUrRoV4hEIwoxgRG+niSWDOGmezhnR4E
         MhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aOAxJBlKBYcN64lRAiG4sf6vUj/R/Ju5OzGJfr7r2WM=;
        b=nBqt8onPhU656vhnCrtHbI6j3VW6KgJ11cPBMYDOIBJ9MAy7h5y4MOaTrC6RL5hdAR
         9xzNGVaiEE5PhseU6fXOzJkSD3OQjXx7cbOo2gsvpEBuVJ5k7ZwoDcqb/Ru6kF2BJhTL
         3eK3EkRPmi3pNinrOiOGhF9rduGwUkWUuT9ybtGVr6mHDkHH+ZN3TiVOGq+uwBl6oN0j
         sQ6S1qPu4PRB+Ko8pUKQcLHV5z4lmnCOdO2I90vA2KlPOFfbZl+X1wS3RIdZb0LpVLch
         Hbh0GGOKOb3Digy2ANCC9Dwj3YYfl6EZdfe22yjMrMTxr3oDr8v/Kt1LaME5VJEvorgV
         rfsg==
X-Gm-Message-State: AOAM533bcQ3Y2Vh+sNv0JBUhnGo67cfK8dsmd4RnaGgMcFxDef6frcsx
        FjTlIByuu4ZXTpqcurSQSSxKQw==
X-Google-Smtp-Source: ABdhPJysNoDApSfkuB/eTC6zhtgU/zqA1iZ645P7qrkMZeZIEC2JPk7gNbQY0PYThf/UfjSryY7Z2A==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr2582042wmh.166.1614844874345;
        Thu, 04 Mar 2021 00:01:14 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-144-192.adsl.proxad.net. [82.252.144.192])
        by smtp.googlemail.com with ESMTPSA id n6sm15567967wrt.1.2021.03.04.00.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 00:01:13 -0800 (PST)
Subject: Re: [PATCH v1 1/5] MAINTAINERS: Add Tegra CPUIDLE driver section
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org
Cc:     ksitaraman@nvidia.com, sanjayc@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <1614838092-30398-1-git-send-email-skomatineni@nvidia.com>
 <1614838092-30398-2-git-send-email-skomatineni@nvidia.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <f73021ed-77c4-8349-d079-e9038b4dd00b@linaro.org>
Date:   Thu, 4 Mar 2021 09:01:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1614838092-30398-2-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 04/03/2021 07:08, Sowjanya Komatineni wrote:
> Add Tegra CPUIDLE driver section with maintainers and mailing list
> entries.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cac8429..277fcfd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4679,6 +4679,18 @@ S:	Supported
>  F:	drivers/cpuidle/cpuidle-psci.h
>  F:	drivers/cpuidle/cpuidle-psci-domain.c
>  
> +CPUIDLE DRIVER - TEGRA194
> +M:	Thierry Reding <thierry.reding@gmail.com>
> +M:	Jonathan Hunter <jonathanh@nvidia.com>
> +M:	Krishna Sitaraman <ksitaraman@nvidia.com>
> +M:	Sanjay Chandrashekara <sanjayc@nvidia.com>
> +M:	Sowjanya Komatineni <skomatineni@nvidia.com>

It does not make sense to have so many maintainers for a single file.


> +L:	linux-pm@vger.kernel.org
> +L:	linux-tegra@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml
> +F:	drivers/cpuidle/cpuidle-tegra194.c
> +
>  CRAMFS FILESYSTEM
>  M:	Nicolas Pitre <nico@fluxnic.net>
>  S:	Maintained
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
