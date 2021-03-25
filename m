Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A19C433C1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:05:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4050561962
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbhCYOFQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:05:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:36128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230413AbhCYOFI (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 10:05:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AFD361962;
        Thu, 25 Mar 2021 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616681108;
        bh=XeshBZAcsFeiOAUYe2PtNKj43OZu8tobuQFdAHD8T2Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FdyoKZOrObeOYsZuhGSLJ7RN/lbZsDVzpcwSRCGvjOCONiMrcy45OyMLVyp6Bu9cH
         vkCiJSiQ5+bpHAJkCPUYIeMPIeQ8M8giHyEtVmIxIv9VLbjh+GQGCJZTFJHn0fadwn
         3IA/spbQh8v5n4kFjaszYXpT6Cks5UPv4udVt8HSvZKy4XWQGfPmVaWxGceYECkFBJ
         qOB6gL2VTP0ySefer9Znxt+08zWEKiwGM9z50/Cx5pWvAhevBjH/50F1up4DHaQZDK
         YeE8oj2XiCfXdSIGSERRsKvUbMsLdzD7nbr+NpaKvD6fM0Sh/lMqRHM6Ws6zg+hZuN
         KahTZ+DIi75+w==
Date:   Thu, 25 Mar 2021 19:35:04 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <gregkh@linuxfoundation.org>, mturquette@baylibre.com,
        sboyd@kernel.org, robh@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        nkristam@nvidia.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 00/14] Tegra XHCI controller ELPG support
Message-ID: <YFyYkAMkWysF0JE5@vkoul-mobl.Dlink>
References: <20210120073414.69208-1-jckuo@nvidia.com>
 <YB1vGTt0ufzsYBgo@ulmo>
 <YB1wxazg/QpRSJz6@kroah.com>
 <YFszBH1JJmjJmjn2@orome.fritz.box>
 <YFs/VBZvZo6mBJqz@orome.fritz.box>
 <YFwqdNkkcrTRxSkP@vkoul-mobl.Dlink>
 <YFyXbNXSVSBGqp9i@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFyXbNXSVSBGqp9i@orome.fritz.box>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25-03-21, 15:00, Thierry Reding wrote:
> On Thu, Mar 25, 2021 at 11:45:16AM +0530, Vinod Koul wrote:
> > On 24-03-21, 14:32, Thierry Reding wrote:

> > > Also adding Vinod for visibility and in case Kishon's too busy.
> > 
> > Yes please CC me on all things phy (MAINTAINERS should have told you so)
> > 
> > If you can resend me and cc linux-phy@lists.infradead.org, I would take
> > a look. FWIW since this goes thru Greg, the window closes earlier than
> > merge window
> 
> Greg already agreed that it might be best to take this through the Tegra
> tree because there's a bunch of dependencies. For Tegra the patches go
> through ARM SoC and that usually means I have to send pull requests by
> -rc6.

Ok, i dont mind ack'ing in that case once they hit my inbox

> JC, do you have time to resend this batch this week? If not I can do it,
> too.

Thanks
-- 
~Vinod
