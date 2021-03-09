Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3301CC433DB
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Mar 2021 22:30:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01D35650E5
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Mar 2021 22:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbhCIWaZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 9 Mar 2021 17:30:25 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:49647 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbhCIWaV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Mar 2021 17:30:21 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 9EC5D2223A;
        Tue,  9 Mar 2021 23:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1615329018;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hd2LMGNdbPy56tyf0yjAuAUyGKnyIDHM2Ywt14xCuRI=;
        b=sFwZIOc4jVQsnrU/IpsFHUvES+v/WU9a6X0fpFw+fV9cJ+ypQyetm5o8RxYUHXYvEgrE73
        2f7r39G59iKuo2YJYarJW9iR83Cy1zEA/I2tKdhpoDqA14pE3yAukYE3qGBBaj7hEgrLwp
        pOkNBuLWgTuo5kH8kqvpySYtTeL2VU4=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Mar 2021 23:30:16 +0100
From:   Michael Walle <michael@walle.cc>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     alsa-devel@alsa-project.org, broonie@kernel.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Sameer,

Am 2021-03-09 17:27, schrieb Sameer Pujar:
> On 3/9/2021 8:11 PM, Michael Walle wrote:
>>> If "clocks = <&xxx>" is specified from the CPU or Codec component
>>> device node, the clock is not getting enabled. Thus audio playback
>>> or capture fails.
>>> 
>>> Fix this by populating "simple_dai->clk" field when clocks property
>>> is specified from device node as well. Also tidy up by re-organising
>>> conditional statements of parsing logic.
>>> 
>>> Fixes: bb6fc620c2ed ("ASoC: simple-card-utils: add 
>>> asoc_simple_card_parse_clk()")
>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> 
>> This actually breaks sound on my board
>> (arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts).
>> The codec on this board (wm8904) has a fixed clock input (only 
>> distinct
>> frequencies are supported) and uses the FLL of the codec to generate 
>> the
>> desired sample rate.
>> 
>> It seems that after this patch the clock rate of the codecs clock 
>> (rather
>> than the FLL) is tried to be changed. Which fails, because it doesn't
>> support arbitrary frequencies.
> 
> Yes, after the given change the clock will be updated if "*mclk-fs"
> property is specified.
> 
> DT you mentioned has property "simple-audio-card,mclk-fs = <256>",
> which means you need a clock that is a function of sample rate. But as
> per above you want a fixed clock for MCLK. I think if you drop this
> property, the clock updates won't happen. Earlier for your case, this
> property was not used at all because the clock handle was not
> populated.

You mean to drop the mclk-fs property? I can't do that because I
actually need a frequency of 256 * sample rate. But that doesn't
necessarily need to be the MCLK, because the codec itself has a
FLL/PLL which can be used to generate any frequency for a given
MCLK. So that is a valid scenario. See also commit 13409d27cb39
("ASoC: wm8904: configure sysclk/FLL automatically").

-michael
