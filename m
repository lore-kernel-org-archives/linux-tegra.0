Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F937C2D0E3
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 08:14:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDB562075B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 08:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="j0x93+j7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgIQIAF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 04:00:05 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16941 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgIQIAB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 04:00:01 -0400
X-Greylist: delayed 311 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 04:00:01 EDT
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f6316260002>; Thu, 17 Sep 2020 00:54:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 17 Sep 2020 00:54:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 17 Sep 2020 00:54:27 -0700
Received: from [10.26.74.242] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 17 Sep
 2020 07:54:14 +0000
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
To:     Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        "Sumit Garg" <sumit.garg@linaro.org>, <kernel-team@android.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Gregory Clement" <gregory.clement@bootlin.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Linux Samsung SOC" <linux-samsung-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20200901144324.1071694-1-maz@kernel.org>
 <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
 <933bc43e-3cd7-10ec-b9ec-58afaa619fb7@nvidia.com>
 <3378cd07b92e87a24f1db75f708424ee@kernel.org>
 <CACRpkdYvqQUJaReD1yNTwiHhaZpQ9h5Z9DgdqbKkCexnM7cWNw@mail.gmail.com>
 <049d62ac7de32590cb170714b47fb87d@kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <a88528cd-eb76-367a-77d6-7ae20bd28304@nvidia.com>
Date:   Thu, 17 Sep 2020 08:54:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <049d62ac7de32590cb170714b47fb87d@kernel.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600329254; bh=30mp0f3ouirzej9wVaCNihVfHw5D9hL0SMgLcIPw1Ow=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=j0x93+j7OUBnB6jX6fD5/bc7qs3RMJ0n7ZWeJ4vOe+y1vDF9qfUSdZdkWR8u59L10
         JVoTdDlHGAPO4E2PqpwBLh5AGAbux2iXQ8L/dQBBW/gfVKlYSRYmXaaM2so1uoFqd/
         4b6/F9IPtgNTr6sAAylMErP2KGh1Kak6BUi7UbXdNydUMr3EUew6blsFZEnb66w3YH
         VXl16tsxmzZAh9gh6uVscZrbBrIVf/vSFxM5q/HiFZvqb9Sa7pPCHuYJPKMJ3Wo+nj
         A9WB3BtmdB+YQ6QYcV5S13DPJ31F0UR85+96w7cquxk7zfSvP833ETYQUi8v7UcI0F
         wPBxi4C7RpOaA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/09/2020 08:50, Marc Zyngier wrote:
> Hi Linus,
>=20
> On 2020-09-17 08:40, Linus Walleij wrote:
>> On Wed, Sep 16, 2020 at 5:11 PM Marc Zyngier <maz@kernel.org> wrote:
>>
>>> Can you try the patch below and let me know?
>>
>> I tried this patch and now Ux500 WORKS. So this patch is definitely
>> something you should apply.
>>
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (is_fran=
kengic())
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_sgi_intid(irqstat);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this_cpu_wr=
ite(sgi_intid, intid);
>>
>> This needs changing to irqstat to compile as pointed out by Jon.
>>
>> With that:
>> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Thanks a lot for that.
>=20
> Still need to understand why some of Jon's systems are left unbootable,
> despite having similar GIC implementations (Tegra194 and Tegra210 use
> the same GIC-400, and yet only one of the two boots correctly...).

So far, I have only tested this patch on Tegra20. Let me try the other
failing boards this morning and see if those still fail.

Cheers
Jon

--=20
nvpublic
