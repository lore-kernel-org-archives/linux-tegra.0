Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBD0C4320A
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Jul 2021 12:18:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A970861059
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Jul 2021 12:18:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238713AbhG3MSm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 30 Jul 2021 08:18:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:49286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238745AbhG3MSl (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Jul 2021 08:18:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15BF261074;
        Fri, 30 Jul 2021 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627647516;
        bh=xfVOdRGPI0p8bvTjQzrdr1McYn1rjKDlbhisGOum8GE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LuF6zMJ6dfL7TMZBi73lFlpB+FdR+5ckY/pjV8WLSQ2/LyqHdWq0dvO70cpPMyZWI
         NSUbMoem02ehuRZWAWtbz81FG8UnrL5lfaHoicK6rUjZOzJHoQ7Wqwhr0Cx7QvEmce
         HXQ0i02aJvP/UUuMhJINZh9au6V4yWxQdZ4K6mP4B3ECxFtC/EW5neaKcc2p8JjHHk
         Xd6tXq4gIG84qm21e33ubyQ27r6f87nP22O90l7YawT3g2CooarltCyAMlvTB4t1Rw
         d7m/A0QJs2HhBukm4OZCnk6S0mcWK6o90ZiRIuW8V4GWfolJk/ROKaKrh3Id1h4uDh
         HRgkjLMKem9fA==
Date:   Fri, 30 Jul 2021 13:18:31 +0100
From:   Will Deacon <will@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 2/5] iommu: Implement of_iommu_get_resv_regions()
Message-ID: <20210730121831.GD23589@willie-the-truck>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <20210423163234.3651547-3-thierry.reding@gmail.com>
 <bdc42077-d1f3-f561-2e4d-647b5fceb7b6@gmail.com>
 <CAL_Jsq+jSY-OLau3gLPsDL02AYaE_TySOGrd9-tNLFaYvLHZ6A@mail.gmail.com>
 <7f5c8094-6e4f-5a94-2257-1003a78ba92f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f5c8094-6e4f-5a94-2257-1003a78ba92f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Jul 17, 2021 at 02:07:12PM +0300, Dmitry Osipenko wrote:
> 16.07.2021 17:41, Rob Herring пишет:
> > On Fri, Jul 2, 2021 at 8:05 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> >>
> >> 23.04.2021 19:32, Thierry Reding пишет:
> >>> +void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
> >>> +{
> >>> +     struct of_phandle_iterator it;
> >>> +     int err;
> >>> +
> >>> +     of_for_each_phandle(&it, err, dev->of_node, "memory-region", "#memory-region-cells", 0) {
> >>> +             struct iommu_resv_region *region;
> >>> +             struct of_phandle_args args;
> >>> +             struct resource res;
> >>> +
> >>> +             args.args_count = of_phandle_iterator_args(&it, args.args, MAX_PHANDLE_ARGS);
> >>> +
> >>> +             err = of_address_to_resource(it.node, 0, &res);
> >>> +             if (err < 0) {
> >>> +                     dev_err(dev, "failed to parse memory region %pOF: %d\n",
> >>> +                             it.node, err);
> >>> +                     continue;
> >>> +             }
> >>> +
> >>> +             if (args.args_count > 0) {
> >>> +                     /*
> >>> +                      * Active memory regions are expected to be accessed by hardware during
> >>> +                      * boot and must therefore have an identity mapping created prior to the
> >>> +                      * driver taking control of the hardware. This ensures that non-quiescent
> >>> +                      * hardware doesn't cause IOMMU faults during boot.
> >>> +                      */
> >>> +                     if (args.args[0] & MEMORY_REGION_IDENTITY_MAPPING) {
> >>> +                             region = iommu_alloc_resv_region(res.start, resource_size(&res),
> >>> +                                                              IOMMU_READ | IOMMU_WRITE,
> >>> +                                                              IOMMU_RESV_DIRECT_RELAXABLE);
> >>> +                             if (!region)
> >>> +                                     continue;
> >>> +
> >>> +                             list_add_tail(&region->list, list);
> >>> +                     }
> >>> +             }
> >>> +     }
> >>> +}
> >>> +EXPORT_SYMBOL(of_iommu_get_resv_regions);
> >>
> >> Any reason why this is not EXPORT_SYMBOL_GPL? I'm curious what is the
> >> logic behind the OF symbols in general since it looks like half of them
> >> are GPL.
> > 
> > Generally, new ones are _GPL. Old ones probably predate _GPL.
> > 
> > This one is up to the IOMMU maintainers.
> 
> Thank you.

I prefer EXPORT_SYMBOL_GPL(). That's aligned with the symbols exported by
iommu.c, with the *single* exception of generic_iommu_put_resv_regions(),
which I think should be changed to _GPL() as well.

Will
