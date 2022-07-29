Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C28DC3F6B0
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jul 2022 00:14:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbiG2AOw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Jul 2022 20:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbiG2AOv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Jul 2022 20:14:51 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD485925E;
        Thu, 28 Jul 2022 17:14:49 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id C83593200910;
        Thu, 28 Jul 2022 20:14:46 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 28 Jul 2022 20:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1659053686; x=1659140086; bh=1CqIgEzBLY
        47OHaV4sSf/xZhANJWym0dF7Lbe51Gho8=; b=na22atvr2WuV7fFM34KeYBBDq8
        294LzDxhiifI6RCW8CPb4vJFh6pmi1FV/Shc64y6+/8XAvsyvZ2PrDBSwnzpID7R
        I5oDr/T1/ABwhtoctHUMYS7r5Smqjr/mLiLoedkxSyyfAVHGPRiIN0Zi1R5xbNac
        yvFwnPCQ0tVcr9s3nxfuFdmFcqQUovr1n8YXmwjThOv+/hHLiWJezyBlVJ4tDdjn
        cuM58DDxvmqJe3Tz9ZGD99uJvoQZnQFt146rcMXaYI5XGAICRz/p8IK25TIsA4U4
        qwRtkTJ2KnbqZDnMZgoVG4AsR9fbelfTG2YTsaASes2KvuSiYZCvRu2XlbPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1659053686; x=1659140086; bh=1CqIgEzBLY47OHaV4sSf/xZhANJW
        ym0dF7Lbe51Gho8=; b=13c/0+w5I3n1alJt51Oobp0bmYluMp+5C7QPprovaKb1
        GSwzbYn6jH0IGTqF4b3lB/16qGUKsBNhGlE810KiMZBF3H3hnNAgq2yEOzCvawxy
        sYiKctHl7AwvRMt5AP/wTNyZ3n+JClqmmnzBhg+Q3BF/deRyF3pqPuBU9fPHv4/9
        O9f0aPOD4XgijSav2eYSANig/rPeNkEyo+90ieZuq8QEiF0xtWo/SQTOyVGT/5Eo
        LvsAUDl5pARpegz+Fs0wIKhmc27s+rm40fFcz9xHglDOm48SqEMP3BhOG6kjV3wE
        Ap/fbAISnncmpqRvf3FJx2drAlWXhdZ9IMpg5ssD9g==
X-ME-Sender: <xms:dibjYhGRYlMAhh-N63V-HmNkshSLVJq6x8bBIXibwqMfT-Pu2nGjzQ>
    <xme:dibjYmUm79AtT1GQmKCO0fuRYK9r7sxbVi1N9zzshECW6hHqP-7-zeeaAr5yfYIGx
    g4FNKk6AUd8AUbDHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduhedgudefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepkedvkeejkefgjeduffetteegjeekteetudevtdfftdeluddthfeh
    veefteekieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:dibjYjJvzsSu9R8Rzu8dwb18AOJQyfa6LiZb8uZ_lleDZJqvVpV6Gg>
    <xmx:dibjYnGwx2aqe25BuZwtETqovjhSjikdZqBUdCyxgRs8G-uTrqoOPw>
    <xmx:dibjYnVq-w2rVaOy3h_L9LT2rleWo5QkUG8RR-45vptov1e0cq60-Q>
    <xmx:dibjYuDgCS-5lruLvt5nJrRu8Xo9y3ukmaoCCvwOzzcgJMJCOJiYNQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 183BA1700083; Thu, 28 Jul 2022 20:14:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-757-gc3ad9c75d3-fm-20220722.001-gc3ad9c75
Mime-Version: 1.0
Message-Id: <833e10d7-ceb1-4859-8028-e724d41421f1@www.fastmail.com>
In-Reply-To: <20220721141325.2413920-2-arnd@kernel.org>
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-2-arnd@kernel.org>
Date:   Fri, 29 Jul 2022 09:44:25 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Arnd Bergmann" <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     "Andrew Lunn" <andrew@lunn.ch>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        linux-aspeed@lists.ozlabs.org,
        "Neil Armstrong" <narmstrong@baylibre.com>,
        "Tony Lindgren" <tony@atomide.com>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
        "Liviu Dudau" <liviu.dudau@arm.com>,
        "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
        linux-kernel@vger.kernel.org,
        "Thierry Reding" <thierry.reding@gmail.com>,
        "Alim Akhtar" <alim.akhtar@samsung.com>,
        "Fabio Estevam" <festevam@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        "Florian Fainelli" <f.fainelli@gmail.com>,
        "Alexander Shiyan" <shc_work@mail.ru>,
        "Aaro Koskinen" <aaro.koskinen@iki.fi>,
        "Will Deacon" <will@kernel.org>,
        "Gregory Clement" <gregory.clement@bootlin.com>,
        linux-sh@vger.kernel.org,
        "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
        "Russell King" <linux@armlinux.org.uk>,
        "Jernej Skrabec" <jernej.skrabec@gmail.com>,
        "Jonathan Hunter" <jonathanh@nvidia.com>,
        "Chen-Yu Tsai" <wens@csie.org>,
        bcm-kernel-feedback-list@broadcom.com,
        "NXP Linux Team" <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
        "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        "Arnd Bergmann" <arnd@arndb.de>, "Ray Jui" <rjui@broadcom.com>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Takao Orito" <orito.takao@socionext.com>,
        "Vladimir Zapolskiy" <vz@mleia.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org,
        "Scott Branden" <sbranden@broadcom.com>,
        "Taichi Sugaya" <sugaya.taichi@socionext.com>,
        "Samuel Holland" <samuel@sholland.org>,
        "Nicolas Ferre" <nicolas.ferre@microchip.com>,
        "Dinh Nguyen" <dinguyen@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Sudeep Holla" <sudeep.holla@arm.com>, linux-oxnas@groups.io,
        "Shawn Guo" <shawnguo@kernel.org>,
        "Claudiu Beznea" <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 1/6] ARM: refresh defconfig files
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On Thu, 21 Jul 2022, at 23:43, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> A lot of Kconfig options have changed over the years, and we tend
> to not do a blind 'make defconfig' to refresh the files, to ensure
> we catch options that should not have gone away.
>
> I used some a bit of scripting to only rework the bits where an
> option moved around in any of the defconfig files, without also
> dropping any of the other lines, to make it clearer which options
> we no longer have.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/configs/am200epdkit_defconfig    |  26 ++---
>  arch/arm/configs/aspeed_g4_defconfig      |  16 +--
>  arch/arm/configs/aspeed_g5_defconfig      |  16 +--

For the Aspeed bits:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
