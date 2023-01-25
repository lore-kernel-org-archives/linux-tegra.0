Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1178EC27C76
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 14:45:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235800AbjAYOpF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 09:45:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235469AbjAYOpE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 09:45:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA7B182;
        Wed, 25 Jan 2023 06:44:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7582561528;
        Wed, 25 Jan 2023 14:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82AC9C433D2;
        Wed, 25 Jan 2023 14:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674657842;
        bh=WViY2kIrxqPrKUVwduoiDaCJwvXTgjlAIlKvjfvj95o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2cn6wv0eUEf6XEUi44Qck0nDI+pSRt2PC/FRZ4N2UpYUhfIF3moH3blEE7wPcIWyQ
         bgfKodccvgTcokmIjF/NvFfryexlERtmRl/rKbFUrIVLDA3HvsC2ih0ttRFzTR/2j7
         jnYc73pDu4UW+6nU31+NEMSNhw8gBjOkhlDrRLOI=
Date:   Wed, 25 Jan 2023 15:44:00 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH V5 0/5] Tegra USB device support updates
Message-ID: <Y9FAMOUTHBSihY7q@kroah.com>
References: <20230119104208.28726-1-jonathanh@nvidia.com>
 <Y8/j1HBwgEdd4Mp2@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8/j1HBwgEdd4Mp2@orome>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jan 24, 2023 at 02:57:40PM +0100, Thierry Reding wrote:
> On Thu, Jan 19, 2023 at 10:42:03AM +0000, Jon Hunter wrote:
> > This series adds USB device support for Tegra234. 3/5 patches were
> > originally part of the series to add both USB host and device support
> > for Tegra234 [0]. However, the series was getting quite large and so I
> > have split this into a separate series but calling it 'V4' to indicate
> > that this is not completely new either.
> > 
> > I have added two more patches in this version to fix DMA coherency for
> > Tegra194.
> > 
> > [0] https://lore.kernel.org/linux-tegra/20221114124053.1873316-1-waynec@nvidia.com/
> > 
> > Jon Hunter (3):
> >   dt-bindings: usb: tegra-xudc: Add dma-coherent for Tegra194
> >   arm64: tegra: Add dma-coherent property for Tegra194 XUDC
> >   arm64: tegra: Populate the XUDC node for Tegra234
> > 
> > Sing-Han Chen (1):
> >   usb: gadget: tegra-xudc: Add Tegra234 support
> > 
> > Wayne Chang (1):
> >   dt-bindings: usb: tegra-xudc: Add Tegra234 XUDC support
> > 
> >  .../bindings/usb/nvidia,tegra-xudc.yaml       | 15 ++++++++++++
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  1 +
> >  arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 23 +++++++++++++++++++
> >  drivers/usb/gadget/udc/tegra-xudc.c           | 17 ++++++++++++++
> >  4 files changed, 56 insertions(+)
> 
> I've picked up patches 2 and 5 of this series into the Tegra tree. Greg,
> can you pick up patches 1, 3 and 4?

Yes, I will do that now, thanks!

greg k-h
