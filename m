Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910FFC7EE2A
	for <linux-tegra@archiver.kernel.org>; Thu, 11 May 2023 09:03:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237077AbjEKJDc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 May 2023 05:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237106AbjEKJD3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 May 2023 05:03:29 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3F41FEB
        for <linux-tegra@vger.kernel.org>; Thu, 11 May 2023 02:03:27 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-96a5903758fso126482766b.1
        for <linux-tegra@vger.kernel.org>; Thu, 11 May 2023 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683795806; x=1686387806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gURyFCLGL6qPfte/M38lDLhFR1He2KCfzZXXVoCQbA=;
        b=iquqBAsAp6khHMo3FwoOGE6v0VsiHMPYSjGjvTKxzosEfZXQ3il8oDqFbO4XkIeKHv
         FkT2xFPNu5zcoN/xAab+H7GMj/reMx4tM3hgiqvob+pYCfsBi/YWCiT2HOsGcmXjylB8
         jlyfx4eWElKt7wlyOrfyy6wT7BGgUHGjw/Yh2FKxJsH1cLJL90npjpoTGXKFALSQvmiK
         viU5l7F8nmUxXwdBCepdJapeGj+RXbAQT9g5poWne8216Bdve7JknHuyGVL7aUPJ3zxh
         D1JSoze0mGwo3USInbixsY1y9Z7JdB/nsbZfTKlxYZ8RSOJBgs1bl6H4wxAKHlgcuAW+
         TzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683795806; x=1686387806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gURyFCLGL6qPfte/M38lDLhFR1He2KCfzZXXVoCQbA=;
        b=R4FFCj/oBKW/T68pc6lpvZt+TQel5BJjmvThkYAoCNqynwCdlslCAEAuj6o3m9a1ED
         hvbJiqiop5TsnxqVF5DrKk7e0TUjxcJycobTBklNn+uEwvcYPSXIth8Qq8g91xX1lZV6
         /BFgxdEvf/vSfo7sr7mKjmFbO2cLBYlr3NLMc+zO1orLO0TFzh3v0uBnnQSOr+OwVaR2
         pwL3y+gFIJB1WVTrkJ/yCGrsBk5XgGEJAejhw3Kc0lidc4ZGrT7dbOm+t90BMDhXW83n
         ZYDzKRgGnSHDAOJjC02707t69fdkb7zs9MKB9U679x06/kCqdpxlqXJjcQJ4e69ry459
         FxHw==
X-Gm-Message-State: AC+VfDw0O42UnSVoK02s2pKdfWTlNdMtzKGu+H9ZO5dyMUs4ZNz6e3Hk
        OMjbacJ8pad4MyehtchTkVXuEw==
X-Google-Smtp-Source: ACHHUZ5M9+Dx5f6PabYjCF+Jaeu08L2NV+JAQZZXXwsGJViNaDBFle8VnOu909l4RFYzaIos/HWAYA==
X-Received: by 2002:a17:907:d01:b0:965:ffda:b9d2 with SMTP id gn1-20020a1709070d0100b00965ffdab9d2mr21532032ejc.11.1683795805683;
        Thu, 11 May 2023 02:03:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e? ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id qh20-20020a170906ecb400b009655eb8be26sm3737933ejb.73.2023.05.11.02.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:03:25 -0700 (PDT)
Message-ID: <5d01e717-39f1-798b-dda8-022b8430dc7d@linaro.org>
Date:   Thu, 11 May 2023 11:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 5/6] dt-bindings: memory-region property for
 tegra186-bpmp
Content-Language: en-US
To:     Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, stefank@nvidia.com
References: <20230510142248.183629-1-pdeschrijver@nvidia.com>
 <20230510142248.183629-6-pdeschrijver@nvidia.com>
 <cdba4bb0-551b-a3b2-9329-139d6cda71be@linaro.org>
 <ZFyhqXhzOUKYUafA@44189d9-lcedt>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZFyhqXhzOUKYUafA@44189d9-lcedt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/05/2023 10:04, Peter De Schrijver wrote:
> On Wed, May 10, 2023 at 05:01:55PM +0200, Krzysztof Kozlowski wrote:
>> On 10/05/2023 16:22, Peter De Schrijver wrote:
>>> Add memory-region property to the tegra186-bpmp binding to support
>>> DRAM MRQ GSCs.
>>>
>>> Co-developed-by: Stefan Kristiansson <stefank@nvidia.com>
>>> Signed-off-by: Stefan Kristiansson <stefank@nvidia.com>
>>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>>> ---
>>
>> Also no changelog. Since I do not see improvements after Thierry
>> comments I assume you send the same.
>>
> 
> The changelog is in the cover letter. I will send it to you next
> iteration.

I got only few patches, rest is missing including changelog. Thus it is
the same as it did not exist.


Best regards,
Krzysztof

