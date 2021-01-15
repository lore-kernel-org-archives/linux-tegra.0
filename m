Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F90CC433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 05:58:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E4D3239EF
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 05:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbhAOF5o (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 00:57:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:49886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbhAOF5o (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 00:57:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71192239EF;
        Fri, 15 Jan 2021 05:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610690223;
        bh=1nmZ8i/8wKH8oPQ6+f5znp4ICppZYRDs4o+6s2h3Rkk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NkedOrMRk3+x5MdhLl0BdjJjI00H3c81J1AdjoLI9T0/htTxpXmPsnN2dUHJ0MIEj
         4wHCxCxwz+F8M7GzrY2XYeURGOSQAGs1/0Y81b/sQY2jyy+NjyVD3yIjL+CJPVwgZL
         rsBcT3LA0kDKFd7n3xrtoNSwOFvCKUqtztFnIDxq3mLw+p0jyXA9qtNQEdun98+Xwq
         A6caIjQmAOPVIEmsHszxl08o3cbJt/8FzRWzGbMvsFOKL48S2pp2EOckZR9qLjb1mg
         Krs3XUrVvKSUlz72FhyPgobsRjfgrKz+NloQ9V4jelbdejG3nGYcmyxxMfPKAMWREl
         kwx9c3/ezRunA==
Date:   Fri, 15 Jan 2021 11:26:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rajesh Gumasta <rgumasta@nvidia.com>, ldewangan@nvidia.com,
        dan.j.williams@intel.com, thierry.reding@gmail.com,
        p.zabel@pengutronix.de, dmaengine@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        kyarlagadda@nvidia.com
Subject: Re: [Patch v2 0/4] Add Nvidia Tegra GPC-DMA driver
Message-ID: <20210115055658.GD2771@vkoul-mobl>
References: <1596699006-9934-1-git-send-email-rgumasta@nvidia.com>
 <2a99ca73-a6e8-bf7d-a5c1-fa64eee62e23@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a99ca73-a6e8-bf7d-a5c1-fa64eee62e23@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 14-01-21, 10:11, Jon Hunter wrote:
> 
> On 06/08/2020 08:30, Rajesh Gumasta wrote:
> > Changes in patch v2:
> > Addressed review comments in patch v1
> 
> 
> Is there any update on this series? Would be good to get this upstream.

Not sure why, this is is not in my queue, can someone please resend this
to me

Thanks
-- 
~Vinod
