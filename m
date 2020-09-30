Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8551BC4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 21:30:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 445DD2075F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 21:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601501452;
	bh=feeviU9+A/gTyUPoDCemRtabALCS/oslSvMzA1uSTlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UpwyzVVUZZo7OSr20sWNv1YkSwpo1Oxqqfwd2JA4nC6kL8G+mpn1RAdGUgo/rb0Zu
	 AHrE107ZjEtmTVyVIws2VXJiU0rJGptoO6rWo0/o67qXIxXGVVyyJIMSk1QmVNmWon
	 O+b891KS9FNdGFurwksQNIhwZ1rQljMiuB2NpJ2w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbgI3Vav (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 17:30:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:52592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725814AbgI3Vav (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 17:30:51 -0400
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A19720739;
        Wed, 30 Sep 2020 21:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601501451;
        bh=feeviU9+A/gTyUPoDCemRtabALCS/oslSvMzA1uSTlc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iOvN2DZkfruxM4tVe4v/noGq5UC5MncnkeoZiocJeejKgelDd1XQHw++sgRbjdkVw
         5om65naAvbW/rdeJjUwCC90cIKG5Jk7MHWG+kgO2vNtK29kKitcE4/NVmhpLiKeRmX
         Mvxb+Rh/naYoC7WrYSwsgeW62an08UQ3yJ0oRYqs=
Date:   Wed, 30 Sep 2020 16:36:34 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jann Horn <jannh@google.com>
Cc:     Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] mtd: rawnand: Replace one-element array with
 flexible-array member
Message-ID: <20200930213634.GA12855@embeddedor>
References: <20200930210824.GA12277@embeddedor>
 <CAG48ez3X3aZwfde3_2Sc+gdtUGRHfzan6oNFiffAvNzFDSsFDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez3X3aZwfde3_2Sc+gdtUGRHfzan6oNFiffAvNzFDSsFDw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 11:10:43PM +0200, Jann Horn wrote:
> On Wed, Sep 30, 2020 at 11:02 PM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> > There is a regular need in the kernel to provide a way to declare having
> > a dynamically sized set of trailing elements in a structure. Kernel code
> > should always use “flexible array members”[1] for these cases. The older
> > style of one-element or zero-length arrays should no longer be used[2].
> 
> But this is not such a case, right? Isn't this a true fixed-size
> array? It sounds like you're just changing it because it
> pattern-matched on "array of length 1 at the end of a struct".

Yeah; I should have changed that 'dynamically' part of the text above
a bit. However, as I commented in the text below, in the case that more
CS IDs are needed (let's wait for the maintainers to comment on this...)
in the future, this change makes the code more maintainable, as for
the allocation part, the developer would only have to update the CS_N
macro to the number of CS IDs that are needed.

Thanks
--
Gustavo

> 
> > Refactor the code according to the use of a flexible-array member
> > instead of a one-element array. Also, make use of the struct_size()
> > helper to calculate the size of the allocation for _nand_. In order
> > to keep the code as maintainable as possible and to keep _cs_ as an
> > array, add a new macro CS_N to aid in the allocation size calculation,
> > in case there is a need for more Chip Select IDs in the future. In the
> > meantime, the macro is set to 1. This also avoids having to use a magic
> > number '1' as the last argument for struct_size().
> [...]
> > diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
> [...]
> > +/* Number of Chip Selects. Currently, only one. */
> > +#define CS_N                   1
> > +
> >  struct tegra_nand_controller {
> >         struct nand_controller controller;
> >         struct device *dev;
> > @@ -183,7 +186,7 @@ struct tegra_nand_chip {
> >         u32 config;
> >         u32 config_ecc;
> >         u32 bch_config;
> > -       int cs[1];
> > +       int cs[];
> >  };
> [...]
