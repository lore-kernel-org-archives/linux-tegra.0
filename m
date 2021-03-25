Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7652DC433C1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 06:16:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4959861A0E
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 06:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhCYGPb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 02:15:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:53184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229448AbhCYGPV (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 02:15:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79C5661A1D;
        Thu, 25 Mar 2021 06:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616652920;
        bh=KTR7jpTJM0bZVP+ZEpXFNwt30YVH1j8hXCimA4mZGbU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SXWp3BOQjFtaC3rSq2fpxliRjXxBUgfPggz868iwwrW0ZVE+CzENNQh5BtZkAtIXA
         KUXa780J5cKHgodS5Phtev6ZghqsMGCBkQBxf+cQXareObX2+gDRXML510gZ0zQXTc
         rsokJX8dJBO/dwoh/A5yIqw0zyauca39hoUZQ8+uf/OrcsyuPssjuwV4YFAfyrM5CF
         eRN99v/nFZzUCnw1+3zfVgL+KYLhbSYNkq71/xJ9d9TDOJDNB5tHmRFN6fe4Pxx8dp
         CYXOOGQNcNQmrHiCkeREeNHmyGzzmDtiKm86dVaW19viA/Pgw+u/fhnxClU2o4uZQ/
         0BXfWyYEhjGYw==
Date:   Thu, 25 Mar 2021 11:45:16 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <gregkh@linuxfoundation.org>, mturquette@baylibre.com,
        sboyd@kernel.org, JC Kuo <jckuo@nvidia.com>, robh@kernel.org,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 00/14] Tegra XHCI controller ELPG support
Message-ID: <YFwqdNkkcrTRxSkP@vkoul-mobl.Dlink>
References: <20210120073414.69208-1-jckuo@nvidia.com>
 <YB1vGTt0ufzsYBgo@ulmo>
 <YB1wxazg/QpRSJz6@kroah.com>
 <YFszBH1JJmjJmjn2@orome.fritz.box>
 <YFs/VBZvZo6mBJqz@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFs/VBZvZo6mBJqz@orome.fritz.box>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24-03-21, 14:32, Thierry Reding wrote:
> On Wed, Mar 24, 2021 at 01:39:32PM +0100, Thierry Reding wrote:
> > On Fri, Feb 05, 2021 at 05:22:29PM +0100, Greg KH wrote:
> > > On Fri, Feb 05, 2021 at 05:15:21PM +0100, Thierry Reding wrote:
> > > > On Wed, Jan 20, 2021 at 03:34:00PM +0800, JC Kuo wrote:
> > > > > Tegra XHCI controler can be placed in ELPG (Engine Level PowerGated)
> > > > > state for power saving when all of the connected USB devices are in
> > > > > suspended state. This patch series includes clk, phy and pmc changes
> > > > > that are required for properly place controller in ELPG and bring
> > > > > controller out of ELPG.
> > > > > 
> > > > > JC Kuo (14):
> > > > >   clk: tegra: Add PLLE HW power sequencer control
> > > > >   clk: tegra: Don't enable PLLE HW sequencer at init
> > > > >   phy: tegra: xusb: Move usb3 port init for Tegra210
> > > > >   phy: tegra: xusb: Rearrange UPHY init on Tegra210
> > > > >   phy: tegra: xusb: Add Tegra210 lane_iddq operation
> > > > >   phy: tegra: xusb: Add sleepwalk and suspend/resume
> > > > >   soc/tegra: pmc: Provide USB sleepwalk register map
> > > > >   arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
> > > > >   dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
> > > > >   phy: tegra: xusb: Add wake/sleepwalk for Tegra210
> > > > >   phy: tegra: xusb: Tegra210 host mode VBUS control
> > > > >   phy: tegra: xusb: Add wake/sleepwalk for Tegra186
> > > > >   usb: host: xhci-tegra: Unlink power domain devices
> > > > >   xhci: tegra: Enable ELPG for runtime/system PM
> > > > > 
> > > > >  .../phy/nvidia,tegra124-xusb-padctl.txt       |    1 +
> > > > >  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |    1 +
> > > > >  drivers/clk/tegra/clk-pll.c                   |   12 -
> > > > >  drivers/clk/tegra/clk-tegra210.c              |   53 +-
> > > > >  drivers/phy/tegra/xusb-tegra186.c             |  558 ++++-
> > > > >  drivers/phy/tegra/xusb-tegra210.c             | 1889 +++++++++++++----
> > > > >  drivers/phy/tegra/xusb.c                      |   92 +-
> > > > >  drivers/phy/tegra/xusb.h                      |   22 +-
> > > > >  drivers/soc/tegra/pmc.c                       |   94 +
> > > > >  drivers/usb/host/xhci-tegra.c                 |  613 ++++--
> > > > >  include/linux/clk/tegra.h                     |    4 +-
> > > > >  include/linux/phy/tegra/xusb.h                |   10 +-
> > > > >  12 files changed, 2784 insertions(+), 565 deletions(-)
> > > > > 
> > > > > v5 "phy: tegra: xusb: tegra210: Do not reset UPHY PLL" is moved
> > > > > into v6 "phy: tegra: xusb: Rearrange UPHY init on Tegra210"
> > > > 
> > > > Mike, Stephen,
> > > > 
> > > > could you guys take a look at the two clk patches here and give an
> > > > Acked-by? There's build-time dependencies throughout the series, so it'd
> > > > be good if they can all go through either the PHY or USB trees.
> > > > 
> > > > Kishon, Greg,
> > > > 
> > > > any comments on these patches? Unfortunately, the USB patches in this
> > > > series have a build-time dependency on the PHY patches, so this should
> > > > all go through one tree. Since this all culminates in the XHCI driver,
> > > > merging this through the USB tree might be best, provided that Kishon
> > > > provides his Acked-by on the PHY patches.
> > > > 
> > > > Alternatively, I can create a set of branches with the correct
> > > > dependencies and send out pull requests for the three subsystems if
> > > > that's preferrable.
> > > 
> > > I have no objection for the usb patches to go through your tree as they
> > > are hardware-specific.
> > 
> > Kishon,
> > 
> > I haven't heard back from you on this yet. We missed v5.12 but I'd like
> > to get this into v5.13 since it's the last missing piece to get suspend
> > and resume working properly on a number of boards.
> > 
> > Are you okay if I take this through the Tegra tree to satisfy the
> > interdependencies between clk, PHY and USB patches? I've already got
> > Acked-by's from the clock and USB maintainers.
> > 
> > I want to tentatively take this into linux-next to give it a bit of soak
> > time before the ARM SoC -rc6 cut-off. Please let me know if you'd prefer
> > to apply these to your tree so I can back them out of the Tegra tree
> > again.
> 
> Also adding Vinod for visibility and in case Kishon's too busy.

Yes please CC me on all things phy (MAINTAINERS should have told you so)

If you can resend me and cc linux-phy@lists.infradead.org, I would take
a look. FWIW since this goes thru Greg, the window closes earlier than
merge window

-- 
~Vinod
