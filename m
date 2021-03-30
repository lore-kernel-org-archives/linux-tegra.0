Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90DEC433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 14:24:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A54A4619CE
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 14:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhC3OYJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 10:24:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:48270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231623AbhC3OXh (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 10:23:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23933619C8;
        Tue, 30 Mar 2021 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617114217;
        bh=5M2yquBBhiLOCTGF5f2g2d6BfrScvdQstqJq4iBUW4k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SlmOX/BM7xUXgpNG4rww+7aN+rGDiGfKqmW77POT8KkwCl8Ed0VgKMjbJN9R/R6WU
         O2IdwUQv359wKtHBCbibVKep0hhbo8BQmWA0k0FT2o3GJCPXdxFKzEhP/1Ya8KjsVH
         hp1rQJTnVneQiCGsdOztaNgsmHDXUTmIc4SGRKEGlRT8QPE4xLyjR/vCdp3Mgcx0wB
         tGP2D+KjRdClVoPj7owA9ni94LwLNRG1otLVWflae8UrpAkcVWB/moIYQUpKNhgJnH
         DpMa76lfSpqOBcSqLVyfq4kzm71bje1RcRJioH4t5fo459FAtilVx5Yax3jOcmICGP
         e6Ut/cmcWb62g==
Date:   Tue, 30 Mar 2021 19:53:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 06/13] phy: tegra: xusb: Add sleepwalk and
 suspend/resume
Message-ID: <YGM0ZOroZolJ9zEC@vkoul-mobl.Dlink>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-7-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325164057.793954-7-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25-03-21, 17:40, Thierry Reding wrote:
> From: JC Kuo <jckuo@nvidia.com>
> 
> This commit adds sleepwalk/wake and suspend/resume interfaces
> to Tegra XUSB PHY driver.
> 
> Tegra XUSB host controller driver makes use of sleepwalk functions
> to enable/disable sleepwalk circuit which is in always-on partition
> and can respond to USB resume signals when controller is not powered.
> Sleepwalk can be enabled/disabled for any USB UPHY individually.
> 
>   - tegra_xusb_padctl_enable_phy_sleepwalk()
>   - tegra_xusb_padctl_disable_phy_sleepwalk()
> 
> Tegra XUSB host controller driver makes use of wake functions to
> enable/disable/query wake circuit which is in always-on partition
> can wake system up when USB resume happens.
> Wake circuit can be enabled/disabled for any USB PHY individually.
> 
>   - tegra_xusb_padctl_enable_phy_wake()
>   - tegra_xusb_padctl_disable_phy_wake()
>   - tegra_xusb_padctl_remote_wake_detected()
> 
> This commit also adds two system suspend stubs that can be used to
> save and restore XUSB PADCTL context during system suspend and
> resume.
>   - tegra_xusb_padctl_suspend_noirq()
>   - tegra_xusb_padctl_resume_noirq()

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
