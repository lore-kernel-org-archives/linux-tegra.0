Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199A7C27C76
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 10:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235659AbjAYKvb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 05:51:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235696AbjAYKvL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 05:51:11 -0500
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B83D577C3;
        Wed, 25 Jan 2023 02:50:25 -0800 (PST)
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 3F79E262E65;
        Wed, 25 Jan 2023 11:48:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1674643736;
        bh=5SL4DTtyHd1dtmHSOYztGo95/xwXVAuXLfnPFWLBLU8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iN8WLFd4HYO/ivj04aBr/wZV8kOcHhSACBed49v1QjufeQeYLTn0UF3tlyxTEjv6S
         OS/YOsdcZCUO3jKLzA+mtnBPnYsO0gLGL5T2neFycITQkSGDJNmnq3KJX831qgwuT4
         /UDNUsNNhs8zGyk7Msbj+y4dDizBksVjrCR7AFKkMPe1d9bSOrBRND8wFFGCQVqHFL
         Oy7Evgv+Lgqhqm3oOSWmSyUx1amtK21gLyyDGLRc9YB0rLs57RQtperCKhh4pCn78f
         bpo6kUBUIp+XPPiACWFk7rXMnMHJqsLZcHUevzTXHDQaL4QKZ7EJFxTXu1rKlMHztv
         18/GhS0GlmKwQ==
Date:   Wed, 25 Jan 2023 11:48:55 +0100
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
Subject: Re: [PATCH v13 0/4] iommu: Support mappings/reservations in
 reserved-memory regions
Message-ID: <Y9EJF/BwP+JPTxyO@8bytes.org>
References: <20230120174251.4004100-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120174251.4004100-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 20, 2023 at 06:42:47PM +0100, Thierry Reding wrote:
> Thierry Reding (4):
>   of: Introduce of_translate_dma_region()
>   dt-bindings: reserved-memory: Document iommu-addresses
>   iommu: Implement of_iommu_get_resv_regions()
>   iommu: dma: Use of_iommu_get_resv_regions()
> 
>  .../reserved-memory/reserved-memory.yaml      | 89 +++++++++++++++++-
>  drivers/iommu/dma-iommu.c                     |  3 +
>  drivers/iommu/of_iommu.c                      | 94 +++++++++++++++++++
>  drivers/of/address.c                          | 41 ++++++++
>  include/linux/of_address.h                    |  2 +
>  include/linux/of_iommu.h                      |  8 ++
>  6 files changed, 233 insertions(+), 4 deletions(-)

Applied for 6.3, thanks.
