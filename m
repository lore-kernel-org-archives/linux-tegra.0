Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910E4C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 15:44:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B3B364ECD
	for <linux-tegra@archiver.kernel.org>; Thu, 11 Mar 2021 15:44:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbhCKPnb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 10:43:31 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:44403 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234164AbhCKPnX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 10:43:23 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 087662224F;
        Thu, 11 Mar 2021 16:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1615477401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4E0kyLx6eQ/C8Z24BR6u+cUJgT5ViA0Q6ynIRgxXQaI=;
        b=nnoOY3nXiQJXY8eEdfWGXbBl1vxhlLuSRABQDNnG6ui/zHZ4x4l5ZNOTqAsqXIPw9r71Gp
        HbfoE5F8JnPsuuxQRRXUbfiJqKYeyD/8mvAsN/8U5LkacOYrb7DYnXDuPOPk9cqqRaceKw
        go9v4YCh+yPGVVecKnUprx6wNaRkI7k=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 11 Mar 2021 16:43:20 +0100
From:   Michael Walle <michael@walle.cc>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     alsa-devel@alsa-project.org, broonie@kernel.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, sharadg@nvidia.com,
        thierry.reding@gmail.com
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <36c37df5-dffb-9168-d92f-4b3e482602fa@nvidia.com>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <eb26f8e0a4c99d0c9de9d92612102718@walle.cc>
 <fa654e7a-80cc-7ae8-15c6-780e7fa29bb1@nvidia.com>
 <cadc59f29bbb2e0d02235d4c10cb7f4d@walle.cc>
 <36c37df5-dffb-9168-d92f-4b3e482602fa@nvidia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <d4947632a8b3ebefff7fb6751d05a9bd@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am 2021-03-11 15:29, schrieb Sameer Pujar:
> On 3/11/2021 4:46 PM, Michael Walle wrote:
>> Am 2021-03-11 12:05, schrieb Sameer Pujar:
>> 
>>> It would work and initially I had similar patch, see [0] and related
>>> series. Suggestion is to always use "clocks" property with devices
>>> only.
>> 
>> I see. But again, I don't think it is correct to change the clock of
>> the codec by default. What happens if this is for example a
>> compatible = "fixed-clock"?
> 
> The codec rate won't be changed unless a corresponding "*mclk-fs" is 
> provided.
> 
>> 
>> As you pointed out in the referred thread [0]. simple-audio-card has
>> that clock and judging from the code it is exactly for this reason:
>> to either change/enable it or not.
>> 
> 
> 
>> With this patch you'll switch that to "always change it". Therefore,
>> shouldn't there be a dt flag to indicate wheter 
>> simple-audio-card/graph
>> should be in charge of the codecs clock input?
> 
> As mentioned above, it does not change always. Requires "*mclk-fs" to 
> do so.

As mentioned earlier, this is changing the sysclk, too. And I'd guess
most codecs need a fixed factor for the sysclk, thus if the codec 
supports
generating its own sysclk by a PLL it will need this factor, too.

Which is also defined in the binding:

   system-clock-frequency:
     description: |
       If a clock is specified and a multiplication factor is given with
       mclk-fs, the clock will be set to the calculated mclk frequency
       when the stream starts.


> May be below could be a possible alternative?
> - Re-order if-else of clock parsing.
> 
>    if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
>        // Since you are fixing rate already via "assigned-clocks" this
> may be a duplication. OR

exactly. and also need a device tree change (also for older kernels)
on my side.

This could be a last resort, yes. But I'd rather see a flag which
indicates whether the simple-audio-card should control the (first)
clock of the codec or not. Because until now, this wasn't the case.
And I don't know if this was an oversight or on purpose. Kuninori would
need to comment on that. And with the "we change mclk by default", we
break codecs with automatic sysclk generation.

>        // "assigned-clocks" can be parsed to understand if a fixed
> rate is expected.

Sounds like a hack to me. Esp. its doing the same as its already
doing right now. That is a "sysfreq = clk_get_rate(codec)".

>        simple_dai->sysclk = val;
>    } else {
>        // fetch MCLK clock from device and setup sysclk
>        // a. If "*mclk-fs" is given and "clocks" is found, the rate
> would be updated.
>        // b. If "*mclk-fs" is not mentioned and "clocks" is found,
> then simple-card utils won't touch rate. It will just do clock
> enable/disable.

mclk-fs is also a factor for the sysclk, thus it is also needed
if there is no mclk (or a fixed mclk).

I don't think you can deduce whether you can change the codecs
first clock with the current information :(

>    }
> 
>> 
>> And its fetching just the first clock, doesn't it? What happens if a
>> codec has two clock inputs?
> 
> Yes, it would have been more descriptive if it were specifically
> looking for clock "mclk". I think the original assumption was codec
> takes one input clock (MCLK) and uses it for sysclk.

Yeah, I've just noticed that the clk_get_rate() also only works
for the first clock of the codec.

-michael
