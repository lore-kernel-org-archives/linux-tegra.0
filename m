Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4CEC07E9A
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 10:52:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 281E561363
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 10:52:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhGNKzS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jul 2021 06:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhGNKzR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 06:55:17 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28BFAC06175F;
        Wed, 14 Jul 2021 03:52:26 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 753AD352; Wed, 14 Jul 2021 12:52:24 +0200 (CEST)
Date:   Wed, 14 Jul 2021 12:52:23 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] iommu/tegra-smmu: Change debugfs directory name
Message-ID: <YO7B56Mkz3kx5U5Q@8bytes.org>
References: <20210712001341.11166-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712001341.11166-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jul 12, 2021 at 03:13:41AM +0300, Dmitry Osipenko wrote:
> -	err = iommu_device_sysfs_add(&smmu->iommu, dev, NULL, dev_name(dev));
> +	err = iommu_device_sysfs_add(&smmu->iommu, dev, NULL, "smmu");

Are you sure no one is relying on the old name so that this change
breaks ABI? Also this change means that there is always be only one SMMU
per system. Is that guaranteed too?

Regards,

	Joerg
