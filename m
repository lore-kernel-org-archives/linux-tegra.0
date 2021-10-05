Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8793C433FE
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 11:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C20E611F0
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 11:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbhJELIj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Oct 2021 07:08:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:45708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233881AbhJELIj (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 5 Oct 2021 07:08:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9359A61181;
        Tue,  5 Oct 2021 11:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633432009;
        bh=TzrIPxcsGexRZuowd5yTFey66W3I5CCoUeggTOGay6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b5fVzLxaSZ3klmbMRr0tM4gu7NkccL54t77pbne4+SMXm5sgsHG2c5ZJsSUeGgrx/
         m4xSKL/iZ9YOW/qdpR49jmlMLq0AkpDiYz6Bnj8kolU78zuhhQ7zn5rYYX073HU1ss
         0wz7XcMexaTfVpemyW2D9lrsvPUavYdZ2ESqzdhA=
Date:   Tue, 5 Oct 2021 13:06:47 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RESEND] usb: xhci: tegra: mark PM functions as
 __maybe_unused
Message-ID: <YVwxxywC5iSGSaXM@kroah.com>
References: <20210927142258.1863321-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927142258.1863321-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 27, 2021 at 04:22:52PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The added #ifdefs in the PM rework were almost correct, but still
> cause warnings in some randconfig builds:
> 
> drivers/usb/host/xhci-tegra.c:2147:12: error: 'tegra_xusb_resume' defined but not used [-Werror=unused-function]
>  2147 | static int tegra_xusb_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~
> drivers/usb/host/xhci-tegra.c:2105:12: error: 'tegra_xusb_suspend' defined but not used [-Werror=unused-function]
>  2105 | static int tegra_xusb_suspend(struct device *dev)
> 
> Replace the #ifdef checks with simpler __maybe_unused annotations to
> reliably shut up these warnings.
> 
> Fixes: d64d362f1d8b ("usb: xhci: tegra: Enable ELPG for runtime/system PM")

What tree does this commit come in from?  I don't see it in my usb tree
:(

thanks,

greg k-h
