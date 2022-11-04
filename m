Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAC5C433FE
	for <linux-tegra@archiver.kernel.org>; Fri,  4 Nov 2022 13:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbiKDNV7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 4 Nov 2022 09:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232006AbiKDNVz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Nov 2022 09:21:55 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8345B2E6BA
        for <linux-tegra@vger.kernel.org>; Fri,  4 Nov 2022 06:21:42 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id l2so2965062qtq.11
        for <linux-tegra@vger.kernel.org>; Fri, 04 Nov 2022 06:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h42/rVytjbAzsH5GaNhUCQVv5VdM/3dFft3AqwgUXvM=;
        b=Ve+3PmnS7vM9/9xMYjv+Z/0rUbpBmazWmYszIUsz8cLGBQ8Etzs8REN/WjAqkfe9lz
         2nHSAPIieY/AKNgG2YhPKcrYM97Twzs0NvCjPizR078tDYxq0mg2S6Zy13oN8yltSUFg
         053ePzMfbbiQJQuun/fiuvwzWgzfBwfRPSE5lUNbqpJBNv1I3T2EBKDwqNzR6WoJfm6Q
         zfrBjvqtXDwMjifvCFBDZ9T7D1RKVIbLfzG1JtyXg8H/9WQ0VMr8nei3qJwHce4GSRV1
         qBngt6JKCp/+9SCGSLIBSr0i838BJEpi2bhN6ufxP3BzlYVPedwTc2N4QABiFDASjGIy
         uW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h42/rVytjbAzsH5GaNhUCQVv5VdM/3dFft3AqwgUXvM=;
        b=GzWA85RAahl15XGO/GB+q8tvw1CFYbo6OxVq6rYkEGfngRsL5XjXcn6BTUd07xRYkG
         p9S7nyMAF4luFS6I6RkWiNGHFG/m1Z70AV9Wz8gS16guxtbYr3U5R22erb2ALfCS8vtD
         bKr8mYDpF00uDTSBizl/c7yU/uev4bQye3vq45PYt0QSv75iUVEOxrJaDJFNrko+Ov+Y
         7Nmpx68eXoxrosJhX+kxqbHawHlSuu4kwVMA7CCO+RxtJHS8ZVLGZGQypbBNkUEnIhdw
         p/A/FfSbCWklwIoQb0/ZW9WO1Rz/EWio6ZianMAZ2d6wP4hqGlU3z+NjYNDHSEnd1CUA
         xZng==
X-Gm-Message-State: ACrzQf0sEL8kecAzFqiHGrczg1TRPWTvkzzk2sv/vSXkNQkwaoFL+EHr
        OCeMCUyUkhs/q5eVuqnF/z8iMg==
X-Google-Smtp-Source: AMsMyM4pNcFPGfaTR2IULiikglhVymrq5oZYCYs7jMW6MxGzhBI/uU2sfMFqNU/cGq1em7EKWF2Y/Q==
X-Received: by 2002:ac8:1085:0:b0:3a5:3f34:84a2 with SMTP id a5-20020ac81085000000b003a53f3484a2mr14935315qtj.305.1667568101698;
        Fri, 04 Nov 2022 06:21:41 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id a70-20020ae9e849000000b006ce40fbb8f6sm2890333qkg.21.2022.11.04.06.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 06:21:41 -0700 (PDT)
Message-ID: <812fcc48-4023-4812-4b38-ea500ae956ae@linaro.org>
Date:   Fri, 4 Nov 2022 09:21:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] arm64: tegra: Remove clock-names from PWM nodes
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221104114349.1540323-1-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104114349.1540323-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 04/11/2022 07:43, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Tegra PWFM controllers use a single clock, so there's no need for a
> clock-names property.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

