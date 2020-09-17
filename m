Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA12C43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 09:29:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB7F420770
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600334950;
	bh=+HiIxjCTi2UxE0tL5EFrkZ6hadNYj6Tx+yaIuvsKGAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=GYTIN20tSxgtPQlB40WMi5wvQx5tnFMgol453VRPr0ceOLLlklKBRGpdla9k5LGGa
	 ekF9ewlW4DbZlRIUQp7Lm+p97ZIhoz1a3wyAO3ebhd4YYlRc4ztx/xZl+o8li1IHF3
	 ldu1oRnHc2RVJuOXp8EN2hUqfwiMIOmZIL/TkrSM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgIQJ3F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 05:29:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:38186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726180AbgIQJ3E (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 05:29:04 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 760A6206E6;
        Thu, 17 Sep 2020 09:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600334943;
        bh=+HiIxjCTi2UxE0tL5EFrkZ6hadNYj6Tx+yaIuvsKGAQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=zgzseetFM2Zg7BX1vbmvRwxcaGYWo0pVQRch8wbH4Do9FqEoBt4zfkh5O8LqRPW47
         lEKWnLEvXzaWXjA4Tksp6LbYi4ou27CsQBuOEmGCRgWGu0gkp6bIg/pRejIjnbeQur
         VRr/6lvePHSK0YUq1XEVlFlQNgWrXrgVr9wqGAzs=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kIqDt-00CaaF-HC; Thu, 17 Sep 2020 10:29:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Sep 2020 10:29:01 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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
In-Reply-To: <54318b15-cfa4-1460-1e8b-049da2ab2bda@samsung.com>
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
 <bec733a1-227f-d943-90dd-85fc9a993109@nvidia.com>
 <54318b15-cfa4-1460-1e8b-049da2ab2bda@samsung.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <1831a66f81bbacc337329a8b57297d83@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: m.szyprowski@samsung.com, jonathanh@nvidia.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, sumit.garg@linaro.org, kernel-team@android.com, f.fainelli@gmail.com, linux@arm.linux.org.uk, jason@lakedaemon.net, saravanak@google.com, andrew@lunn.ch, catalin.marinas@arm.com, gregory.clement@bootlin.com, b.zolnierkie@samsung.com, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, tglx@linutronix.de, will@kernel.org, Valentin.Schneider@arm.com, linux-tegra@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-09-17 10:13, Marek Szyprowski wrote:

[...]

>>>> Linus, what -next are you testing on? I am using next-20200916.
>>> next-20200916 completely broken on ARM and ARM64. Please check
>>> next-20200915 + the mentioned fix or just check
>>> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/ipi-as-irq
>> Ah thanks! Any idea what is causing the other failure on 
>> next-20200916?
>> 
>> Yes we have noticed that now everything fails next-20200916 so not 
>> just
>> this issue.
> 
> The issue is caused by commit c999bd436fe9 ("mm/cma: make number of CMA
> areas dynamic, remove CONFIG_CMA_AREAS")
> 
> https://lore.kernel.org/linux-arm-kernel/20200915205703.34572-1-mike.kravetz@oracle.com/

There is a workaround here[1] for arm64, but I doubt that's the end of
it (32bit is still dead).

         M.

[1] 
https://lore.kernel.org/linux-arm-kernel/20200916085933.25220-1-song.bao.hua@hisilicon.com/
-- 
Jazz is not dead. It just smells funny...
