Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456D7ECAAA1
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 12:46:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbiJ1MqJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 08:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJ1MqI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 08:46:08 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455681CEC07
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 05:46:06 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id l9so3284557qkk.11
        for <linux-tegra@vger.kernel.org>; Fri, 28 Oct 2022 05:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnb39zjpqX2r3HKo80XytYcwFNnYVwYUMcVlIvU9TL8=;
        b=DCmTVCubue9/E2bl72no/Go8p1pbLGGabQA2CdERIcrVy2zjP0CtUsCWHtulhsj4OS
         2SAQ51FwFY8+4hLWhluyaK1KGQHr/E//MT/+YXrtgHyhnKezH3Xt6K6iUt5j7hcD4pu/
         Sm2hC7KOky+QhCheweOegs5ON1n+YVKfD5H2c3pChNUtcU0cG3GF5VlSTJX/V79p3TSW
         hoM2apBPL0KEeTD5xoPxrZ2/lTxQz0WkXpxdohb3kAmqvx4YNEXBULf1KjQRwcavQ8CR
         C95nf1fmsgmdf1WZKakez8EBFxMPEm+4Wxw90WHxKnHD/Jf9hzjkM9qIZUulp4FT47JD
         3D8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnb39zjpqX2r3HKo80XytYcwFNnYVwYUMcVlIvU9TL8=;
        b=n08joazspXZZvifVmtWeyCsEVIyBL3mhowkD8JrlAPF5osjWoPZJsokKJOA5qo+evG
         APR3IlbH9k9cPqspNmJeDDndOKIf5O+qaDrVz39Q0eBhKcnDZstao0EAfj2SKMVdakU9
         Yd3mBMMHaDEWVkoGWSMF045fcDi2w09tonOHW5MC0vGDinMlJwbFvQgfH3ZMmfoboyFK
         Fy3jpb/o+KfjGxipZ2e8zJ7OdFrCnsg0zQN8blPEc3SytBdUYvqdtP2HYA5+EExuUWsC
         TArp2Bw818qmnt4dSNVvku4P/aWW6dWP0VC21SIn+WFCYb1YMkmqnUksvjSulevloK//
         Fw8g==
X-Gm-Message-State: ACrzQf2Pbtu8UxlbwK7dexwDkmmTXbGqO0mGOgnXkDHd6Ys+eCL0q3lX
        ViNIqIu5kP0zYqjsZ2oBxf5XIw==
X-Google-Smtp-Source: AMsMyM6+dApRdgXx//urTLDa+9Ord8Qt9L9zl+7e2jtpRrOecuRe0lNwHP1pUNCP3yXOfnaRcBh2pw==
X-Received: by 2002:a05:620a:2808:b0:6bc:5d4a:a01a with SMTP id f8-20020a05620a280800b006bc5d4aa01amr37525498qkp.371.1666961165442;
        Fri, 28 Oct 2022 05:46:05 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id v6-20020a05622a014600b003999d25e772sm2320701qtw.71.2022.10.28.05.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 05:46:04 -0700 (PDT)
Message-ID: <ce3fdd20-248f-4fdd-fe83-2aa79fd297c5@linaro.org>
Date:   Fri, 28 Oct 2022 08:46:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] memory: tegra: Add DLA clients for Tegra234
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221028123741.134880-1-jonathanh@nvidia.com>
 <20221028123741.134880-2-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028123741.134880-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 28/10/2022 08:37, Jon Hunter wrote:
> Add the memory clients on Tegra234 which are needed for initialising the
> SMMU for the Deep Learning Accelerator (DLA).
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/memory/tegra/tegra234.c | 160 ++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
> 
> diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
> index a9e8fd99730f..9bdaf8af8c97 100644
> --- a/drivers/memory/tegra/tegra234.c
> +++ b/drivers/memory/tegra/tegra234.c
> @@ -170,6 +170,166 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
>  				.security = 0x504,
>  			},
>  		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_DLA0RDA,
> +		.name = "dla0rda",
> +		.sid = TEGRA234_SID_NVDLA0,

This is now not applicable because you sent dependencies separate, mixed
with other subsystems... Split pieces based on subsystems.

Best regards,
Krzysztof

