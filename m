Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5382EC433E2
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 21:02:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F08E9221F1
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 21:02:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="h4M5AySz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgIPVBv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 17:01:51 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3555 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgIPQaX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 12:30:23 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f621e260000>; Wed, 16 Sep 2020 07:16:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 16 Sep 2020 07:16:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 16 Sep 2020 07:16:49 -0700
Received: from [10.26.74.242] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 14:16:37 +0000
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Marc Zyngier <maz@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Sumit Garg <sumit.garg@linaro.org>, <kernel-team@android.com>,
        "Florian Fainelli" <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "'Linux Samsung SOC'" <linux-samsung-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20200901144324.1071694-1-maz@kernel.org>
 <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <933bc43e-3cd7-10ec-b9ec-58afaa619fb7@nvidia.com>
Date:   Wed, 16 Sep 2020 15:16:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600265766; bh=pV8Al2EsECbYDuX4UchdWHAopEeJoNVCwOOj35gvWvM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=h4M5AySzWoSIHgOXxW6Cn6jFLbFFw8EwZnKcPIVJxTt3lSUrVD8nJr9GNzVJRZw5V
         mImZhD/RoS7WwjvahDfKgHkYaIXfp+ftoL0pqJHgDB+z5tAdDFpFx9bA/x6JlhfK07
         SLOGZitVugJy7yKYTZsjbw1FujpcWOlBOZraOptc4MQLn05uQ3SocrToJ8Savf0KM4
         SnNPc4LrFohTkfjRPSVWjsWMZh0carNG4uAOHRtzY/JiNFmLJdERbfdH1kEdnhq6Cv
         tBNxAb5MW8py5l5lQvAPjoT6utASZ4p7GrGoOsMgMNbtZa/YXT9RYgS2d2jEzajJb+
         5CnyNusDsNCYg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Marc,

On 14/09/2020 14:06, Marek Szyprowski wrote:
> Hi Marc,
> 
> On 01.09.2020 16:43, Marc Zyngier wrote:
>> Change the way we deal with GIC SGIs by turning them into proper
>> IRQs, and calling into the arch code to register the interrupt range
>> instead of a callback.
>>
>> Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
> This patch landed in linux next-20200914 as commit ac063232d4b0 
> ("irqchip/gic: Configure SGIs as standard interrupts"). Sadly it breaks 
> booting of all Samsung Exynos 4210/4412 based boards (dual/quad ARM 
> Cortex A9 based). Here are the last lines from the bootlog:

I am observing the same thing on several Tegra boards (both arm and
arm64). Bisect is pointing to this commit. Reverting this alone does not
appear to be enough to fix the issue.

Cheers
Jon

-- 
nvpublic
