Return-Path: <SRS0=qFEE=EE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A18AC5517A
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 01:03:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B446B20790
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 01:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603933379;
	bh=wi60DUmBasvkrdwMnI8cRmwBCRNGm+pnOQNKuJ3XgsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ijuXqSG6uU289DGtOOb3JADDvUyWGQqg2NHUluxN9YV3kzl6f2mWihVoUPmO8RJT/
	 CFEgEs1gzlUpoyUYYeDYSHzkX5zEUkQm9vf1ysZxCC1fyftF36+e1qRj6bRbFJgr76
	 2XF5pu1LdSmwO7P5Td3/FeLsLsPtpACjveUmyPyw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbgJ1WMe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:12:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:56454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730826AbgJ1WMX (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Oct 2020 18:12:23 -0400
Received: from localhost (unknown [122.171.163.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A21A24791;
        Wed, 28 Oct 2020 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603901555;
        bh=wi60DUmBasvkrdwMnI8cRmwBCRNGm+pnOQNKuJ3XgsU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p+MR2HtmXwm3v1MojdI+nBLwUoZ0MLMTDe2zIs3v62T6VGCx/0RfHCBu3N9mm6d7V
         N0bq50sKvZlIlolY/SY2qtbmmxgFOq9L5AsNTmnPV+fI6OrbNE5eLbHMtugPd2PPpv
         9Z1YHVTuum/h/3FXBM1FXKQp3J3lrUIFz6bZW3rI=
Date:   Wed, 28 Oct 2020 21:42:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        JC Kuo <jckuo@nvidia.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] phy: tegra: xusb: Fix dangling pointer on probe failure
Message-ID: <20201028161230.GS3550@vkoul-mobl>
References: <20201013095820.311376-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013095820.311376-1-maz@kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 13-10-20, 10:58, Marc Zyngier wrote:
> If, for some reason, the xusb PHY fails to probe, it leaves
> a dangling pointer attached to the platform device structure.
> 
> This would normally be harmless, but the Tegra XHCI driver then
> goes and extract that pointer from the PHY device. Things go
> downhill from there:

Applied, thanks

-- 
~Vinod
