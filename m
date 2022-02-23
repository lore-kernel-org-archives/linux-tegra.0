Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F80C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Feb 2022 06:36:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236337AbiBWGhI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Feb 2022 01:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233316AbiBWGhH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Feb 2022 01:37:07 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF73F62E6;
        Tue, 22 Feb 2022 22:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=/iX0wAICLVMEM1N1QRmtagYvAxCkv3rP8cMN2xrU/F0=; b=1LSr7rAmQ8gLIePxkwSjmV52zI
        XxP3kWpPZm1/Ue2ppNdJud+IF3UugAVr8sazajGI9MK1YPeWEFbPVj+tHDjbGjiWeI1DEn43JFOm5
        kzpXI8vFDze19m1HGhImheK14zjFW2ESUV6xf9yVntJ5gB65BjhRNrQ66MCfkjyIqcFZtySp67xYG
        8Oeo0T5B28wYJObsGTz2dkUGXWpYRjo5CVp6A75OQNMMmtUJMefGhUdJBRknxp23/LwLchfBhZ1na
        RAxXD+FYJNRPAfXGpipRMirKlxOqANGEniZWMh/trLFa+bkaL5qxp9qf8aHyzfkymn8Ilg0Tj8Okc
        DEixtwzA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nMlGJ-00CzV0-8q; Wed, 23 Feb 2022 06:36:31 +0000
Date:   Tue, 22 Feb 2022 22:36:31 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
        will@kernel.org, robh+dt@kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/9] gpu: host1x: Add context bus
Message-ID: <YhXV7x+MzE6yQ4J8@infradead.org>
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-3-mperttunen@nvidia.com>
 <YhUNiHiYdQfxJybk@infradead.org>
 <c0dee650-df1c-4fad-aa97-fb9eab03f3a2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0dee650-df1c-4fad-aa97-fb9eab03f3a2@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Feb 22, 2022 at 09:30:30PM +0000, Robin Murphy wrote:
> > But the pattern that this copies in arm_smmu_bus_init is really
> > ugly.  I think we need to figure out a way todo that without having
> > to export all the low-level bus types.
> 
> Yup, as it happens that was the first step on my mission :)
> 
> https://gitlab.arm.com/linux-arm/linux-rm/-/commits/iommu/bus
> 
> Still a way to go with the main meat of that work, though, so I was figuring
> this could probably land as-is and I'll sweep it up in due course.

Yes, that part looks very nice.  It would be great to get that merged
ASAP.
