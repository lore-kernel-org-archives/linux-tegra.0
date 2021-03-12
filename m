Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4252C433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 12:02:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B0D665004
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 12:02:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhCLMB4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 07:01:56 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:39721 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbhCLMBn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 07:01:43 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 9B6AC22238;
        Fri, 12 Mar 2021 13:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1615550502;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fW2gTmh4PzgbJrGWy/381fOG4Lx9Rw+iMj4STBKbzXc=;
        b=iaj7o6dL1mWyPoPOEazdaiHA68HsVTcD2IfHTNByW16TuaT+wokwGVZpyjVLNsvzDu4ufY
        kt7WueG1k02GKHrkht1oWyMJEvYRzWpi5JkC5vwmta2TTZeSTZTy7fl8RKjYhf1Vtd6W+6
        1Efo06VnGYEf29lcBWXB0JqFA3kFzdg=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 12 Mar 2021 13:01:41 +0100
From:   Michael Walle <michael@walle.cc>
To:     Mark Brown <broonie@kernel.org>
Cc:     Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <20210312113544.GB5348@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <6ed28bb5330879b1919aced5174f319f@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am 2021-03-12 12:35, schrieb Mark Brown:
> On Thu, Mar 11, 2021 at 11:11:15PM +0100, Michael Walle wrote:
>> Am 2021-03-11 17:15, schrieb Mark Brown:
> 
>> > The trick is figuring out if it's best to vary the input clock
>> > or to use the FLL to adapt a fixed input clock,
> 
>> For simple-audio-card you can set the "clock" property if you want
>> that clock to be changed/enabled/disabled. But that doesn't seem to
>> be the way to go, at least it was NAKed by Rob for the 
>> audio-graph-card.
>> I don't see a way to figure out if MCLK should be controlled by
>> simple-*-card without adding further properties to the device tree.
> 
> If the card has a clock API clock as sysclk then set_sysclk(() should
> be configuring that clock.

What do you mean by "the card". The simple-audio-card itself?

Take a look at:
https://elixir.bootlin.com/linux/v5.12-rc2/source/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts#L29

Does the card has a clock? IMHO the WM8904 codec has a clock, but not
the audio card.

-michael
