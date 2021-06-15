Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02884C48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 18:21:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3764613CC
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 18:21:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbhFOSXp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 14:23:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:39490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230349AbhFOSXp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 14:23:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE9E6610CD;
        Tue, 15 Jun 2021 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623781300;
        bh=SzyNItewNDf3JLfbNaHGlLNTLLwcqD7llt2uApYwFsc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p0dXbmARm2inTC1UzBTVZL0vHWS1a7A8WbWw5Ya+27l1H/AVxTX/AIUi8BNa2m69S
         WldU9ZaDX171o/gB051qQ6RYH6l3R5QoMEvO39E8xySUu+8rbSZA58KJktl2Kydm+0
         Ib5HqF2tEQmKvQoRWiQVGghg2pqwlk0Gc/ZlMQchF7PnelhopV3rLUdX64WF6z8yzP
         OXPLyHlbMxxfXE+ZMol8ZfV4RvHEaQY1GLEsRHREhGsms+hkI98ImehNq/tQ27X3z1
         w4PHNaztggl49onc3oECs14PoZF8XmiU4ZYXVpVhKKqLOx77QVBnj7IPXYvCB9blnb
         cVAsZBHbBhvYg==
Date:   Tue, 15 Jun 2021 19:21:35 +0100
From:   Will Deacon <will@kernel.org>
To:     Krishna Reddy <vdumpa@nvidia.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/9] iommu/arm-smmu: Implement ->probe_finalize()
Message-ID: <20210615182135.GA21481@willie-the-truck>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
 <20210603164632.1000458-4-thierry.reding@gmail.com>
 <CGME20210615180133eucas1p2563c2a173eca1fb5a1c5ccf654c23778@eucas1p2.samsung.com>
 <46e65ade-49cb-5437-5863-1f11ccc2205e@samsung.com>
 <BY5PR12MB376468558EB3330D64758210B3309@BY5PR12MB3764.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR12MB376468558EB3330D64758210B3309@BY5PR12MB3764.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 15, 2021 at 06:12:13PM +0000, Krishna Reddy wrote:
> > if (smmu->impl->probe_finalize)
> 
> The above is the issue. It should be updated as below similar to other instances impl callbacks.
> if (smmu->impl && smmu->impl->probe_finalize)

I'll push a patch on top shortly...

Will
