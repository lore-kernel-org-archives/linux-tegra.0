Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188A4C43461
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0F4C20708
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 19:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Akgvk03c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbgIPTId (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 15:08:33 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11662 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbgIPTI1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 15:08:27 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f6262500001>; Wed, 16 Sep 2020 12:06:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 16 Sep 2020 12:08:24 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 16 Sep 2020 12:08:24 -0700
Received: from [10.26.74.242] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 19:08:14 +0000
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
To:     Marc Zyngier <maz@kernel.org>
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
 <5c2ec2bf156f27f2f1cde54611a98923@kernel.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <fdf8605d-22ea-0832-625e-749291d88b8c@nvidia.com>
Date:   Wed, 16 Sep 2020 20:08:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5c2ec2bf156f27f2f1cde54611a98923@kernel.org>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600283217; bh=r0H0jedd/uhuvnqLBjAgmRLE9Ie1+Xeyuy2zOoYREEc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Akgvk03cLtJ2sCI7EynFQPFruJe6WTFuVooa/py9K7DeLTv09BaVfueSTE2OtyZ8Z
         qPQb5DMPru8Mpjmrp165mW/6p3kfAd6CCkyPDncY3og8RD8AgyuBsYb8tiPfj8nOvP
         jE8EjJvoQXyXwITJXL462NGIJvf05C6UpCRYDzTFh/9f13hRkPFcutLMkNTMhbVZ+N
         YBmpqUaZBJNL32aF76+VUSkoxsiAcOxi7WSotdBV4j5EmoOthZuk3ukgQHw6ItRjwn
         LMMSlTC0n+s0PBO5Q/eNwGc4mM9ZBVQF7FpYGXrsqrFCfTCxU8qT6VBECQ+LPbCbnF
         EfQCSMEbhbgfQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/09/2020 17:28, Marc Zyngier wrote:

...

> Make it that instead:
>=20
> =C2=A0static void gic_eoimode1_eoi_irq(struct irq_data *d)
> =C2=A0{
> +=C2=A0=C2=A0=C2=A0 u32 hwirq =3D gic_irq(d);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Do not deactivate an IRQ forwarded to a vcpu.=
 */
> =C2=A0=C2=A0=C2=A0=C2=A0 if (irqd_is_forwarded_to_vcpu(d))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>=20
> -=C2=A0=C2=A0=C2=A0 writel_relaxed(gic_irq(d), gic_cpu_base(d) + GIC_CPU_=
DEACTIVATE);
> +=C2=A0=C2=A0=C2=A0 if (hwirq < 16)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwirq =3D this_cpu_read(sgi_i=
ntid);
> +
> +=C2=A0=C2=A0=C2=A0 writel_relaxed(hwirq, gic_cpu_base(d) + GIC_CPU_DEACT=
IVATE);
> =C2=A0}


Unfortunately, still does not boot :-(

Jon

--=20
nvpublic
