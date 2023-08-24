Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F70C7EE2C
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Aug 2023 03:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239650AbjHXDmq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Aug 2023 23:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239657AbjHXDm2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Aug 2023 23:42:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA4010C4
        for <linux-tegra@vger.kernel.org>; Wed, 23 Aug 2023 20:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692848505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CH6mXKRKMtD7TEsSEIJfvoLTAwKYFLojoxw+I3lfT8w=;
        b=I4kDFujAOgWWAOl0aUYsz5otZMn5Bz4nKwZZ1ysZ3QZDYN4aESBvifOmT2ecq345K2Jw3N
        0QhzFTWfH85QV2HV6MEkDNBk/50VH7m80QmTkYJXprdvrgpCTo8Kv5/bHTku6asZSU5w1c
        eweqoLnMePh71KUIs7LhK+iYjk7VSRY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265--E8o2TA4OGGldO6IJRRH5A-1; Wed, 23 Aug 2023 23:41:44 -0400
X-MC-Unique: -E8o2TA4OGGldO6IJRRH5A-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-411f7e77b44so10750721cf.3
        for <linux-tegra@vger.kernel.org>; Wed, 23 Aug 2023 20:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692848503; x=1693453303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH6mXKRKMtD7TEsSEIJfvoLTAwKYFLojoxw+I3lfT8w=;
        b=SeAc0ZUEQ48TYM4qi0yToOAgPqku+ziSWIALJ7ol3wfahw/gNtPKBcqiqZqDy9VOvU
         jS/ou38ahirhKv4lNtvV1IyvBTorNsMW/KMcB7OAfT01B1ap1o0inguDgm8wzMoqM3+5
         YoPChojtFcPNq4kfqAnlw+OB6T15arAWKgRQmsfY+R/Um0hQfhpd/Tj51NH5b8MA1OW3
         PwIouIUbOXycHkdR9lyzZpdjgb2bf3NYViOLkbQAL2kZomz623ybltj5+VHADFJazTCc
         U85jAWETPYODGCRFNvKFbr4gPCwDPeMnJ8Zfnj/QIkOFlu5jvVt2JlrnrNbeiKI8rayU
         tEjw==
X-Gm-Message-State: AOJu0YwIyhDN/xh+g6i4hhDA3m/Bgv+RQcy+CNnB/SaSRMfISOX56Ekj
        tuJTzEaWbRcBu1WKF2U7ilx0M2GAq2ffT2kBuYfqsCHySSM9XVh0rWyP5XCvzrOM4LB9p9FoYfp
        ONzO/vkUAiuTKD/oRG3+5+w4=
X-Received: by 2002:a05:622a:1a19:b0:410:8551:2608 with SMTP id f25-20020a05622a1a1900b0041085512608mr13211941qtb.58.1692848503536;
        Wed, 23 Aug 2023 20:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHjWv1CiL8QEOPMtXQgjOpwEGJSl7biyyoMP2HI5INen9hHlXD9XV1I7hmZP4s4Z/4tJVc6A==
X-Received: by 2002:a05:622a:1a19:b0:410:8551:2608 with SMTP id f25-20020a05622a1a1900b0041085512608mr13211932qtb.58.1692848503326;
        Wed, 23 Aug 2023 20:41:43 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id s26-20020a0cb31a000000b006375f9fd170sm5116337qve.34.2023.08.23.20.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 20:41:42 -0700 (PDT)
Date:   Wed, 23 Aug 2023 20:41:41 -0700
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
Subject: Re: [PATCH v7 01/24] iommu: Add iommu_ops->identity_domain
Message-ID: <r362pqn2venwjut7ernpzbxnc72kvknshxeobrvkvp7p5m554e@7jnu4wja663k>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <1-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:15PM -0300, Jason Gunthorpe wrote:
> This allows a driver to set a global static to an IDENTITY domain and
> the core code will automatically use it whenever an IDENTITY domain
> is requested.
> 
> By making it always available it means the IDENTITY can be used in error
> handling paths to force the iommu driver into a known state. Devices
> implementing global static identity domains should avoid failing their
> attach_dev ops.
> 
> To make global static domains simpler allow drivers to omit their free
> function and update the iommufd selftest.
> 
> Convert rockchip to use the new mechanism.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>


Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

