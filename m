Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DE1C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Dec 2021 15:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbhLOPOn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Dec 2021 10:14:43 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:46572
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234827AbhLOPOm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Dec 2021 10:14:42 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6381B40042
        for <linux-tegra@vger.kernel.org>; Wed, 15 Dec 2021 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639581281;
        bh=HCQ6GEO47JgcGr62NBBVlTaY0YhpsPGHwysu2NXjzeM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=JEzed4uM7X73uiMYHxceXV2yJyicw37is+1rskJD+GmBefg6y93+m2eOjT00jifpB
         k9F3xnOhbAWkVPUvOCXav16Y10qjNTiWq2+jOfJdBhwcOQAnZnv4ACX3iNPYnObZ5C
         vRRWypZXzVtH317zZnabn5C60NOqtYr+rtQ7ny8phybS9jr8Wqfnkm/el7OPrQJg6D
         016G4ZhdEUDEYHf5/ncluVrDl8aamI8455ad3zt81XNhdCE33NIF7TCLvJZb2zrRkf
         O7kvUJ3p523icFSaatGD+SgV5qmbHq/NleNZI7Sh0WDnvbQ419v0a+E0EEYJfuRKtx
         bEVcec4/If0DQ==
Received: by mail-lf1-f72.google.com with SMTP id k32-20020a0565123da000b0041643c6a467so9681323lfv.5
        for <linux-tegra@vger.kernel.org>; Wed, 15 Dec 2021 07:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HCQ6GEO47JgcGr62NBBVlTaY0YhpsPGHwysu2NXjzeM=;
        b=DvrmYsd+9IBKDHodmacVN5/ZOwdpDrkK7iWXtKlFvKzx4e3Ar9aLsPGm04MORCXaNR
         fw9n9LZN4NE/bCm6I9wWYsUGC8a2aQMxWFdazvjwpB4t7/BfEx+3terwt9lq3gOqLh5N
         9cimigDSsI+HoGsxhiMG9JRUlK1EQKB57G+g7XLj3BQ9Inf3PRflHY/+b6M/41T4i/jJ
         Lw3vEYc2Ov1ctMIUvVlIG2CAbhySlL3JPbrq8lReOWi9kWADPnBq7l8emDGLCeXmRz8B
         etyKM9rkQ4D5O+lcmoqSBjYjbLjqQIw3L0QPsgxtgfH++X2IRMoDt4xtg6/pBX+wcFTl
         A0Rg==
X-Gm-Message-State: AOAM530JYa300sBtz0GjfHTKPXveppG5BIG3WEWJJp7QJIpmRQZN/Sct
        u3lVF3SeNjs5EXgp6N6VjDW+3kyZbhMOhUjd6saCSKRgngyCjo51OQLGGTAfxG1TkQ3+Q5zSSI+
        1lg3vAh4DdkKxkjXhGvAy9d5n0Th0PzdltIHpFe+Q
X-Received: by 2002:a05:6512:e9f:: with SMTP id bi31mr10452402lfb.14.1639581280724;
        Wed, 15 Dec 2021 07:14:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyKEUNwWPUJ+3ZK3UELgqthsYMFoTOE37u+iLiJV8CaadLxmTPXEn/UT169xLasRo9O/FHeA==
X-Received: by 2002:a05:6512:e9f:: with SMTP id bi31mr10452392lfb.14.1639581280538;
        Wed, 15 Dec 2021 07:14:40 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a7sm361273lfi.149.2021.12.15.07.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 07:14:39 -0800 (PST)
Message-ID: <88a2ac63-8d58-ff58-f18b-73374a2e5dc4@canonical.com>
Date:   Wed, 15 Dec 2021 16:14:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 1/6] dt-bindings: memory: tegra: Update for Tegra194
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211213162151.916523-1-thierry.reding@gmail.com>
 <20211213162151.916523-2-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211213162151.916523-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 13/12/2021 17:21, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The #interconnect-cells properties are required to hook up memory
> clients to the MC/EMC in interconnects properties. Add a description for
> these properties.
> 
> For the nested EMC controller, the list of required properties was
> missing. Add it so that the validation can be more strict.
> 
> Also, allow multiple reg entries required by Tegra194 and later.
> 
> While at it, also remove the dummy BPMP node from the example because it
> is incomplete and fails validation. It's also not necessary for this
> file and the BPMP DT schema already has a full example.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - reword commit message to reflect changes in v2
> 
> Changes in v2:
> - drop incomplete BPMP snippet from example
> - explicitly set minItems for reg property
> - describe MC and EMC general interrupts
> - add required properties for EMC
> 
>  .../nvidia,tegra186-mc.yaml                   | 78 ++++++++++++++++---
>  1 file changed, 67 insertions(+), 11 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
