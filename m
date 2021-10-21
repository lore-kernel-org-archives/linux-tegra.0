Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C437BC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 22:14:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3FB461251
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 22:14:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhJUWQh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 18:16:37 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:61880 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231652AbhJUWQh (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 18:16:37 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Hb1wq0xsJz5Y;
        Fri, 22 Oct 2021 00:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1634854459; bh=jb8CLRE8zqbQSvTsN+g6tjnxPfYf6JUnbcaeDcYmEF4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bYc3cG3zcwCYjEL6BKsrl3lUuycBFrUocEaSRSXxaSKRegrF5lgFFmHxk/l7FF7+y
         oOINatm7SrCu6AwMPC3Y7ANlZeowMCuecDZpVoQlla7mw8ZNROSawo6n7gDFh2XC6b
         zOfr3fIsoiDOWM1fNYJbn0S+wUF3yigNXUoFwiOioTtiwHP6R7P+H8mg8ajW6UP9Ex
         wV+dwUF0dTQ6mOlKInfH0168KXmF2aN7kaeBPqoBuHDHCkxSBAAkmu+xJ6Qk8WXqvi
         xKhOzzozN5egnZwSx6m3AZx4pKoeMKzof4qQjsvGKnOyRcVf30JnpvQmzs694GFwAe
         +vO8uSokLpW6w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date:   Fri, 22 Oct 2021 00:14:17 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] usb: xhci: tegra: Check padctrl interrupt presence in
 device tree
Message-ID: <YXHmOT+inPg7as0x@qmqm.qmqm.pl>
References: <20211021115501.14932-1-digetx@gmail.com>
 <YXHdoFAgGlxoI0Jx@qmqm.qmqm.pl>
 <29b38423-631e-192e-b006-aa0d258c8030@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29b38423-631e-192e-b006-aa0d258c8030@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 22, 2021 at 12:46:23AM +0300, Dmitry Osipenko wrote:
> 22.10.2021 00:37, Michał Mirosław пишет:
> > On Thu, Oct 21, 2021 at 02:55:01PM +0300, Dmitry Osipenko wrote:
> >> Older device-trees don't specify padctrl interrupt and xhci-tegra driver
> >> now fails to probe with -EINVAL using those device-trees. Check interrupt
> >> presence and disallow runtime PM suspension if it's missing to fix the
> >> trouble.
> > [...]
> >> --- a/drivers/usb/host/xhci-tegra.c
> >> +++ b/drivers/usb/host/xhci-tegra.c
> >> @@ -1454,10 +1454,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
> >>  		goto put_padctl;
> >>  	}
> >>  
> >> -	tegra->padctl_irq = of_irq_get(np, 0);
> >> -	if (tegra->padctl_irq <= 0) {
> >> -		err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
> >> -		goto put_padctl;
> >> +	/* Older device-trees don't specify padctrl interrupt */
> >> +	if (of_property_read_bool(np, "interrupts")) {
> > 
> > Does this catch "interrupts-extended"?
> 
> No, Tegra doesn't use interrupts-extended.

I believe it is generic and equivalent to "interrupt-parent" +
"interrupts" properties, so people might as well put this in
the DT to save (or loose) a few bytes.

You could just check if of_irq_get() returned -EINVAL instead of
matching "interrupts" property.

Best Regards
Michał Mirosław
