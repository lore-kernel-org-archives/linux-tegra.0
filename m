Return-Path: <SRS0=mSjp=DY=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD00C43457
	for <linux-tegra@archiver.kernel.org>; Sat, 17 Oct 2020 05:39:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A65D320714
	for <linux-tegra@archiver.kernel.org>; Sat, 17 Oct 2020 05:39:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF3BQ+8Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436548AbgJQFjo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 17 Oct 2020 01:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411652AbgJQFjm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 17 Oct 2020 01:39:42 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2C4C0610E1;
        Fri, 16 Oct 2020 19:04:38 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id hk7so2474243pjb.2;
        Fri, 16 Oct 2020 19:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=swJTOo0+OeDIPNlZmpUNpCccwzVAN8JMX1PnG4lkV8M=;
        b=JF3BQ+8ZwhdmCyhHsc4k56aEf2TRI4JW3HNtDvCsDa3bvLNAFOMP/UrvvlhqEMIHpI
         Z6Yr+OeHrXAvlRZzgke5PASmG4xm0uPRrdasNvWaVRmJWe/7IhoRvToWL9yO9H+muIvY
         nVLTKNMWL/GBSv9IDq1uEcZ7GAolCNiUX+v7lML4Emr7EXDncHSwBu0FOdkkZRbgZiSs
         CJCfVNOeDWn0trXRMmQPmJXPVh2nXITBr60MB+wX1K6y4zaW8abBuM/9iNVY0V+DD2Ba
         ygCRHZKgRrH6B2uT17MnJvCFSgAD52yHR7ZxGRpgVhLXPlhwvosMWsSZf+vXp86lpsEP
         bypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=swJTOo0+OeDIPNlZmpUNpCccwzVAN8JMX1PnG4lkV8M=;
        b=ID8xS4adj1xzu665+wl1iEKamvxuV/CHkfEMuJA6fy/KXoVmJAS3pMMDvZ6MYMvR35
         Xn/1ZErZ3zNUErIr/xouLt0wRbMuWUaH/aajEaZbYgcbTxgTfGOUqhO6/Fgq9lo1MxLn
         iCWPC2idf/nfzMEYwy+Ydv0bNwmJjSxur9UULQHNJ0TqQB9kCVhgfPKtMcMN8kMguVH/
         Pl0S8ZLYRcH6KWPujD1zg7SnOfuHVBZUuvp8ahyxltPHHq6/DT5tCTGHGt7QtJ62dxWV
         fnKp9RnajJiGK7hQJM17p//3hxOYuJ6LcQpDmOKm1HSWbJQoHciF4kREvwyKqq77LgoC
         LZLg==
X-Gm-Message-State: AOAM531RjqOFOYC92wgcBSPpPjLQdi5mW0fxczqtS1Q3m/fco6mFv8DU
        NpZ2YF92DINcVCxZEkd/f90=
X-Google-Smtp-Source: ABdhPJwEY0kB/NGLxD9ci0NbxaFi/YJtDjtuugODqnZm3qeuLt8C1eqt/2mdtsrRfEyU68ls+csv8Q==
X-Received: by 2002:a17:90b:d91:: with SMTP id bg17mr7030547pjb.66.1602900277826;
        Fri, 16 Oct 2020 19:04:37 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id bj17sm4168738pjb.15.2020.10.16.19.04.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Oct 2020 19:04:37 -0700 (PDT)
Date:   Fri, 16 Oct 2020 18:56:08 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
Subject: Re: [PATCH v7 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20201017015607.GC7203@Asurada-Nvidia>
References: <20201009161936.23122-1-nicoleotsuka@gmail.com>
 <20201009161936.23122-4-nicoleotsuka@gmail.com>
 <cbc6e3bf-eedc-195c-c4d6-52d3cd24c257@arm.com>
 <20201015041346.GA13936@Asurada-Nvidia>
 <340afbc0-5513-0742-d2d2-1ab908248af3@arm.com>
 <20201016035347.GA28140@Asurada-Nvidia>
 <1431eba3-d0b3-8460-2c12-573dc148e0df@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431eba3-d0b3-8460-2c12-573dc148e0df@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 16, 2020 at 03:10:26PM +0100, Robin Murphy wrote:
> On 2020-10-16 04:53, Nicolin Chen wrote:
> > On Thu, Oct 15, 2020 at 10:55:52AM +0100, Robin Murphy wrote:
> > > On 2020-10-15 05:13, Nicolin Chen wrote:
> > > > On Wed, Oct 14, 2020 at 06:42:36PM +0100, Robin Murphy wrote:
> > > > > On 2020-10-09 17:19, Nicolin Chen wrote:
> > > > > > This patch simply adds support for PCI devices.
> > > > > > 
> > > > > > Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> > > > > > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > > > > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > > > > > ---
> > > > > > 
> > > > > > Changelog
> > > > > > v6->v7
> > > > > >     * Renamed goto labels, suggested by Thierry.
> > > > > > v5->v6
> > > > > >     * Added Dmitry's Reviewed-by and Tested-by.
> > > > > > v4->v5
> > > > > >     * Added Dmitry's Reviewed-by
> > > > > > v3->v4
> > > > > >     * Dropped !iommu_present() check
> > > > > >     * Added CONFIG_PCI check in the exit path
> > > > > > v2->v3
> > > > > >     * Replaced ternary conditional operator with if-else in .device_group()
> > > > > >     * Dropped change in tegra_smmu_remove()
> > > > > > v1->v2
> > > > > >     * Added error-out labels in tegra_smmu_probe()
> > > > > >     * Dropped pci_request_acs() since IOMMU core would call it.
> > > > > > 
> > > > > >     drivers/iommu/tegra-smmu.c | 35 +++++++++++++++++++++++++----------
> > > > > >     1 file changed, 25 insertions(+), 10 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> > > > > > index be29f5977145..2941d6459076 100644
> > > > > > --- a/drivers/iommu/tegra-smmu.c
> > > > > > +++ b/drivers/iommu/tegra-smmu.c
> > > > > > @@ -10,6 +10,7 @@
> > > > > >     #include <linux/kernel.h>
> > > > > >     #include <linux/of.h>
> > > > > >     #include <linux/of_device.h>
> > > > > > +#include <linux/pci.h>
> > > > > >     #include <linux/platform_device.h>
> > > > > >     #include <linux/slab.h>
> > > > > >     #include <linux/spinlock.h>
> > > > > > @@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
> > > > > >     	group->smmu = smmu;
> > > > > >     	group->soc = soc;
> > > > > > -	group->group = iommu_group_alloc();
> > > > > > +	if (dev_is_pci(dev))
> > > > > > +		group->group = pci_device_group(dev);
> > > > > 
> > > > > Just to check, is it OK to have two or more swgroups "owning" the same
> > > > > iommu_group if an existing one gets returned here? It looks like that might
> > > > > not play nice with the use of iommu_group_set_iommudata().
> > > > 
> > > > Do you mean by "gets returned here" the "IS_ERR" check below?
> > > 
> > > I mean that unlike iommu_group_alloc()/generic_device_group(),
> > > pci_device_group() may give you back a group that already contains another
> > > device and has already been set up from that device's perspective. This can
> > > happen for topological reasons like requester ID aliasing through a PCI-PCIe
> > > bridge or lack of isolation between functions.
> > 
> > Okay..but we don't really have two swgroups owning the same groups
> > in case of PCI devices. For Tegra210, all PCI devices inherit the
> > same swgroup from the PCI controller. And I'd think previous chips
> > do the same. The only use case currently of 2+ swgroups owning the
> > same iommu_group is for display controller.
> > 
> > Or do you suggest we need an additional check for pci_device_group?
> 
> Ah, OK - I still don't have the best comprehension of what exactly swgroups

The "swgroup" stands for "software group", which associates with
an ASID (Address Space Identifier) for SMMU to determine whether
this client is going through SMMU translation or not.

> are, and the path through .of_xlate looked like you might be using the PCI
> requester ID as the swgroup identifier, but I guess that ultimately depends
> on what your "iommu-map" is supposed to look like. If pci_device_group()

This is copied from pcie node in our downstream dtsi file:

		iommus = <&mc TEGRA_SWGROUP_AFI>;
		iommu-map = <0x0 &mc TEGRA_SWGROUP_AFI 0x1000>;
		iommu-map-mask = <0x0>;

> will effectively only ever get called once regardless of how many endpoints
> exist, then indeed this won't be a concern (although if that's *guaranteed*
> to be the case then you may as well just stick with calling
> iommu_group_alloc() directly). Thanks for clarifying.

All PCI devices are supposed to get this swgroup of the pcie node
above. So the function will return the existing group of the pcie
controller, before giving a chance to call iommu_group_alloc().

Thanks for the review and input.
