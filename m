Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5038EC4363C
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 07:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC42E207EA
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 07:22:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="lncQ3h3F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727694AbgJGHW3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 03:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbgJGHW3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 03:22:29 -0400
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CDCC061755;
        Wed,  7 Oct 2020 00:22:29 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id 7E91B5C9251;
        Wed,  7 Oct 2020 09:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1602055345;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/dAIqjiicGptdfRu3qYqqJJN23634h4i58r4TShcvuQ=;
        b=lncQ3h3FO0m7JOx+cvkZtWmAtdtQYPCKzVYKHskh6TiyZtL5ZB/ANfyxe3MlhrgeBVKWE1
        BJhpaMoqQAzmaIVCpZQvmLeDok4Y1Cm5BEW1eSeqqpHN1W8ozn+gFYPfkRxtJYuNahQCmV
        r6yQ0iCUiXbEjWMU2GuNAHpi306triE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Oct 2020 09:22:25 +0200
From:   Stefan Agner <stefan@agner.ch>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Support NVIDIA Tegra-based Ouya game console
In-Reply-To: <20201004133114.845230-1-pgwipeout@gmail.com>
References: <20201004133114.845230-1-pgwipeout@gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <cdd0f520ae4990de90f461e21cb4f298@agner.ch>
X-Sender: stefan@agner.ch
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Peter,

On 2020-10-04 15:31, Peter Geis wrote:
> Good Day,
> 
> This series introduces upstream kernel support for the Ouya game
> console device. Please review and apply. Thank you in advance.

Interesting patchset, maybe I can give my Ouya a second live now :-) Do
you happen to have (a link) to instructions how to flash the device?

Btw, there was also a driver for the Bluetooth controller on the ML
once, maybe a good time to revive that:
https://spinics.net/lists/linux-input/msg56288.html

--
Stefan

> 
> Changelog:
> v3: - Reorder aliases per Dmitry Osipenko's review.
>     - Add sdio clocks per Dmitry Osipenko's review.
>     - Add missing ti sleep bits per Dmitry Osipenko's review.
>     - Enable lp1 sleep mode.
>     - Fix bluetooth comment and add missing power supplies.
> 
> v2: - Update pmic and clock handles per Rob Herring's review.
>     - Add acks from Rob Herring to patch 2 and 3.
> 
> Peter Geis (3):
>   ARM: tegra: Add device-tree for Ouya
>   dt-bindings: Add vendor prefix for Ouya Inc.
>   dt-bindings: ARM: tegra: Add Ouya game console
> 
>  .../devicetree/bindings/arm/tegra.yaml        |    3 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  arch/arm/boot/dts/Makefile                    |    3 +-
>  arch/arm/boot/dts/tegra30-ouya.dts            | 4511 +++++++++++++++++
>  4 files changed, 4518 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/tegra30-ouya.dts
