Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E42C4743C
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 15:54:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D743661153
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 15:54:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhFUP4j (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Jun 2021 11:56:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:33086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229719AbhFUP4j (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 11:56:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CF3C60FD8;
        Mon, 21 Jun 2021 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624290864;
        bh=JhMpx8Btj48mWJ1v62+IDUgjcau8pNUf2ATlJwM7KBc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JMMs3rcvrsK6Z8kam8EVgcWu+GQKGhDR9FObycLAaG/aS4SCnAcqUM/2XiMFB1DYL
         8S1RnbRWfKUGHN2KIX0RQ4c6q3pd9E9Xhba3+ilZRxI94D64gtUArchgmHp2e6FPor
         tDlXWzIPVEWMfVlFBqexX70nTMpt+Vwcj8enWL5xrqoxvCMAklMQ5YYDytS8p+yeVD
         nx7JH2MTvTKFBonRqhi+V5BYQbRH//saxNr+22NE8sH7b9H67EmEUoOfcivN+gQF8q
         3K92tPk2GcUOgB6AgBpZ1BWcb41IcONtN5s6rCK9SG5O7IgPXYsgCMQHb6Ap3+uOlm
         NULHbwM2QXj8w==
Date:   Mon, 21 Jun 2021 16:54:18 +0100
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/9] dt-bindings: arm-smmu: Add Tegra186 compatible
 string
Message-ID: <20210621155418.GA29488@willie-the-truck>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
 <20210603164632.1000458-3-thierry.reding@gmail.com>
 <CAL_JsqLDKxwANn2Pba0Db6J9337pK0dNL=bBN8ucn-k4DZ3gyg@mail.gmail.com>
 <14551e79-853d-471f-bb5e-0d2d6581a9b6@canonical.com>
 <YNCeK9cdMPf+serd@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNCeK9cdMPf+serd@orome.fritz.box>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jun 21, 2021 at 04:11:55PM +0200, Thierry Reding wrote:
> On Mon, Jun 21, 2021 at 08:46:54AM +0200, Krzysztof Kozlowski wrote:
> > On 18/06/2021 21:47, Rob Herring wrote:
> > > On Thu, Jun 3, 2021 at 10:49 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > >> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > >> index 9d27aa5111d4..1181b590db71 100644
> > >> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > >> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > >> @@ -54,8 +54,14 @@ properties:
> > >>            - const: arm,mmu-500
> > >>        - description: NVIDIA SoCs that program two ARM MMU-500s identically
> > >>          items:
> > >> +      - description: NVIDIA SoCs that require memory controller interaction
> > > 
> > > This is not valid jsonschema:
> > > 
> > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm,smmu.yaml:
> > > properties:compatible:oneOf:4:items: 'anyOf' conditional failed, one
> > > must be fixed:
> > > None is not of type 'object', 'boolean'
> > > None is not of type 'array'
> > > from schema $id: http://json-schema.org/draft-07/schema#
> > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm,smmu.yaml:
> > > properties:compatible:oneOf:4:items: 'oneOf' conditional failed, one
> > > must be fixed:
> > > None is not of type 'object'
> > > None is not of type 'array'
> > > from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm,smmu.yaml:
> > > properties:compatible:oneOf:4:items: 'oneOf' conditional failed, one
> > > must be fixed:
> > > None is not of type 'object'
> > > None is not of type 'array'
> > > from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
> > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm,smmu.yaml:
> > > properties:compatible:oneOf:5:items: 'oneOf' conditional failed, one
> > > must be fixed:
> > > [{'enum': [{'const': 'nvidia,tegra194-smmu'}, {'const':
> > > 'nvidia,tegra186-smmu'}]}, {'const': 'nvidia,smmu-500'}] is not of
> > > type 'object'
> > > {'const': 'nvidia,tegra194-smmu'} is not of type 'string'
> > > {'const': 'nvidia,tegra186-smmu'} is not of type 'string'
> > > from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
> > > 
> > > 
> > > This was not reviewed nor tested since the DT list was not Cc'ed.
> > 
> > Ugh, I see now weird empty item on a list... and not only DT list was
> > skipped - Thierry did not Cc you either.
> 
> This seemed like a too trivial addition to waste Rob's time on, so I
> didn't add him (or the DT list for that matter) on Cc. The ARM SMMU
> maintainers had reviewed this, which seemed like it was enough for what
> the DT bindings change was doing.

Hmm, I didn't review it. I find the yaml stuff unreadable so I usually
wait for the DT folks to ack bindings changes before I queue them in the
SMMU tree.

Will
