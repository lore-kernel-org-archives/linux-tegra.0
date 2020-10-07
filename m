Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82876C4363D
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 14:19:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2659C21531
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 14:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbgJGOTE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 10:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGOTE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 10:19:04 -0400
X-Greylist: delayed 2553 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 07 Oct 2020 07:19:03 PDT
Received: from verain.settrans.net (verain.settrans.net [IPv6:2a00:1098:0:86:1000:11:ea:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F0CC061755;
        Wed,  7 Oct 2020 07:19:03 -0700 (PDT)
Received: from [185.132.133.26] (helo=lotus.a.rb)
        by verain.settrans.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <rah@settrans.net>)
        id 1kQ9cJ-0002Ny-EW; Wed, 07 Oct 2020 14:36:27 +0100
Received: from localhost ([127.0.0.1])
        by lotus.a.rb with esmtp (Exim 4.92)
        (envelope-from <rah@settrans.net>)
        id 1kQ9cI-0000DG-OJ; Wed, 07 Oct 2020 14:36:26 +0100
To:     Stefan Agner <stefan@agner.ch>, Peter Geis <pgwipeout@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lukas Rusak <lorusak@gmail.com>
References: <20201004133114.845230-1-pgwipeout@gmail.com>
 <cdd0f520ae4990de90f461e21cb4f298@agner.ch>
From:   Bob Ham <rah@settrans.net>
Autocrypt: addr=rah@settrans.net; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH v3 0/3] Support NVIDIA Tegra-based Ouya game console
Message-ID: <4d3eb998-045b-f288-7a9c-aaa620c38bff@settrans.net>
Date:   Wed, 7 Oct 2020 14:36:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cdd0f520ae4990de90f461e21cb4f298@agner.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi all,

The Bluetooth controller driver sent to linux-input by Lukas Rusak
(CC'd) is a bit of a concern.  Here is the original driver:

https://github.com/ouya/ouya_1_1-kernel/blob/master/drivers/hid/hid-ouya.c

and you can see that there is no SPDX header, no license information and
no MODULE_LICENSE declaration.  I'd previously noticed this as a
possible cause for concern in upstreaming the driver.

Meanwhile, Lukas's driver is clearly derived from the Ouya Inc. driver
and even retains the Ouya Inc. copyright notice line.  However, Lukas's
driver now has a MODULE_LICENSE("GPL") declaration added.

Lukas, did you get clear permission to license the driver as GPL?

Alternatively, kernel developers with greater legal or Ouya knowledge,
is this actually a concern or is it nothing to worry about?

Thanks,

Bob


On 07/10/2020 08:22, Stefan Agner wrote:
> Hi Peter,
> 
> On 2020-10-04 15:31, Peter Geis wrote:
>> Good Day,
>>
>> This series introduces upstream kernel support for the Ouya game
>> console device. Please review and apply. Thank you in advance.
> 
> Interesting patchset, maybe I can give my Ouya a second live now :-) Do
> you happen to have (a link) to instructions how to flash the device?
> 
> Btw, there was also a driver for the Bluetooth controller on the ML
> once, maybe a good time to revive that:
> https://spinics.net/lists/linux-input/msg56288.html
> 
> --
> Stefan
> 
>>
>> Changelog:
>> v3: - Reorder aliases per Dmitry Osipenko's review.
>>     - Add sdio clocks per Dmitry Osipenko's review.
>>     - Add missing ti sleep bits per Dmitry Osipenko's review.
>>     - Enable lp1 sleep mode.
>>     - Fix bluetooth comment and add missing power supplies.
>>
>> v2: - Update pmic and clock handles per Rob Herring's review.
>>     - Add acks from Rob Herring to patch 2 and 3.
>>
>> Peter Geis (3):
>>   ARM: tegra: Add device-tree for Ouya
>>   dt-bindings: Add vendor prefix for Ouya Inc.
>>   dt-bindings: ARM: tegra: Add Ouya game console
>>
>>  .../devicetree/bindings/arm/tegra.yaml        |    3 +
>>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>>  arch/arm/boot/dts/Makefile                    |    3 +-
>>  arch/arm/boot/dts/tegra30-ouya.dts            | 4511 +++++++++++++++++
>>  4 files changed, 4518 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts
> 
