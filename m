Return-Path: <SRS0=Wy30=DW=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6458FC433E7
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Oct 2020 04:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0250A2223F
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Oct 2020 04:21:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqZNkqpt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgJOEV7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Oct 2020 00:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbgJOEV7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Oct 2020 00:21:59 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DF7C061755;
        Wed, 14 Oct 2020 21:21:59 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id 1so901143ple.2;
        Wed, 14 Oct 2020 21:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=myKWn2aw1JHwruWf4bmkepVRzhTOK/8xfJ1WsTjjYmk=;
        b=lqZNkqptZUVuKR9lHZ1zEPqnfTwsO69lt6hrzs9rJi06GS3A92tVdrgA9WWsj4rrU0
         EqDtAA+tEmvD4UwaiV6QyDNPdo+wH8giGVEakIvTG9QhQf1XItID/7M9ya4KLRi/HOqV
         Yoq5Fqwpow00+QFN/6NhlBR+UuZrrJ+L6XJTJ4R0DhP6GPBOP3EwRitt+6gYXrtVTEfq
         QlPvyhIXha20eiiTrhI+7/f3Af7+XUTWEEF2/+g+dMuNxgilknqPjvycDN/oQtw0IuKL
         P6nVbs7JaoMoKaFyt05ZfyVa5VtrQVGdyjQAtveq9ND7g+E8W2fOIJsGb4rUf5KjdHC2
         R7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=myKWn2aw1JHwruWf4bmkepVRzhTOK/8xfJ1WsTjjYmk=;
        b=YRk+z2NcoNXi3r2/9fFqTJcJVptYr56t5nAQ2XMj9Xc1Pn14ZuRdKJtVXSRRMu1U1Y
         gGe00XzyOKuVHaxFyge00m8vIPInCQWc97dBKTA6jC+4P2X4c89e6fBzNs+sHjdxZzmQ
         bXz+MV9/yUQU8a1HO0Rz882Gh6wrrLAMJCc2VZqFpQGiO6wy7NvNNrNKvw0H9pbvkSJI
         Hzu19j7i8wia2VuLj0h8zU3dqeSjXrRgIhqDCc4idcjgnW61I3MoDTqhorqC4VvvVge0
         Qd89c8Od2YxL2Zr707oxZLrBdL7S6cO3+hUAolLCH/anSoVFGyax+c9xlGJMVxigm/LK
         4KCg==
X-Gm-Message-State: AOAM532JhQCIU0kkEAtiD6a7/uYW3YZRUb8ElpXHUr/gV1j33nyCJx0p
        aYlURqZ50AWx9GuqFH1RNs9WNZQ7Elo=
X-Google-Smtp-Source: ABdhPJxw6tR6GVDDSYHrsi4pLkqfC+F4ExcRYMfk1T1p55SL/VCxDQAOusd2IB1WQGFK7yUmV/K/dA==
X-Received: by 2002:a17:90a:c58f:: with SMTP id l15mr2403427pjt.93.1602735718832;
        Wed, 14 Oct 2020 21:21:58 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id w143sm1287330pfc.31.2020.10.14.21.21.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Oct 2020 21:21:58 -0700 (PDT)
Date:   Wed, 14 Oct 2020 21:13:47 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
Subject: Re: [PATCH v7 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20201015041346.GA13936@Asurada-Nvidia>
References: <20201009161936.23122-1-nicoleotsuka@gmail.com>
 <20201009161936.23122-4-nicoleotsuka@gmail.com>
 <cbc6e3bf-eedc-195c-c4d6-52d3cd24c257@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbc6e3bf-eedc-195c-c4d6-52d3cd24c257@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 14, 2020 at 06:42:36PM +0100, Robin Murphy wrote:
> On 2020-10-09 17:19, Nicolin Chen wrote:
> > This patch simply adds support for PCI devices.
> > 
> > Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
> > 
> > Changelog
> > v6->v7
> >   * Renamed goto labels, suggested by Thierry.
> > v5->v6
> >   * Added Dmitry's Reviewed-by and Tested-by.
> > v4->v5
> >   * Added Dmitry's Reviewed-by
> > v3->v4
> >   * Dropped !iommu_present() check
> >   * Added CONFIG_PCI check in the exit path
> > v2->v3
> >   * Replaced ternary conditional operator with if-else in .device_group()
> >   * Dropped change in tegra_smmu_remove()
> > v1->v2
> >   * Added error-out labels in tegra_smmu_probe()
> >   * Dropped pci_request_acs() since IOMMU core would call it.
> > 
> >   drivers/iommu/tegra-smmu.c | 35 +++++++++++++++++++++++++----------
> >   1 file changed, 25 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> > index be29f5977145..2941d6459076 100644
> > --- a/drivers/iommu/tegra-smmu.c
> > +++ b/drivers/iommu/tegra-smmu.c
> > @@ -10,6 +10,7 @@
> >   #include <linux/kernel.h>
> >   #include <linux/of.h>
> >   #include <linux/of_device.h>
> > +#include <linux/pci.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/slab.h>
> >   #include <linux/spinlock.h>
> > @@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
> >   	group->smmu = smmu;
> >   	group->soc = soc;
> > -	group->group = iommu_group_alloc();
> > +	if (dev_is_pci(dev))
> > +		group->group = pci_device_group(dev);
> 
> Just to check, is it OK to have two or more swgroups "owning" the same
> iommu_group if an existing one gets returned here? It looks like that might
> not play nice with the use of iommu_group_set_iommudata().

Do you mean by "gets returned here" the "IS_ERR" check below?

> Robin.
> 
> > +	else
> > +		group->group = generic_device_group(dev);
> > +
> >   	if (IS_ERR(group->group)) {
> >   		devm_kfree(smmu->dev, group);
> >   		mutex_unlock(&smmu->lock);
