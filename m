Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C8EC433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Oct 2021 14:34:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4875D60EFF
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Oct 2021 14:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhJYOgz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 25 Oct 2021 10:36:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230137AbhJYOgz (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Oct 2021 10:36:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6595A60720;
        Mon, 25 Oct 2021 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635172472;
        bh=BWCI0zBBdH4Ik+znRZ7aJYJUjSobDgePF66QuPV4y90=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iSUqk+0YiY3c1g212989NV4QAIxMDM+tPLHJPt+SLcyBHL+o6+9sVm4v7zSac7xjJ
         J/+MlDFwIW8osmbHYphW6pgggplcV05cpzLouG2KgS6CPPFySbkemjoLoac8TtQZag
         l4EMJ6YhRG4bxnzT3SrX9YbH86hyWd/DJbDBFGhOWjx4dSuDVFIfh6Wk+2snKT+FyI
         d22Fn8YtiUzeseiWU/0bGSl5LuSTMNESCAmnFXkTYRsqELKHpZza1OLB6rJ/eglTbj
         7Gul2+Hx3gTna8TZL7CNIAqltTzJi40sMvjEaR4fdeSkjOoD0GAoOVBus1/OmVng3q
         AjqzLtYFQOo9A==
Date:   Mon, 25 Oct 2021 07:34:28 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] soc/tegra: fuse: Fix bitwise vs. logical OR warning
Message-ID: <YXbAdIc1IEDXa7vg@archlinux-ax161>
References: <20211021214500.2388146-1-nathan@kernel.org>
 <YXHh1lVCzVnyTiZv@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXHh1lVCzVnyTiZv@qmqm.qmqm.pl>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Michał,

On Thu, Oct 21, 2021 at 11:55:34PM +0200, Michał Mirosław wrote:
> On Thu, Oct 21, 2021 at 02:45:00PM -0700, Nathan Chancellor wrote:
> [...]
> > --- a/drivers/soc/tegra/fuse/speedo-tegra20.c
> > +++ b/drivers/soc/tegra/fuse/speedo-tegra20.c
> > @@ -69,7 +69,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
> >  
> >  	val = 0;
> >  	for (i = CPU_SPEEDO_MSBIT; i >= CPU_SPEEDO_LSBIT; i--) {
> > -		reg = tegra_fuse_read_spare(i) |
> > +		reg = tegra_fuse_read_spare(i) ||
> >  			tegra_fuse_read_spare(i + CPU_SPEEDO_REDUND_OFFS);
> >  		val = (val << 1) | (reg & 0x1);
> >  	}
> > @@ -84,7 +84,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
> >  
> >  	val = 0;
> >  	for (i = SOC_SPEEDO_MSBIT; i >= SOC_SPEEDO_LSBIT; i--) {
> > -		reg = tegra_fuse_read_spare(i) |
> > +		reg = tegra_fuse_read_spare(i) ||
> >  			tegra_fuse_read_spare(i + SOC_SPEEDO_REDUND_OFFS);
> >  		val = (val << 1) | (reg & 0x1);
> >  	}
> 
> It does seem correct, but nevertheless the code looks suspicious. reg is
> already masked with 0x1 as far as I can tell, and there are other places
> which depend on this (like speedo-tegra210.c). Guessing from the use of
> tegra_fuse_read_spare() I would recommend changing its return type as it
> is returing a bit value, not necessarily semantically a boolean.

Yes, I did notice that, as well as the use of tegra_fuse_read_spare()
with boolean operators in tegra-apbmisc.c. I could change it to int if
that is what the maintainers prefer, which would also solve the warning.

Cheers,
Nathan
