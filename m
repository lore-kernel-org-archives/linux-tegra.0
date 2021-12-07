Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A0FC433F5
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 17:45:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235315AbhLGRs5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 12:48:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233774AbhLGRs4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Dec 2021 12:48:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121EDC061574;
        Tue,  7 Dec 2021 09:45:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 33BB4B8174A;
        Tue,  7 Dec 2021 17:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4A6C341C1;
        Tue,  7 Dec 2021 17:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638899122;
        bh=KjWNHaT0pVUYgAY1hh4MpIytf4YMbPixMZIjWDNj2ZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W4T9+TttHp+ONF28qWtBBu5kKm3s6q3YfO8KoVw+BmE/D6tlOF+Serlp/dLC6L335
         FXy6buBKVY/ny7D6WwBz4er/lVjLB5A4xXY0QYFESYZJQ6DqWwIP2CVb/k3vtKlIJ5
         alxwphmb2XZqMbqnis0PriRTBQTdd2XW964JXZRs=
Date:   Tue, 7 Dec 2021 18:45:19 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/11] misc: sram: Add compatible string for Tegra234
 SYSRAM
Message-ID: <Ya+dr3ZOXVMwy/3I@kroah.com>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
 <20211112123542.3680629-6-thierry.reding@gmail.com>
 <Ya+DMHSYt7T22fYX@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ya+DMHSYt7T22fYX@orome.fritz.box>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Dec 07, 2021 at 04:52:16PM +0100, Thierry Reding wrote:
> On Fri, Nov 12, 2021 at 01:35:36PM +0100, Thierry Reding wrote:
> > From: Mikko Perttunen <mperttunen@nvidia.com>
> > 
> > We want to use the same behavior as on Tegra186 and Tegra194, so add
> > this the compatible string for Tegra234 SYSRAM to the list.
> > 
> > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/misc/sram.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Hi Greg,
> 
> I forgot to Cc you on the initial submission, not realizing that I had
> this one-line driver change mixed into a set of DT bindings and device
> tree updates.
> 
> Quoting in full. Would you mind if I pick this up into the Tegra tree,
> or do you want me to resend this to you for inclusion in your tree?

A separate stand-alone patch would be great as b4 wants to grab all of
the patches in this series.

thanks,

greg k-h
