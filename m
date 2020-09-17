Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA5CC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 08:56:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EA6121973
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 08:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600332967;
	bh=ASfbwo/4BJotCpMj7MrnxB32LQiVl0LY/S/7W1o9ClQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=cUslLIAJZOGnTtguIwD8ilCkzxwIyKey1l8LuXo+uXnSdafZ3baj4uCFQRoAM4lFZ
	 Q+dNM9aBRYtxGyYg0oNxAxuARXdtRGYLzwssgH++5pLw5TCd5Z3kB8oaLgBQOgCmIf
	 ti3jiGitbBmm3//c5Nx020QNHyShiNdkRlWchQOs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgIQI4G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 04:56:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726153AbgIQI4G (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 04:56:06 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D02D20872;
        Thu, 17 Sep 2020 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600332965;
        bh=ASfbwo/4BJotCpMj7MrnxB32LQiVl0LY/S/7W1o9ClQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NIsDDqrMZEiDV2K+294cpkk8I8IoVTVX++VJYwcYjwvpsHYyEivEzbcDY7kS4dv/C
         f6MW32b0HphaYNgS5OTQxCb0fXwDpCMuadjC8HpR3T0iGaNegdR93t+LctC3djZ7TA
         3S3HCD2P2yGXRYsv9fIdurfAplIkBU0xb393URxw=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kIphz-00CaER-QG; Thu, 17 Sep 2020 09:56:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Sep 2020 09:56:03 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@linaro.org>,
        kernel-team@android.com, Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
In-Reply-To: <e317b2fe-52e3-8ce7-ba77-43d2708d660f@nvidia.com>
References: <20200901144324.1071694-1-maz@kernel.org>
 <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
 <933bc43e-3cd7-10ec-b9ec-58afaa619fb7@nvidia.com>
 <3378cd07b92e87a24f1db75f708424ee@kernel.org>
 <CACRpkdYvqQUJaReD1yNTwiHhaZpQ9h5Z9DgdqbKkCexnM7cWNw@mail.gmail.com>
 <049d62ac7de32590cb170714b47fb87d@kernel.org>
 <a88528cd-eb76-367a-77d6-7ae20bd28304@nvidia.com>
 <81cb16323baa1c81e7bc1e8156fa47b8@kernel.org>
 <e317b2fe-52e3-8ce7-ba77-43d2708d660f@nvidia.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <2fc64291c2c890c7ea7b8718c810ad64@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jonathanh@nvidia.com, linus.walleij@linaro.org, m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, sumit.garg@linaro.org, kernel-team@android.com, f.fainelli@gmail.com, linux@arm.linux.org.uk, jason@lakedaemon.net, saravanak@google.com, andrew@lunn.ch, catalin.marinas@arm.com, gregory.clement@bootlin.com, b.zolnierkie@samsung.com, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, tglx@linutronix.de, will@kernel.org, Valentin.Schneider@arm.com, linux-tegra@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-09-17 09:49, Jon Hunter wrote:
> On 17/09/2020 09:45, Marc Zyngier wrote:
>> On 2020-09-17 08:54, Jon Hunter wrote:

>>> So far, I have only tested this patch on Tegra20. Let me try the 
>>> other
>>> failing boards this morning and see if those still fail.
>> 
>> Tegra20 (if I remember well) is a dual A9 with the same GIC 
>> implementation
>> as Ux500, hence requiring the source CPU bits to be written back. So 
>> this
>> patch should have cured it, but didn't...
>> 
>> /me puzzled.
> 
> Me too. Maybe there just happens to be something else also going wrong
> in next. I am doing a bit more testing to see if applying the fix
> directly on top of this change fixes it to try and eliminate anything
> else in -next.
> 
> Linus, what -next are you testing on? I am using next-20200916.

You can directly try [1], which has all the queued fixes (and only 
that).

         M.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/ipi-as-irq
-- 
Jazz is not dead. It just smells funny...
