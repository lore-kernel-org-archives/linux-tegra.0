Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5346C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Feb 2022 10:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiBPKaD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Feb 2022 05:30:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiBPKaC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Feb 2022 05:30:02 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31DA222DC5
        for <linux-tegra@vger.kernel.org>; Wed, 16 Feb 2022 02:29:50 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 13FC640611
        for <linux-tegra@vger.kernel.org>; Wed, 16 Feb 2022 10:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645007389;
        bh=8Ae2IyDPIYtSDwfICZYtX6NpzxBQNSp7pmdTk/Ww12w=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=eEGZhUg9pEwrWWEynxctTdc68oefRueRjt8FIaby3HvBj0WSWo3FhsBPTx5LkJoUj
         UqfCe+5JfOoQO1EZwuHKr8lPe9bjYxHAJIHZCNkgJvCKBhijp260meMi0NWFEaKXPX
         NdUVBaoQGfiubzupQ2JAyZCJx9qPdimcDVwQqD8wbzsK3/X04wN1XF/EMPZBwZc24/
         N32RzZAnq0ePWwQzJHVB99SAPnaTxxMNg6r47l1EHcsuBqR/bxyTLY56f+Vy6G1ed9
         GZ02kXUGJYl10T8n4D2KGNZWRRnJRerbqYkk+bSCYv5aXZej2pFMi9UBzbarc9VmDa
         i2wOD1zbj1btw==
Received: by mail-ej1-f72.google.com with SMTP id k16-20020a17090632d000b006ae1cdb0f07so621099ejk.16
        for <linux-tegra@vger.kernel.org>; Wed, 16 Feb 2022 02:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8Ae2IyDPIYtSDwfICZYtX6NpzxBQNSp7pmdTk/Ww12w=;
        b=jsi3KWKlr0GyLjqEsOkMo+GlbqeYzegVZqrKRQZF2+oDg05qu4tXxVutMgLF2mUcWM
         NZKRLsn/BTpOyzm5L2iYNoHHmoTbEbrzk4R1tj8LJLSjyVrjoMCTwXFwlpxF2t4EHIEi
         8+2OlQWYWiAsP52b4apaufWMnbq2aDBElH/YO4gKeVKbAagOT6RhCcwBCvNkCDUBdQNc
         KhNPjHYITZh4dgMf0Ytr03ZLdJnC2xcH7rqYD7kdZcgbGa09lSxrM1Ak08rj4MxUiiZQ
         2rb+OaFWbKUMqyOncoWt4lkKW/B75YyQA055rffECTeVBXfMaMje3ZsdXDhHjP7atYvo
         Cq9A==
X-Gm-Message-State: AOAM532uxpBNG5rdG2gAuMXraekEUdpWVBJDM7sOgP+H2IXeSKA5xGsK
        zEZuh1u29bzRj2jE3SDDh5TC9xPByX77NQ5sfXYlECI2Ns+mgPyVIEwThFU+pBP3B8Q+MB8QERI
        9js8UJbIpBnssWrDE1EmbuhQ11Qz2S9XWf1UmmBfD
X-Received: by 2002:a17:907:70c1:b0:6ce:78ff:bad4 with SMTP id yk1-20020a17090770c100b006ce78ffbad4mr1757706ejb.68.1645007388020;
        Wed, 16 Feb 2022 02:29:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyB8SV5fiPCVTykaHtbYxxGP3rr/oFhGzeVD5CLSmaDY/7MY+BRd9s2Om9TXV6Oz9hnD0yY4A==
X-Received: by 2002:a17:907:70c1:b0:6ce:78ff:bad4 with SMTP id yk1-20020a17090770c100b006ce78ffbad4mr1757676ejb.68.1645007387804;
        Wed, 16 Feb 2022 02:29:47 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id p25sm5037598ejn.33.2022.02.16.02.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 02:29:47 -0800 (PST)
Message-ID: <2249cf46-5c54-2e59-f247-5a22f2e6e5b9@canonical.com>
Date:   Wed, 16 Feb 2022 11:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/6] dt-bindings: Document Tegra234 HDA support
Content-Language: en-US
To:     Mohan Kumar <mkumard@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
        tiwai@suse.com, jonathanh@nvidia.com, spujar@nvidia.com
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220216092240.26464-1-mkumard@nvidia.com>
 <20220216092240.26464-6-mkumard@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220216092240.26464-6-mkumard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/02/2022 10:22, Mohan Kumar wrote:
> Update binding document for HDA support on Tegra234 chip.
> 
> Tegra234 has max of 2 clocks and 2 resets which requires to add
> minItems and maxItems for clocks and resets as Tegra chips can
> now have minimum of 2 and maximum of 3 clocks and reset support.
> 
> Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> index 2c913aa44fee..12c31b4b99e1 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
> @@ -23,6 +23,7 @@ properties:
>        - const: nvidia,tegra30-hda
>        - items:
>            - enum:
> +              - nvidia,tegra234-hda

Why putting it in non-alphabetical order? Although someone put
nvidia,tegra124-hda already at the end of list... having things ordered
is helpful to avoid conflicts and makes code easier to read.


Best regards,
Krzysztof
