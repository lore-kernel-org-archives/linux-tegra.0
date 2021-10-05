Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281CDC4332F
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 10:47:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F24A961354
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 10:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbhJEKtI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Oct 2021 06:49:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:38890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233490AbhJEKtG (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 5 Oct 2021 06:49:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEAC460F9D;
        Tue,  5 Oct 2021 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633430836;
        bh=n/mLNJNfw2jgnN4lHucNLVGQuscvmSJHf9GsOtyO4d4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C4ce0xnh5XOP8FyIq0BszjrQ9GZIJ4MCw8cf/awkf6UCGACy+5VQkUnImmuGWkLcT
         aIlhhhcTphj/cmopLkfiwQxbrCupJUn9+rmD8PTI5stNHqIeP/lWE6AFiZSsXNjiUv
         qMOPFmQHighBAU+J0eT/RiBGhAqPvR7Hr4YAi0mc=
Date:   Tue, 5 Oct 2021 12:47:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: phy: tegra20-usb-phy: Convert to
 schema
Message-ID: <YVwtMtRTSYYD0Jha@kroah.com>
References: <20210912181718.1328-1-digetx@gmail.com>
 <20210912181718.1328-2-digetx@gmail.com>
 <YVttLY4cCtgh9Cuu@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVttLY4cCtgh9Cuu@orome.fritz.box>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 04, 2021 at 11:07:57PM +0200, Thierry Reding wrote:
> On Sun, Sep 12, 2021 at 09:17:12PM +0300, Dmitry Osipenko wrote:
> > Convert NVIDIA Tegra20 USB PHY binding to schema.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  .../bindings/phy/nvidia,tegra20-usb-phy.txt   |  74 ----
> >  .../bindings/phy/nvidia,tegra20-usb-phy.yaml  | 357 ++++++++++++++++++
> >  2 files changed, 357 insertions(+), 74 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.txt
> >  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml
> 
> I'm assuming that Greg or Felipe will pick this (and patch 2) up along
> with the USB PHY driver patch, in which case:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
> Greg, Felipe, if you'd prefer me to take this through the Tegra tree
> (and ultimately ARM SoC), let me know and I can pick it up as well.

I'll pick these up now, thanks.

greg k-h
