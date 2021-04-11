Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88D8C433ED
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Apr 2021 14:30:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8B9E611AD
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Apr 2021 14:30:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbhDKOav (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Apr 2021 10:30:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:44076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235095AbhDKOau (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Apr 2021 10:30:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B975660FD8;
        Sun, 11 Apr 2021 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618151433;
        bh=pCMnb5nX7ZCPBwul6KUVOSq+mnPHU59xMBeUvZ7Eegk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iafxZ7UpdQ/DxbNUOcTV807BWTcf4VS2rdAWWBz0nJHWY51eODVHwQjTwOqJbxd+M
         0hoUMXy2ljcHtm8SK3b9MQvqKf5/L5rW1nVw71sLlzP+JvJXgkxCZ5FUAI2J65xa2z
         obUxH4hJy4SJYqIINS7orqqOy7/isPI33zLGEqM54+OgCB/k2FYUDnhCBe5q091Ud8
         J1F4KakoLZQLUkiJ9r/c4IZaL2cbxRNZYOg0E3Ul0/NVyXCNRdzyV+ndbqBjvQfjt/
         oEDDe94y5T2Amr/Rqwzd5bI4dCHNseCcSlO2g2WkAVAUJBkOmSPClT6vvjd556GVZO
         adJCs/G2UjycQ==
Date:   Sun, 11 Apr 2021 20:00:28 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 09/13] phy: tegra: xusb: Add wake/sleepwalk for
 Tegra210
Message-ID: <YHMIBES4z7RLFUMS@vkoul-mobl.Dlink>
References: <20210325164057.793954-10-thierry.reding@gmail.com>
 <20210401110512.2743589-1-thierry.reding@gmail.com>
 <YGvrMJ6FwwV3KOpt@vkoul-mobl.Dlink>
 <YGxo6558N4llZo2U@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGxo6558N4llZo2U@orome.fritz.box>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

On 06-04-21, 15:58, Thierry Reding wrote:
> On Tue, Apr 06, 2021 at 10:31:36AM +0530, Vinod Koul wrote:
> > On 01-04-21, 13:05, Thierry Reding wrote:
> > > From: JC Kuo <jckuo@nvidia.com>
> > > 
> > > This commit implements Tegra210 XUSB PADCTL wake and sleepwalk
> > > routines. Sleepwalk logic is in PMC (always-on) hardware block.
> > > PMC driver provides managed access to the sleepwalk registers
> > > via regmap framework.
> > 
> > Acked-By: Vinod Koul <vkoul@kernel.org>
> 
> Hi Vinod,
> 
> thanks for looking at these so quickly. Unfortunately this missed the
> v5.12-rc6 cut-off for ARM SoC. However, all the prerequisites are now
> in ARM SoC and Greg had acked the XHCI patches, another option would
> be for me to send you a pull request for this series with all the
> prerequisites (that are already in ARM SoC) included for v5.13. What
> do you think?

Sorry but phy tree goes thru Greg as well and PR is already done.

-- 
~Vinod
