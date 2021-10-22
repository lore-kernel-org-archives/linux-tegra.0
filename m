Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BC4C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Oct 2021 09:29:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6FA3610C8
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Oct 2021 09:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbhJVJbf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Oct 2021 05:31:35 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:15223 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232180AbhJVJbf (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Oct 2021 05:31:35 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4HbJvc0x0Wz6R;
        Fri, 22 Oct 2021 11:29:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1634894956; bh=pO7i9ULJaHjN7Sqq1IpXShYJlA593nOcfY3JYM6OVAs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DKWyg0Epb+SVdZ7mIDsKvEJcLVkECMqCT27G7la/+wSYZ08jj8CTDC/WXRHhL9RX9
         pjObxLxUvA5KihuE5ra/2BTIhmGZYxmSP/KK8VlRyZR9Scf9l7Rip4GD55DbvyHefu
         oi0Ep7s/x/5qvUBKZOIeQaC/kaP2wfVLAPkd/zCAmCUxch4MOcXHfOGcYtuUnpPfiP
         iJN+uo0r938ib1HCaPuSYPp1xH//J2Bn8M6pD3y32V/kqceLg7eZ0qwRV+uYS5IgFb
         hZH7LLC436hZP1UZded1eFWuCFKQZLZFOtxQg/IdkV/c/nKpBfH82v4mQWITCj4egq
         VxNZVq/jm54AQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date:   Fri, 22 Oct 2021 11:29:11 +0200
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
Message-ID: <YXKEZyweVxvNyl8K@qmqm.qmqm.pl>
References: <20211021115501.14932-1-digetx@gmail.com>
 <YXHdoFAgGlxoI0Jx@qmqm.qmqm.pl>
 <29b38423-631e-192e-b006-aa0d258c8030@gmail.com>
 <YXHmOT+inPg7as0x@qmqm.qmqm.pl>
 <0a48c38e-1841-0dc9-473e-5dbe67ce04d5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a48c38e-1841-0dc9-473e-5dbe67ce04d5@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 22, 2021 at 08:58:02AM +0300, Dmitry Osipenko wrote:
> 22.10.2021 01:14, Michał Mirosław пишет:
> > On Fri, Oct 22, 2021 at 12:46:23AM +0300, Dmitry Osipenko wrote:
> >> 22.10.2021 00:37, Michał Mirosław пишет:
> >>> On Thu, Oct 21, 2021 at 02:55:01PM +0300, Dmitry Osipenko wrote:
> >>>> Older device-trees don't specify padctrl interrupt and xhci-tegra driver
> >>>> now fails to probe with -EINVAL using those device-trees. Check interrupt
> >>>> presence and disallow runtime PM suspension if it's missing to fix the
> >>>> trouble.
> >>> [...]
> >>>> --- a/drivers/usb/host/xhci-tegra.c
> >>>> +++ b/drivers/usb/host/xhci-tegra.c
> >>>> @@ -1454,10 +1454,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
> >>>>  		goto put_padctl;
> >>>>  	}
> >>>>  
> >>>> -	tegra->padctl_irq = of_irq_get(np, 0);
> >>>> -	if (tegra->padctl_irq <= 0) {
> >>>> -		err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
> >>>> -		goto put_padctl;
> >>>> +	/* Older device-trees don't specify padctrl interrupt */
> >>>> +	if (of_property_read_bool(np, "interrupts")) {
> >>>
> >>> Does this catch "interrupts-extended"?
> >>
> >> No, Tegra doesn't use interrupts-extended.
> > 
> > I believe it is generic and equivalent to "interrupt-parent" +
> > "interrupts" properties, so people might as well put this in
> > the DT to save (or loose) a few bytes.
> > 
> > You could just check if of_irq_get() returned -EINVAL instead of
> > matching "interrupts" property.
> 
> It should be a bad idea to rely on -EINVAL since it's ambiguous error code.
> 
> Perhaps it's fine to assume that today of_irq_get() may only return
> -EINVAL in a case of a missing DT property, but then it should be two
> patches here:
> 
> 1. Use -EINVAL and backport this fix to stable kernel.
> 2. Change of_irq_get() to return -ENOENT for a missing property and
> change tegra_xusb_probe() accordingly.

I would love to see the part 2 done, but I'm afraid you will need to
change a lot of callsites before that can happen.

Best Regards
Michał Mirosław
