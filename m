Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E69BC433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Apr 2022 13:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbiDMNjv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Apr 2022 09:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233742AbiDMNjv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Apr 2022 09:39:51 -0400
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210EA5F240;
        Wed, 13 Apr 2022 06:37:30 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id i11-20020a9d4a8b000000b005cda3b9754aso1165458otf.12;
        Wed, 13 Apr 2022 06:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vVwMNhUUHsY7dc6d0f9n1lAM7yT9lwBnJKe7WLSKID0=;
        b=x/FHyw0rE/htNaw3RQlQCoPAzoDMtxpVc5uAjzxUIQiOTXqoHujV0vSnZYK8ztgJr2
         klWAZcitRCJy2WBdlPT4DjwMGicqxI80O/z++Yk9p2JCvpwAw1BptZtnwcbaJnLl020a
         xxXwTRJfsP7cP3u2CwOWfkIPbxGUKAxwdVSXRVperDSboNqMnF0otbgB+zoGFQ7uuY2Y
         9p/W4VOn08ovMO2e+Dd6HsQFsC+CcrTvvKdFuTHqxQGWeau5K835Li1MDFSu7Kszq1fy
         55DIfnxPGlIEy608ca/v1MtMXzsB5+n0HvswMP3DKyryMuPVIkBJvYNRqDaeUKWAQORz
         iZ4Q==
X-Gm-Message-State: AOAM531m007qZPzwZR65lFPp9fE59oAylJeqVqhYSIL/Xap0qPyJ6MXY
        aDXofbVpjQ7CDC2FLvOBAA==
X-Google-Smtp-Source: ABdhPJzRayVPW0NrvFDebGFBcCiJJloeTKmG0BgRIxF3CbY/VeL30ky6BKkSiYuxU0EUXIqIZeSAWA==
X-Received: by 2002:a05:6830:2055:b0:5b2:5659:542f with SMTP id f21-20020a056830205500b005b25659542fmr15031191otp.189.1649857049323;
        Wed, 13 Apr 2022 06:37:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h8-20020a056830400800b005cdceb42261sm14584614ots.66.2022.04.13.06.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 06:37:29 -0700 (PDT)
Received: (nullmailer pid 3097465 invoked by uid 1000);
        Wed, 13 Apr 2022 13:37:28 -0000
Date:   Wed, 13 Apr 2022 08:37:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ashish Mhetre <amhetre@nvidia.com>
Cc:     dmitry.osipenko@collabora.com, digetx@gmail.com,
        krzysztof.kozlowski@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vdumpa@nvidia.com,
        Snikam@nvidia.com
Subject: Re: [Patch v7 3/4] dt-bindings: memory: Update reg/reg-names
 validation
Message-ID: <YlbSGEBKgpVC51dZ@robh.at.kernel.org>
References: <20220413094012.13589-1-amhetre@nvidia.com>
 <20220413094012.13589-4-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413094012.13589-4-amhetre@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Apr 13, 2022 at 03:10:11PM +0530, Ashish Mhetre wrote:
> From tegra186 onwards, memory controller support multiple channels.
> Reg items are updated with address and size of these channels.
> Tegra186 has overall 5 memory controller channels. Tegra194 and tegra234
> have overall 17 memory controller channels each.
> There is 1 reg item for memory controller stream-id registers.
> So update the reg maxItems to 18 in tegra186 devicetree documentation.
> Also update validation for reg-names added for these corresponding reg
> items.

Somehow your subject should indicate this is for Tegra.

> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  .../nvidia,tegra186-mc.yaml                   | 80 +++++++++++++++++--
>  1 file changed, 74 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> index 13c4c82fd0d3..c7cfa6c2cd81 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> @@ -34,8 +34,12 @@ properties:
>            - nvidia,tegra234-mc
>  
>    reg:
> -    minItems: 1
> -    maxItems: 3
> +    minItems: 6

You just broke current users.

> +    maxItems: 18
> +
> +  reg-names:
> +    minItems: 6
> +    maxItems: 18
>  
>    interrupts:
>      items:
> @@ -142,7 +146,18 @@ allOf:
>      then:
>        properties:
>          reg:
> -          maxItems: 1
> +          maxItems: 6
> +          description: 5 memory controller channels and 1 for stream-id registers
> +
> +        reg-names:
> +          maxItems: 6
> +          items:
> +            - const: sid
> +            - const: broadcast
> +            - const: ch0
> +            - const: ch1
> +            - const: ch2
> +            - const: ch3
>  
>    - if:
>        properties:
> @@ -151,7 +166,30 @@ allOf:
>      then:
>        properties:
>          reg:
> -          minItems: 3
> +          minItems: 18
> +          description: 17 memory controller channels and 1 for stream-id registers
> +
> +        reg-names:
> +          minItems: 18
> +          items:
> +            - const: sid
> +            - const: broadcast
> +            - const: ch0
> +            - const: ch1
> +            - const: ch2
> +            - const: ch3
> +            - const: ch4
> +            - const: ch5
> +            - const: ch6
> +            - const: ch7
> +            - const: ch8
> +            - const: ch9
> +            - const: ch10
> +            - const: ch11
> +            - const: ch12
> +            - const: ch13
> +            - const: ch14
> +            - const: ch15
>  
>    - if:
>        properties:
> @@ -160,13 +198,37 @@ allOf:
>      then:
>        properties:
>          reg:
> -          minItems: 3
> +          minItems: 18
> +          description: 17 memory controller channels and 1 for stream-id registers
> +
> +        reg-names:
> +          minItems: 18
> +          items:
> +            - const: sid
> +            - const: broadcast
> +            - const: ch0
> +            - const: ch1
> +            - const: ch2
> +            - const: ch3
> +            - const: ch4
> +            - const: ch5
> +            - const: ch6
> +            - const: ch7
> +            - const: ch8
> +            - const: ch9
> +            - const: ch10
> +            - const: ch11
> +            - const: ch12
> +            - const: ch13
> +            - const: ch14
> +            - const: ch15
>  
>  additionalProperties: false
>  
>  required:
>    - compatible
>    - reg
> +  - reg-names

New, added properties cannot be required. That's an ABI break.

>    - interrupts
>    - "#address-cells"
>    - "#size-cells"
> @@ -182,7 +244,13 @@ examples:
>  
>          memory-controller@2c00000 {
>              compatible = "nvidia,tegra186-mc";
> -            reg = <0x0 0x02c00000 0x0 0xb0000>;
> +            reg = <0x0 0x02c00000 0x0 0x10000>,    /* MC-SID */
> +                  <0x0 0x02c10000 0x0 0x10000>,    /* Broadcast channel */
> +                  <0x0 0x02c20000 0x0 0x10000>,    /* MC0 */
> +                  <0x0 0x02c30000 0x0 0x10000>,    /* MC1 */
> +                  <0x0 0x02c40000 0x0 0x10000>,    /* MC2 */
> +                  <0x0 0x02c50000 0x0 0x10000>;    /* MC3 */
> +            reg-names = "sid", "broadcast", "ch0", "ch1", "ch2", "ch3";
>              interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
>  
>              #address-cells = <2>;
> -- 
> 2.17.1
> 
