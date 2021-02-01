Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9C3C433E6
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Feb 2021 10:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F191564E2A
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Feb 2021 10:53:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbhBAKwy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 1 Feb 2021 05:52:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233039AbhBAKwx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 1 Feb 2021 05:52:53 -0500
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88851C061573;
        Mon,  1 Feb 2021 02:52:13 -0800 (PST)
Received: from pd956d63d.dip0.t-ipconnect.de ([217.86.214.61] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <postmaster@kaiser.cx>)
        id 1l6WoQ-0000R3-N5; Mon, 01 Feb 2021 11:52:06 +0100
Received: from martin by martin-debian-2.paytec.ch with local (Exim 4.92)
        (envelope-from <martin@martin-debian-2.paytec.ch>)
        id 1l6WoO-0002Q0-Nu; Mon, 01 Feb 2021 11:52:04 +0100
Date:   Mon, 1 Feb 2021 11:52:04 +0100
From:   Martin Kaiser <martin@kaiser.cx>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Android Kernel Team <kernel-team@android.com>
Subject: Re: [PATCH v2 0/2] of: property: Add fw_devlink support for more
 props
Message-ID: <20210201105204.GA1467@martin-debian-1.paytec.ch>
References: <20210121225712.1118239-1-saravanak@google.com>
 <20210131163823.c4zb47pl4tukcl7c@viti.kaiser.cx>
 <CAGETcx8A_+Y0sCLPdyeeT+rHOsAPsmg4LVn_ahF0NaD6hfRiZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx8A_+Y0sCLPdyeeT+rHOsAPsmg4LVn_ahF0NaD6hfRiZw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: "Martin Kaiser,,," <martin@martin-debian-2.paytec.ch>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Saravana,

Thus wrote Saravana Kannan (saravanak@google.com):

> This series [1] has a high chance of fixing it for you if
> CONFIG_MODULES is disabled in your set up. Can you give it a shot?

sure. This fixes things for me if CONFIG_MODULES is disabled. Booting is
still stuck if modules are enabled.

> The real problem is that arch/arm/mach-imx/avic.c doesn't set the
> OF_POPULATED flag for the "fsl,avic" node. fw_devlink uses this
> information to know that this device node will never have a struct
> device created for it. The proper way to do this for root IRQCHIP
> nodes is to use IRQCHIP_DECLARE(). I Cc'ed you on a clean up patch for
> IMX [2], can you please give [2] a shot *without* [1] and with
> CONFIG_MODULES enabled? Things should boot properly with this
> combination too.

This works as well.

Thanks,
Martin
