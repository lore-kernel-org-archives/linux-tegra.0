Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB43AC433E2
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 20:25:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 719CB20715
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 20:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Gb4KarHw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgIPUZl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 16:25:41 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14539 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgIPR1i (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 13:27:38 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f62361e0000>; Wed, 16 Sep 2020 08:58:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 16 Sep 2020 08:58:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 16 Sep 2020 08:58:34 -0700
Received: from [10.26.74.242] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 15:58:22 +0000
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
To:     Marc Zyngier <maz@kernel.org>
CC:     Sumit Garg <sumit.garg@linaro.org>, <linus.walleij@linaro.org>,
        "Florian Fainelli" <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <linux-kernel@vger.kernel.org>,
        "Krzysztof Kozlowski" <krzk@kernel.org>,
        Will Deacon <will@kernel.org>,
        "'Linux Samsung SOC'" <linux-samsung-soc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        <kernel-team@android.com>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
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
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d6dddab0-47aa-ddf2-959b-85493b8da52d@nvidia.com>
Date:   Wed, 16 Sep 2020 16:58:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a6c7bbc91c5b23baa44f3abe35eb61c9@kernel.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600271902; bh=OInfV1VGaZqOky+4sqAk+1JkJLOXjadzDikei1Od4OI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Gb4KarHw3+zcTv/V6iSsJDbvfGwcXVN4lmZsAkeW/bxXJblXfSYu2paCUtH3M18RZ
         bZwmG2KuON5AniHraV5oygS6tN7yHMYb/78WfizBc+pdEdTMI/8Tglh3muYkqrN5Ss
         lksxTyfGWT5qBzw+oDcyNKRWoqzJ4OtbfJZPK15CCF2Nf1avZSz5ovP0h2aOSl6SN/
         TR+Y7x+9vk2Tx8Hh9eiUD3m28nC7kFhh5r23VCSCv7kWmOgU9s+6VbL0M2s4K+/1zI
         0ajW2N0f6Bv8MapUXyl7o3tyOm+HMvZIAVt6eHEndChF1cR6Q6k0VJ0TFl1u5+D4CU
         Pbd4YSB80xeEQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/09/2020 16:55, Marc Zyngier wrote:
> On 2020-09-16 16:46, Jon Hunter wrote:
>> On 16/09/2020 16:10, Marc Zyngier wrote:
>>> Hi Jon,
>>>
>>> +Linus, who is facing a similar issue.
>>>
>>> On 2020-09-16 15:16, Jon Hunter wrote:
>>>> Hi Marc,
>>>>
>>>> On 14/09/2020 14:06, Marek Szyprowski wrote:
>>>>> Hi Marc,
>>>>>
>>>>> On 01.09.2020 16:43, Marc Zyngier wrote:
>>>>>> Change the way we deal with GIC SGIs by turning them into proper
>>>>>> IRQs, and calling into the arch code to register the interrupt range
>>>>>> instead of a callback.
>>>>>>
>>>>>> Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
>>>>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>>>> This patch landed in linux next-20200914 as commit ac063232d4b0
>>>>> ("irqchip/gic: Configure SGIs as standard interrupts"). Sadly it
>>>>> breaks
>>>>> booting of all Samsung Exynos 4210/4412 based boards (dual/quad ARM
>>>>> Cortex A9 based). Here are the last lines from the bootlog:
>>>>
>>>> I am observing the same thing on several Tegra boards (both arm and
>>>> arm64). Bisect is pointing to this commit. Reverting this alone does
>>>> not
>>>> appear to be enough to fix the issue.
>>>
>>> Right, I am just massively by the GICv3 spec, and failed to remember
>>> that ye olde GIC exposes the source CPU in AIR *and* wants it back,
>>> while
>>> newer GICs deal with that transparently.
>>>
>>> Can you try the patch below and let me know?
>>
>> Yes will do.
>>
>>> @@ -365,14 +354,13 @@ static void __exception_irq_entry
>>> gic_handle_irq(struct pt_regs *regs)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 smp_rmb();
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /*
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * Samsung's funky GIC encodes the source CPU in
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * GICC_IAR, leading to the deactivation to fail if
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * not written back as is to GICC_EOI.=C2=A0 Stash the
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * INTID away for gic_eoi_irq() to write back.
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * This only works because we don't nest SGIs...
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * The GIC encodes the source CPU in GICC_IAR,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * leading to the deactivation to fail if not
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * written back as is to GICC_EOI.=C2=A0 Stash the INTID
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * away for gic_eoi_irq() to write back.=C2=A0 This only
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * works because we don't nest SGIs...
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(is_frankengic())
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 set_sgi_intid(irqstat);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 thi=
s_cpu_write(sgi_intid, intid);
>>
>> I assume that it should be irqstat here and not intid?
>=20
> Indeed. As you can tell, I haven't even tried to compile it, sorry about
> that.

No worries, I got the gist. However, even with this change, it still
does not boot :-(

Jon

--=20
nvpublic
