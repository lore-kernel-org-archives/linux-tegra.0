Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28517C433E0
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 20:32:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D502A64F31
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 20:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbhBESuD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Feb 2021 13:50:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:45588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233086AbhBEPEk (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 5 Feb 2021 10:04:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7681664DA8;
        Fri,  5 Feb 2021 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612542152;
        bh=2FOXgrVvrtQQwxzm4Wfix8cnVUh7IkUdTTu1De+bjtU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KfFDSzcVzjJbQYJ7meo6+XLjz46z89rptPO7r0cjN61WrYRyEN3XrG1sLfkaa43Ud
         ExG/AI741QCRdc2A3z0dnPK65OJTg2MFRTlWFMlkLM7X9XtAOfKjQzqhv0OqXyG8pr
         tgMWAaKQ8D5iEAfl3J+c1jPNT7ZfVcyr1oRM+yq0=
Date:   Fri, 5 Feb 2021 17:22:29 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     kishon@ti.com, mturquette@baylibre.com, sboyd@kernel.org,
        JC Kuo <jckuo@nvidia.com>, robh@kernel.org,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 00/14] Tegra XHCI controller ELPG support
Message-ID: <YB1wxazg/QpRSJz6@kroah.com>
References: <20210120073414.69208-1-jckuo@nvidia.com>
 <YB1vGTt0ufzsYBgo@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YB1vGTt0ufzsYBgo@ulmo>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Feb 05, 2021 at 05:15:21PM +0100, Thierry Reding wrote:
> On Wed, Jan 20, 2021 at 03:34:00PM +0800, JC Kuo wrote:
> > Tegra XHCI controler can be placed in ELPG (Engine Level PowerGated)
> > state for power saving when all of the connected USB devices are in
> > suspended state. This patch series includes clk, phy and pmc changes
> > that are required for properly place controller in ELPG and bring
> > controller out of ELPG.
> > 
> > JC Kuo (14):
> >   clk: tegra: Add PLLE HW power sequencer control
> >   clk: tegra: Don't enable PLLE HW sequencer at init
> >   phy: tegra: xusb: Move usb3 port init for Tegra210
> >   phy: tegra: xusb: Rearrange UPHY init on Tegra210
> >   phy: tegra: xusb: Add Tegra210 lane_iddq operation
> >   phy: tegra: xusb: Add sleepwalk and suspend/resume
> >   soc/tegra: pmc: Provide USB sleepwalk register map
> >   arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
> >   dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
> >   phy: tegra: xusb: Add wake/sleepwalk for Tegra210
> >   phy: tegra: xusb: Tegra210 host mode VBUS control
> >   phy: tegra: xusb: Add wake/sleepwalk for Tegra186
> >   usb: host: xhci-tegra: Unlink power domain devices
> >   xhci: tegra: Enable ELPG for runtime/system PM
> > 
> >  .../phy/nvidia,tegra124-xusb-padctl.txt       |    1 +
> >  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |    1 +
> >  drivers/clk/tegra/clk-pll.c                   |   12 -
> >  drivers/clk/tegra/clk-tegra210.c              |   53 +-
> >  drivers/phy/tegra/xusb-tegra186.c             |  558 ++++-
> >  drivers/phy/tegra/xusb-tegra210.c             | 1889 +++++++++++++----
> >  drivers/phy/tegra/xusb.c                      |   92 +-
> >  drivers/phy/tegra/xusb.h                      |   22 +-
> >  drivers/soc/tegra/pmc.c                       |   94 +
> >  drivers/usb/host/xhci-tegra.c                 |  613 ++++--
> >  include/linux/clk/tegra.h                     |    4 +-
> >  include/linux/phy/tegra/xusb.h                |   10 +-
> >  12 files changed, 2784 insertions(+), 565 deletions(-)
> > 
> > v5 "phy: tegra: xusb: tegra210: Do not reset UPHY PLL" is moved
> > into v6 "phy: tegra: xusb: Rearrange UPHY init on Tegra210"
> 
> Mike, Stephen,
> 
> could you guys take a look at the two clk patches here and give an
> Acked-by? There's build-time dependencies throughout the series, so it'd
> be good if they can all go through either the PHY or USB trees.
> 
> Kishon, Greg,
> 
> any comments on these patches? Unfortunately, the USB patches in this
> series have a build-time dependency on the PHY patches, so this should
> all go through one tree. Since this all culminates in the XHCI driver,
> merging this through the USB tree might be best, provided that Kishon
> provides his Acked-by on the PHY patches.
> 
> Alternatively, I can create a set of branches with the correct
> dependencies and send out pull requests for the three subsystems if
> that's preferrable.

I have no objection for the usb patches to go through your tree as they
are hardware-specific.

thanks,

greg k-h
