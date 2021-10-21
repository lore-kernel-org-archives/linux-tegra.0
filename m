Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC30BC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 15:20:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C185F6112D
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 15:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbhJUPWq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 11:22:46 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59313 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231789AbhJUPWo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 11:22:44 -0400
Received: (qmail 1161764 invoked by uid 1000); 21 Oct 2021 11:20:28 -0400
Date:   Thu, 21 Oct 2021 11:20:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] usb: xhci: tegra: Check padctrl interrupt presence in
 device tree
Message-ID: <20211021152028.GB1161262@rowland.harvard.edu>
References: <20211021115501.14932-1-digetx@gmail.com>
 <YXFyu+Q5ifG8Au9w@orome.fritz.box>
 <5f122caa-c810-534d-b2a1-53edef313ff0@gmail.com>
 <32694811-8768-8e77-f188-4ed1a1fb93da@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32694811-8768-8e77-f188-4ed1a1fb93da@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 21, 2021 at 06:08:41PM +0300, Dmitry Osipenko wrote:
> 21.10.2021 17:57, Dmitry Osipenko пишет:
> > It might be wrong to disable device_may_wakeup() because it will change
> > the system suspend-resume behaviour, i.e. you won't be able to resume by
> > USB event, see [1].
> > 
> > [1]
> > https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/usb/host/xhci-tegra.c#L1962
> > 
> > Although, I'm not sure whether this is a correct behaviour to start
> > with. Previously, before the offending commit, device_wakeup was never
> > enabled for tegra-xusb. Commit message doesn't explain why wakeup is now
> > enabled unconditionally, wakeup checks aren't needed at all then. This
> > makes no sense, please check it with JC Kuo.
> 
> Although, wakeup could be disabled via sysfs, so it makes sense. Still
> it's not clear whether it's a correct behaviour to enable wakeup during
> system suspend by default. If it wakes machine from suspend when USB
> device is plugged/unplugged, then it's a wrong behaviour.

It depends on the details of how the device works.  In most cases we do 
want to enable wakeup by default for host controller devices.  The 
reason is simple enough: If some USB device attached to the HC is 
enabled for wakeup and sends a wakeup request, we don't want the request 
to get lost because the HC isn't allowed to forward the request on to 
the CPU.

But we do not want to enable wakeup for root hubs.  In particular, we 
don't want to wake up a suspended system merely because a USB device has 
been plugged or unplugged.

Clearly this arrangement depends on the hardware making a distinction 
between wakeup requests originating from the root hub and those simply 
passing through the HC.

Alan Stern
