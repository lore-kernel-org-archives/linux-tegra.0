Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4264AC433E6
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 17:40:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01C0D64F17
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 17:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhCORjv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Mar 2021 13:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231469AbhCORjk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Mar 2021 13:39:40 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8276FC06174A;
        Mon, 15 Mar 2021 10:39:40 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 4A3D022234;
        Mon, 15 Mar 2021 18:39:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1615829971;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d5Z7hIwaOvVEkPuQ/yO5n6QsbNAjH+MEMoi2JmnTPOE=;
        b=RZBHsDx9Y5MjBUY5csUgmC1nFPa8dTjN7jJIpPRI2n93+1k5+1DEroe2KSWAB1BXD655G/
        n8KQgVkL2apu2tHioXkWQJLrEA4uplu9369VnsQP84xo2jAZTV/DMKspBXYHnQBb989XTg
        gsHabVe+AdcOT3daGqCeASHgQCLOnIQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 15 Mar 2021 18:39:31 +0100
From:   Michael Walle <michael@walle.cc>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com, oder_chiou@realtek.com,
        jonathanh@nvidia.com, kuninori.morimoto.gx@renesas.com,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
        sharadg@nvidia.com
Subject: Re: [PATCH 1/2] ASoC: simple-card-utils: Do not handle device clock
In-Reply-To: <1615829492-8972-2-git-send-email-spujar@nvidia.com>
References: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
 <1615829492-8972-2-git-send-email-spujar@nvidia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <62f003b9cf2bc1ae238689ea811b870d@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am 2021-03-15 18:31, schrieb Sameer Pujar:
> This reverts commit 1e30f642cf29 ("ASoC: simple-card-utils: Fix device
> module clock"). The original patch ended up breaking following 
> platform,
> which depends on set_sysclk() to configure internal PLL on wm8904 codec
> and expects simple-card-utils to not update the MCLK rate.
>  - 
> "arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts"
> 
> It would be best if codec takes care of setting MCLK clock via DAI
> set_sysclk() callback.
> 
> Reported-by: Michael Walle <michael@walle.cc>
> Suggested-by: Mark Brown <broonie@kernel.org>
> Suggested-by: Michael Walle <michael@walle.cc>
> Fixes: 1e30f642cf29 ("ASoC: simple-card-utils: Fix device module 
> clock")
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>

Thanks!

Tested-by: Michael Walle <michael@walle.cc>

-michael
