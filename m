Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA6CC43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 09:02:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47CE520770
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 09:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TMd9+3me"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgIQJC6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 05:02:58 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39375 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgIQJC4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 05:02:56 -0400
X-Greylist: delayed 528 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 05:02:54 EDT
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200917085404euoutp0250f6da4f59c732cfec5064d11c84add6~1hj41LE6M2403024030euoutp021
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 08:54:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200917085404euoutp0250f6da4f59c732cfec5064d11c84add6~1hj41LE6M2403024030euoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600332844;
        bh=m4UP/i//3GAkZfp1ImTn473rw4qBRCZqFac37IxmfG0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=TMd9+3meh7rjXtu2gdMVqFHXOrTUc+dTAxNeT9K8VBXNxDT6uVhBlMLzbo5MloJiC
         1bjmY0XKZSUY1UIhnhCYEzb8cqgZpuJ3wTb3qBNbo8XuTiSJLItWaeSa8KKvyStYDP
         gagTtH5NB699Gu273VA+4RTar3BXCiHgPR/3bQ5k=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200917085403eucas1p14cb0cd829f1f07e2be0d92e0145b45b8~1hj4NhGQe2857828578eucas1p1P;
        Thu, 17 Sep 2020 08:54:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 2E.96.06456.B24236F5; Thu, 17
        Sep 2020 09:54:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200917085403eucas1p137a621fd292f8f6d4ea36c9e1584ab7d~1hj3yIpoO2050620506eucas1p19;
        Thu, 17 Sep 2020 08:54:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200917085403eusmtrp29d6bbb75252248443ffefcbea39253dc~1hj3xNjWx2476724767eusmtrp2q;
        Thu, 17 Sep 2020 08:54:03 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-e6-5f63242b1c8c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id E7.B0.06017.B24236F5; Thu, 17
        Sep 2020 09:54:03 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200917085402eusmtip175d8054f62dfef0e3fcf2314307b3365~1hj2uyDVI2770527705eusmtip1_;
        Thu, 17 Sep 2020 08:54:02 +0000 (GMT)
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
Message-ID: <4645f636-e7cc-6983-a3b7-897c20ec5096@samsung.com>
Date:   Thu, 17 Sep 2020 10:54:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e317b2fe-52e3-8ce7-ba77-43d2708d660f@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH++3e3V2l1a/p8GBltNIoyTJLfj2wl9AtijKIIipbebFQl2zN
        Mommk9SpPbShLsmS1CVqNnP5Qmw9xKStVKSHJmkULTTTHhhaOW+W/33O93zP73sO/FhKls94
        s8dVJ3m1ShmtYNxp6+MRx1L/hUfDl+sH5xNHt40id3Jvi8nn4gxEfg48lJB8czxJvNlOk2RT
        IU1q7nkSh6NSQq6MloiIpa9TTNrr8hmS62gUkbSvJoa8bpeS2vwWMTHYxhhS0XiBIVUWI0Xu
        FYxQJLlr1QY5Z623irmya2WIS9ZnMNy1sgSu1tQt4a5btJylNI3hdE0OmuvqbGC4AbtdwlXd
        PMfV1gyLuEz9AMNduFuKuGGLz66Z+93XRfDRx+N49bKQw+7HnFUXJbFN+PSTlA8SHbJLDciN
        BbwSeusfIQNyZ2XYjKCg/g0jFF8RpJh7REIxjMBalMpMjpiznBMswyUI3rTSgukzguHOHtrV
        8MC7oTv9MnKxJw6FpN5ysctE4RwGLIODEyYGB4Kh3zDxkhSHgC1vlHIxjX3B/F1gOT4Ej5/0
        0oJnFrTkvRtnlnUb96cXnXHJFJ4H+uqrlMBe8OpdwcTWgJ+xkGXsp4StQ+HB5ZcSgT3A2Xz3
        L8+B37WTA3oEb+3lEqHIQNCelIsE11rosv9kXMkUXgy365YJ8kZwphaJXTLgGfCif5awxAzI
        suZQgiyF1PMywe0HpuaKf7H3n7VRl5DCNOUy05RzTFPOMf3PvY7oUuTFazUxkbwmUMWfCtAo
        YzRaVWTA0RMxFjT+Z1t/NQ/VoG9tR2wIs0gxXVopPxIuEyvjNPExNgQspfCUbnraekgmjVDG
        n+HVJ8LV2mheY0OzWVrhJQ0q/HhQhiOVJ/kono/l1ZNdEevmrUPGyh+B8r7t5rAF3d51qqDc
        ROPsamvl3rEDQ/seBsyPam25FRD8vNPZt7e0o5xdvXbLjfWXQvotc311qWG6inTeVh1kMHYs
        ci5384/+kqWPypMHZ/ut8RkzfEtI130a3ZbZEzHt7IIVQ+89fOk7O2OzCwd2FF9kbc2ba/DW
        hv17tCsVtOaYMnAJpdYo/wA6Q6mfrwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRiA+XbOzo7i6DQnfpg3DkmiNJu6+VkmEhEHgq4QoaUuPajknJ2z
        VatA00E51+xipctplJaZmW06tYvZEMMs92MkUe5HJVhiKzBKwy6bM/Dfw8vzvPDCS2KSLmEE
        WVKmZbkyVSlNBONjf5571ieuLcjbMHk3GLk8Tgw9aLgvRF9vmQD65R0WoaZ2PTrd6saRwXID
        R/19UuRydYtQ/eJtAbJ9nBAi98MmAjW4BgWo5ruFQO/cYjTQNCpERudvAnUNmglkt13GUF/L
        AoYMk4qsMMbxyCFkOps7AWOoNhFMc+dJZsDiETHXbTrG1lFDMJVDLpyZnHhMMN7xcRFjb61g
        BvrnBMy5ai/BmHs6ADNni961KluWwWl0Wja2WMNrN9M5cpQsk6cjWXJqukyeknZwY7KCTsrM
        KGRLS46yXFJmvqx4xl4nKh+ijr84My2qBONiIwgiIZUK2y/OEH6WUG0AVjn0gXkkHL1SKQxw
        KFycMPqcYJ/zBUDDRetSEErtgZ7aC8DPUmorrPpwT+iXMMpKwLlPZjxQeHB4Y9gr8FsEJYfG
        L8alWkxlQmfjIuZnnIqD7T8CHEblwpemT8vOajjaOOVbRJJBPr+27YR/jFFK2Gx/jwU4Blb3
        XlvmcPh2qkVwHkgsK2rLisSyIrGsSK4DvANIWR2vLlLzyTJepeZ1ZUWyAo3aBny/4hhZ6OkH
        Ru9eJ6BIQIeIu8MO5UmEqqO8Xu0EkMRoqXjLq7FcibhQpT/Bcpo8TlfK8k6g8N12AYsIK9D4
        Pq9MmydXyNNQujwtJS1Fiehw8Vnq2QEJVaTSsodZtpzl/ncCMiiiEnCzSjo7t/PNzSxYxUXv
        jlnTzU6/GvxmrghXRu08Mn9qLzerT7qUiCcolQ4zE3LVRCs8RZtS/g7Fxa5rdOx/HbnPfac+
        PXLA6m5Nte7v+4xEo5FZOSMFp3aMxUb9MKEn25MO59t/hsyUG3rn6o4V2tviG2bog9vujpOz
        8fNPh2mcL1bJEzCOV/0DLOzW60EDAAA=
X-CMS-MailID: 20200917085403eucas1p137a621fd292f8f6d4ea36c9e1584ab7d
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
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Jon,

On 17.09.2020 10:49, Jon Hunter wrote:
> On 17/09/2020 09:45, Marc Zyngier wrote:
>> On 2020-09-17 08:54, Jon Hunter wrote:
>>> On 17/09/2020 08:50, Marc Zyngier wrote:
>>>> On 2020-09-17 08:40, Linus Walleij wrote:
>>>>> On Wed, Sep 16, 2020 at 5:11 PM Marc Zyngier <maz@kernel.org> wrote:
>>>>>
>>>>>> Can you try the patch below and let me know?
>>>>> I tried this patch and now Ux500 WORKS. So this patch is definitely
>>>>> something you should apply.
>>>>>
>>>>>> -                       if (is_frankengic())
>>>>>> -                               set_sgi_intid(irqstat);
>>>>>> +                       this_cpu_write(sgi_intid, intid);
>>>>> This needs changing to irqstat to compile as pointed out by Jon.
>>>>>
>>>>> With that:
>>>>> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>>>> Thanks a lot for that.
>>>>
>>>> Still need to understand why some of Jon's systems are left unbootable,
>>>> despite having similar GIC implementations (Tegra194 and Tegra210 use
>>>> the same GIC-400, and yet only one of the two boots correctly...).
>>> So far, I have only tested this patch on Tegra20. Let me try the other
>>> failing boards this morning and see if those still fail.
>> Tegra20 (if I remember well) is a dual A9 with the same GIC implementation
>> as Ux500, hence requiring the source CPU bits to be written back. So this
>> patch should have cured it, but didn't...
>>
>> /me puzzled.
> Me too. Maybe there just happens to be something else also going wrong
> in next. I am doing a bit more testing to see if applying the fix
> directly on top of this change fixes it to try and eliminate anything
> else in -next.
>
> Linus, what -next are you testing on? I am using next-20200916.

next-20200916 completely broken on ARM and ARM64. Please check 
next-20200915 + the mentioned fix or just check 
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/ipi-as-irq

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

