Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BE7C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  5 May 2022 14:53:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235473AbiEEO4z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 May 2022 10:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbiEEO4x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 May 2022 10:56:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4575AEDC
        for <linux-tegra@vger.kernel.org>; Thu,  5 May 2022 07:53:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 28A576195A
        for <linux-tegra@vger.kernel.org>; Thu,  5 May 2022 14:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54603C385A4;
        Thu,  5 May 2022 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651762393;
        bh=oSwfd81AM0OY4QoBIEasIKXinM4DcH+LT1YNQY4fTgw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DkD+hHPOPezMyZSaKjaYBAhl7weGZAqObGKfIaJFmAANGGXKUv77/oaKv+jMfRWCg
         /XvY6hqHucR0Zz0lKr3+oRk4s0cnPcN3r30mark5nHyJOZ/phTa1CQHJSWajK40jLu
         P47QrJhDb5N/t7h4sjRzVsjOsvv5MrnPyvCFYQmDIvZVirQ9X6af6fu10CD0U+wReF
         Ul9UzhRj4iHFWN22y++XuFgKxzCA3OtJK1raNXtDHpY7rQJEL7CUzL8yaDAkyjn3BE
         6vNLq8qpb4psTGCm/A2YCAxSOJAo3HJ3Q78BjwjBvWToRL4JO1NuvgZPuyeH8HQKbz
         DbNYq8GiOiZCA==
Date:   Thu, 5 May 2022 15:53:08 +0100
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] iommu/arm-smmu: Support Tegra234 SMMU
Message-ID: <20220505145307.GA21784@willie-the-truck>
References: <20220429082243.496000-1-thierry.reding@gmail.com>
 <YnPcAaQTMRsNEQYJ@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnPcAaQTMRsNEQYJ@orome>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, May 05, 2022 at 04:15:29PM +0200, Thierry Reding wrote:
> On Fri, Apr 29, 2022 at 10:22:40AM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > Hi Joerg,
> > 
> > this is essentially a resend of v2 with a Acked-by:s from Robin and Will
> > added. These have been on the list for quite a while now, but apparently
> > there was a misunderstanding, so neither you nor Will picked this up.
> > 
> > Since Will acked these, I think it's probably best for you to pick these
> > up directly. If not, let me know and I'll work with Will to merge via
> > the ARM SMMU tree.
> > 
> > Thanks,
> > Thierry
> > 
> > Thierry Reding (3):
> >   dt-bindings: arm-smmu: Document nvidia,memory-controller property
> >   dt-bindings: arm-smmu: Add compatible for Tegra234 SOC
> >   iommu/arm-smmu: Support Tegra234 SMMU
> > 
> >  .../devicetree/bindings/iommu/arm,smmu.yaml   | 23 +++++++++++++++++--
> >  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |  3 ++-
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> 
> Joerg,
> 
> anything left to do on this from your perspective, or can this go into
> v5.19?

I'll pick them up in the Arm SMMU queue, as there are some other SMMU
patches kicking around and we may as well keep them all together.

Will
