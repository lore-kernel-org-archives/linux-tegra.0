Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463E3C35264
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 08:49:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06D4220770
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 08:49:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="sRwsmYAm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgIQIt0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 04:49:26 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6281 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgIQItZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 04:49:25 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f6322b90001>; Thu, 17 Sep 2020 01:47:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 17 Sep 2020 01:49:22 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 17 Sep 2020 01:49:22 -0700
Received: from [10.26.74.242] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 17 Sep
 2020 08:49:08 +0000
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
To:     Marc Zyngier <maz@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Sumit Garg <sumit.garg@linaro.org>,
        <kernel-team@android.com>, Florian Fainelli <f.fainelli@gmail.com>,
        "Russell King" <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        "Saravana Kannan" <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        "Valentin Schneider" <Valentin.Schneider@arm.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
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
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <e317b2fe-52e3-8ce7-ba77-43d2708d660f@nvidia.com>
Date:   Thu, 17 Sep 2020 09:49:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <81cb16323baa1c81e7bc1e8156fa47b8@kernel.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600332474; bh=z6Ik8MFeZEIDclcxjNpVE2no7Ouado4SrHpNqiqWNco=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=sRwsmYAmFaTCDPAkn8vF/y4g2Cmas4wK7XFrt0y/7V0EcmgrEu67Chb3lSkP100Jb
         zB2akawgML/0UT/BNLeVPr8jT/8jIGMtHZExgIwfdpxkpJsacH239vhpKga6PWypjn
         med48LElyVmDabuyz3zzX2eEGKKFMMV4LPrTgpS/GbML+jEk9VlXilS+7kYanUHHhI
         VT6F7woytMHNUOklP7MOSN17iQuqcdOK2nV3PE51PQ/a5btLU73LBkjvu619NeAs7w
         MKVcv3vCaXlYzrZvCbuQ5vy3rpJw1vewHtqvNsqCpxtfGQ6giVe8aADSDinN4Ph+x6
         lm2E0XxQnB7oA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/09/2020 09:45, Marc Zyngier wrote:
> On 2020-09-17 08:54, Jon Hunter wrote:
>> On 17/09/2020 08:50, Marc Zyngier wrote:
>>> Hi Linus,
>>>
>>> On 2020-09-17 08:40, Linus Walleij wrote:
>>>> On Wed, Sep 16, 2020 at 5:11 PM Marc Zyngier <maz@kernel.org> wrote:
>>>>
>>>>> Can you try the patch below and let me know?
>>>>
>>>> I tried this patch and now Ux500 WORKS. So this patch is definitely
>>>> something you should apply.
>>>>
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (is_f=
rankengic())
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_sgi_intid(irqstat);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this_cpu=
_write(sgi_intid, intid);
>>>>
>>>> This needs changing to irqstat to compile as pointed out by Jon.
>>>>
>>>> With that:
>>>> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> Thanks a lot for that.
>>>
>>> Still need to understand why some of Jon's systems are left unbootable,
>>> despite having similar GIC implementations (Tegra194 and Tegra210 use
>>> the same GIC-400, and yet only one of the two boots correctly...).
>>
>> So far, I have only tested this patch on Tegra20. Let me try the other
>> failing boards this morning and see if those still fail.
>=20
> Tegra20 (if I remember well) is a dual A9 with the same GIC implementatio=
n
> as Ux500, hence requiring the source CPU bits to be written back. So this
> patch should have cured it, but didn't...
>=20
> /me puzzled.

Me too. Maybe there just happens to be something else also going wrong
in next. I am doing a bit more testing to see if applying the fix
directly on top of this change fixes it to try and eliminate anything
else in -next.

Linus, what -next are you testing on? I am using next-20200916.

Jon

--=20
nvpublic
