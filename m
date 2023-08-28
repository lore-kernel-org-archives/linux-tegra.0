Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90098C83F14
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Aug 2023 23:20:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234077AbjH1XTb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Aug 2023 19:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233044AbjH1XTK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Aug 2023 19:19:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD6AC2
        for <linux-tegra@vger.kernel.org>; Mon, 28 Aug 2023 16:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693264701;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NqA+se+NtJmo6VZ6Aa5eIZ0Mw7Oak0MLDxzh66FDHNk=;
        b=d6xNKgjlS9CH+ZuDN2utM1wWpXH3ZlAI9xdkvTOfQIWcTqMw4skyDDlOOhYdAQb2p8cH3E
        HUuCIaRrcRI46Wy/wxnzsy+QF1nYctYE+NZzVopuwie0mEKBXe0xaW4PvPRsiGBaMrEWjs
        7s1JRMFM8lPK/cAnNEH/50XxrgwRQSs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-EwntgXI8MdKJ9yGxCbqYZA-1; Mon, 28 Aug 2023 19:18:19 -0400
X-MC-Unique: EwntgXI8MdKJ9yGxCbqYZA-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1bf58d92bd9so38618075ad.3
        for <linux-tegra@vger.kernel.org>; Mon, 28 Aug 2023 16:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693264698; x=1693869498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqA+se+NtJmo6VZ6Aa5eIZ0Mw7Oak0MLDxzh66FDHNk=;
        b=Mny+xLdqTS/KNyD/1p5Gd4Idcxmqm2wcaGRuZGqLuu3V54a1y8Uei8XrGmUZiddBzS
         8fmaNyo2+7AXf8XE8Wx/iuHAbpUDoEgLya16DgRNpPvv/en6t/iMoiHtfbsd9h8nsd6F
         cRdNeou6Iypb+bdpQ+f+ZZLmQ8miKQw5c09/vGPnC0lqDqOadrcdjJ0hH8M3uxpEIGBF
         M30UpGOLYMpsIpLHXzawgZgINIhVRqqtE+/mt+xZLKuKmVG6Y7xO7QSnkw0EyYCj+OgC
         GJ5a/C6WC4TEL+vp77R92+er6L46+vUJgTyYc84RdGGCe51db9XJgQpCQ56IzvcYzJoX
         XKXw==
X-Gm-Message-State: AOJu0YwQ7LgcbQKP4nY6G5BrY43d9pXGKAWeYRDy9skeRsm9m9sFrEVx
        H6sM/fp8dkvARTaXMM4RpPgbtp6lqSdGxmHBz4bC1RTnrTxX8HZVPl8R5Ckxuc3ZHQmcvZzzRew
        +SAoUtL29m5YONZweK2lVeIo=
X-Received: by 2002:a17:902:ea08:b0:1c0:a30e:2388 with SMTP id s8-20020a170902ea0800b001c0a30e2388mr17734022plg.31.1693264698546;
        Mon, 28 Aug 2023 16:18:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4PLIDBi9wZuEsVkyH1S0PFnZ5haeuWus0luN/Yrn+a4DV04N4xayoEkUTdP5JJP349iuJ+Q==
X-Received: by 2002:a17:902:ea08:b0:1c0:a30e:2388 with SMTP id s8-20020a170902ea0800b001c0a30e2388mr17733983plg.31.1693264698231;
        Mon, 28 Aug 2023 16:18:18 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902ce8b00b001b53953f306sm7947728plg.178.2023.08.28.16.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 16:18:17 -0700 (PDT)
Date:   Mon, 28 Aug 2023 16:18:16 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v7 22/24] iommu: Add ops->domain_alloc_paging()
Message-ID: <6wbamqxazr3yxu25haul2vcbyt5da5py4i2pemga77pg74knov@htfe53txxkzx>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <22-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:36PM -0300, Jason Gunthorpe wrote:
> This callback requests the driver to create only a __IOMMU_DOMAIN_PAGING
> domain, so it saves a few lines in a lot of drivers needlessly checking
> the type.
> 
> More critically, this allows us to sweep out all the
> IOMMU_DOMAIN_UNMANAGED and IOMMU_DOMAIN_DMA checks from a lot of the
> drivers, simplifying what is going on in the code and ultimately removing
> the now-unused special cases in drivers where they did not support
> IOMMU_DOMAIN_DMA.
> 
> domain_alloc_paging() should return a struct iommu_domain that is
> functionally compatible with ARM_DMA_USE_IOMMU, dma-iommu.c and iommufd.
> 
> Be forwards looking and pass in a 'struct device *' argument. We can
> provide this when allocating the default_domain. No drivers will look at
> this.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 17 ++++++++++++++---
>  include/linux/iommu.h |  3 +++
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

