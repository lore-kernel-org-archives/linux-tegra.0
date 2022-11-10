Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B54C4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Nov 2022 07:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbiKJHKA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Nov 2022 02:10:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232683AbiKJHJ7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Nov 2022 02:09:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2476615A27
        for <linux-tegra@vger.kernel.org>; Wed,  9 Nov 2022 23:09:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B52D061D70
        for <linux-tegra@vger.kernel.org>; Thu, 10 Nov 2022 07:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7C2C433C1;
        Thu, 10 Nov 2022 07:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668064198;
        bh=V7yDfiL6FXOyL8hHuXJBRR5wnNHmetLnLRlaixlcqdY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uB2P9hwAMM01f/49Y+bDwuY972Gp1s7u4u1BdV8jGMGI8zTH+JzwMbYYEa3fm2BZp
         1cEUzyxw5r1Y5vzynJE1GWyUBAkSpqrEBrTBABbMAVLercW1vxWupOlZ/73uzpTAIM
         a+bEtk0SeFxqMv21Wdog3daUzIxjAHskpllCDbVhXHarKGn448kzjsmSs3YqNStuFs
         o4vRTuNvCrsy6ufqdNlJCNra5XEBANI0ehfoDSh190ZhKqeVEI7/8RVOCUcUBYfTwd
         k4K130bY3gh5HIr39CUy7d/4c/N1dBYnckna/61YMbsaGZlL3U6vfqcNGjUpSD8iY2
         TrzTnBg/foQjQ==
Date:   Thu, 10 Nov 2022 12:39:53 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        Jim Lin <jilin@nvidia.com>
Subject: Re: [PATCH] phy: tegra: xusb: Fix crash during pad power on/down
Message-ID: <Y2yjwRUFYQcrOHNT@matsya>
References: <20221010135132.30809-1-jonathanh@nvidia.com>
 <Y0zqKh7B9BaOoREo@matsya>
 <eaf26959-401c-1c82-e95b-9f8a07f189a0@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaf26959-401c-1c82-e95b-9f8a07f189a0@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 07-11-22, 21:27, Jon Hunter wrote:
> Hi Vinod,
> 
> On 17/10/2022 06:37, Vinod Koul wrote:
> > On 10-10-22, 14:51, Jon Hunter wrote:
> > > Commit a88520bfc0ec ("usb: gadget: tegra: Reduce pad power") added calls
> > > to tegra_phy_xusb_utmi_pad_power_on/down in the Tegra XUDC driver to
> > > control the pad power. This change is causing a kernel panic when
> > > powering down the pads on entering suspend with the Jetson TX2 platform.
> > > The panic occurs because the 'xudc->curr_utmi_phy' is not configured on
> > > this platform and we do not check to see if the pointer is valid before
> > > attempting to deference the pointer. Fix this by checking to see if the
> > > 'phy' pointer passed to tegra_phy_xusb_utmi_pad_power_on/down is valid.
> > 
> > Applied, thanks
> > 
> 
> We need this fix for Linux v6.1. The crash is still seen as of v6.1-rc3.

This is in phy/fixes so should be in v6.1 or in linus's tree shortly

-- 
~Vinod
