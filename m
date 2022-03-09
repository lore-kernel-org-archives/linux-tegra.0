Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ED0C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Mar 2022 12:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbiCIMov (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Mar 2022 07:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbiCIMov (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Mar 2022 07:44:51 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA0C53711;
        Wed,  9 Mar 2022 04:43:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6371661995;
        Wed,  9 Mar 2022 12:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0704FC340E8;
        Wed,  9 Mar 2022 12:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646829831;
        bh=NfpZrz/N2z7mKEqxDudtRMZkspXLAswLYMQk23y6/AQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tK04+G+eh8HiQbfVzo9KJZkzySqvXhheh+6DNZALmaiC5uoP6ANl6ksKfrnZblpEj
         xJox+Mo4pseHbX09hV9KZEr56gERT0PfU0NE7Wjh+nVj/rq4wqfzdpOAUuQTZN3TT1
         077EIBTVvrTrRZQmwdTNY4BUhDcPkbe9fjZ8c+pZy5S1PAzm/FRtbZa/ruI/4ZIXoC
         df2bLserL/oi/mFV/ThJf22+yNn6vYfI9pYwFj9WH4mDMxXD0luAGRVZQgp6dRVYjG
         Zp90lJjXbWJ89zAUmeE3fYGaHhEx9r7kdE7UNPnnFTH45OKTE75xWk9chKicR3QjsV
         IjozpGq4upSBA==
Date:   Wed, 9 Mar 2022 12:43:45 +0000
From:   Will Deacon <will@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: arm-smmu: Document
 nvidia,memory-controller property
Message-ID: <20220309124344.GF397@willie-the-truck>
References: <20211209163600.609613-1-thierry.reding@gmail.com>
 <Ygz7QD4EJX3vZJtD@orome>
 <Yid9SWbpPQQhNgA4@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yid9SWbpPQQhNgA4@orome>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Mar 08, 2022 at 04:59:05PM +0100, Thierry Reding wrote:
> On Wed, Feb 16, 2022 at 02:25:20PM +0100, Thierry Reding wrote:
> > On Thu, Dec 09, 2021 at 05:35:57PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > On NVIDIA SoC's the ARM SMMU needs to interact with the memory
> > > controller in order to map memory clients to the corresponding stream
> > > IDs. Document how the nvidia,memory-controller property can be used to
> > > achieve this.
> > > 
> > > Note that this is a backwards-incompatible change that is, however,
> > > necessary to ensure correctness. Without the new property, most of the
> > > devices would still work but it is not guaranteed that all will.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > Changes in v2:
> > > - clarify why the new nvidia,memory-controller property is required
> > > 
> > >  .../devicetree/bindings/iommu/arm,smmu.yaml     | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > 
> > Hi Joerg,
> > 
> > can you pick up patches 1-3 of this series? DT bindings have been
> > reviewed by Rob and Will acked the ARM SMMU change. I can take the
> > device tree changes (patch 4) through the Tegra tree.
> 
> Will, Robin, Joerg,
> 
> I haven't seen this show up in linux-next yet but was hoping to see this
> go in for v5.18. Anything I can do to help this move along?

Hmm, I guess I could've taken 1-3, but after your message to Joerg I just
Acked the driver change on the assumption that was a dependency or
something.

In any case, I'm happy for Joerg to pick these three up directly if he has
time this late in the cycle.

Will
