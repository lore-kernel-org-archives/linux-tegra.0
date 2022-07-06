Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B7AC433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Jul 2022 18:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbiGFSDd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Jul 2022 14:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbiGFSDd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Jul 2022 14:03:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BC41C12614
        for <linux-tegra@vger.kernel.org>; Wed,  6 Jul 2022 11:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657130609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VBlFjIiB9ZC4gvoYyy90cQtMpZILwrGOgeqSFzZ8m1s=;
        b=T69uL2I2+AIs3O44T7hyHDeWFfoUxlJOz67wyck2UJQFSkC3CFnhqpx86PyapwfClWoARO
        rt+rmjatcSjZoqkVuoA9b7216IAXWXQkAvHi99vVqetL+EjiR+PA94E3Bof1r/A+QMCS6Y
        Vej+8JWaIohWA4qNX2sD50cNoMGbt6k=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-tZEqOq6FNV6EckDtIGEX2Q-1; Wed, 06 Jul 2022 14:03:29 -0400
X-MC-Unique: tZEqOq6FNV6EckDtIGEX2Q-1
Received: by mail-io1-f71.google.com with SMTP id h18-20020a5d9712000000b00674f83a60f0so8555684iol.4
        for <linux-tegra@vger.kernel.org>; Wed, 06 Jul 2022 11:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=VBlFjIiB9ZC4gvoYyy90cQtMpZILwrGOgeqSFzZ8m1s=;
        b=Ztndyp8P/mE2pqWaJ9pUwWyhuT/Arlkgrz0ECeMoX8TKvdujQJGMef7NLEU/1PFY8z
         uu7zC4LsCVlN9b8JZlVPUcmlU6HeENrYpU1FwzNSrHNBMIbPq/SxrUqxlEgzDFFijVoo
         LxfzI9fG9DawguCbWOAJ34knj343LKBsDX5VAS0LcGcYyfa+/dmr0mBiguWlfgkKGnoG
         kgnOMq/M7/qMyiGvT5BTXW2YaqK6OcMgrekos7cE2WmgcBAZ+nPUyj2BiIN8OlM1CbqQ
         s9b1le4mWrc2svBlUaEMTp/OKRrcZPinsL+liJukklqZDbMNXRLxKAoz8LeY9CMGe/fJ
         5XHg==
X-Gm-Message-State: AJIora8DBv13avAx+cP4/EhNHKcp5nun/ROUUnses6yeJJf5qErrHmOh
        oknUVwumf9jSz9/T1jXxKeVlpS2z7aDLGrWnrc0ww/M63HMn2ugVz6GF170Wgh94SThwIm21l+Z
        Uirk5r4I7Rw8gsLmk5DOIfcc=
X-Received: by 2002:a05:6638:218f:b0:33c:caf0:a61c with SMTP id s15-20020a056638218f00b0033ccaf0a61cmr26531508jaj.198.1657130608178;
        Wed, 06 Jul 2022 11:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tABH1Ic8RqUAALPXzLJn+RofmhnwMLRPJ18ZPWLjNFSi2aNVbpdWUQPpp6mJB+LAKijjE03g==
X-Received: by 2002:a05:6638:218f:b0:33c:caf0:a61c with SMTP id s15-20020a056638218f00b0033ccaf0a61cmr26531473jaj.198.1657130607865;
        Wed, 06 Jul 2022 11:03:27 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id co14-20020a0566383e0e00b0033efe711a37sm1538401jab.35.2022.07.06.11.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 11:03:27 -0700 (PDT)
Date:   Wed, 6 Jul 2022 12:03:25 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Nicolin Chen <nicolinc@nvidia.com>
Cc:     <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
        <sven@svenpeter.dev>, <robin.murphy@arm.com>,
        <robdclark@gmail.com>, <baolu.lu@linux.intel.com>,
        <orsonzhai@gmail.com>, <baolin.wang7@gmail.com>,
        <zhang.lyra@gmail.com>, <jean-philippe@linaro.org>,
        <jgg@nvidia.com>, <kevin.tian@intel.com>,
        <suravee.suthikulpanit@amd.com>, <alyssa@rosenzweig.io>,
        <dwmw2@infradead.org>, <mjrosato@linux.ibm.com>,
        <gerald.schaefer@linux.ibm.com>, <thierry.reding@gmail.com>,
        <vdumpa@nvidia.com>, <jonathanh@nvidia.com>, <cohuck@redhat.com>,
        <thunder.leizhen@huawei.com>, <christophe.jaillet@wanadoo.fr>,
        <chenxiang66@hisilicon.com>, <john.garry@huawei.com>,
        <yangyingliang@huawei.com>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>, <kvm@vger.kernel.org>
Subject: Re: [PATCH v5 0/5] cover-letter: Simplify vfio_iommu_type1
 attach/detach routine
Message-ID: <20220706120325.4741ff34.alex.williamson@redhat.com>
In-Reply-To: <YsXMMCX5LY/3IOtf@Asurada-Nvidia>
References: <20220701214455.14992-1-nicolinc@nvidia.com>
        <20220706114217.105f4f61.alex.williamson@redhat.com>
        <YsXMMCX5LY/3IOtf@Asurada-Nvidia>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 6 Jul 2022 10:53:52 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Wed, Jul 06, 2022 at 11:42:17AM -0600, Alex Williamson wrote:
> 
> > On Fri, 1 Jul 2022 14:44:50 -0700
> > Nicolin Chen <nicolinc@nvidia.com> wrote:
> >   
> > > This is a preparatory series for IOMMUFD v2 patches. It enforces error
> > > code -EMEDIUMTYPE in iommu_attach_device() and iommu_attach_group() when
> > > an IOMMU domain and a device/group are incompatible. It also drops the
> > > useless domain->ops check since it won't fail in current environment.
> > >
> > > These allow VFIO iommu code to simplify its group attachment routine, by
> > > avoiding the extra IOMMU domain allocations and attach/detach sequences
> > > of the old code.
> > >
> > > Worths mentioning the exact match for enforce_cache_coherency is removed
> > > with this series, since there's very less value in doing that as KVM will
> > > not be able to take advantage of it -- this just wastes domain memory.
> > > Instead, we rely on Intel IOMMU driver taking care of that internally.
> > >
> > > This is on github:
> > > https://github.com/nicolinc/iommufd/commits/vfio_iommu_attach  
> > 
> > How do you foresee this going in, I'm imagining Joerg would merge the
> > first patch via the IOMMU tree and provide a topic branch that I'd
> > merge into the vfio tree along with the remaining patches.  Sound
> > right?  Thanks,  
> 
> We don't have any build dependency between the IOMMU change and
> VFIO changes, yet, without the IOMMU one, any iommu_attach_group()
> failure now would be a hard failure without a chance falling back
> to a new_domain, which is slightly different from the current flow.
> 
> For a potential existing use case that relies on reusing existing
> domain, I think it'd be safer to have Joerg acking the first change
> so you merge them all? Thank!

Works for me, I'll look for buy-in + ack from Joerg.  Thanks,

Alex

