Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA51C63777
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 11:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74053206E5
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 11:04:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlCdrz+d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbgKYLD4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Nov 2020 06:03:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:34168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726802AbgKYLDz (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Nov 2020 06:03:55 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9975320665;
        Wed, 25 Nov 2020 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606302235;
        bh=CzEeT5Xh6gcRrt1T4vSx7QTc/WixV1DBolwFwAp6bHw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nlCdrz+d2NL2ohysbnzrEpzCD/t0Ptpr3tblxV1jjz6Xr+acDgEE2w0CVhQKttNCF
         YStajaMO1kwITjvtHTf5DbOlhiPnWkezXACcJWKiRf4yUhr8qr1ih0FX6XxIMKbAd2
         Y1ntdcbddrRnEXNqjVw5J5QQHtrlsnefd6RwfoRY=
Date:   Wed, 25 Nov 2020 11:03:50 +0000
From:   Will Deacon <will@kernel.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com, thierry.reding@gmail.com, joro@8bytes.org
Subject: Re: [PATCH RESEND v2 0/5] iommu/tegra-smmu: Some pending reviewed
 changes
Message-ID: <20201125110349.GA15239@willie-the-truck>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125101013.14953-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 25, 2020 at 02:10:08AM -0800, Nicolin Chen wrote:
> Changelog
> v1->v2:
>  * Added Thierry's acks to PATCH-3~5
> 
> This is a merged set of resend for previously two series of patches
> that were reviewed/acked a month ago yet have not got applied.

Thanks, and sorry I missed these (I'm doing my best). I'll queue the
lot for 5.11.

Will
