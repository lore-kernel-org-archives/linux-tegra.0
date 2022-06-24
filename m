Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54EAC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jun 2022 16:03:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbiFXQDF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jun 2022 12:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbiFXQDE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jun 2022 12:03:04 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C2112601
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jun 2022 09:03:02 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id s1so3704136wra.9
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jun 2022 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=k7sNPIkshs8hu2yu7mroWNudPOiCNYBjcO8jSGHCo44=;
        b=DNUUK/3WHa6QP/Cm7MAnmTVZ9qedZ5CiIIG2zJCd3nWHrKBpI5U/Qt5OtaKz/kbBiI
         JtXveDt9t+IJkedvTUikme8xg6m+Fz1CUyQt/zRBwChEhYDx2574hYfXFqi3xKs8lytM
         1G+KbLelub0IFjdD0UlZJuwP5bbYk2wIrOWg3W9movbKQcBTdD9PxIUC3FqA/aZiPR6p
         m4dTMYIvoODFg/g5HkLYYo/H2E/AymFryX165AjjjF9soNX0wirEkBeeca/DMMK1/uKV
         EJsk/V1N8syAYtgRNqExpvonbtx/dQi1lpYe6Nw4y5pZDvoz9ETSijnNwK94Fi/84rnS
         xRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k7sNPIkshs8hu2yu7mroWNudPOiCNYBjcO8jSGHCo44=;
        b=QNPG3EhR1tdnt58fY0jruKsGk19i6SH5FSDBCpKpqI2NOeKH/Fw94HkXLOrdV0Is9e
         0wWfjqaUbJ/sokGSJtljDE13G9fRr0P22UaXy8e6ESMbZdMNq/SX4hV+kpq2vtTx/vlq
         PUPvE9kAvINq3n11xBbUMxZpWFHnwDgWyeUpRV0JIfQm1G1ZgMTxW3CEG5UrNapSF6Zi
         a3Vn9kw2MaHJ0v2jlIPLHLweRgkRBKRf2wN8D8mG3GB3KD2OpLKARkoqldM+qque+hmd
         RnNsefbh3UPUG5SweBqw85fayFw0aCBuLUPROmBI76mYU5HTwITKzAzV2SqLsnNqTtex
         aqfA==
X-Gm-Message-State: AJIora9Y3y8VlI//cuSoDAJ3eyL6MPWcl6GTVQ4Xapa1Ky3TTUa+h2de
        KJLmkuem6hsBZ4AIfhvbsr+yLA==
X-Google-Smtp-Source: AGRyM1v6EKlCPfruQY4kqyHY1qTXjCySikHyVgSzAUwJnyTXGiIHyXrrozgV15uMdm3odkLAH9j5EA==
X-Received: by 2002:a5d:59a5:0:b0:218:3ffb:e6ea with SMTP id p5-20020a5d59a5000000b002183ffbe6eamr14332757wrr.715.1656086580838;
        Fri, 24 Jun 2022 09:03:00 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600001c700b002167efdd549sm2665316wrx.38.2022.06.24.09.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 09:03:00 -0700 (PDT)
Message-ID: <53e8aa2f-f5f6-43d9-c167-ec5c5818dfb0@linaro.org>
Date:   Fri, 24 Jun 2022 18:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH net-next v1 2/9] dt-bindings: Add Tegra234 MGBE clocks and
 resets
Content-Language: en-US
To:     Bhadram Varka <vbhadram@nvidia.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, kuba@kernel.org,
        catalin.marinas@arm.com, will@kernel.org,
        Thierry Reding <treding@nvidia.com>
References: <20220623074615.56418-1-vbhadram@nvidia.com>
 <20220623074615.56418-2-vbhadram@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623074615.56418-2-vbhadram@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 23/06/2022 09:46, Bhadram Varka wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the clocks and resets used by the MGBE Ethernet hardware found on
> Tegra234 SoCs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra234-clock.h | 101 +++++++++++++++++++++
>  include/dt-bindings/reset/tegra234-reset.h |   8 ++
>  2 files changed, 109 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
> index bd4c3086a2da..bab85d9ba8cd 100644
> --- a/include/dt-bindings/clock/tegra234-clock.h
> +++ b/include/dt-bindings/clock/tegra234-clock.h
> @@ -164,10 +164,111 @@
>  #define TEGRA234_CLK_PEX1_C5_CORE		225U
>  /** @brief PLL controlled by CLK_RST_CONTROLLER_PLLC4_BASE */
>  #define TEGRA234_CLK_PLLC4			237U
> +/** @brief RX clock recovered from MGBE0 lane input */

The IDs should be abstract integer incremented by one, without any
holes. I guess the issue was here before, so it's fine but I'll start
complaining at some point :)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
