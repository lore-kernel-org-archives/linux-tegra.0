Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC061C433DB
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 07:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8560A64E4A
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 07:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbhBEHje (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Feb 2021 02:39:34 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39276 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbhBEHja (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Feb 2021 02:39:30 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210205073846euoutp01e779c64fd01acea6beda893658f49b34~gyfZ1U5I-0426504265euoutp01i
        for <linux-tegra@vger.kernel.org>; Fri,  5 Feb 2021 07:38:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210205073846euoutp01e779c64fd01acea6beda893658f49b34~gyfZ1U5I-0426504265euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1612510727;
        bh=55eQMS/d03nHm+PZhlRxp5CqR/vQUKnMAkenKtWarvk=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=HY8hFynZz78YipeH6RTGXoIyIco4TRW0lBBbvugEVWu9Dp/8xIe0L6tuA0dobVv0n
         8tHcVMLuR3vJJOqYman7GwsME05vxlOSpTDwhmSuuxxsN+YRddY+J4WK/ZwzUp/u/U
         Bcf2RyA4Ct2slD0ZGmDw9OaRuJeNv8RSfImZJAPo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210205073846eucas1p248f3090daf705557701e2fd83622b47f~gyfZilqhB2235722357eucas1p2y;
        Fri,  5 Feb 2021 07:38:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 5C.5D.44805.606FC106; Fri,  5
        Feb 2021 07:38:46 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210205073846eucas1p1fa13af91e95c5d1c7bde436f2eb3aec9~gyfZLHJ0I2036920369eucas1p1m;
        Fri,  5 Feb 2021 07:38:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210205073846eusmtrp1625a33c7a2fdbeafeef43962c382a5d2~gyfZKRXgX1842418424eusmtrp1N;
        Fri,  5 Feb 2021 07:38:46 +0000 (GMT)
X-AuditID: cbfec7f4-b4fff7000000af05-be-601cf6066466
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 73.08.21957.606FC106; Fri,  5
        Feb 2021 07:38:46 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210205073845eusmtip251c5030a7592e7d109ef44e7a3164b29~gyfYTt7nO3052230522eusmtip2M;
        Fri,  5 Feb 2021 07:38:45 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] of: property: Add fw_devlink support for
 interrupts
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Android Kernel Team <kernel-team@android.com>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <treding@nvidia.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <6b606a5d-0435-1e9d-ac61-a8dacf051067@samsung.com>
Date:   Fri, 5 Feb 2021 08:38:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx_KDA55Ti=5CHw48BP1L2Xo64=AFFe+17g27n=P-KUrow@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMKsWRmVeSWpSXmKPExsWy7djP87ps32QSDDbNUrT4MvcUi8X8I+dY
        LWa++c9m8ezWXiaL5sXr2SxaZi1isdixXcTiZ/sWJospf5YzWVzeNYfNovPLLDaLnXNOslq0
        7j3CbvF/zw52i65Df9ksbv/mcxDw2LZ7G6vH+xut7B47Z91l91iwqdRj06pONo871/aweRw6
        3MHosX/uGnaP3uZ3bB6fN8kFcEVx2aSk5mSWpRbp2yVwZfxYP4eloEey4vPUd+wNjL9Fuhg5
        OSQETCTWH3/A2sXIxSEksIJRYtXRp0wQzhdGiTkP9zFDOJ8ZJZac/8MI0/Js/0yoluWMEi+/
        wvR/ZJS4d/YOM0iVsECgRFfrITBbREBLYtO1xywgRcwCM1klpt66ywaSYBMwlOh62wVm8wrY
        SfxcMAWsgUVARWLdhUVgtqhAksTym3+YIGoEJU7OfMICYnMCLdjRdAIsziwgL9G8dTYzhC0u
        cevJfLAnJAR2c0oc2rGeHeJuF4mmU3NZIGxhiVfHt0DFZSROT+5hgWhoZpR4eG4tO4TTwyhx
        uWkG1NfWEnfO/QI6lQNohabE+l36EGFHibu/n7GChCUE+CRuvBWEOIJPYtK26cwQYV6JjjYh
        iGo1iVnH18GtPXjhEvMERqVZSF6bheSdWUjemYWwdwEjyypG8dTS4tz01GKjvNRyveLE3OLS
        vHS95PzcTYzAdHj63/EvOxiXv/qod4iRiYPxEKMEB7OSCG9im1SCEG9KYmVValF+fFFpTmrx
        IUZpDhYlcd6kLWvihQTSE0tSs1NTC1KLYLJMHJxSDUyCn9Y8muvZP1l1VqJ221lJkcut8YWH
        Z/1tPplsK+Czq3rd+YtbWs3y0qz4H4me1Qnr/h7T8eOt3uQC9WSOd348Qk6zlz4InvFHYdGS
        8+1tRTWdO5ffPV6nlee2Uld0VnzXpLjHkt8S96o1hrlO1NWs1GMzEig6PrNB9euXz7ti9Wys
        1meZbpmluX+Zlr6BhcydLa9T7rkGazZLnli+Y5pm4Ynz4moczv2L8pQWup2arNTSoHpX48+K
        ZRf2L5+5L/PGK6s5D38sd+/zvhrNyVc8YY7irNeFUxZaAJ2QL2o5t+GCvdtrm/VfhexaNgb/
        mL+93od99ttzr0p3cfFwbls82yck8tY056BLX5nWzVFiKc5INNRiLipOBAAP0y+b9gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKIsWRmVeSWpSXmKPExsVy+t/xe7ps32QSDFomclh8mXuKxWL+kXOs
        FjPf/GezeHZrL5NF8+L1bBYtsxaxWOzYLmLxs30Lk8WUP8uZLC7vmsNm0fllFpvFzjknWS1a
        9x5ht/i/Zwe7Rdehv2wWt3/zOQh4bNu9jdXj/Y1Wdo+ds+6yeyzYVOqxaVUnm8eda3vYPA4d
        7mD02D93DbtHb/M7No/Pm+QCuKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxM
        lfTtbFJSczLLUov07RL0Mn6sn8NS0CNZ8XnqO/YGxt8iXYycHBICJhLP9s9k7WLk4hASWMoo
        8efhKTaIhIzEyWkNrBC2sMSfa11sEEXvGSVeXp/JApIQFgiU6Go9xAxiiwhoSWy69pgFpIhZ
        YC6rxM/jX6A69jJJ/L9/FWwsm4ChRNfbLjCbV8BO4ueCKWDdLAIqEusuLAKzRQWSJB7fus8E
        USMocXLmE7BtnEDbdjSdAIszC5hJzNv8kBnClpdo3jobyhaXuPVkPtMERqFZSNpnIWmZhaRl
        FpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQLjf9uxn5t3MM579VHvECMTB+MhRgkO
        ZiUR3sQ2qQQh3pTEyqrUovz4otKc1OJDjKZA/0xklhJNzgcmoLySeEMzA1NDEzNLA1NLM2Ml
        cd6tc9fECwmkJ5akZqemFqQWwfQxcXBKNTApzlTco38trDovbTHjFNYnxxbOvpIVZrrke3rd
        0tmruoz9piVtW65q/EWOLWJNfvvmSd4iibZ70o4L1m8O/h0xI8HHJGV921dF9xWNn0SY+FMd
        r65dISLrtsOJsUC/1jhxabVw/6e7pW9efIsOmR8cZK916PLBlZMLPn78sMMlcFrvY21e8bNL
        X/3ee/MIS6iO4XS5rjsLDv2cFOLTyC9yNtjPhS3tnsSSValclZc3bP9qWSP789Rsj8fPy5gF
        +B/IbGDqNNZp8//wbOoTo+eFM0N4JGbqvOD4F/Bi5ufzRRIzGR7N8PFMEH56zcc3bftkvatz
        H74LKmW7yJLku0nZSO7Lw7ddC+7umttYmy2sxFKckWioxVxUnAgAcIFNe4gDAAA=
X-CMS-MailID: 20210205073846eucas1p1fa13af91e95c5d1c7bde436f2eb3aec9
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
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Saravana,

On 04.02.2021 22:31, Saravana Kannan wrote:
> On Thu, Feb 4, 2021 at 3:52 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 21.01.2021 23:57, Saravana Kannan wrote:
>>> This allows fw_devlink to create device links between consumers of an
>>> interrupt and the supplier of the interrupt.
>>>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Reviewed-by: Thierry Reding <treding@nvidia.com>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>> This patch landed some time ago in linux-next as commit 4104ca776ba3
>> ("of: property: Add fw_devlink support for interrupts"). It breaks MMC
>> host controller operation on ARM Juno R1 board (the mmci@50000 device
>> defined in arch/arm64/boot/dts/arm/juno-motherboard.dtsi). I didn't
> I grepped around and it looks like the final board file is this or
> whatever includes it?
> arch/arm64/boot/dts/arm/juno-base.dtsi
The final board file is arch/arm64/boot/dts/arm/juno-r1.dts
> This patch just finds the interrupt-parent and then tries to use that
> as a supplier if "interrupts" property is listed. But the only
> interrupt parent I can see is:
>          gic: interrupt-controller@2c010000 {
>                  compatible = "arm,gic-400", "arm,cortex-a15-gic";
>
> And the driver uses IRQCHIP_DECLARE() and hence should be pretty much
> a NOP since those suppliers are never devices and are ignored.
> $ git grep "arm,gic-400" -- drivers/
> drivers/irqchip/irq-gic.c:IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);
>
> This doesn't make any sense. Am I looking at the right files? Am I
> missing something?

Okay, I've added displaying a list of deferred devices when mounting 
rootfs fails and got following items:

Deferred devices:
18000000.ethernet        platform: probe deferral - supplier 
bus@8000000:motherboard-bus not ready
1c050000.mmci    amba: probe deferral - supplier 
bus@8000000:motherboard-bus not ready
1c1d0000.gpio    amba: probe deferral - supplier 
bus@8000000:motherboard-bus not ready
2b600000.iommu   platform: probe deferral - wait for supplier 
scpi-power-domains
7ff50000.hdlcd   platform: probe deferral - wait for supplier scpi-clk
7ff60000.hdlcd   platform: probe deferral - wait for supplier scpi-clk
1c060000.kmi     amba: probe deferral - supplier 
bus@8000000:motherboard-bus not ready
1c070000.kmi     amba: probe deferral - supplier 
bus@8000000:motherboard-bus not ready
1c170000.rtc     amba: probe deferral - supplier 
bus@8000000:motherboard-bus not ready
1c0f0000.wdt     amba: probe deferral - supplier 
bus@8000000:motherboard-bus not ready
gpio-keys
Kernel panic - not syncing: VFS: Unable to mount root fs on 
unknown-block(0,0)

I don't see the 'bus@8000000:motherboard-bus' on the deferred devices 
list, so it looks that device core added a link to something that is not 
a platform device...

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

