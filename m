Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C70FC433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Mar 2022 19:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238139AbiCBTcI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Mar 2022 14:32:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237410AbiCBTcH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Mar 2022 14:32:07 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CCF0D64FA
        for <linux-tegra@vger.kernel.org>; Wed,  2 Mar 2022 11:31:24 -0800 (PST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 975AC3F222
        for <linux-tegra@vger.kernel.org>; Wed,  2 Mar 2022 19:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646249482;
        bh=h7zoiHroALo7RM2Ucqc+edums/unXH0DNAll2z0zzoI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ni+aXlkowli1/cMc2XxZcdEpnfoCXecPMDooQlGNr7UU7dk4xGQloLDOIPnUCXYVR
         zdAoV2aWi++fgXailw6BTsUp1D8Lt/W34Mr4dXynyi1vVzIDPbNGzuYHZjTuCuNLjf
         ncLI7PAbcWCasYr3HG6ikOtD6AjLnzmsEsrP4boz8RV79Gi6Z1pG3YoKTk3yLNkp8o
         qYWHnhTU6SWOD9xbI2Oy9jhkugwrYY6POTUH0r93dEVk6kDUVU1EADNqtmoLQw7aCZ
         6QpzCJcF+/3NWAUOZ+IBNAQXmbNZm7QRmDVjXLwTLz41swENH0HM/6ajs8rCvaRKAe
         a0UWn5kV6yotQ==
Received: by mail-wm1-f72.google.com with SMTP id v125-20020a1cac83000000b0037e3d70e7e1so2308107wme.1
        for <linux-tegra@vger.kernel.org>; Wed, 02 Mar 2022 11:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h7zoiHroALo7RM2Ucqc+edums/unXH0DNAll2z0zzoI=;
        b=4/XvYHTjHKjiFDw+UZEL1XjaHgW832MvEQhaLqtzQkZIZSPngQNPsEDf89ifsFL4+d
         F2ZoTLRyje8BjZyfpxk0pS403n3oTRu9qDze1Rk3Ts18gVgK82fVydLEbRrvmlSo0CQ5
         9xiRlCj8QkJqCR0FRa6fgy55S9sI1GBVi3FLrenblTfXUwDB+gl2ZWzLWEEEj64ILxv/
         knnR43eNFAEwutHB5rBlNY/hf9ctseFhsH0sDicRsV4I+DLLtCnazi1F1TIgUDfgResV
         O5bgMgr5ixMrZLic8S+dVXxpHYpdyeboWvQVnFsqtwS3bJFGoVWq52VfsPrDj6q6m3Ev
         7A7Q==
X-Gm-Message-State: AOAM5325G48ghePiafOGj7robyFrFKpIjtTL1PXy6WbMwdq45mApLDPq
        K02bCvk92XkU/DLTM9s1fiGE34FIIjQfMhpNTYGhKVwKbU7qIUTRzWLhFoW0NCuavu9m8Mja/Kk
        +nzStEM46CnGNBKEFqDSi9jHbsBrt+XJOvWKCH9BH
X-Received: by 2002:a05:6000:508:b0:1e4:a027:d147 with SMTP id a8-20020a056000050800b001e4a027d147mr24344779wrf.315.1646249481831;
        Wed, 02 Mar 2022 11:31:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwacERm1jqXGVZsAJ8yvmRStyZfoO559hV3UUAuxRuYbfDu3w787ac8/2QnUb/1f7xbH8Keeg==
X-Received: by 2002:a05:6000:508:b0:1e4:a027:d147 with SMTP id a8-20020a056000050800b001e4a027d147mr24344763wrf.315.1646249481644;
        Wed, 02 Mar 2022 11:31:21 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b00381141f4967sm10016714wmq.35.2022.03.02.11.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 11:31:20 -0800 (PST)
Message-ID: <b7f68054-707c-8b76-23ab-027a8aab41f0@canonical.com>
Date:   Wed, 2 Mar 2022 20:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Patch v4 2/4] dt-bindings: memory: Update reg maxitems for
 tegra186
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, vdumpa@nvidia.com, Snikam@nvidia.com
References: <1646210609-21943-1-git-send-email-amhetre@nvidia.com>
 <1646210609-21943-3-git-send-email-amhetre@nvidia.com>
 <Yh+um1TSNWK8P6GY@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <Yh+um1TSNWK8P6GY@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02/03/2022 18:51, Rob Herring wrote:
> On Wed, Mar 02, 2022 at 02:13:27PM +0530, Ashish Mhetre wrote:
>> >From tegra186 onwards, memory controller support multiple channels.
>> Reg items are updated with address and size of these channels.
>> Tegra186 has overall 5 memory controller channels. Tegra194 and tegra234
>> have overall 17 memory controller channels each.
>> There is 1 reg item for memory controller stream-id registers.
>> So update the reg maxItems to 18 in tegra186 devicetree documentation.
> 
> Some of this needs to be in 'description' for 'reg'.
> 
>>
>> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
>> ---
>>  .../devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml      | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
>> index 13c4c82..eb7ed00 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
>> @@ -35,7 +35,7 @@ properties:
>>  
>>    reg:
>>      minItems: 1
>> -    maxItems: 3
>> +    maxItems: 18
>>  

...and with "if:" block constraining these on different hardware.


Best regards,
Krzysztof
