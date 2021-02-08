Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7D3C433E0
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 08:15:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EF5064E7E
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 08:15:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhBHIO5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Feb 2021 03:14:57 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40346 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhBHIO4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 Feb 2021 03:14:56 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210208081413euoutp01867d75d9972f7cbf3177c6211ff7cf94~ht6NNmhI23124131241euoutp01e
        for <linux-tegra@vger.kernel.org>; Mon,  8 Feb 2021 08:14:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210208081413euoutp01867d75d9972f7cbf3177c6211ff7cf94~ht6NNmhI23124131241euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1612772053;
        bh=XgoPUqQXgR0uYujgzVQ4yQ/U/qDYhHI0TbM+ugNU6og=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=OzzLkcs/IdRX17wY/XydK2V91YN/VFT51mn4rzj4ePubUY05+l60OcVdkzEtNWvjf
         r1GUw7sxEkJEYd1TUKj0oo6RTkua8DUwnrooFlyhcElV4ETkEmOvoqd/gQ/ChKPfy/
         YhUFQLPsAb35PDO3wvVKoqttM0yXxjVzcL8DLbBA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210208081413eucas1p13e4010ae8aeacf8394fb77905b0075cb~ht6M52llf0792107921eucas1p1N;
        Mon,  8 Feb 2021 08:14:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 07.95.45488.5D2F0206; Mon,  8
        Feb 2021 08:14:13 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210208081412eucas1p2fcc78bf5251226982548f91fea96525c~ht6MVMFMU1388813888eucas1p2s;
        Mon,  8 Feb 2021 08:14:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210208081412eusmtrp2d5da6c62a297720b2341d751ed598796~ht6MUVd1H2144921449eusmtrp2W;
        Mon,  8 Feb 2021 08:14:12 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-27-6020f2d5d8bb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 25.41.21957.4D2F0206; Mon,  8
        Feb 2021 08:14:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210208081411eusmtip2235ad5fecb5390ced0f44ad7da32e1a0~ht6Ldg4912126721267eusmtip2Q;
        Mon,  8 Feb 2021 08:14:11 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] of: property: Add fw_devlink support for
 interrupts
To:     Saravana Kannan <saravanak@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Android Kernel Team <kernel-team@android.com>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <treding@nvidia.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <ab39d157-a150-3f34-ec3a-047821f7c2a8@samsung.com>
Date:   Mon, 8 Feb 2021 09:14:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx8+de7RYcUZQzq4WvdK_Qq9ZsJ_SuXw4rX9EZ+sXWtu+A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMKsWRmVeSWpSXmKPExsWy7djPc7pXPykkGKzpZrf4MvcUi8X8I+dY
        LWa++c9m8ezWXiaL5sXr2SxaZi1isdixXcTiZ/sWJospf5YzWVzeNYfNovPLLDaLnXNOslq0
        7j3CbvF/zw52i65Df9ksbv/mcxDw2LZ7G6vH+xut7B47Z91l91iwqdRj06pONo871/aweRw6
        3MHosX/uGnaP3uZ3bB6fN8kFcEVx2aSk5mSWpRbp2yVwZVyftJGt4LtVxd3FqxkbGC8bdDFy
        ckgImEjMmbuAtYuRi0NIYAWjxNzrr5ghnC+MEp+A7oZwPjNKdL4CyUC0HLvRxA6RWM4ocfzI
        G6j+j4wS018tZwWpEhYIlOhqPQTWISIQLrF5y2SwucwCb1gkvk6bxAaSYBMwlOh62wVm8wrY
        Sdzpe8oCYrMIqEhsPjsNLC4qkCSx/OYfJogaQYmTM5+A1XACLbi59ArYAmYBeYntb+dA2eIS
        t57MZwJZJiGwm1Ni1vXf7BB3u0gs//aIEcIWlnh1fAtUXEbi/06YhmZGiYfn1rJDOD2MEpeb
        ZkB1WEvcOfcL6CQOoBWaEut36UOEHSXu/n7GChKWEOCTuPFWEOIIPolJ26YzQ4R5JTrahCCq
        1SRmHV8Ht/bghUvMExiVZiF5bRaSd2YheWcWwt4FjCyrGMVTS4tz01OLjfNSy/WKE3OLS/PS
        9ZLzczcxAtPh6X/Hv+5gXPHqo94hRiYOxkOMEhzMSiK8gZ1yCUK8KYmVValF+fFFpTmpxYcY
        pTlYlMR5d21dEy8kkJ5YkpqdmlqQWgSTZeLglGpg2l45J1hVbMNqV+OwaQaOYVK3XnGGuFi/
        6Ki/tnSDMkPqxv02iS39Qc1nZGPZL7XcP6BdZRLfkjZdVSsw+QK33cYA98ILSz3bnhdr3d/H
        25hyIFUxNfnmHTMXMaEVE1X8fQpn3NGzLerw5XBh+L3wTXC5bePFnrOBkRutXNatT95008Tl
        Sr7J9g1dAZOUr6/euWxK5LuuN+xKxlwxHxQVDjSbippfv/tb1szIwW9SeJXvgW7jJMl7N05t
        q/1/yqNsvf3u0szpfkGs7JctHYLF2mf/5KhyVbi6TPvLzE2uyq8ivrdU7bu5RKbgipTfjU79
        Rx9/ufQrXbn1YN3kVRIKUZv+8VvVZSdIXHlQJqLEUpyRaKjFXFScCACeby/L9gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKIsWRmVeSWpSXmKPExsVy+t/xe7pXPikkGJyeqGjxZe4pFov5R86x
        Wsx885/N4tmtvUwWzYvXs1m0zFrEYrFju4jFz/YtTBZT/ixnsri8aw6bReeXWWwWO+ecZLVo
        3XuE3eL/nh3sFl2H/rJZ3P7N5yDgsW33NlaP9zda2T12zrrL7rFgU6nHplWdbB53ru1h8zh0
        uIPRY//cNewevc3v2Dw+b5IL4IrSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIy
        VdK3s0lJzcksSy3St0vQy7g+aSNbwXeriruLVzM2MF426GLk5JAQMJE4dqOJvYuRi0NIYCmj
        xJ7fM9ggEjISJ6c1sELYwhJ/rnWxQRS9Z5TYd3s9WJGwQKBEV+shZhBbRCBcomXHDxaQImaB
        DywSzZ+nMkF0PGaT2NH2DKyDTcBQouttF5jNK2AncafvKQuIzSKgIrH57DSwuKhAksTjW/eZ
        IGoEJU7OfAJWwwm07ebSK2DbmAXMJOZtfghly0tsfzsHyhaXuPVkPtMERqFZSNpnIWmZhaRl
        FpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQLjf9uxn5t3MM579VHvECMTB+MhRgkO
        ZiUR3sBOuQQh3pTEyqrUovz4otKc1OJDjKZA/0xklhJNzgcmoLySeEMzA1NDEzNLA1NLM2Ml
        cd6tc9fECwmkJ5akZqemFqQWwfQxcXBKNTDphnwMDl45c4W2xzYJoVu+BcyzDnz2YVdJmHjx
        of/lnkr1mecq3u8VOSVfrvur5mxf0mzOS9xpp2edNWO8wOH6/tR9b6bEWNUALvNl7ApPf70x
        TbfTf1vXtfJrW42s9Fourh9R+0+9fSrY/Ohkn5pFUiXX2pe9va3ONTIvDucxNDmrJE/brTfN
        pPTyhUPPc3Zk8C700/pU+KO+dENC8ALV/Zv9U/e7f+wW/9J6Qye0aA77qtMR7yRqhFZNj/KX
        cP59YlZ93QzjDaZ7dZfOd/1zX+pB6Id9xk/YQoxOrZvebxjx89QNjXzZthuTl7O9LTRuPuxy
        I3nerPRfJhHcV0Wa/icavZxv+GEOz64ftv+VWIozEg21mIuKEwGl043kiAMAAA==
X-CMS-MailID: 20210208081412eucas1p2fcc78bf5251226982548f91fea96525c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210204115252eucas1p2d145686f7a5dc7e7a04dddd0b0f2286c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210204115252eucas1p2d145686f7a5dc7e7a04dddd0b0f2286c
References: <20210121225712.1118239-1-saravanak@google.com>
        <CGME20210204115252eucas1p2d145686f7a5dc7e7a04dddd0b0f2286c@eucas1p2.samsung.com>
        <20210121225712.1118239-3-saravanak@google.com>
        <9692dfc9-4c63-71c9-b52b-d0feba466695@samsung.com>
        <CAGETcx_KDA55Ti=5CHw48BP1L2Xo64=AFFe+17g27n=P-KUrow@mail.gmail.com>
        <6b606a5d-0435-1e9d-ac61-a8dacf051067@samsung.com>
        <CAMuHMdWqZonpeyk59b=o_3EKOQx4TxUZE4Jeo-Kxy_o_3CQvnQ@mail.gmail.com>
        <CAGETcx9Rqa7PygjSiQvadm7C2bpxS2rCf5oB_pFhjh+ESV-WQA@mail.gmail.com>
        <CAMuHMdUt4tSEO_Hcf4AgVY_jqZ6Bsyk2+f2P3gQRQk0UfgSSjQ@mail.gmail.com>
        <CAGETcx9YN6uC3XJ_J+PLxvHBVFK-h2X3Qh+kuKDceN5XSt3ZuQ@mail.gmail.com>
        <CAMuHMdVyTOp9PU0rO+YkpzE68VtGdy-bMOwmE_PJx2fiwwpMzQ@mail.gmail.com>
        <CAGETcx93cee=aH+cOyf-xmYGSHcn6AfBHC=fOw7By6=8JzT56Q@mail.gmail.com>
        <CAGETcx8+de7RYcUZQzq4WvdK_Qq9ZsJ_SuXw4rX9EZ+sXWtu+A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Saravana,

On 06.02.2021 05:32, Saravana Kannan wrote:
> On Fri, Feb 5, 2021 at 9:55 AM Saravana Kannan <saravanak@google.com> wrote:
>> On Fri, Feb 5, 2021 at 9:52 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> On Fri, Feb 5, 2021 at 6:20 PM Saravana Kannan <saravanak@google.com> wrote:
>>>> On Fri, Feb 5, 2021 at 2:20 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>> On Fri, Feb 5, 2021 at 11:06 AM Saravana Kannan <saravanak@google.com> wrote:
>>>>>> On Fri, Feb 5, 2021 at 12:06 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>>>> On Fri, Feb 5, 2021 at 8:38 AM Marek Szyprowski
>>>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>>>> On 04.02.2021 22:31, Saravana Kannan wrote:
>>>>>>>>> On Thu, Feb 4, 2021 at 3:52 AM Marek Szyprowski
>>>>>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>>>>>> On 21.01.2021 23:57, Saravana Kannan wrote:
>>>>>>>>>>> This allows fw_devlink to create device links between consumers of an
>>>>>>>>>>> interrupt and the supplier of the interrupt.
>>>>>>>>>>>
>>>>>>>>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>>>>>>>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>>>>>>>>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>>>>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>>>>>>>> Reviewed-by: Thierry Reding <treding@nvidia.com>
>>>>>>>>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>>>>>>>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>>>>>>>>>> This patch landed some time ago in linux-next as commit 4104ca776ba3
>>>>>>>>>> ("of: property: Add fw_devlink support for interrupts"). It breaks MMC
>>>>>>>>>> host controller operation on ARM Juno R1 board (the mmci@50000 device
>>>>>>>>>> defined in arch/arm64/boot/dts/arm/juno-motherboard.dtsi). I didn't
>>>>>>>>> I grepped around and it looks like the final board file is this or
>>>>>>>>> whatever includes it?
>>>>>>>>> arch/arm64/boot/dts/arm/juno-base.dtsi
>>>>>>>> The final board file is arch/arm64/boot/dts/arm/juno-r1.dts
>>>>>>>>> This patch just finds the interrupt-parent and then tries to use that
>>>>>>>>> as a supplier if "interrupts" property is listed. But the only
>>>>>>>>> interrupt parent I can see is:
>>>>>>>>>           gic: interrupt-controller@2c010000 {
>>>>>>>>>                   compatible = "arm,gic-400", "arm,cortex-a15-gic";
>>>>>>>>>
>>>>>>>>> And the driver uses IRQCHIP_DECLARE() and hence should be pretty much
>>>>>>>>> a NOP since those suppliers are never devices and are ignored.
>>>>>>>>> $ git grep "arm,gic-400" -- drivers/
>>>>>>>>> drivers/irqchip/irq-gic.c:IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);
>>>>>>>>>
>>>>>>>>> This doesn't make any sense. Am I looking at the right files? Am I
>>>>>>>>> missing something?
>>>>>>>> Okay, I've added displaying a list of deferred devices when mounting
>>>>>>>> rootfs fails and got following items:
>>>>>>>>
>>>>>>>> Deferred devices:
>>>>>>>> 18000000.ethernet        platform: probe deferral - supplier
>>>>>>>> bus@8000000:motherboard-bus not ready
>>>>>>>> 1c050000.mmci    amba: probe deferral - supplier
>>>>>>>> bus@8000000:motherboard-bus not ready
>>>>>>>> 1c1d0000.gpio    amba: probe deferral - supplier
>>>>>>>> bus@8000000:motherboard-bus not ready
>>>>>>>> 2b600000.iommu   platform: probe deferral - wait for supplier
>>>>>>>> scpi-power-domains
>>>>>>>> 7ff50000.hdlcd   platform: probe deferral - wait for supplier scpi-clk
>>>>>>>> 7ff60000.hdlcd   platform: probe deferral - wait for supplier scpi-clk
>>>>>>>> 1c060000.kmi     amba: probe deferral - supplier
>>>>>>>> bus@8000000:motherboard-bus not ready
>>>>>>>> 1c070000.kmi     amba: probe deferral - supplier
>>>>>>>> bus@8000000:motherboard-bus not ready
>>>>>>>> 1c170000.rtc     amba: probe deferral - supplier
>>>>>>>> bus@8000000:motherboard-bus not ready
>>>>>>>> 1c0f0000.wdt     amba: probe deferral - supplier
>>>>>>>> bus@8000000:motherboard-bus not ready
>>>>>>>> gpio-keys
>>>>>>>> Kernel panic - not syncing: VFS: Unable to mount root fs on
>>>>>>>> unknown-block(0,0)
>>>>>>>>
>>>>>>>> I don't see the 'bus@8000000:motherboard-bus' on the deferred devices
>>>>>>>> list, so it looks that device core added a link to something that is not
>>>>>>>> a platform device...
>>>>>> Probe deferred devices (even platform devices) not showing up in that
>>>>>> list is not unusual. That's because devices end up on that list only
>>>>>> after a driver for them is matched and then it fails.
>>>>>>
>>>>>>> Lemme guess: bus@8000000 is a simple bus, but it has an
>>>>>>> interrupt-map, and the devlink code doesn't follow the mapping?
>>>>>>>
>>>>>> No, what's happening is that (and this is something I just learned)
>>>>>> that if a parent has an "#interrupt-cells" property, it becomes your
>>>>>> interrupt parent. In this case, the motherboard-bus (still a platform
>>>>>> device) is the parent, but it never probes (because it's simple-bus
>>>>>> and "arm,vexpress,v2p-p1"). But it becomes the interrupt parent. And
>>>>>> this mmci device is marked as a consumer of this bus (while still a
>>>>>> grand-child). Yeah, I'm working on patches (multiple rewrites) to take
>>>>>> care of cases like this.
>>>>> One more reason to scrap the different handling of "simple-bus" and
>>>>> "simple-pm-bus", and use drivers/bus/simple-pm-bus.c, which is a
>>>>> platform device driver, for both? (like I originally intended ;-)
>>>> I'm not sure if this will cause more issues since people are used to
>>>> simple-bus not needing a driver. I'm afraid to open that pandora's
>>>> box. Maybe last resort if I don't have any other options.
>>>>
>>>> But keeping that aside, I'm confused how interrupts are even working
>>>> if the parent is a DT node with no driver (let alone a device). Any
>>>> ideas on what's going on or what I'm misunderstanding?
>>> No driver is needed, as the interrupts are just translated by the map,
>>> and passed to another interrupt controller, which does have a driver.
>>>
>>> Cfr. Section 2.4.3 "Interrupt Nexus Properties" in the DeviceTree
>>> Specification (https://protect2.fireeye.com/v1/url?k=72fff987-2d64c09f-72fe72c8-0cc47a314e9a-fd7dac11a78508f3&q=1&e=c0dbf5ca-130b-4aac-a011-447e82ca1914&u=https%3A%2F%2Fwww.devicetree.org%2F).
>>>
>> Yeah, I need to add interrupt-map support. Sigh. Only so many things I
>> can fix at a time. Let me know if you want to help.
>>
> Marek,
>
> After reading the DT spec and poking at the code, I THINK this code is
> correct. Can you give it a shot? If it works, then I can clean it up,
> roll in interrupts-extended and send a patch.

Yep, this fixes this issue. Fell free to add:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> -Saravana
>
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1300,10 +1300,12 @@ static struct device_node
> *parse_gpio_compat(struct device_node *np,
>   static struct device_node *parse_interrupts(struct device_node *np,
>                                              const char *prop_name, int index)
>   {
> -       if (strcmp(prop_name, "interrupts") || index)
> +       struct of_phandle_args sup_args;
> +       if (strcmp(prop_name, "interrupts"))
>                  return NULL;
>
> -       return of_irq_find_parent(np);
> +       return of_irq_parse_one(np, index, &sup_args) ? NULL : sup_args.np;
>   }
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

