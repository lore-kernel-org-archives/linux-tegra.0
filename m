Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7226BC433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 08:37:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57CC660EE9
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 08:37:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhJDIjG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 04:39:06 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56286
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231500AbhJDIjF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 4 Oct 2021 04:39:05 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A5CEA405FA
        for <linux-tegra@vger.kernel.org>; Mon,  4 Oct 2021 08:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633336634;
        bh=9ZwCtTzwSq1uVvj/tTRyEks425J4Fu+BkeRySbAum8A=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=QmSh3bJcje6+E4yzaOJmPDHZY/x8Ce94IkVHixBQK2o7E0In8I+hW4KUaGI6XstZi
         auhX6cFnOFrAQfxskePlNmveNzc5+HnQXzNRLCNrgBpTL5ZJn/UD3IEQguhZ138jRZ
         ShkK/CUIjx0+CXJeAouAaiaz/k6X9tLSc4AyXPbUzq2PlE9UUlavy6m7tbpijgPj5I
         EeF4PvOx6P+jFCXJzWsBIeCBzahQCeJVCoyesAwkTR/I3rGjsZqQeeXkxp3cSi0VGV
         9/ryMvhseyrn/4C/nGfltmqaBkCc2h25RmWJYt4z24iyPQEpNVmNflSVSqZIhRA/HE
         bKlo/k1TVcT/w==
Received: by mail-lf1-f70.google.com with SMTP id g9-20020a0565123b8900b003f33a027130so13591287lfv.18
        for <linux-tegra@vger.kernel.org>; Mon, 04 Oct 2021 01:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9ZwCtTzwSq1uVvj/tTRyEks425J4Fu+BkeRySbAum8A=;
        b=pz0Yz8UGYbnEXQUWtsy8SICzWs69tjE9T7cjBUrx9ZY+/l4CG6WkihHgYHyo/6auOX
         KrK47awHP/DJ3yaRnybZyRXFbXH3Gw2/QAUiZSVlBWJTykrKC8Ugw8X6pY7IG1ZjAe0o
         y4cSNNmFSL5tNLzZkP7OGL039W3++emPcie9gQsfAzCdnqf3D4q8TtyPiR8mgfcgMkuN
         H9XgV3Zcgkw7wZTgq+2hhPC4/ni4o+jAd4adhYPqiK7bpDwh4MBaiwAChRko/duKOCkb
         s9tpDhRWP7FkT0mWFvKCC5pDlKOrjRz0PX4ueda244d8QTTog1cV5iIIlcYi84VcbAgO
         tBMw==
X-Gm-Message-State: AOAM532RDQkJihJj+EcWoQtyty0j4AgfVA9T2un0t0Z3KfZfXTHXBUfp
        kj9EcC3WaW1/ZTKpEPfG1hxKFcPB3XEQOeRJ9iLXaIYnptSONI5Df9SFlm1vU8BLibnf8XLEPkZ
        KV6Z9LA0GHR8vD5ex8xCy9tllIjpTa+ntlIghpumi
X-Received: by 2002:ac2:44a2:: with SMTP id c2mr4213101lfm.452.1633336633256;
        Mon, 04 Oct 2021 01:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIpIoQvGRYSydgv8gO2smid6Br2zdF6PBc8gJBhHpLJls5rpiHdF7zMbh37bkAT9xl7GaGLQ==
X-Received: by 2002:ac2:44a2:: with SMTP id c2mr4213083lfm.452.1633336633008;
        Mon, 04 Oct 2021 01:37:13 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id a23sm1005122ljb.107.2021.10.04.01.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 01:37:12 -0700 (PDT)
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211003013235.2357-1-digetx@gmail.com>
 <20211003013235.2357-3-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: memory: tegra20: emc: Document new
 LPDDR2 sub-node
Message-ID: <a3713f62-0ece-5ab2-f55a-3d614ce01c00@canonical.com>
Date:   Mon, 4 Oct 2021 10:37:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003013235.2357-3-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 03/10/2021 03:32, Dmitry Osipenko wrote:
> Some Tegra20 boards don't have RAM code stored in NVMEM, which is used for
> the memory chip identification and the identity information should be read
> out from LPDDR2 chip in this case. Document new sub-node containing generic
> LPDDR2 properties that will be used for the memory chip identification if
> RAM code isn't available. The identification is done by reading out memory
> configuration values from generic LPDDR2 mode registers of SDRAM chip and
> comparing them with the values of device-tree sub-node's.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra20-emc.yaml  | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
> index cac6842dc8f1..65f7c3898ac4 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
> @@ -164,13 +164,14 @@ patternProperties:
>        "#size-cells":
>          const: 0
>  
> +      lpddr2-configuration:

Nodes should be named generic, so just lpddr2?


> +        $ref: "jedec,lpddr2.yaml#"
> +        type: object
> +
>      patternProperties:
>        "^emc-table@[0-9]+$":
>          $ref: "#/$defs/emc-table"
>  
> -    required:
> -      - nvidia,ram-code

Isn't lpddr2-configuration required in such case? If not, probably you
want either this or that (oneOf like in reserved-memory.yaml).

> -
>      additionalProperties: false
>  
>  required:
> @@ -186,6 +187,8 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/memory/lpddr2.h>
> +
>      external-memory-controller@7000f400 {
>          compatible = "nvidia,tegra20-emc";
>          reg = <0x7000f400 0x400>;
> @@ -226,5 +229,13 @@ examples:
>                          0x007fe010 0x00001414 0x00000000 0x00000000
>                          0x00000000 0x00000000 0x00000000 0x00000000>;
>              };
> +
> +            lpddr2-configuration {
> +                jedec,lpddr2-manufacturer-id = <LPDDR2_MANID_ELPIDA>;
> +                jedec,lpddr2-revision-id1 = <1>;
> +                jedec,lpddr2-density-mbits = <2048>;
> +                jedec,lpddr2-io-width-bits = <16>;
> +                jedec,lpddr2-type = <LPDDR2_TYPE_S4>;
> +            };
>          };
>      };
> 


Best regards,
Krzysztof
