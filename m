Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD25C4727E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 08:12:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF3D821707
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 08:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbgJAIMe convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 04:12:34 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:39014 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgJAIMe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 04:12:34 -0400
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 42DF23AB62A;
        Thu,  1 Oct 2020 08:12:32 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id ECF2124000D;
        Thu,  1 Oct 2020 08:12:07 +0000 (UTC)
Date:   Thu, 1 Oct 2020 10:12:06 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Jann Horn <jannh@google.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] mtd: rawnand: Replace one-element array with
 flexible-array member
Message-ID: <20201001101206.6e4beea7@xps13>
In-Reply-To: <CAG48ez3XqE0m2UmRh+OtmYJRhyCBYY=sdJKaWBXtJZKCRpLMYQ@mail.gmail.com>
References: <20200930210824.GA12277@embeddedor>
        <CAG48ez3X3aZwfde3_2Sc+gdtUGRHfzan6oNFiffAvNzFDSsFDw@mail.gmail.com>
        <20200930213634.GA12855@embeddedor>
        <CAG48ez3XqE0m2UmRh+OtmYJRhyCBYY=sdJKaWBXtJZKCRpLMYQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Jann,

Jann Horn <jannh@google.com> wrote on Thu, 1 Oct 2020 00:32:24 +0200:

> On Wed, Sep 30, 2020 at 11:30 PM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> > On Wed, Sep 30, 2020 at 11:10:43PM +0200, Jann Horn wrote:  
> > > On Wed, Sep 30, 2020 at 11:02 PM Gustavo A. R. Silva
> > > <gustavoars@kernel.org> wrote:  
> > > > There is a regular need in the kernel to provide a way to declare having
> > > > a dynamically sized set of trailing elements in a structure. Kernel code
> > > > should always use “flexible array members”[1] for these cases. The older
> > > > style of one-element or zero-length arrays should no longer be used[2].  
> > >
> > > But this is not such a case, right? Isn't this a true fixed-size
> > > array? It sounds like you're just changing it because it
> > > pattern-matched on "array of length 1 at the end of a struct".  
> >
> > Yeah; I should have changed that 'dynamically' part of the text above
> > a bit. However, as I commented in the text below, in the case that more
> > CS IDs are needed (let's wait for the maintainers to comment on this...)
> > in the future, this change makes the code more maintainable, as for
> > the allocation part, the developer would only have to update the CS_N
> > macro to the number of CS IDs that are needed.  
> 
> But in that case, shouldn't you change it to "int cs[CS_N]" and get
> rid of the struct_size() stuff?

I do agree with Jann, I think it's best to consider this a fixed-size
array for now. If we ever want to extend the number of supported CS,
there is much more rework involved anyway.

Thanks,
Miquèl
