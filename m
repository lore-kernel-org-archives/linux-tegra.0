Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF68DC43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 18:24:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B16162220E
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 18:24:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="RE2bH0s9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgIQSYV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 14:24:21 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8987 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgIQSYT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 14:24:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f63a9c50001>; Thu, 17 Sep 2020 11:24:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 17 Sep 2020 11:24:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 17 Sep 2020 11:24:17 -0700
Received: from [10.26.74.242] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 17 Sep
 2020 18:24:05 +0000
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Marc Zyngier <maz@kernel.org>
CC:     Sumit Garg <sumit.garg@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <linux-kernel@vger.kernel.org>,
        "Krzysztof Kozlowski" <krzk@kernel.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        "Linux Samsung SOC" <linux-samsung-soc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        <kernel-team@android.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
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
 <4645f636-e7cc-6983-a3b7-897c20ec5096@samsung.com>
 <ace68d00-f005-fee3-1f01-44522c180462@nvidia.com>
Message-ID: <a31dac24-7a1d-d78c-ae70-2ada2a7f7862@nvidia.com>
Date:   Thu, 17 Sep 2020 19:24:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ace68d00-f005-fee3-1f01-44522c180462@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600367045; bh=9LGKaI2wlKQQmLNzyHkqNxgojy+NS551Db2wCZaU7Uo=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=RE2bH0s9+fX29nL2J3qqqqHcvou+8d99yux+4vKOp4hbfbDzQT0r//lMc1QUPpaNK
         R45mWSmoMqFKWalEAD9rdxZ/itx+TxjFCA7vACghU6vOfARfYmOQ6ZANVAJ5WRfGPz
         jmUkPROBVmNnous/BQk0VsnycVDk6j3VmHA8YSzk2+bMBMvgehOmpHejC7hlcxRZAA
         XuWTfLwVtpws1FBh5nh49DMEvFzHL59DKutL2i09wJjnReDAXuaO1XzUfEEg7dhhZR
         cbd70Oi6I9jgFnHTVV1k27Evm5rw0w2K0jRIAEOcFJGxp+w3SYiMEl9B01enJ0jDyT
         bTTWNb76h+BgQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/09/2020 15:53, Jon Hunter wrote:

...

>> next-20200916 completely broken on ARM and ARM64. Please check 
>> next-20200915 + the mentioned fix or just check 
>> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/ipi-as-irq
> 
> OK, I have confirmed that on Tegra20 and Tegra30, that next-20200915 +
> Marc's fix boots fine.
> 
> Tegra186 and Tegra194 are not booting, but I am wondering if this is yet
> another issue that is not related. I have not actually bisected on these
> boards, but I am now bisecting on Tegra186 to confirm.

Hmm ... well bisect on Tegra186 is also pointing to this commit, but the
fix is not working there. Wonder what's going on with this gic-400?

Jon

-- 
nvpublic
