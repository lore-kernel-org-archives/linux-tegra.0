Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A685C433FE
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 10:57:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68775611C6
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 10:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237843AbhJFK65 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 06:58:57 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59646
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237982AbhJFK64 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 6 Oct 2021 06:58:56 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2ABED3F32D
        for <linux-tegra@vger.kernel.org>; Wed,  6 Oct 2021 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633517824;
        bh=lyiS2gzwV3aL5tiUb/AbiuQ32zpcsPqknffpCI5B3YU=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=h3Ipz+kiQ4OhVi6i6b1vw/DiWQZiplPKEYML1TTcVwJeWcrTDZf/MEdRGReUkMCcp
         p3UQe/6YOrvbgaSWIDWe1ga788111IVFcd/maBhKbGsv5nqTeAie2acOj5hHXsAv7M
         iAGCem0kkQBzI0KtsqtLmHz4OnzVJjYG4wUw9eH4Uok6aHp4f9Pv9CgbjKe4yBoxco
         eZoZM7U3termd2q3BDZmKEj0iwJjOsQQGgPshBvhARYmDh+lMkglPqWLgZnXWxRK+V
         ttHL3MHI15adXY6UdbI0Aj3BoFKXLm2J1ESaMe5lELBQ93cCRm8EkPgCdPcmr5ZWih
         d9nQ3taHx4WyA==
Received: by mail-lf1-f71.google.com with SMTP id bq35-20020a056512152300b003fd45087a72so1673812lfb.9
        for <linux-tegra@vger.kernel.org>; Wed, 06 Oct 2021 03:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lyiS2gzwV3aL5tiUb/AbiuQ32zpcsPqknffpCI5B3YU=;
        b=kOe0CNCdIh5Txh5uakrVUbEtN0x1PSy0/S5GFbTdVAI8FISKm8QCvIsMopemjQf/Ow
         lDFAbX9m8KaEafwANQWhuSOX5VcBwzyjmcHHiZEKfCTIeFS5ORhJOONAceBHFZURR0oG
         m4gnUZc/m9F9pNknaqopzj4v1K8JMTZt6umneJKX+GdhF8uAX9bhyyFPQFG/LmqN7yDN
         nbnAg2qS21MnOqsS8LFORgpp8++0+xmRzhEhdmIjBtjl+N3nh/TT0R3JnV3DELVp1SaP
         mwi2GzG1GSioKDLIZzU2XPjv7aalX+4xaD20TJXsZ7WFk9lXBjHZN0TawmoLyyp3MpF6
         daMQ==
X-Gm-Message-State: AOAM532uaF8QOkgoUaMVXx2KjeITXE9Xbj87uC049OWJ2Gv6R8qNm6Wn
        gnrskNGExCAKNaniCLFaCLScHi0xjgDi1qtt24nZ1d4o7msaHZnzq6a0ISd9d+qFlwSWSGSk4s1
        d8M+14xOB5Cm+j9evwSITcGhbCjlESKoQhLBnQV8n
X-Received: by 2002:a2e:a367:: with SMTP id i7mr29225024ljn.435.1633517823223;
        Wed, 06 Oct 2021 03:57:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0ybYQ7M5dUd0pO4EK9DU+QoPo9Dd8A/gKrWWPoQzw+dP3SEbSn9uqn0MbLXq/NaPnshLEPw==
X-Received: by 2002:a2e:a367:: with SMTP id i7mr29225005ljn.435.1633517823047;
        Wed, 06 Oct 2021 03:57:03 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e5sm2248255ljj.129.2021.10.06.03.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 03:57:02 -0700 (PDT)
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211005230009.3635-1-digetx@gmail.com>
 <20211005230009.3635-3-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: memory: lpddr2: Convert to schema
Message-ID: <6b8f6ef7-cfc5-3a8b-d44d-f4080a85ecf3@canonical.com>
Date:   Wed, 6 Oct 2021 12:57:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005230009.3635-3-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 06/10/2021 01:00, Dmitry Osipenko wrote:
> Convert LPDDR2 binding to schema. I removed obsolete ti,jedec-lpddr2-*
> compatibles since they were never used by device-trees and by the code.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/ddr/jedec,lpddr2.yaml  | 195 ++++++++++++++++++
>  .../memory-controllers/ddr/lpddr2.txt         | 102 ---------
>  2 files changed, 195 insertions(+), 102 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2.txt
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
> new file mode 100644
> index 000000000000..d99ccad54938
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
> @@ -0,0 +1,195 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LPDDR2 SDRAM compliant to JEDEC JESD209-2
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>

My Canonical address please, so:
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - Elpida,ECB240ABACN
> +          - enum:
> +              - jedec,lpddr2-s4
> +      - items:
> +          - enum:
> +              - jedec,lpddr2-s2
> +      - items:
> +          - enum:
> +              - jedec,lpddr2-nvm
> +
> +  density:
> +    description: |
> +      Density in megabits of SDRAM chip. Obtained from device datasheet.

You need here a type/ref, so uint32.

> +    enum:
> +      - 64
> +      - 128
> +      - 256
> +      - 512
> +      - 1024
> +      - 2048
> +      - 4096
> +      - 8192
> +      - 16384
> +      - 32768
> +
> +  io-width:
> +    description: |
> +      IO bus width in bits of SDRAM chip. Obtained from device datasheet.

You need here a type/ref, so uint32.

> +    enum:
> +      - 32
> +      - 16
> +      - 8
> +
> +  tRRD-min-tck:
> +    maximum: 16

Here and further type is needed.


> +    description: |
> +      Active bank a to active bank b in terms of number of clock cycles.
> +      Obtained from device datasheet.
> +
> +  tWTR-min-tck:
> +    maximum: 16
> +    description: |
> +      Internal WRITE-to-READ command delay in terms of number of clock cycles.
> +      Obtained from device datasheet.
> +

Best regards,
Krzysztof
