Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10570C77B7F
	for <linux-tegra@archiver.kernel.org>; Mon,  8 May 2023 16:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbjEHQWB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 May 2023 12:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234055AbjEHQWA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 May 2023 12:22:00 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6253730CF
        for <linux-tegra@vger.kernel.org>; Mon,  8 May 2023 09:21:58 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-965e4be7541so681068766b.1
        for <linux-tegra@vger.kernel.org>; Mon, 08 May 2023 09:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683562917; x=1686154917;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Daf3/YZVuIRlar1MVrr7jyzSesx6ayqFzzPJwULdeHM=;
        b=D5POiHEz5U7FjRpb3liXqB68Ft9wtkp5+kNbSZM509XH0qGUvCoZaSLTGbPyv0m8J2
         1U3B3wk7Icg+2wzX9lWduEW7ywVUmUcGfhu80GNjL3KPMPq3fd1n2X7jr6DalMgNMSxK
         c0qxe9Hiir/SJ22nCMm6hvCRFOD5rzkKialo2vZGPg9wcgcmwXK1y8pnN1bAt8Zni+M/
         Yt/vo7OfTfXxIM4KDClW+Vj+FeJWT1y3foVa1N79nDpklPxNGHcVLY+sIg3UgqiFk+/K
         5I6zzyzUu6qHD8ahl6X9J0LgZnZCb4jwzlvTcvmItQOd12B9wg9j8S1mwKg5JR8cQOqR
         Y7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683562917; x=1686154917;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Daf3/YZVuIRlar1MVrr7jyzSesx6ayqFzzPJwULdeHM=;
        b=BNJgfOCzHcYuL96L+SHqyddYg/BK+R+E2tfNFLjwvqQf/SIPa9VES8vvM3pwSp2VJa
         8FwoHZ1wO7pDNKqaPYnq/pTjHMD51avq8eX2qZHjTB29uO3h1BwjDzgSPMH8WSz0lqxM
         flU582hH3uc0RBS94LGUKs+rSw5tnIm4VKt5/v53TG0iBtYoPPO8beTrCw+VUCgw7W1h
         3bWo2XlZMJqPTZ8awbOl5AdP8CuGFKU8nyrQE5TPKimSIF1eT8bCJ8nv/mjD7faNAQW7
         OKVR3fPuFv47mbOpbAf266iVzJZjT9OBvLlnHTk14fq83aefCtCGk92/RmPik/GSfWEg
         H2Ug==
X-Gm-Message-State: AC+VfDyIelc+7Ybo9JCXzrxsxgR62oFlNwOepeaU8w54e/zB/LTOKw5d
        4QI+EUZg2FhhoP4nr0r+vm/rRA==
X-Google-Smtp-Source: ACHHUZ7yu3q6sU0Jtw7QF/12xkZZ6/bDUisSp1CiuLKg+AsRUEkSSJXPf60SjFKfBFrDDxEvjp/nuw==
X-Received: by 2002:a17:907:2d0c:b0:966:5c04:2c5a with SMTP id gs12-20020a1709072d0c00b009665c042c5amr3952247ejc.69.1683562916889;
        Mon, 08 May 2023 09:21:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300? ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id r16-20020a170906c29000b0094f3e169ca5sm147101ejz.158.2023.05.08.09.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 09:21:56 -0700 (PDT)
Message-ID: <0ca8517e-ad78-581a-598a-98784223232f@linaro.org>
Date:   Mon, 8 May 2023 18:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: tegra: Document compatible for IGX
Content-Language: en-US
To:     Shubhi Garg <shgarg@nvidia.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230508102733.1751527-1-shgarg@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508102733.1751527-1-shgarg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 08/05/2023 12:27, Shubhi Garg wrote:
> Document the compatible strings used for Nvidia IGX Orin Development
> kit which uses P3701 SKU8 and P3740 carrier board.
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v2: sorted IGX Orin position as per part number. Since
> P3740 is designed prior to P3768, it is placed before Orin NX.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

