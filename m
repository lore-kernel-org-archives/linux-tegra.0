Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CB8C433E7
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 04:02:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FA512076E
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 04:02:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUnr49tv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbgJPECL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 00:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgJPECL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 00:02:11 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4AFBC061755;
        Thu, 15 Oct 2020 21:02:09 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h6so625333pgk.4;
        Thu, 15 Oct 2020 21:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C9/au9NmuAjbAcpNdJ/iNR3JJfxaIrQJHGtDNhivldY=;
        b=fUnr49tvI2n8Bt8NbcB9EuFZXeZSkEm0m3HKZpMJQNWe1MqKl04RBFrb2f1epAFdf+
         la4hswFSfMQ+QyQ3YcImGcU1wpeC3mZh/5Pk7kSDKWmg7hz3aR2Jkj6hXGUr/lvBOolV
         vQCAO05qsArss6AZMqm1OJzYrp2WsasKMfy4DuDRcZxo7KuQAfeLczazVfX0zpyWLtVh
         mhbDAz4bd8OPnx9fQMJ+H7lz+F51UfQZDiE6F5Ry4Ya/clJd8EfIzGRbPa2kgxe5gy8n
         P2LLP/iSGXrLTqUn2MF7rmekQd88zpnFoLmFIYaLcsZuJGzn8AnjDPgP7uC5SgIJC50d
         Jx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C9/au9NmuAjbAcpNdJ/iNR3JJfxaIrQJHGtDNhivldY=;
        b=SPiXOul7m3wdU8hgrFeCjx1s6PSmql9ee799wkmJajm7JgJPCRQnabGTvRmz7r6l6u
         ckxOFM9111dvQFEXv0LMNj2xRtSSuxaX4c+30NuBzMiXGp2jKvP9oHXMPj4T/FKpCPfX
         bjZhqVNiBPfkbRKBy569grYvFR4KVFAaxC6bJ86VrmilDDVOKFbyA68DtjYf9B15fj5I
         2byUHy95wfHNSgLW838Yue5+9gWZQQLMIi5uKcfSkd9XP+oLNK3vA5TC25RYp8R6zqfx
         ydsdeFuIVHp4f1h4X9/7EQO2Ol5Xa2RUmDRGP5PTRQaBQ0uuN7vkJ8LXzg9qO0NCpiu9
         1Vqg==
X-Gm-Message-State: AOAM533FMQq/yfdlgYmKYGWVUaK7Kf4TZ6ZnlZeR0AbKquJPUt8XL3Ya
        CDXODsZP5/jWS9d2lCQo3ECUVzsj1Ns=
X-Google-Smtp-Source: ABdhPJxi8B6Bs2WRpPkDMeAnj8BXHgnjQ/A9MDIaKhIjybBlGt4xg5ji7MXBKq7c8ilm/fIZeed10w==
X-Received: by 2002:a05:6a00:150a:b029:159:53cd:86db with SMTP id q10-20020a056a00150ab029015953cd86dbmr1667035pfu.11.1602820928943;
        Thu, 15 Oct 2020 21:02:08 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id b6sm943638pjq.42.2020.10.15.21.02.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 21:02:08 -0700 (PDT)
Date:   Thu, 15 Oct 2020 20:53:47 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, jonathanh@nvidia.com
Subject: Re: [PATCH v7 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20201016035347.GA28140@Asurada-Nvidia>
References: <20201009161936.23122-1-nicoleotsuka@gmail.com>
 <20201009161936.23122-4-nicoleotsuka@gmail.com>
 <cbc6e3bf-eedc-195c-c4d6-52d3cd24c257@arm.com>
 <20201015041346.GA13936@Asurada-Nvidia>
 <340afbc0-5513-0742-d2d2-1ab908248af3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <340afbc0-5513-0742-d2d2-1ab908248af3@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 15, 2020 at 10:55:52AM +0100, Robin Murphy wrote:
> On 2020-10-15 05:13, Nicolin Chen wrote:
> > On Wed, Oct 14, 2020 at 06:42:36PM +0100, Robin Murphy wrote:
> > > On 2020-10-09 17:19, Nicolin Chen wrote:
> > > > This patch simply adds support for PCI devices.
> > > > 
> > > > Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> > > > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > > > ---
> > > > 
> > > > Changelog
> > > > v6->v7
> > > >    * Renamed goto labels, suggested by Thierry.
> > > > v5->v6
> > > >    * Added Dmitry's Reviewed-by and Tested-by.
> > > > v4->v5
> > > >    * Added Dmitry's Reviewed-by
> > > > v3->v4
> > > >    * Dropped !iommu_present() check
> > > >    * Added CONFIG_PCI check in the exit path
> > > > v2->v3
> > > >    * Replaced ternary conditional operator with if-else in .device_group()
> > > >    * Dropped change in tegra_smmu_remove()
> > > > v1->v2
> > > >    * Added error-out labels in tegra_smmu_probe()
> > > >    * Dropped pci_request_acs() since IOMMU core would call it.
> > > > 
> > > >    drivers/iommu/tegra-smmu.c | 35 +++++++++++++++++++++++++----------
> > > >    1 file changed, 25 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> > > > index be29f5977145..2941d6459076 100644
> > > > --- a/drivers/iommu/tegra-smmu.c
> > > > +++ b/drivers/iommu/tegra-smmu.c
> > > > @@ -10,6 +10,7 @@
> > > >    #include <linux/kernel.h>
> > > >    #include <linux/of.h>
> > > >    #include <linux/of_device.h>
> > > > +#include <linux/pci.h>
> > > >    #include <linux/platform_device.h>
> > > >    #include <linux/slab.h>
> > > >    #include <linux/spinlock.h>
> > > > @@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
> > > >    	group->smmu = smmu;
> > > >    	group->soc = soc;
> > > > -	group->group = iommu_group_alloc();
> > > > +	if (dev_is_pci(dev))
> > > > +		group->group = pci_device_group(dev);
> > > 
> > > Just to check, is it OK to have two or more swgroups "owning" the same
> > > iommu_group if an existing one gets returned here? It looks like that might
> > > not play nice with the use of iommu_group_set_iommudata().
> > 
> > Do you mean by "gets returned here" the "IS_ERR" check below?
> 
> I mean that unlike iommu_group_alloc()/generic_device_group(),
> pci_device_group() may give you back a group that already contains another
> device and has already been set up from that device's perspective. This can
> happen for topological reasons like requester ID aliasing through a PCI-PCIe
> bridge or lack of isolation between functions.

Okay..but we don't really have two swgroups owning the same groups
in case of PCI devices. For Tegra210, all PCI devices inherit the
same swgroup from the PCI controller. And I'd think previous chips
do the same. The only use case currently of 2+ swgroups owning the
same iommu_group is for display controller.

Or do you suggest we need an additional check for pci_device_group?
