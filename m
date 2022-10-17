Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BE4C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Oct 2022 05:37:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJQFhz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Oct 2022 01:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiJQFhy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Oct 2022 01:37:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7789B4D4CF
        for <linux-tegra@vger.kernel.org>; Sun, 16 Oct 2022 22:37:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1F68DB80E88
        for <linux-tegra@vger.kernel.org>; Mon, 17 Oct 2022 05:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40FCAC433D6;
        Mon, 17 Oct 2022 05:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665985070;
        bh=l82/GTBkohY3ZdHf/rjfVba1i2r1OPoKfMNAHu+bjqA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GwrSM0rVJ7HY+i4wSl5aLapJJJZgZjRAlcEVPMSVmjGRRyc7/mTNvEt8ohkGapKjy
         P5/lAlHfVBcVyiZ1boyRdtZajW0YK2VvN7ZFHq0thNW0ksiODzE9F6+wWMvtgnzr8G
         jytacvPLcaxw3t0Dm5uRAhV4lRYZEbxyuPRLI9sYxXBa0hOCdKW5zdAUenR1uRfwX9
         ZYZHXCxadzqvpOELQ2u3VVQSXURsb1OIhEmkzZ8TVmbfnIKKuxCIJJDHHaRP2xyEV+
         8EP0bNB+LRGylh5kItcILDu//3z31LzJobi9dV5IxafO9Npi/gM8OzALrqeC3YbWKm
         vgdrLU4CfY35w==
Date:   Mon, 17 Oct 2022 11:07:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        Jim Lin <jilin@nvidia.com>
Subject: Re: [PATCH] phy: tegra: xusb: Fix crash during pad power on/down
Message-ID: <Y0zqKh7B9BaOoREo@matsya>
References: <20221010135132.30809-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010135132.30809-1-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10-10-22, 14:51, Jon Hunter wrote:
> Commit a88520bfc0ec ("usb: gadget: tegra: Reduce pad power") added calls
> to tegra_phy_xusb_utmi_pad_power_on/down in the Tegra XUDC driver to
> control the pad power. This change is causing a kernel panic when
> powering down the pads on entering suspend with the Jetson TX2 platform.
> The panic occurs because the 'xudc->curr_utmi_phy' is not configured on
> this platform and we do not check to see if the pointer is valid before
> attempting to deference the pointer. Fix this by checking to see if the
> 'phy' pointer passed to tegra_phy_xusb_utmi_pad_power_on/down is valid.

Applied, thanks

-- 
~Vinod
