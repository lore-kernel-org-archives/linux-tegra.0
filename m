Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3A6C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 13:31:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237616AbhLMNa7 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 08:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbhLMNa7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 08:30:59 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50144C061574
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 05:30:59 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mwlPp-0000zK-7i; Mon, 13 Dec 2021 14:30:53 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mwlPn-000F2x-Td; Mon, 13 Dec 2021 14:30:51 +0100
Message-ID: <c3fbce43b49ee7c5ab5abdaab8ac8f7c9b6f2278.camel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller fixes for v5.16
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Arnd Bergmann <arnd@arndb.de>, Jon Hunter <jonathanh@nvidia.com>
Cc:     arm-soc <arm@kernel.org>, Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Date:   Mon, 13 Dec 2021 14:30:51 +0100
In-Reply-To: <CAK8P3a0d0AR7fvMn6+zLVUec4ww+SY9h_aCuf++gErwvmj5z4w@mail.gmail.com>
References: <5383deda141721643419e98c485fb510be56fb61.camel@pengutronix.de>
         <22bbd3d0-2622-3f23-2fa9-9826631084b0@nvidia.com>
         <CAK8P3a0d0AR7fvMn6+zLVUec4ww+SY9h_aCuf++gErwvmj5z4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Arnd, Jon,

On Mon, 2021-12-13 at 14:15 +0100, Arnd Bergmann wrote:
> On Mon, Dec 13, 2021 at 1:21 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> > On 19/11/2021 17:07, Philipp Zabel wrote:
> > > Reset controller fixes for v5.16
> > > 
> > > Well, just one: revert commit c045ceb5a145 ("reset: tegra-bpmp: Handle
> > > errors in BPMP response"), which exposed an issue with the Tegra194 HDA
> > > controller reset. BPMP response error handling will be reinstated once
> > > there's a fix for the HDA issue.
> > > 
> > 
> > I have not seen this get picked up yet and we need this fix for v5.16.
> > Please can you pick this up?
> 
> Thank you for pointing this out. I see this never made it into patchwork
> because it was sent to the old address (arm@kernel.org) that gets in
> my inbox but not patchwork like the new address (soc@kernel.org).

Ouf, sorry. I thought I had switched over to the soc@ address for good,
but this time my fingers must have betrayed me.

> I'm also behind with the other pull requests, but I've picked it up manually
> now.

Thank you.

> Philipp, please make sure you send future pull requests to soc@kernel.org,
> and maybe check that I did pick up previous ones you may have sent.

I'll do that, and make sure I won't manually type that address even
though it seems so memorable.

regards
Philipp
