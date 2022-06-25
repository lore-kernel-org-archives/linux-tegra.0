Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F27C43334
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jun 2022 20:18:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233489AbiFYUSY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 25 Jun 2022 16:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233430AbiFYUSW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 25 Jun 2022 16:18:22 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8743513F31
        for <linux-tegra@vger.kernel.org>; Sat, 25 Jun 2022 13:18:21 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z19so7809320edb.11
        for <linux-tegra@vger.kernel.org>; Sat, 25 Jun 2022 13:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gyXE165H8su3Mb9u+C47L6hRDPnkCPdn2RUMPpfaTRA=;
        b=Mw3DJRqeQDK4Mt0csdppDgi50vOzVjUHrRN0jJ71rRxeJ6JkL9uI5nUts/unmXlZTl
         uiaagBYapoa+iNKG2j1F8/dUkMk83IZCslsFb9U4xgBJw5UhEgvpjkKnYSgmJFZEkffY
         BEmb6AGh8l4h9DD1H8+X9rFzmVxRWihZkdhhSuoEDwR/VAmBgBkHRyX2fzvCSUsHUEJC
         SKJT5l5H6Am7OE5kdCJZfqCoIC0qpW2MY1LdQ5ByeMAJw7Dit0Pll7iytdX0sNvIbWTh
         GES0zTuLla8yRDluBXyUQyUIesSz5xEv4TpYKuUIrI53OYLyQ93hlLYs9ug6XD/wlM9X
         vO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gyXE165H8su3Mb9u+C47L6hRDPnkCPdn2RUMPpfaTRA=;
        b=7uCpnunxunsRsldhd8zCzlpWg1FhZ/dIYdd08rKxa1af7xOx5++Z9SpMwSCzcuMu/G
         dIICRBaxcC53D6rykXVM7iBjqt7SqwgM3sLwxiHr40L4H1BNfUaQi3vIQsBTKexvagIQ
         K/FhBkxFuY81RstOIBGDLb50KpVp/8T98jxs2CFiVRJzAwByVxDIQKQYf2FOr+Pf/TIO
         cfO1uDYBj4WoTxVt/8sY9jVutGNdv7WcYMKU47I4JEfoR71gbECQY2tecXTMApLadRTc
         HPxf4wtqebhEmB2m7jHh5Z9MAsql5DgcZ9q81rltgPzgJ3QjSdgiOG9bws0LCeX+AGZs
         SYew==
X-Gm-Message-State: AJIora8+YXW7Iw40xWQz/NP+aDhdAhsYwFLmi3AdbRa4FkSUtlCrTr7r
        ut9hC3Yf7gX3UPXOIe0d+qlP2g==
X-Google-Smtp-Source: AGRyM1tEqv+GS3AHgEL5Sw5OB74PdpfD1udvuzXpG41dMyK0U6malxhqkn1B40mgy4sTrE5KmJTs+Q==
X-Received: by 2002:aa7:c14f:0:b0:435:7b75:fd06 with SMTP id r15-20020aa7c14f000000b004357b75fd06mr7050404edp.352.1656188300195;
        Sat, 25 Jun 2022 13:18:20 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h6-20020aa7cdc6000000b00435720b7a1csm4635809edw.20.2022.06.25.13.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 13:18:19 -0700 (PDT)
Message-ID: <8237565f-e9a2-75ef-e9b8-060793fe42ee@linaro.org>
Date:   Sat, 25 Jun 2022 22:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH net-next v1 3/9] dt-bindings: memory: Add Tegra234 MGBE
 memory clients
Content-Language: en-US
To:     Bhadram Varka <vbhadram@nvidia.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, kuba@kernel.org,
        catalin.marinas@arm.com, will@kernel.org,
        Thierry Reding <treding@nvidia.com>
References: <20220623074615.56418-1-vbhadram@nvidia.com>
 <20220623074615.56418-3-vbhadram@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623074615.56418-3-vbhadram@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 23/06/2022 09:46, Bhadram Varka wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the memory client and stream ID definitions for the MGBE hardware
> found on Tegra234 SoCs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Dropped from my tree.

Best regards,
Krzysztof
