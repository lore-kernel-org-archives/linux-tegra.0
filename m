Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E466C4708F
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 12:26:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D52F613AD
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 12:26:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhFAM2d (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 08:28:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:46780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231219AbhFAM2c (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 1 Jun 2021 08:28:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D66B060FF0;
        Tue,  1 Jun 2021 12:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622550411;
        bh=eXqJC3GRoWPNutXm6EevRjIRj1wQ3hmw12wr3ZM5m7U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rN+o2G4MHs1yeYvPmTOT8oqOzaqINuKaNHKggKT77EUnHxTV67rhmn3KfH6IAxtlL
         m3vCUBcCZ5+DouvljOQC1q4oELw6hDAZ6N3IMWVzvr0OOhDt2YzUyk1GxbmSKyv+y2
         Ld1+GprZJWsbWVt3rnlSqeCUPysA8HBELfRYmBzakT51wYAgBMzLYgxmDwyzkY22VV
         Keivj4UvIYKb4UKDCa9mmJIrs4XxR7sMBc4xeO3alvw30Xu0uGyKYhlW/DUei7tBY9
         y+kL4Bc+ylMniYyeteVF5h9KfvjBxV9VlB17TZbmvKp4p2g77My4xf463aUNLsxbUd
         YVoiotYyNBDRQ==
Date:   Tue, 1 Jun 2021 13:26:46 +0100
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 00/10] arm64: tegra: Prevent early SMMU faults
Message-ID: <20210601122646.GB27832@willie-the-truck>
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
 <YLEi2FonP568wYrE@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLEi2FonP568wYrE@orome.fritz.box>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, May 28, 2021 at 07:05:28PM +0200, Thierry Reding wrote:
> On Tue, Apr 20, 2021 at 07:26:09PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > Hi,
> > 
> > this is a set of patches that is the result of earlier discussions
> > regarding early identity mappings that are needed to avoid SMMU faults
> > during early boot.
> > 
> > The goal here is to avoid early identity mappings altogether and instead
> > postpone the need for the identity mappings to when devices are attached
> > to the SMMU. This works by making the SMMU driver coordinate with the
> > memory controller driver on when to start enforcing SMMU translations.
> > This makes Tegra behave in a more standard way and pushes the code to
> > deal with the Tegra-specific programming into the NVIDIA SMMU
> > implementation.
> > 
> > Compared to the original version of these patches, I've split the
> > preparatory work into a separate patch series because it became very
> > large and will be mostly uninteresting for this audience.
> > 
> > Patch 1 provides a mechanism to program SID overrides at runtime. Patch
> > 2 updates the ARM SMMU device tree bindings to include the Tegra186
> > compatible string as suggested by Robin during review.
> > 
> > Patches 3 and 4 create the fundamentals in the SMMU driver to support
> > this and also make this functionality available on Tegra186. Patch 5
> > hooks the ARM SMMU up to the memory controller so that the memory client
> > stream ID overrides can be programmed at the right time.
> > 
> > Patch 6 extends this mechanism to Tegra186 and patches 7-9 enable all of
> > this through device tree updates. Patch 10 is included here to show how
> > SMMU will be enabled for display controllers. However, it cannot be
> > applied yet because the code to create identity mappings for potentially
> > live framebuffers hasn't been merged yet.
> > 
> > The end result is that various peripherals will have SMMU enabled, while
> > the display controllers will keep using passthrough, as initially set up
> > by firmware. Once the device tree bindings have been accepted and the
> > SMMU driver has been updated to create identity mappings for the display
> > controllers, they can be hooked up to the SMMU and the code in this
> > series will automatically program the SID overrides to enable SMMU
> > translations at the right time.
> > 
> > Note that the series creates a compile time dependency between the
> > memory controller and IOMMU trees. If it helps I can provide a branch
> > for each tree, modelling the dependency, once the series has been
> > reviewed.
> > 
> > Changes in v2:
> > - split off the preparatory work into a separate series (that needs to
> >   be applied first)
> > - address review comments by Robin
> > 
> > Thierry
> > 
> > Thierry Reding (10):
> >   memory: tegra: Implement SID override programming
> >   dt-bindings: arm-smmu: Add Tegra186 compatible string
> >   iommu/arm-smmu: Implement ->probe_finalize()
> >   iommu/arm-smmu: tegra: Detect number of instances at runtime
> >   iommu/arm-smmu: tegra: Implement SID override programming
> >   iommu/arm-smmu: Use Tegra implementation on Tegra186
> >   arm64: tegra: Use correct compatible string for Tegra186 SMMU
> >   arm64: tegra: Hook up memory controller to SMMU on Tegra186
> >   arm64: tegra: Enable SMMU support on Tegra194
> >   arm64: tegra: Enable SMMU support for display on Tegra194
> > 
> >  .../devicetree/bindings/iommu/arm,smmu.yaml   |  11 +-
> >  arch/arm64/boot/dts/nvidia/tegra186.dtsi      |   4 +-
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 166 ++++++++++++++++++
> >  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |   3 +-
> >  drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c  |  90 ++++++++--
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c         |  13 ++
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h         |   1 +
> >  drivers/memory/tegra/mc.c                     |   9 +
> >  drivers/memory/tegra/tegra186.c               |  72 ++++++++
> >  include/soc/tegra/mc.h                        |   3 +
> >  10 files changed, 349 insertions(+), 23 deletions(-)
> 
> Will, Robin,
> 
> do you have any more comments on the ARM SMMU bits of this series? If
> not, can you guys provide an Acked-by so that Krzysztof can pick this
> (modulo the DT patches) up into the memory-controller tree for v5.14?
> 
> I'll send out a v3 with the bisectibilitiy fix that Krishna pointed
> out.

Probably best if I queue 3-6 on a separate branch once you send a v3,
then Krzysztof can pull that in if he needs it.

Will
