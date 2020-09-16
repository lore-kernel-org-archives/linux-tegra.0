Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F871C433E2
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D164220936
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="IcyIvdV5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbgIPTkD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 15:40:03 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:15021 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbgIPTjz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 15:39:55 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f6269b30000>; Wed, 16 Sep 2020 12:38:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 16 Sep 2020 12:39:55 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 16 Sep 2020 12:39:55 -0700
Received: from [10.26.74.242] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 19:39:41 +0000
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
To:     Mikko Perttunen <cyndis@kapsi.fi>, Marc Zyngier <maz@kernel.org>
CC:     Sumit Garg <sumit.garg@linaro.org>, <kernel-team@android.com>,
        "Florian Fainelli" <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <linux-kernel@vger.kernel.org>,
        "Krzysztof Kozlowski" <krzk@kernel.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Will Deacon" <will@kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20200901144324.1071694-1-maz@kernel.org>
 <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
 <933bc43e-3cd7-10ec-b9ec-58afaa619fb7@nvidia.com>
 <3378cd07b92e87a24f1db75f708424ee@kernel.org>
 <dcf812d9-2409-bcae-1925-e21740c2932e@nvidia.com>
 <a6c7bbc91c5b23baa44f3abe35eb61c9@kernel.org>
 <d6dddab0-47aa-ddf2-959b-85493b8da52d@nvidia.com>
 <13c096832bd923f956ddd7db7e337857@kernel.org>
 <02bb9262-221a-b2cf-4471-dd3a46b442e7@nvidia.com>
 <63815f37-6a82-27c2-10e9-2649b2c864a0@kapsi.fi>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <28655b4b-79fe-2400-8dbc-5592660e6b4a@nvidia.com>
Date:   Wed, 16 Sep 2020 20:39:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <63815f37-6a82-27c2-10e9-2649b2c864a0@kapsi.fi>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600285107; bh=/5KjCkcLzngnkCQGz7TD33bT1DSdH/EM8+HlFjeCcYc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=IcyIvdV5Nks+v9t6EZeKukN52YaSukQXQqwW8I/r1q3SFx3FnNyMieAHNVufe27vL
         zDdui7llBBMMflOnHIhtUSVFUZBsS+tBY6ndRO/1H+qwbnb+A/PFV5C+CYLNq2hdt7
         vWUC9ZN6W8O/CNdqSYhDUa5IftysTwJzVCoaNdRA/YzqdwNbcFFoUuzPJC4Aj098d6
         6TbohVolnqJXW2eUOZy5xKjgIJGWLMjUDmrjOONTPJSqxzoLw8FZezHkPahoBIWMu8
         WJcUiJxQh32OGmZp+nzx4bKj0gT/0ywJPuIMJXsYL11BAHR/ORl6sdxQZsJSjC2mjM
         2AxzBUS0q3yzA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/09/2020 20:26, Mikko Perttunen wrote:
> Not sure which boards this issue is happening on, but looking at my
> hobby kernel's git history (from a couple of years ago, memory is a bit
> hazy), the commit labeled "Add support for TX2" adds code to drop from
> EL2 to EL1 at boot.

I am seeing boot issues on Tegra20, Tegra30, Tegra186 and Tegra194.
Interestingly, Tegra124 and Tegra210 are booting OK.

Jon

-- 
nvpublic
