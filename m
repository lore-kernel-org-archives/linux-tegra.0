Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13423C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 12:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4E6C64F6C
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 12:31:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhCLMa0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 07:30:26 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:57033 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhCLMaE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 07:30:04 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 550BD22238;
        Fri, 12 Mar 2021 13:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1615552202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DLDt3qK5Lj/9krzodd0NKRhKwpbPQn93pLiyIHMlDW4=;
        b=JUibZx2YXrL0+9ptaGFBZofuARSICiab+jH7Ss0cay9ZcmU0D3vh1gZdeXXD0DNc3h3g60
        LMYwkXdk50J1K4d0J8tLLq6ujOw7IzFxnNqUyJ+Zaj8wxNqlj0qw3slHj3m1GJZl1orOYk
        p42hD3MvuvCFZihjvNoxAoQCNJZhEPs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 12 Mar 2021 13:30:02 +0100
From:   Michael Walle <michael@walle.cc>
To:     Mark Brown <broonie@kernel.org>
Cc:     Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <20210312120456.GD5348@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
 <6ed28bb5330879b1919aced5174f319f@walle.cc>
 <20210312120456.GD5348@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <684332700f8be9f77348a510eb6eba22@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am 2021-03-12 13:04, schrieb Mark Brown:
> On Fri, Mar 12, 2021 at 01:01:41PM +0100, Michael Walle wrote:
>> Am 2021-03-12 12:35, schrieb Mark Brown:
> 
>> > If the card has a clock API clock as sysclk then set_sysclk(() should
>> > be configuring that clock.
> 
>> What do you mean by "the card". The simple-audio-card itself?
> 
>> Take a look at:
>> https://elixir.bootlin.com/linux/v5.12-rc2/source/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts#L29
> 
>> Does the card has a clock? IMHO the WM8904 codec has a clock, but not
>> the audio card.
> 
> The clock on the CODEC, which the card configures.  The CODEC should be
> passing on the configuration to the clock API.

Sorry, I don't understand.

The card calls set_sysclk(), which eventually ends up in the codec.
The codec therefore, could figure out if it needs to configure the
clock or if it can use its internal FLL.
Is that what you mean?

But the set_sysclk() of the codec isn't even called, because the
card itself already tries to call clk_set_rate() on the Codec's MCLK,
which returns with an error [0].

[0] 
https://elixir.bootlin.com/linux/v5.12-rc2/source/sound/soc/generic/simple-card-utils.c#L265

-michael
