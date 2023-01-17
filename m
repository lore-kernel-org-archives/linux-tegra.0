Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4D9C3DA78
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Jan 2023 11:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236550AbjAQLOF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Jan 2023 06:14:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236763AbjAQLND (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Jan 2023 06:13:03 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C78934570
        for <linux-tegra@vger.kernel.org>; Tue, 17 Jan 2023 03:12:51 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id j34-20020a05600c1c2200b003da1b054057so9810538wms.5
        for <linux-tegra@vger.kernel.org>; Tue, 17 Jan 2023 03:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bBL+3z7FwRu66kVqmwrvKHKciT56qaxXPVTQkVCDYt8=;
        b=KjtJ8nG+uqmSz8f9E6FB/XyUef5RrwLssFDnC/XT5FlJ0NHoYHT4j006ESqIa+FNop
         nT+gAmGKKG6pBSOgURdT7gdzlFhCSogb9WJ5lUqqNkRdTIdx5fpVmKcvD5gK8IJnwZq8
         ccfpRXxas7C10rHmX2cBmJJRCOQ6ckNFHbw+vUeicI6/sdsqxhkrEwEN9r3OIYTXCu8V
         h9HYhV7o3uWDfts6jx+YX0qBMuPYTHVC7UulzZEz8aew0skOItz2QzuvGNT+ChgYVeyk
         QcCdtN+1iqFw1jZCGixqu+sUog7bFoKpdJiZTpq7ZyLffE8zUEjyGJihvt3bMQ7W9syA
         cBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBL+3z7FwRu66kVqmwrvKHKciT56qaxXPVTQkVCDYt8=;
        b=yipHsPyXlkd+iv8sccjBF6+K9uDY5iec4uUBJubrgTWWvOAM5WSS9Sxf2YA0Ep2Wwg
         zKtGluH24+PcqzU+uUNc9pU+AUa+vKzE/QjiY/zOWXW9gLdunZ+bkWa7TAFhFd0hUSj7
         HFORK/735FbKNkmGpNB6qOSZO2s70QfkR517WSDU2PHTbgOp+hm+bpw1PPdMGgiX80N2
         Bn/0ceCdUxaSNsusiOpwNyj8+mOUob19j0cnb5n1WWXfPsqKTm5u5aKdJMBF6c7hK8cK
         gt2J8YciqnSN7WuIKGXTUuf6t43a7yx8sqH9aYESdfUJ3gDkNr2k01I+1Lwahh2I84bv
         ObCA==
X-Gm-Message-State: AFqh2kpwXvOPeSijTFC5f4nijc7bqSe5ivd89ojgoKpMn7OV7ybYFq69
        1kImcUUuhXcJJBXdp1Gd/fJRIQ==
X-Google-Smtp-Source: AMrXdXs71rRTTNnxoWaaJ+6Z5xjRQ6G3SYq885C7J5gYeSzqJwN1qsu/urj6k4aS1qlXPB0jUR4Mkg==
X-Received: by 2002:a1c:7514:0:b0:3d9:f559:1f7e with SMTP id o20-20020a1c7514000000b003d9f5591f7emr11398160wmc.20.1673953969834;
        Tue, 17 Jan 2023 03:12:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c444800b003c21ba7d7d6sm40016037wmn.44.2023.01.17.03.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:12:48 -0800 (PST)
Message-ID: <232ed345-aea1-5e68-5fca-9a93c3896acb@linaro.org>
Date:   Tue, 17 Jan 2023 12:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V4 1/5] dt-bindings: usb: tegra-xudc: Add dma-coherent for
 Tegra194
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230116145452.91442-1-jonathanh@nvidia.com>
 <20230116145452.91442-2-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116145452.91442-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/01/2023 15:54, Jon Hunter wrote:
> DMA operations for XUSB device controller are coherent for Tegra194 and
> so update the device-tree binding to add this property.
> 
> Fixes: 394b012a422d ("dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support")
> 

No blank lines between the tags.

If this is a fix, you need to describe the observed issue or bug. Commit
suggests this is just adding some missing piece, so not a fix for a bug.

> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> index f6cb19efd98b..4ef88d38fa3a 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> @@ -112,6 +112,8 @@ properties:
>    hvdd-usb-supply:
>      description: USB controller power supply. Must supply 3.3 V.
>  
> +  dma-coherent: true
> +
>  required:
>    - compatible
>    - reg
> @@ -164,6 +166,16 @@ allOf:
>          clock-names:
>            maxItems: 4
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra194-xudc
> +    then:
> +      required:
> +        - dma-coherent
> +
>  additionalProperties: false
>  
>  examples:

Best regards,
Krzysztof

