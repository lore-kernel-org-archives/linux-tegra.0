Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BE6C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 13:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbhLMNQA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 08:16:00 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:38107 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbhLMNQA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 08:16:00 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mz9IT-1ma1Er0gbr-00wEFO for <linux-tegra@vger.kernel.org>; Mon, 13 Dec
 2021 14:15:58 +0100
Received: by mail-wr1-f49.google.com with SMTP id d9so27014751wrw.4
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 05:15:58 -0800 (PST)
X-Gm-Message-State: AOAM531B4qgzttNJSJr+kF906joYe+DhDkzFsHjYs98WQi6uMHIlVHl2
        0NBL7Vo/PVU2zonCNkVu20HoDeeuD4fQD7NB5EM=
X-Google-Smtp-Source: ABdhPJwm11Q1UXwvOVD+0E70pIcgKjkMKS6MnverEG1m2choWJvqaXY+7l98jsFWNoxFqwFkC5pEG0FxeAhOenlVy3o=
X-Received: by 2002:a05:6000:52:: with SMTP id k18mr32572355wrx.192.1639401357879;
 Mon, 13 Dec 2021 05:15:57 -0800 (PST)
MIME-Version: 1.0
References: <5383deda141721643419e98c485fb510be56fb61.camel@pengutronix.de> <22bbd3d0-2622-3f23-2fa9-9826631084b0@nvidia.com>
In-Reply-To: <22bbd3d0-2622-3f23-2fa9-9826631084b0@nvidia.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 13 Dec 2021 14:15:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0d0AR7fvMn6+zLVUec4ww+SY9h_aCuf++gErwvmj5z4w@mail.gmail.com>
Message-ID: <CAK8P3a0d0AR7fvMn6+zLVUec4ww+SY9h_aCuf++gErwvmj5z4w@mail.gmail.com>
Subject: Re: [GIT PULL] Reset controller fixes for v5.16
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>, arm-soc <arm@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:a90zkdJiJfkcx7krU9EQlLlZ0YMqd/2+xnCS1JISNUtej3HC3RC
 ZK7yGUZbPChVHsFu5sWf6X96JVvU+2TZ+JiRh5s+xwQQQoZZYQ+LmqCQpgrGL7ElkEuS0dw
 5RJSMEZ78u6bndNNY9pySRqPS76Xmi+KOL1Zmw7flEPewgRdDgRrZJLwH7VvEHG8lqnkD+3
 gTdH2X9/h6r4RprSzJC0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:95gq/ef1xmo=:9IG74m16EYMahc4NIJMoqb
 fHu/3Xw1S9qWayzaiVfMYmbXCjNlvnTi3G+rT43jb5kEki47tQpuArs4icMox280TuHAIOTQt
 Mwv1X8nt7VEuG3cuwCdb5tCX5jtxNsmWqxQdsEpbSB2MbpSKP5hfxWNWNJw7a5PTj8p/K6Pkx
 8N+S+2LFQytx7/SyrJl/sT97rdJUL3EdiMbrjTPl6+OyCwNR6ur1ysOqP30k9Dn+DDJxdo5Pb
 wV+oZwiXDq9KoXsvcajneP54yom0r8AtyzjCh/oLMA3c1Jyy1XiVV4j8BOZUq3XqJHYx1afL8
 ZwNf5fsA24Yh2/O0kRHKjhpYBgH3oNPVEuYBlXpT1VV4cEg95TXtGIBvODA5SmZr5sX1BTF7s
 gucP1rnUpv3OCBsbhMayJSo/7k4UYo2mZA2jGlPI2BuRHXeu+32+V/HX9pP+fpD1xSTORtMlK
 WPWITkpH/OEry1QXz92vvcwA3oanZhu3YmavqLqBEhGfquor5mNGDp0brhKRexkIFwfR68GjP
 YiQOoFGlj9wbj9tAqLqKbN0lCP1sbzQShcRsUrQlPGiaAHx3IfG819GkxP8F/SnPnLiUiSA7Y
 Zq1zu6LC/4YfU9T5fZ8CnlU5UcoUTKBU7doZU+Yz6TjXTuCdi5MMoG5w6N+fdkg1S0OlENYgt
 SfpnZP+MrWrFmyIKNK6W8daQrVve3LRwcdSQlMZoFNWcAG1GCYUo4o4mnLLAN7tcLcF8=
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Dec 13, 2021 at 1:21 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> On 19/11/2021 17:07, Philipp Zabel wrote:
> > Reset controller fixes for v5.16
> >
> > Well, just one: revert commit c045ceb5a145 ("reset: tegra-bpmp: Handle
> > errors in BPMP response"), which exposed an issue with the Tegra194 HDA
> > controller reset. BPMP response error handling will be reinstated once
> > there's a fix for the HDA issue.
> >
>
> I have not seen this get picked up yet and we need this fix for v5.16.
> Please can you pick this up?

Thank you for pointing this out. I see this never made it into patchwork
because it was sent to the old address (arm@kernel.org) that gets in
my inbox but not patchwork like the new address (soc@kernel.org).

I'm also behind with the other pull requests, but I've picked it up manually
now.

Philipp, please make sure you send future pull requests to soc@kernel.org,
and maybe check that I did pick up previous ones you may have sent.

       Arnd
