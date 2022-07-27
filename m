Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA6FC04A68
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jul 2022 10:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbiG0K6I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jul 2022 06:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbiG0K6F (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jul 2022 06:58:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E95D48C9F;
        Wed, 27 Jul 2022 03:58:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1E305618C1;
        Wed, 27 Jul 2022 10:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E952C433C1;
        Wed, 27 Jul 2022 10:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1658919483;
        bh=8zvjoYn3iaPSAV/n1nrhAfFVcbmaZQTSCwUK6lTktII=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cCgoaxMeh5iovE14Rg9ny5zVHEhU8GsO5vxuJq4lA9ZuQyC7my8FGyQQQ27bDoh/z
         YvWXaq0pEGLcSg9b4atRtAfSTY8sjPjO7mG+ia+F06C95V9vwiJ2alA+ox6yB/Yfpr
         iq/Ms1PurOCCyxdV146ZIcoiCBA/SR4jei9SJwk8=
Date:   Wed, 27 Jul 2022 12:58:00 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jim Lin <jilin@nvidia.com>
Cc:     jckuo@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, balbi@kernel.org, vkoul@kernel.org,
        mathias.nyman@intel.com, Allie Liu <alliel@nvidia.com>
Subject: Re: [PATCH] xhci: tegra: USB2 pad power controls
Message-ID: <YuEaOGP/AaUKimFg@kroah.com>
References: <20220727105314.14681-1-jilin@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727105314.14681-1-jilin@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jul 27, 2022 at 06:53:14PM +0800, Jim Lin wrote:
> Program USB2 pad PD controls during port
> connect/disconnect, port suspend/resume etc
> as suggested by HW to reduce power consumption.

You do have a full 72 columns to use :)

And this does not explain what this commit does at all, or why we would
want to take it.  Please read the kernel documentation for how to write
a good changelog commit.

> Squash following fixes from local kernel 4.9 to this commit:
> ce4e7e5 usb: host: tegra: Power on utmi pads
> 3a10c61 usb: tegra: Program USB2 pad PD controls
> 4e62fbb xhci: tegra: move pad power on to non-atomic place
> ed0fb0a usb: xhci: tegra: don't use hs_pls in xhci-iov
> 401801a usb: xhci: add USB2 pad PD control for Test Mode

This makes no sense, as these commits are not in our kernel tree at all.

Also they are not even in the correct format, if we were to take them
(hint, you need to fix your development process to not take lines like
this.)



> 
> Signed-off-by: Allie Liu <alliel@nvidia.com>
> Signed-off-by: Jim Lin <jilin@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra186.c   |  27 +++--
>  drivers/phy/tegra/xusb.c            |  32 +++++-
>  drivers/phy/tegra/xusb.h            |   4 +-
>  drivers/usb/gadget/udc/tegra-xudc.c |   8 +-
>  drivers/usb/host/xhci-hub.c         |   2 +
>  drivers/usb/host/xhci-tegra.c       | 146 +++++++++++++++++++++++++++-
>  include/linux/phy/tegra/xusb.h      |   4 +-
>  7 files changed, 209 insertions(+), 14 deletions(-)

Are you sure you want to touch all of these files in a single commit?
Why not submit a patch series?

thanks,

greg k-h
