Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B043CC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 19:56:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76B0F22211
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 19:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="gWnvu/cy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgIQT4C (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 15:56:02 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12254 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727757AbgIQOyn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 10:54:43 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f6378080002>; Thu, 17 Sep 2020 07:51:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 17 Sep 2020 07:53:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 17 Sep 2020 07:53:21 -0700
Received: from [10.26.74.242] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 17 Sep
 2020 14:53:09 +0000
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Marc Zyngier <maz@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
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
 <a88528cd-eb76-367a-77d6-7ae20bd28304@nvidia.com>
 <81cb16323baa1c81e7bc1e8156fa47b8@kernel.org>
 <e317b2fe-52e3-8ce7-ba77-43d2708d660f@nvidia.com>
 <4645f636-e7cc-6983-a3b7-897c20ec5096@samsung.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ace68d00-f005-fee3-1f01-44522c180462@nvidia.com>
Date:   Thu, 17 Sep 2020 15:53:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4645f636-e7cc-6983-a3b7-897c20ec5096@samsung.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600354312; bh=JvhskCgRRc+by6CEI8mCU2/vrU7nc17FP3zO033b9jg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=gWnvu/cyb8ETmuvHuS85SQkDc0iD+QnmQ5xmwjvHmr7dpAdvG02eZggPEx5xq/yoP
         CI5kwWAviTU0lE/2QCaSTE11nna/qI+/b3O6W3MbI/qwTb85w6eSkd/FS/AYlGZlkX
         vryYTr3aT7GFbksMsJhg5hzivJg7dYFo1M3u1L9AIMK8Et0FD7ZFaUBFy2k95BJX8G
         qPlt+zqWvWw5XGuSVI1cCZYZdE6IPn1Gl5uxFqRAcbu3FzDmUKwE1tmzvRqcAmjXF8
         EvqYNfFv6Dz5H36qrqeFxgUJlsrN7AN5pfv28L4H/48v0MKDddNjA3BCXdV+p36qQa
         869zQF2HOlTow==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/09/2020 09:54, Marek Szyprowski wrote:
> Hi Jon,
>=20
> On 17.09.2020 10:49, Jon Hunter wrote:
>> On 17/09/2020 09:45, Marc Zyngier wrote:
>>> On 2020-09-17 08:54, Jon Hunter wrote:
>>>> On 17/09/2020 08:50, Marc Zyngier wrote:
>>>>> On 2020-09-17 08:40, Linus Walleij wrote:
>>>>>> On Wed, Sep 16, 2020 at 5:11 PM Marc Zyngier <maz@kernel.org> wrote:
>>>>>>
>>>>>>> Can you try the patch below and let me know?
>>>>>> I tried this patch and now Ux500 WORKS. So this patch is definitely
>>>>>> something you should apply.
>>>>>>
>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (is_f=
rankengic())
>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_sgi_intid(irqstat);
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this_cpu=
_write(sgi_intid, intid);
>>>>>> This needs changing to irqstat to compile as pointed out by Jon.
>>>>>>
>>>>>> With that:
>>>>>> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>>>>> Thanks a lot for that.
>>>>>
>>>>> Still need to understand why some of Jon's systems are left unbootabl=
e,
>>>>> despite having similar GIC implementations (Tegra194 and Tegra210 use
>>>>> the same GIC-400, and yet only one of the two boots correctly...).
>>>> So far, I have only tested this patch on Tegra20. Let me try the other
>>>> failing boards this morning and see if those still fail.
>>> Tegra20 (if I remember well) is a dual A9 with the same GIC implementat=
ion
>>> as Ux500, hence requiring the source CPU bits to be written back. So th=
is
>>> patch should have cured it, but didn't...
>>>
>>> /me puzzled.
>> Me too. Maybe there just happens to be something else also going wrong
>> in next. I am doing a bit more testing to see if applying the fix
>> directly on top of this change fixes it to try and eliminate anything
>> else in -next.
>>
>> Linus, what -next are you testing on? I am using next-20200916.
>=20
> next-20200916 completely broken on ARM and ARM64. Please check=20
> next-20200915 + the mentioned fix or just check=20
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log=
/?h=3Dirq/ipi-as-irq

OK, I have confirmed that on Tegra20 and Tegra30, that next-20200915 +
Marc's fix boots fine.

Tegra186 and Tegra194 are not booting, but I am wondering if this is yet
another issue that is not related. I have not actually bisected on these
boards, but I am now bisecting on Tegra186 to confirm.

Jon

--=20
nvpublic
