Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E15C6FA91
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Sep 2022 16:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiITQA5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Sep 2022 12:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbiITQAt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Sep 2022 12:00:49 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8136240579
        for <linux-tegra@vger.kernel.org>; Tue, 20 Sep 2022 09:00:47 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s10so3559933ljp.5
        for <linux-tegra@vger.kernel.org>; Tue, 20 Sep 2022 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=+ipAueGYq20ud/XafDtc9lpH1wkNgmf60dZIXYXJn7M=;
        b=zo6YEvwbQt03IwL1smspUYWhyyZznPGHE0FrtQkTg42FKGHlwf+cjm3rI5kLvms4BI
         mHFYKVOPRFfu1fSSTAnODSWJD8UCm0khtBaRtYVMbjoIdKIdi8lZ1compQ6h9doiwpmJ
         IWePJ3qc1dKkV0GFFz0gMQ7HlFh9xhY7XD1U+wx7raigu0p7clSAGHQmLADz4qO7TPu9
         Qy/TlALCNQVUjW0Pjvp7XGVrFWRjGDWO/jcFwnRvYnT1d+IJUC8OQORtjf/Ql5H0tdTZ
         lYjIhMgmI7/hUMPfGFWVahyp9Xf4SXzs0w0ciT+R83IEc3Iwk+fEHPrjXlyha9EbaV8X
         /gpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+ipAueGYq20ud/XafDtc9lpH1wkNgmf60dZIXYXJn7M=;
        b=TTNmQwHRWmYCtFYzqrF4pQ3D0R4a3PoGel7uNG0ntYMh2dGuaq9WC9AEsi+0GtpGQ8
         Lq46Tg/3IDq9eeu0A/NjskYZzr7AD/4n8Bsr2V7IwVVy6VYSMnzKfFTR+oVtBbVvkbof
         aOW01Hrwcx3bBbNHWzuas+qPJX3eJr52zwTmxmMMMEXxRWtgUS0JCCCSkAVyPHZiigUQ
         Y2BCqOt98xQEWbyacVHGYIFLgtWHevPCqxJs7L53he/uLEDr7I13P5joQQUc33drEJk3
         iAipU8zwmwwr1OZOg01RnT8wfK6f+tUeKbs24aVNp07oRKy5v9BIqcgLNYAs1TLuu0XI
         IUiA==
X-Gm-Message-State: ACrzQf0PQv90Zqt+flq1KVO2Oha8uNjKEBuQjyZwFY5L1Gyaj2UZ+cV/
        NbP2fh8I5J2KCkwLP58FYLMw3Q==
X-Google-Smtp-Source: AMsMyM5SWWn2dqLZUyBtlV83s4L7GxK5sCbJPht6qd5fTmr+bTRUwrJbINsFVbiagjEn0Lwm5Z02fg==
X-Received: by 2002:a2e:9606:0:b0:26c:442a:40c2 with SMTP id v6-20020a2e9606000000b0026c442a40c2mr5265118ljh.458.1663689645880;
        Tue, 20 Sep 2022 09:00:45 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e8507000000b0026c36023a9asm10840lji.131.2022.09.20.09.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 09:00:45 -0700 (PDT)
Message-ID: <558e9b2e-36cb-f09d-2c39-c98248b185d9@linaro.org>
Date:   Tue, 20 Sep 2022 18:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 2/3] arm64: tegra: Add PWM controllers on Tegra234
Content-Language: en-US
To:     Sandipan Patra <spatra@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bbasu@nvidia.com, kyarlagadda@nvidia.com
References: <20220919141455.31084-1-spatra@nvidia.com>
 <20220919141455.31084-2-spatra@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919141455.31084-2-spatra@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 19/09/2022 16:14, Sandipan Patra wrote:
> Tegra234 has eight single-channel PWM controllers, one of them in the
> AON block.
> 
> Signed-off-by: Sandipan Patra <spatra@nvidia.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
