Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98A3C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 19:14:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CC3C610EA
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 19:14:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhJUTRO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 15:17:14 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47033 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231862AbhJUTRN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 15:17:13 -0400
Received: (qmail 1170333 invoked by uid 1000); 21 Oct 2021 15:14:52 -0400
Date:   Thu, 21 Oct 2021 15:14:52 -0400
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
Message-ID: <20211021191452.GA1170019@rowland.harvard.edu>
References: <20211021115501.14932-1-digetx@gmail.com>
 <YXFyu+Q5ifG8Au9w@orome.fritz.box>
 <5f122caa-c810-534d-b2a1-53edef313ff0@gmail.com>
 <32694811-8768-8e77-f188-4ed1a1fb93da@gmail.com>
 <20211021152028.GB1161262@rowland.harvard.edu>
 <82a02e70-33bc-7faf-e085-a25884e48844@gmail.com>
 <44567c4f-0f0f-6995-b48f-c427cedb6755@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44567c4f-0f0f-6995-b48f-c427cedb6755@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 21, 2021 at 08:16:40PM +0300, Dmitry Osipenko wrote:
> 21.10.2021 20:13, Dmitry Osipenko пишет:
> > 21.10.2021 18:20, Alan Stern пишет:
> >> On Thu, Oct 21, 2021 at 06:08:41PM +0300, Dmitry Osipenko wrote:
> >>> 21.10.2021 17:57, Dmitry Osipenko пишет:
> >>>> It might be wrong to disable device_may_wakeup() because it will change
> >>>> the system suspend-resume behaviour, i.e. you won't be able to resume by
> >>>> USB event, see [1].
> >>>>
> >>>> [1]
> >>>> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/usb/host/xhci-tegra.c#L1962
> >>>>
> >>>> Although, I'm not sure whether this is a correct behaviour to start
> >>>> with. Previously, before the offending commit, device_wakeup was never
> >>>> enabled for tegra-xusb. Commit message doesn't explain why wakeup is now
> >>>> enabled unconditionally, wakeup checks aren't needed at all then. This
> >>>> makes no sense, please check it with JC Kuo.
> >>>
> >>> Although, wakeup could be disabled via sysfs, so it makes sense. Still
> >>> it's not clear whether it's a correct behaviour to enable wakeup during
> >>> system suspend by default. If it wakes machine from suspend when USB
> >>> device is plugged/unplugged, then it's a wrong behaviour.
> >>
> >> It depends on the details of how the device works.  In most cases we do 
> >> want to enable wakeup by default for host controller devices.  The 
> >> reason is simple enough: If some USB device attached to the HC is 
> >> enabled for wakeup and sends a wakeup request, we don't want the request 
> >> to get lost because the HC isn't allowed to forward the request on to 
> >> the CPU.
> >>
> >> But we do not want to enable wakeup for root hubs.  In particular, we 
> >> don't want to wake up a suspended system merely because a USB device has 
> >> been plugged or unplugged.
> >>
> >> Clearly this arrangement depends on the hardware making a distinction 
> >> between wakeup requests originating from the root hub and those simply 
> >> passing through the HC.
> > 
> > Should USB keyboard be able to wake up every HC or it's a
> > machine-specific feature?
> 
> I mean whether key press should wake up HC if wake-up is enabled for the
> keyboard device.

Yes, it should.  More specifically, if the keyboard is capable of 
generating wakeup requests, and wakeup is enabled for both the keyboard 
device and the HC, then the keyboard should be able to wake up the 
system from suspend.  Some HCs or systems might not support this 
capability, however.

> > I'm asking because wakeup works on a typical
> > Intel hardware, but doesn't work on older Tegra SoCs that use Chipidea
> > controller. It's not obvious to me whether this is something that
> > firmware handles for Intel or it's broken on Tegra. Could you please
> > clarify? If it should work for every HC, then I may try to take a closer
> > look.

If the hardware/firmware can support it then it should work.  I don't 
know what's going on with your older Tegra SoCs; it's possible there is 
a bug in the driver.

Alan Stern
