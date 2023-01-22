Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90B5C27C76
	for <linux-tegra@archiver.kernel.org>; Sun, 22 Jan 2023 14:15:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjAVOPL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 22 Jan 2023 09:15:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjAVOPF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Jan 2023 09:15:05 -0500
X-Greylist: delayed 514 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 22 Jan 2023 06:14:53 PST
Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AC81F49B
        for <linux-tegra@vger.kernel.org>; Sun, 22 Jan 2023 06:14:53 -0800 (PST)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
        id 7EDDC26F69C; Sun, 22 Jan 2023 15:06:17 +0100 (CET)
Date:   Sun, 22 Jan 2023 15:06:17 +0100
From:   Janne Grunau <j@jannau.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v13 0/4] iommu: Support mappings/reservations in
 reserved-memory regions
Message-ID: <20230122140617.GF3576@jannau.net>
References: <20230120174251.4004100-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120174251.4004100-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hej,

On 2023-01-20 18:42:47 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> This version is a rebase on top of v6.2-rc4 to resolve a minor conflict.
> Version 12 can be found here:
> 
>   https://lore.kernel.org/all/20221117185424.2359687-1-thierry.reding@gmail.com/
> 
> The only change here is that the #dma-{address,size}-cells is dropped.
> It turns out to be much simpler to just update #{address,size}-cells to
> what they should be rather than add extra complexity for the DMA work-
> around. There's a minor update to the DT binding so that it can now
> properly validate cases where we have both reg and iommu-addresses
> properties.
> 
> An example is included in the DT bindings, but here is an extract of
> what I've used to test this:
> 
>         reserved-memory {
>                 #address-cells = <2>;
>                 #size-cells = <2>;
>                 ranges;
> 
>                 /*
>                  * Creates an identity mapping for the framebuffer that
>                  * the firmware has setup to scan out a bootsplash from.
>                  */
>                 fb: framebuffer@92cb2000 {
>                         reg = <0x0 0x92cb2000 0x0 0x00800000>;
>                         iommu-addresses = <&dc0 0x0 0x92cb2000 0x0 0x00800000>;
>                 };
> 
>                 /*
>                  * Creates a reservation in the IOVA space to prevent
>                  * any buffers from being mapped to that region. Note
>                  * that on Tegra the range is actually quite different
>                  * from this, but it would conflict with the display
>                  * driver that I tested this against, so this is just
>                  * a dummy region for testing.
>                  */
>                 adsp: reservation-adsp {
>                         iommu-addresses = <&dc0 0x0 0x90000000 0x0 0x00010000>;
>                 };
>         };
> 
>         host1x@50000000 {
>                 dc@54200000 {
>                         memory-region = <&fb>, <&adsp>;
>                 };
>         };
> 
> This is abbreviated a little to focus on the essentials. Note also that
> the ADSP reservation is not actually used on this device and the driver
> for this doesn't exist yet, but I wanted to include this variant for
> testing, because we'll want to use these bindings for the reservation
> use-case as well at some point.
> 
> I've also been able to make use of this binding and the IOMMU code in
> conjunction with the simple-framebuffer driver to hand over a display
> configuration set up by UEFI to the Linux kernel.
> 
> Janne has confirmed[0] this to be suitable for indirect mappings as
> well, though these patches don't implement that feature yet. Potential
> extensions to this have been discussed but are not yet included at this
> time to not further complicate things.

The dt-bindings are sufficient for various firmware based co-processors 
on Apple silicon systems. This version and several before with 
additional straight forward changes to support indirect mappings are 
tested on the downstream asahi kernel with display processor support.

Acked-by: Janne Grunau <j@jannau.net>

Janne
