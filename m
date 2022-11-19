Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3BEC433FE
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Nov 2022 09:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233728AbiKSJjO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 19 Nov 2022 04:39:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233638AbiKSJjN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 19 Nov 2022 04:39:13 -0500
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A87AC7DED9;
        Sat, 19 Nov 2022 01:39:11 -0800 (PST)
Received: from 8bytes.org (p200300c27724780086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7724:7800:86ad:4f9d:2505:dd0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 826D92A02E9;
        Sat, 19 Nov 2022 10:39:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1668850749;
        bh=zWtga/KvubHoJ0zb/2PRxtdqk3xpMDxLeLBasVYUrwA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FZlZRDuyN+NhX9mRTLX2JPwfJ4uclm5XvIJkjNAJU79wu4Hq/3IY1TeLmylQqT7ah
         cc5SxAv5E+AYqJiH2VrFx1xb7hFWa0MM0V7sQHACey0ecJWflrSbR9DMqBiNeOPv0i
         NW61iVgiEYyI0jAUCE5gmS3HknUqctA9UxX+Qx6QNH+N1qdF2PFoVHjz7crH4Huz1c
         8XJuozPRQomKeTf62eMAuF2oa46Qxm8NpdoahKo6zPquj9GtDIyvQUtZ6bYU40g8u8
         OBIv/7DQDTQhu5Cx6FbVW9Sdsagh8DIGw3JOEA/uA9xwcvDEAhaIpwl7eRS1M1P6gD
         E6dwp675GQlWw==
Date:   Sat, 19 Nov 2022 10:39:08 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v11 0/5] iommu: Support mappings/reservations in
 reserved-memory regions
Message-ID: <Y3ikPBFYrSCWB10K@8bytes.org>
References: <20221111161806.630527-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111161806.630527-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 11, 2022 at 05:18:01PM +0100, Thierry Reding wrote:
> Thierry Reding (5):
>   of: Introduce support for #dma-{address,size}-cells
>   of: Introduce of_translate_dma_region()
>   dt-bindings: reserved-memory: Document iommu-addresses
>   iommu: Implement of_iommu_get_resv_regions()
>   iommu: dma: Use of_iommu_get_resv_regions()
> 
>  .../reserved-memory/reserved-memory.yaml      | 73 ++++++++++++++
>  drivers/iommu/dma-iommu.c                     |  3 +
>  drivers/iommu/of_iommu.c                      | 94 +++++++++++++++++++
>  drivers/of/address.c                          | 84 +++++++++++++----
>  drivers/of/base.c                             | 70 +++++++++++---
>  drivers/of/of_private.h                       | 14 ++-
>  include/linux/of.h                            | 17 +++-
>  include/linux/of_address.h                    |  4 +-
>  include/linux/of_iommu.h                      |  8 ++
>  9 files changed, 329 insertions(+), 38 deletions(-)

Despite this lacking some essential reviews, what is the plan with this
code? Should it go through the IOMMU or DT tree?

Regards,

	Joerg
