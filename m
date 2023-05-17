Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5CAC77B7A
	for <linux-tegra@archiver.kernel.org>; Wed, 17 May 2023 12:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbjEQMvl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 May 2023 08:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbjEQMvl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 May 2023 08:51:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B097E44
        for <linux-tegra@vger.kernel.org>; Wed, 17 May 2023 05:51:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D5E163BFE
        for <linux-tegra@vger.kernel.org>; Wed, 17 May 2023 12:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734CAC433D2;
        Wed, 17 May 2023 12:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684327898;
        bh=2JoCzAya4ozHUzDjJra+EnUuUPNieFhbiHSZyLF00PA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=psTl8xOZaaVdlSpsfzROkdJ3SFvhphHBtGtz60jb/YMXr4VTHVXNht91DgJqAKtwM
         H8sgLo39VR+p56amkVM+nizUQfoThZu3vREL8JG9oFCQqTcQvl5XAltpW5aIjg+VyD
         SXMVUJckERKd+j3EukP8dpqLSfgIEoR3G9omf+hXqvZqa4axZsItV3gonpk6A8s/pN
         aRgAqwHumvaCfTdfM+T1i/wkM1+WA1WCZDXLbBAa4slFyzUdR07YpZ1fzVfvgAKnkF
         hRjaRUQDDdRbbO8HXsql899236rOEs5v2FskSLs7JyqngQT+3AHoxSsRmt0EUEYCTP
         OSzvA1yy38gsw==
Date:   Wed, 17 May 2023 18:21:34 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Guillaume Ranquet <granquet@baylibre.com>,
        linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] phy: mediatek: Avoid floating point constants
Message-ID: <ZGTN1vWnxmaR/XKM@matsya>
References: <20230419122131.2167122-1-thierry.reding@gmail.com>
 <89583b89-ea8c-8096-b083-6ab773e6c281@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89583b89-ea8c-8096-b083-6ab773e6c281@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17-05-23, 12:59, Jon Hunter wrote:
> Hi Vinod,
> 
> On 19/04/2023 13:21, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > When building with old versions of GCC (6.3 in this case), the compiler
> > stumbles over the floating point constants in this driver:
> > 
> > 	: In function ‘mtk_hdmi_pll_prepare’:
> > 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:331:23: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
> > 	  } else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {
> > 
> > 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:361:12: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
> > 	 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
> > 		    ^~~~~~~~~~~~~~~~~~~~
> > 	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:361:12: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
> > 
> > Fix this by switching to the KILO macro instead and multiplying the
> > constants by 1000 to get rid of the floating point.
> > 
> > Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> > Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > index abfc077fb0a8..b10af26cad2f 100644
> > --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > @@ -239,9 +239,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
> >   		txposdiv = 8;
> >   	else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
> >   		txposdiv = 4;
> > -	else if (tmds_clk >= 148.35 * MEGA && tmds_clk < 296.7 * MEGA)
> > +	else if (tmds_clk >= 148350 * KILO && tmds_clk < 296700 * KILO)
> >   		txposdiv = 2;
> > -	else if (tmds_clk >= 296.7 * MEGA && tmds_clk <= 594 * MEGA)
> > +	else if (tmds_clk >= 296700 * KILO && tmds_clk <= 594 * MEGA)
> >   		txposdiv = 1;
> >   	else
> >   		return -EINVAL;
> > @@ -328,12 +328,12 @@ static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
> >   		clk_channel_bias = 0x34; /* 20mA */
> >   		impedance_en = 0xf;
> >   		impedance = 0x36; /* 100ohm */
> > -	} else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {
> > +	} else if (pixel_clk >= 74175 * KILO && pixel_clk <= 300 * MEGA) {
> >   		data_channel_bias = 0x34; /* 20mA */
> >   		clk_channel_bias = 0x2c; /* 16mA */
> >   		impedance_en = 0xf;
> >   		impedance = 0x36; /* 100ohm */
> > -	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74.175 * MEGA) {
> > +	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74175 * KILO) {
> >   		data_channel_bias = 0x14; /* 10mA */
> >   		clk_channel_bias = 0x14; /* 10mA */
> >   		impedance_en = 0x0;
> 
> 
> This is breaking kernel compilation with older compilers such as GCC7. This
> is now in the mainline and older compilers cannot build the kernel with this
> driver enabled. The kernel docs say the min version supported is GCC 5.1
> currently.
> 
> Can we get this merged as a fix for v6.4?

Sorry I missed this one but I have already applied 03262a3f5b5b ("phy:
mediatek: rework the floating point comparisons to fixed point") and
this is in linux-next and should be hopefully in Linus's tree in next rc

Thanks
-- 
~Vinod
