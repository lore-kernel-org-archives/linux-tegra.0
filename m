Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15D6C49361
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 19:48:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8ABCA613C2
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 19:48:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbhFRTuV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 15:50:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:41606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229591AbhFRTuV (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 15:50:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5D4F61284
        for <linux-tegra@vger.kernel.org>; Fri, 18 Jun 2021 19:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624045691;
        bh=qkc2MGqHvyVub+dZlUlMfi1Ge8BQxPm0xrrh4ob2XuQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UvBXGpsCp4GW2OXicEqRgt1naVvarBwoMXPrd0uoEna1yVXUvQvJYhNXWIkPuyC50
         /nsrsENo9dEmMXiyhQa+Ru7REIc760yyNX39bjmShonUWwfaH/SSa+21d9sRs+d3id
         +83vyUUHNWVG8Y50m8vEQw07K0Q67hUkx1PK/g5pEidQngjffg15xBJ1Ik/mQGEUs7
         4V9d2FrvdrEL7Pby7/QAF5MqPq8ATPDrMnPVzr65EyTH96vTM8DDrbRmq3ugwkceKB
         hFNNw4dhCX7WcXu862CNnHK0lQbopHAYIFAjQKDacAZpF3MKmU5xF984C3svs7Nzpy
         zmcHRmXvyDE4w==
Received: by mail-ed1-f48.google.com with SMTP id h17so182187edw.11
        for <linux-tegra@vger.kernel.org>; Fri, 18 Jun 2021 12:48:11 -0700 (PDT)
X-Gm-Message-State: AOAM5315pe+35cqcc5O+O6F51pqGbK6fxdI/d3wHLX146S/Qxtc94lHl
        rQxf+oVPbfrSPwUqW+1LhZMEM0cW44hrtsLHng==
X-Google-Smtp-Source: ABdhPJw1eLcJOIk68SqoUPZvUGfPSxyK19pxr4bmx3ZN67yWYW4HyzECYtMFKa8UGYfyjdFuPr6pihmA0/bbVI3Vg40=
X-Received: by 2002:aa7:cac9:: with SMTP id l9mr7102053edt.373.1624045690409;
 Fri, 18 Jun 2021 12:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210603164632.1000458-1-thierry.reding@gmail.com> <20210603164632.1000458-3-thierry.reding@gmail.com>
In-Reply-To: <20210603164632.1000458-3-thierry.reding@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 18 Jun 2021 13:47:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLDKxwANn2Pba0Db6J9337pK0dNL=bBN8ucn-k4DZ3gyg@mail.gmail.com>
Message-ID: <CAL_JsqLDKxwANn2Pba0Db6J9337pK0dNL=bBN8ucn-k4DZ3gyg@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: arm-smmu: Add Tegra186 compatible string
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jun 3, 2021 at 10:49 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> The ARM SMMU instantiations found on Tegra186 and later need inter-
> operation with the memory controller in order to correctly program
> stream ID overrides.
>
> Furthermore, on Tegra194 multiple instances of the SMMU can gang up
> to achieve higher throughput. In order to do this, they have to be
> programmed identically so that the memory controller can interleave
> memory accesses between them.
>
> Add the Tegra186 compatible string to make sure the interoperation
> with the memory controller can be enabled on that SoC generation.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 9d27aa5111d4..1181b590db71 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -54,8 +54,14 @@ properties:
>            - const: arm,mmu-500
>        - description: NVIDIA SoCs that program two ARM MMU-500s identically
>          items:
> +      - description: NVIDIA SoCs that require memory controller interaction

This is not valid jsonschema:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm,smmu.yaml:
properties:compatible:oneOf:4:items: 'anyOf' conditional failed, one
must be fixed:
None is not of type 'object', 'boolean'
None is not of type 'array'
from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm,smmu.yaml:
properties:compatible:oneOf:4:items: 'oneOf' conditional failed, one
must be fixed:
None is not of type 'object'
None is not of type 'array'
from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm,smmu.yaml:
properties:compatible:oneOf:4:items: 'oneOf' conditional failed, one
must be fixed:
None is not of type 'object'
None is not of type 'array'
from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm,smmu.yaml:
properties:compatible:oneOf:5:items: 'oneOf' conditional failed, one
must be fixed:
[{'enum': [{'const': 'nvidia,tegra194-smmu'}, {'const':
'nvidia,tegra186-smmu'}]}, {'const': 'nvidia,smmu-500'}] is not of
type 'object'
{'const': 'nvidia,tegra194-smmu'} is not of type 'string'
{'const': 'nvidia,tegra186-smmu'} is not of type 'string'
from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#


This was not reviewed nor tested since the DT list was not Cc'ed.

Rob
