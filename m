Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8B4C8301A
	for <linux-tegra@archiver.kernel.org>; Mon, 30 Nov 2020 15:38:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB40520855
	for <linux-tegra@archiver.kernel.org>; Mon, 30 Nov 2020 15:38:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJNutTEN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbgK3PiK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 30 Nov 2020 10:38:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:43516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728156AbgK3PiI (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Nov 2020 10:38:08 -0500
Received: from localhost (unknown [122.171.214.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9140020725;
        Mon, 30 Nov 2020 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606750647;
        bh=17KfgSyzR01zJgRuyyJ5oyibbOOrqhUpARQ2iG03vzQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TJNutTENGTfuQZKw+RIkJji45vVDS0Hs2s8Pj9ywQt1eR04niSRjPljQh+4gAV2r9
         6HAB/eBcla8On1Epw0kdke1h56rbDGFn7QSaGzP9OIVZpJwakNOxhw/NZU+pXhSDfn
         t5E8q4ZfpimAViGKrVNf0/MSERKyv2wEwK8yngnA=
Date:   Mon, 30 Nov 2020 21:07:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     kishon@ti.com, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        nkristam@nvidia.com
Subject: Re: [PATCH v1] phy: tegra: xusb: Fix usb_phy device driver field
Message-ID: <20201130153722.GU8403@vkoul-mobl>
References: <20201117083803.185209-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117083803.185209-1-jckuo@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17-11-20, 16:38, JC Kuo wrote:
> In commit "phy: tegra: xusb: Add usb-phy support", an OTG capable PHY
> device, such as phy-usb2.0 device of Jetson-TX1 platform, will be
> bound to the tegra-xusb-padctl driver by the following line in
> tegra_xusb_setup_usb_role_switch().
> 
> 	port->usb_phy.dev->driver = port->padctl->dev->driver;
> 
> With this, dev_pm_ops set of tegra-xusb-padctl driver will be invoked
> for the OTG capable PHY incorrectly as below logs show.
> 
> This commit fixes the issue by assigning an empty driver to it.

Applied, thanks

-- 
~Vinod
