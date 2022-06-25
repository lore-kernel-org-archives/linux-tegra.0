Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBDBCCA480
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jun 2022 20:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233485AbiFYUSi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 25 Jun 2022 16:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233524AbiFYUSh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 25 Jun 2022 16:18:37 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF8113F7E
        for <linux-tegra@vger.kernel.org>; Sat, 25 Jun 2022 13:18:36 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id ej4so7847441edb.7
        for <linux-tegra@vger.kernel.org>; Sat, 25 Jun 2022 13:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vzewte8MtMWVwJWHnEGSEVk2W35vpxyGLjDSNXmoDZ8=;
        b=hhq6jEDvAOzm1zWMH7z/JMsPL8YRvwUjxT6pXMKfdtDi+xFDCwLaylzHRKcZz9k5i9
         fN9XteIpHlwkIOkMtZ9PuKIgW6FbR7C/wARqoRt0nw6kLRVryGznLOav1I3A31MpX0Kv
         fZv9VdY9EMlIo5iIvru6rC5bujBnEstciEImtvDpuNAVrfFKGUXQ6sWoyg1JztZ/b4dN
         XEiDDE8HmZpMcnlw8yCrv6RJdF93s68yokt5qGPch6VGIQaLcrz4veawt4HrycS0d1Sv
         mop5INBTe7HlaRmftTLPc625baTj6gvQQO6Iog75Z7Yqr09zmm7+/i0ls5oNkt/kOmim
         rI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vzewte8MtMWVwJWHnEGSEVk2W35vpxyGLjDSNXmoDZ8=;
        b=rCBPuqnzj2Zu5ZGhqAQKPn37EEtJpIvb4BLhggHFkliFqobRbEZG/d9V1n3uyRHzck
         epr3hBclbLbaZDRAreV+FfVH492xWy8Qr2/U8i+ggOkKW1i9XzTNunHqEjGPjEuPAAzb
         4piDeWNaL50I2yWAQR1CnXN6C7nq1R1yzoUF9HZKIsjme7uUGFn1vDtrgn/ik1ZHaV1m
         TQsVABojZHU4u3H4K0Eyhpo1EJGEnXSIgBo344s4kkTFVQD1SqQLg8JqNrx1HLFyFwRM
         58VvU/LYY8yFB95/jDT0BaMdjN3L4fJhtzYCtVJrUUxbrrnqbgzAJs385nguwQ6dPXnI
         ADcQ==
X-Gm-Message-State: AJIora+GN0DOSA69wbAtUHeRGpZ6N8IVNJfbJngv7bRoMo7r7NB4BtED
        vYJrx6M4ltVvxBx+EKzmseChyA==
X-Google-Smtp-Source: AGRyM1s3rVR9cr96dysg7bldvesEoN5+h0nXdLSHlyd9fQnHdIwlEKHbfFROnfIHwVIWoPcOeqiQ4w==
X-Received: by 2002:a05:6402:2422:b0:435:6707:7f1f with SMTP id t34-20020a056402242200b0043567077f1fmr7184415eda.38.1656188315414;
        Sat, 25 Jun 2022 13:18:35 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709062cd300b006ff802baf5dsm2986752ejr.54.2022.06.25.13.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 13:18:35 -0700 (PDT)
Message-ID: <a37a344f-88f6-19b2-96ae-df46bc901b9b@linaro.org>
Date:   Sat, 25 Jun 2022 22:18:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH net-next v1 4/9] memory: tegra: Add MGBE memory clients
 for Tegra234
Content-Language: en-US
To:     Bhadram Varka <vbhadram@nvidia.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, kuba@kernel.org,
        catalin.marinas@arm.com, will@kernel.org,
        Thierry Reding <treding@nvidia.com>
References: <20220623074615.56418-1-vbhadram@nvidia.com>
 <20220623074615.56418-4-vbhadram@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623074615.56418-4-vbhadram@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 23/06/2022 09:46, Bhadram Varka wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra234 has multiple network interfaces with each their own memory
> clients and stream IDs to allow for proper isolation.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>
> ---
>  drivers/memory/tegra/tegra234.c | 80 +++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Dropped from my tree.

Best regards,
Krzysztof
