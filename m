Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734D4C61DA4
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Feb 2023 13:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbjBCNhN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Feb 2023 08:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232891AbjBCNhM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Feb 2023 08:37:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C71885F0;
        Fri,  3 Feb 2023 05:37:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B47C061F20;
        Fri,  3 Feb 2023 13:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44020C433D2;
        Fri,  3 Feb 2023 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675431423;
        bh=ZZx3nGqH4qzHtCTP7gc5u4gXwhafYjW64wFE9xehQZI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PC8VNj+wZkDfbJoqNkderv9knz5Oo+pT3sfm3c1cr77Ubyjs3yab0Mav8a2YbJY6k
         jtpvCnCaaokAr5EWzY1ykc0vHUHVXMKsc0ycKRc/iRKUvLCGFXt0IMzaa0uBP3dgNv
         FXJkGaYYb9Aw3ZUGbMEgz94uHmKcGarBi78/BLR8/aI2/t+6ZmVV6F4yJsg3P8AORq
         vspHZ51eKSajiXxbw2vZTv8NlI0QdrLKoAxh1XB+3/GAIQE7IcDzpY7u0c/XMPvrww
         yongZFEgBem0zD3pu82swgRGLsa4ByrzeEAB6xQFtaHAhivstR5Bft9aRFXKNbFBGV
         Sc407wctcLSEw==
Date:   Fri, 3 Feb 2023 19:06:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        waynec@nvidia.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V6 2/6] dt-bindings: phy: tegra-xusb: Add support for
 Tegra234
Message-ID: <Y90N+v0Qo0zdYdNS@matsya>
References: <20230111110450.24617-1-jonathanh@nvidia.com>
 <20230111110450.24617-3-jonathanh@nvidia.com>
 <Y9P6PJ9xPVst/um2@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9P6PJ9xPVst/um2@orome>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 27-01-23, 17:22, Thierry Reding wrote:
> On Wed, Jan 11, 2023 at 11:04:46AM +0000, Jon Hunter wrote:
> > Add the compatible string for the Tegra234 XUSB PHY.
> > 
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > V5 -> V6: Added Krzysztof's ACK 
> > V3 -> V5: Fixed compatible string
> > V3 -> V4: Added patch
> > 
> >  .../devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Hi Vinod,
> 
> can you pick this up into your tree? This applies on top of the
> conversion patch ("dt-bindings: phy: tegra-xusb: Convert to
> json-schema") that's aready in your next branch.

Applied now, thanks for pinging

-- 
~Vinod
