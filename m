Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D3AC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 09:13:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C80C32087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 09:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qvjfQDUT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgIQJNm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 05:13:42 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43865 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbgIQJNm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 05:13:42 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200917091339euoutp010bba87f15a9245ce8fe565ba93bc7fd7~1h0-vk6uS0979609796euoutp01C
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 09:13:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200917091339euoutp010bba87f15a9245ce8fe565ba93bc7fd7~1h0-vk6uS0979609796euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600334020;
        bh=B/62Rlrgs6pTDct1H3Yfp3nsJVLyqEOvjMmYhqZfxYc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=qvjfQDUTWO9qZ3uJYCRYSbQM0rqk5JEKtJOweo/2Trw2HIRwzJt55wUnApEtQ2ZgO
         /TrBU8ktxYhFFSVNcYdlWPrZT22kOf9UqhSFd6DX5Y2+z2ye4IvzIGAw7KfINaiXtI
         vRmCewpwUFVR9lbsood6viaBy3lyhxgeLAe7Ode0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200917091339eucas1p1e8123965c945be5992653c6bdec3baa3~1h0-JKfuP2623126231eucas1p1s;
        Thu, 17 Sep 2020 09:13:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 9D.4D.06318.3C8236F5; Thu, 17
        Sep 2020 10:13:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200917091338eucas1p17216de760da67b46756b316cb19650f5~1h0_0Xzh51720917209eucas1p1W;
        Thu, 17 Sep 2020 09:13:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200917091338eusmtrp1f5fc53ec7f3b7578406d8353537b6919~1h0_zhLnE2872328723eusmtrp1j;
        Thu, 17 Sep 2020 09:13:38 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-89-5f6328c309dd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 58.74.06017.2C8236F5; Thu, 17
        Sep 2020 10:13:38 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200917091337eusmtip2b226949d24ee4419ce57ab15598613a5~1h09r_BlF1866518665eusmtip2H;
        Thu, 17 Sep 2020 09:13:37 +0000 (GMT)
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
To:     Jon Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <54318b15-cfa4-1460-1e8b-049da2ab2bda@samsung.com>
Date:   Thu, 17 Sep 2020 11:13:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bec733a1-227f-d943-90dd-85fc9a993109@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjmO+fs7DhanS3DF4vCQVJBF7Hg60LY5ccJsisUCGXTTlNyM3a0
        soK0SenSykrU4/ISZiWadSx1FcNWuXS0hQPLW5nZRSm7qD8qi9yOlf+e932e93ueBz6G1Nro
        UCbRlMKbTfokHa2i6pu/exY+nBcfu6TyowZ7e5wkvlVYq8CfK3MQ/jH0SIlt19JwRoWPwpni
        ZQo3NgRjr/emEl8cu0pg6U27Avvu2mhc6HUQOHtEpHGXT43tthYFtjp/0fiG4wyN66R8EjeU
        fidxZveyqBlc/b16BVddUo24TEsOzZVUH+XsYo+SK5NSOakqm+bSm7wU191+n+aGPB4lV1dx
        nLM3DhNcrmWI5s7crkLcsDR7y7QY1aq9fFLiQd68ePUeVcKrbyXEgd7gw73vN6ejCo0VBTHA
        LoXHpz5SVqRitOw1BB++jhB+QsuOIKjpWScTwwiKW38q/148t55TyMRVBC878iaGzwgyRn+R
        ftV0dhv0nM5DfhzMrocTfTUBEckW0CB9+UL5CZqNAOsnK+3HanY12JqkgDfFzoUOR1HgoRns
        bmhu7aNkjQZaivoDOGhc315THMAkOwcsd4pJGYdAZ38p4TcD9hkD0tlOQs69Hhqut010mA6D
        rtsTeBa4L+RQ8oEFwWtPjVIechD4ThQiWbUSuj0/xqMy4xbzofbuYnm9Bgazrij8a2CnwotP
        GjnEVDhfX0DKazVkndTK6nAQXTf+2T541kaeQzpxUjVxUh1xUh3xv28ZoqpQCJ8qGA28EGni
        Dy0S9EYh1WRYFJ9slND4n3X/do02IsdYnBOxDNJNUTMQF6tV6A8KaUYnAobUBavXPnXv1qr3
        6tOO8ObkWHNqEi840UyG0oWoIy8P7NKyBn0Kv5/nD/DmvyzBBIWmo9bHZckJA62zrmfbo5a/
        TZ7f0RG2NCxO9bNw2GCKGBPW5mXc62sp25rbhejaunebUkqNLvexV4bGsRTN6SpVRnjcgGXF
        JV+Wmai8FBMfXS5mX3HXctv78tJORQ9ujYl6sqO/rTx3Nq8Ncw1UdyfY9+W79fc3PIoP3yiZ
        SfWoY6eOEhL0EQtIs6D/A/Wh/GivAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTURyAO/e1Ga6uc9JJImvQA6vptLVj5IgecCGiF/ZOW3pR0W1x7yaZ
        QavZa5komOmc64E9EF/Nt6bpKkVMF5lKD0tr2CRcmEHYe9MC//v4ne87hwM/IS6uIIOFyVo9
        y2nVqVJqLtH9u/PtGsfK+Lhw93mEnEMOHN0vqCTR5ztZAH33PBYg6710dKakj0CZllsEaqiX
        IKezSoDyft7FkP3DAIn6mqwUKnC2YujSVwuFXveJUKO1i0Rmxy8KVbRmU6jafhVH9dencJT5
        RrExiKlrriOZMlsZYDJNWRRjK8tgGi1DAuaG3cDYSy9RjLHNSTBvBh5QjKe3V8BUl5xmGhsm
        MeaKyUMx2TWlgJm0L945/6BsA6cz6NklSTpeHy09JEcRMnkUkkWsjZLJI5VH1kcopGGqDQls
        anIay4WpjsqS3n2xYceHJSeGP+4wgpIAM/ATQnotHDTnkD4W07cBvFlLzcwXwa58IznDgfDn
        gNk7n+t1xgEcezmF+w4C6d1w6HIu8LGE3gLPvi8nfRJOF1Nw0p1NzBQdJHS/+Er4LIqWQ/O4
        efoJEa2C1jY75mOCXgZfthZO3xpEx8KnWe5/TgDsKnRNt35ef6C8aJpxeh20VY/gMxwCTbVF
        /3gBfOW6juUAsWVWbpmVWGYlllnJDUCUAglr4DWJGj5Cxqs1vEGbKIvXaezAuyt1HVM1DcDs
        2eMAtBBI/UVVQcfixKQ6jU/XOAAU4lKJaFNPd6xYlKBOP8lyujjOkMryDqDwfi4XDw6K13k3
        T6uPkyvkShQlV0YqI9ch6QLRRbr9sJhOVOvZFJY9znL/O0zoF2wE85qfG3tCu7tGBU8S3K5H
        /rHFz4YHe5ImzhWauAMjmepPMX5EQ55rv2trfMbrOS1/Ou3Lo1fLQmI2e0KV7Z7nD1fks2lF
        bsk+7hc0WXelbOvvr9moV52CP/L7ayv3jmHab0sr/BeaVtXa3uOKmsaEFlXT6LVNI9tjLuT6
        T2Dl4VKCT1LLQ3GOV/8FLFh/EkEDAAA=
X-CMS-MailID: 20200917091338eucas1p17216de760da67b46756b316cb19650f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200914130601eucas1p23ce276d168dee37909b22c75499e68da
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200914130601eucas1p23ce276d168dee37909b22c75499e68da
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
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Jon,

On 17.09.2020 11:09, Jon Hunter wrote:
> On 17/09/2020 09:54, Marek Szyprowski wrote:
>> On 17.09.2020 10:49, Jon Hunter wrote:
>>> On 17/09/2020 09:45, Marc Zyngier wrote:
>>>> On 2020-09-17 08:54, Jon Hunter wrote:
>>>>> On 17/09/2020 08:50, Marc Zyngier wrote:
>>>>>> On 2020-09-17 08:40, Linus Walleij wrote:
>>>>>>> On Wed, Sep 16, 2020 at 5:11 PM Marc Zyngier <maz@kernel.org> wrote:
>>>>>>>
>>>>>>>> Can you try the patch below and let me know?
>>>>>>> I tried this patch and now Ux500 WORKS. So this patch is definitely
>>>>>>> something you should apply.
>>>>>>>
>>>>>>>> -                       if (is_frankengic())
>>>>>>>> -                               set_sgi_intid(irqstat);
>>>>>>>> +                       this_cpu_write(sgi_intid, intid);
>>>>>>> This needs changing to irqstat to compile as pointed out by Jon.
>>>>>>>
>>>>>>> With that:
>>>>>>> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>>>>>> Thanks a lot for that.
>>>>>>
>>>>>> Still need to understand why some of Jon's systems are left unbootable,
>>>>>> despite having similar GIC implementations (Tegra194 and Tegra210 use
>>>>>> the same GIC-400, and yet only one of the two boots correctly...).
>>>>> So far, I have only tested this patch on Tegra20. Let me try the other
>>>>> failing boards this morning and see if those still fail.
>>>> Tegra20 (if I remember well) is a dual A9 with the same GIC implementation
>>>> as Ux500, hence requiring the source CPU bits to be written back. So this
>>>> patch should have cured it, but didn't...
>>>>
>>>> /me puzzled.
>>> Me too. Maybe there just happens to be something else also going wrong
>>> in next. I am doing a bit more testing to see if applying the fix
>>> directly on top of this change fixes it to try and eliminate anything
>>> else in -next.
>>>
>>> Linus, what -next are you testing on? I am using next-20200916.
>> next-20200916 completely broken on ARM and ARM64. Please check
>> next-20200915 + the mentioned fix or just check
>> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/ipi-as-irq
> Ah thanks! Any idea what is causing the other failure on next-20200916?
>
> Yes we have noticed that now everything fails next-20200916 so not just
> this issue.

The issue is caused by commit c999bd436fe9 ("mm/cma: make number of CMA 
areas dynamic, remove CONFIG_CMA_AREAS")

https://lore.kernel.org/linux-arm-kernel/20200915205703.34572-1-mike.kravetz@oracle.com/

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

