Return-Path: <SRS0=kXk7=C3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AAB2C43466
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 08:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDF0421D42
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600417451;
	bh=lUYNaNiZ3xGBR8zJ1KybHo8613T0moodIxZkxWsv0X4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=035OOPh93X0blY91M+fjEMOwMEs5IwUb2R/FXvf4l2n8A+JZ8ByaUCCYZ1HbpSKFw
	 5RWZpj/zbyyuCTf1gcMWd9a/Mpga2r9KMMQESlMiLL+1U1TAAXO/IZRi3f9muLybBa
	 ykC2eni1TZmFjpq+a8syeTbntRWjxvglsY2pc+vg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgIRIYH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Sep 2020 04:24:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:48146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726366AbgIRIYH (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Sep 2020 04:24:07 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6712A21D42;
        Fri, 18 Sep 2020 08:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600417446;
        bh=lUYNaNiZ3xGBR8zJ1KybHo8613T0moodIxZkxWsv0X4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PEy+iwxuA+46MoaY0Gk6Pt+Hlx3cPzAx+FTYDsBoElEwdtee7tgLtoBVFtFoX0Adm
         FbwTnHJ+WK18H4b9brnxV/OV8FmlP+ueWUju5WlkK5oIYQMxZrVjr6W7Z+oWN8bzHo
         xXynd0zhqNghGEU891wrj1SAn6V7um6nC+4ERrnE=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kJBga-00Cvso-IJ; Fri, 18 Sep 2020 09:24:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Sep 2020 09:24:04 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com,
        Gregory Clement <gregory.clement@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
In-Reply-To: <a31dac24-7a1d-d78c-ae70-2ada2a7f7862@nvidia.com>
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
 <a31dac24-7a1d-d78c-ae70-2ada2a7f7862@nvidia.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <e757da2ab2452da6dbaf98a752688eaf@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jonathanh@nvidia.com, m.szyprowski@samsung.com, sumit.garg@linaro.org, f.fainelli@gmail.com, linux@arm.linux.org.uk, jason@lakedaemon.net, saravanak@google.com, andrew@lunn.ch, catalin.marinas@arm.com, linus.walleij@linaro.org, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org, krzk@kernel.org, Valentin.Schneider@arm.com, will@kernel.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, tglx@linutronix.de, kernel-team@android.com, gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-09-17 19:24, Jon Hunter wrote:
> On 17/09/2020 15:53, Jon Hunter wrote:
> 
> ...
> 
>>> next-20200916 completely broken on ARM and ARM64. Please check
>>> next-20200915 + the mentioned fix or just check
>>> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/ipi-as-irq
>> 
>> OK, I have confirmed that on Tegra20 and Tegra30, that next-20200915 +
>> Marc's fix boots fine.
>> 
>> Tegra186 and Tegra194 are not booting, but I am wondering if this is 
>> yet
>> another issue that is not related. I have not actually bisected on 
>> these
>> boards, but I am now bisecting on Tegra186 to confirm.
> 
> Hmm ... well bisect on Tegra186 is also pointing to this commit, but 
> the
> fix is not working there. Wonder what's going on with this gic-400?

It's not GIC400. I have tons of machines with GIC400 around me, and they
don't even need the fix. What happens if you only boot the non-Denver 
CPUs?

         M.
-- 
Jazz is not dead. It just smells funny...
