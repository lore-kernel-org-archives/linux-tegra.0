Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D29EC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Apr 2022 07:12:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354982AbiD2HPV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Apr 2022 03:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354983AbiD2HPU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Apr 2022 03:15:20 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABA319C1C
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 00:12:02 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id y3so13661998ejo.12
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 00:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Edd8ZLYtYb/gwlpyDZkQOxSq27PsRFpIp30d8SMER+g=;
        b=tqpFpORB+WKNr57yBie6HkLBpEWBDwutFEby7Q21Gz862pVw5QVxAdeiQt7SQzvXsg
         d8XFA7qTsBmWwXDwR1qPiiw8lpFCyNNrNjfJ+0azA3SAMJCyg2COrurBTlmlKkDzzlJP
         tE9854dsAw5C4y/dCJ2T7ttXIyHf0PzgHqNBzPWYGmaWqYevybj22Sj9Cf2A1CFR8b+1
         EnILFy5/3CtF8TN/JjKOBAar+YMpFdIJpaH4guyFPc37dhUnqygvIHpEJrr6afnaa8Km
         FbfDP4X7LgxAISo1exzuxi/G+/IZKX/TtB9EW/N2AXGqQl9Avp2eer/OxELapy9qMjD+
         P0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Edd8ZLYtYb/gwlpyDZkQOxSq27PsRFpIp30d8SMER+g=;
        b=gn0hWHyddDFiJYZnFxcm0/CDaSjQiYGnDRTpsOTM77pGgvHX4JB6bhTJjOzsK2acn3
         9H2pCWz48e9xCL07YtVHc9MlT41/sqO96vRqMKfmMp3KXN7lX4mKi8eC++WHIhs+Zk4c
         v/Uxawee9vpU1WgFx7Vljfp+dBsZvyxn3M4H35dDmqIIMmWUfjSfsd6pgMBQd3vFLoz/
         k1OYBJ/iK3OHqwYP0MJh1IW4OFGILTw5zLkWg+FIffWkCEozFTxm/mpDldz1tuosd2zS
         5BBEQ0vZjd4UB6CcuKlK4zVZf50Ugrc6R59b+6dGaiF4ZZDm3EydDERiCCFIACvWE+n1
         HdZw==
X-Gm-Message-State: AOAM532YCOmYO4KxV64fLxyrXl7Yytex9yEKGnqlcCIcGxZR7oSOBQ/v
        SipKdBFy0N+Tq6Oetu6VmfNO4A==
X-Google-Smtp-Source: ABdhPJzt/5R7YhS1n1/Tl1fP5rjgP1BaMd1p1mgvE1MTVa32BuX2e89s7ed/ZnNEEjG7z8VMDAwWCQ==
X-Received: by 2002:a17:906:5597:b0:6ce:f3cc:14e8 with SMTP id y23-20020a170906559700b006cef3cc14e8mr34343226ejp.426.1651216321471;
        Fri, 29 Apr 2022 00:12:01 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jl25-20020a17090775d900b006f3ef214dc5sm365463ejc.43.2022.04.29.00.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 00:12:00 -0700 (PDT)
Message-ID: <2f600411-d40e-c4e7-fd54-bd15546bf71f@linaro.org>
Date:   Fri, 29 Apr 2022 09:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Patch v9 1/4] memory: tegra: Add memory controller channels
 support
Content-Language: en-US
To:     Ashish Mhetre <amhetre@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, digetx@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.osipenko@collabora.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     vdumpa@nvidia.com, Snikam@nvidia.com
References: <20220426073827.25506-1-amhetre@nvidia.com>
 <20220426073827.25506-2-amhetre@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220426073827.25506-2-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 26/04/2022 09:38, Ashish Mhetre wrote:
> From tegra186 onwards, memory controller support multiple channels.
> Add support for mapping address spaces of these channels.
> Add number of channels supported by tegra186, tegra194 and tegra234.
> In case of old bindings, channels won't be present. If channels are not
> present then print warning and continue so that backward compatibility
> will be preserved in driver.
> During error interrupts from memory controller, appropriate registers
> from these channels need to be accessed for logging error info.
> 
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/memory/tegra/mc.c       |  6 ++++++
>  drivers/memory/tegra/tegra186.c | 34 +++++++++++++++++++++++++++++++++
>  drivers/memory/tegra/tegra194.c |  1 +
>  drivers/memory/tegra/tegra234.c |  1 +

This does not apply, neither on my mem-ctrl-next, nor on master.
Probably because tegra234 is somewhere else (Thierry?). Either you send
it without tegra234 or it goes via Thierry's tree.

Best regards,
Krzysztof
