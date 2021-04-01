Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4550DC433B4
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 05:16:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F9986108F
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 05:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhDAFQA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 01:16:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:60784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229459AbhDAFPY (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 1 Apr 2021 01:15:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8922E60698;
        Thu,  1 Apr 2021 05:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617254124;
        bh=8NtburFMkGmcAYV5T3rhtkugYAkB42xpELqKvPB6a5g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c+K3dyAAmxgn3sj1E3F05hptmOezBg11CPHGOBpz1YA/FAZx0kJqL4OAtNrM796HA
         9YTao6tY4Hb/dnka8/T86iZfHhnls91vfNiAFkEtjltYMTDulSYcAk2Fb5qUWCeO8U
         fjv/FrfVVKjkiBbg5/PRZnFXA7F8s7dS87bOfczAXJ1cWh73cbFgMPdv9ko/B+d4VR
         shFR4Ik0UV3V78bwVXdQits0ZAzVmCARX7w769pZPw56KhytissJJ1qcQXOMTZfeNr
         ceOhyOON8MPxkAFZFl5brIrEHkEO6ZEFg0ROCrQNIK9vRnFhoC34MHoWL9wev3oAXu
         U8UkRf9jL7jgA==
Date:   Thu, 1 Apr 2021 10:45:20 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 03/13] phy: tegra: xusb: Move usb3 port init for
 Tegra210
Message-ID: <YGVW6LEZM2w+dyJ8@vkoul-mobl.Dlink>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-4-thierry.reding@gmail.com>
 <YGMx5cLmX+d48XKO@vkoul-mobl.Dlink>
 <YGSkAcRLByY8zNnu@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGSkAcRLByY8zNnu@orome.fritz.box>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31-03-21, 18:32, Thierry Reding wrote:
> On Tue, Mar 30, 2021 at 07:42:53PM +0530, Vinod Koul wrote:
> > Hi Thierry,
> > 
> > On 25-03-21, 17:40, Thierry Reding wrote:
> > 
> > > +static struct tegra_xusb_usb3_port *
> > > +tegra210_lane_to_usb3_port(struct tegra_xusb_lane *lane)
> > > +{
> > > +	int port;
> > > +
> > > +	if (!lane || !lane->pad || !lane->pad->padctl)
> > > +		return NULL;
> > 
> > This looks problematic to me, so if lane is NULL, it will still go ahead
> > and check lane->pad which would result in NULL pointer dereference.
> 
> No, this isn't going to result in a NULL pointer dereference because the
> compiler will short-circuit this if the first expression is true. If the
> lane parameter is NULL, then the entire expression is going to be true
> no matter what lane->pad and lane->pad->padctl evaluate to (because of
> the logical OR) and hence the compiler knows that it can skip the rest.

Yes, that is correct. I assumed wrongly, so:

Acked-By: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
