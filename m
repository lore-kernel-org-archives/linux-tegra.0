Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270D9C433E6
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 12:06:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D854864EE1
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 12:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbhCOMFw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Mar 2021 08:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbhCOMFe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Mar 2021 08:05:34 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E919C061574;
        Mon, 15 Mar 2021 05:05:34 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 574BC22172;
        Mon, 15 Mar 2021 13:05:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1615809930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=56lCTBoJc0zn0J8RcUtKReFHALPDLgWyoBcvGIIJrSo=;
        b=BszTYF2fRmRNnTp2xegfjD1M2aL7Lv/SCZp2gUsxRz9qL408p1dFznBJQRUXFOa+pcOgLM
        Bb3m8lvAeQkYYDvmlC6pzSOI5Sh6XWmUUH2lVRJGgiaPIK+qi8MJqFtiarVOojGSsRK9FE
        IJQFg0/hF+UbpkNIqCjKlQSBGwk1w+s=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 15 Mar 2021 13:05:30 +0100
From:   Michael Walle <michael@walle.cc>
To:     Mark Brown <broonie@kernel.org>, Sameer Pujar <spujar@nvidia.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        jonathanh@nvidia.com, kuninori.morimoto.gx@renesas.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        robh@kernel.org, sharadg@nvidia.com, thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <20210312134642.GF5348@sirena.org.uk>
References: <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
 <6ed28bb5330879b1919aced5174f319f@walle.cc>
 <20210312120456.GD5348@sirena.org.uk>
 <684332700f8be9f77348a510eb6eba22@walle.cc>
 <20210312134642.GF5348@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8cdf1cfa971945792b509a687a4de735@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am 2021-03-12 14:46, schrieb Mark Brown:
> On Fri, Mar 12, 2021 at 01:30:02PM +0100, Michael Walle wrote:
> 
>> The card calls set_sysclk(), which eventually ends up in the codec.
>> The codec therefore, could figure out if it needs to configure the
>> clock or if it can use its internal FLL.
>> Is that what you mean?
> 
> Yes.
> 
>> But the set_sysclk() of the codec isn't even called, because the
>> card itself already tries to call clk_set_rate() on the Codec's MCLK,
>> which returns with an error [0].
> 
> OK, so I think we need to push this down a level so that the clock
> setting is implemented by the core/CODEC rather than by simple-card,
> with the helpers being something the CODEC can opt out of.

Sameer, it looks like the proper fix should be to add the clock
support to your codec.

I've also looked at other users of "simple-audio-card" and
it looks like they will break too. For example,
- arch/arm64/boot/dts/rockchip/rk3399.dtsi
     If I'm not mistaken, this will try to set the first clock
     of hdmi@ff940000 there, which is "iahb".
- arch/arm/boot/dts/sun8i-a33.dtsi
     There "&ccu CLK_BUS_CODEC" of codec@1c22e00 will be changed

And it doesn't stop there, it also sets the first clock
of the CPU endpoint, which I guess just works because .set_rate
is a noop for the most clocks which are used there.

-michael
