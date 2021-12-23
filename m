Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91DAC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 23 Dec 2021 16:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349057AbhLWQN0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 23 Dec 2021 11:13:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349055AbhLWQNZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Dec 2021 11:13:25 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8C6C061756
        for <linux-tegra@vger.kernel.org>; Thu, 23 Dec 2021 08:13:24 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id b13so23259125edd.8
        for <linux-tegra@vger.kernel.org>; Thu, 23 Dec 2021 08:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yHLMEZ1VuzE6uxMbdPv55wU7eVtiVgZCa+D9ZzJsUAc=;
        b=hI8YCvDquqUmJHnaXxcafS+98svO1SNpzc/r98lDaV2TuUo2k61fxi4pE8oBIrSENR
         tNTGQWwExqzOqg+6lIDd3P5PwaUXG1kclyGVargOvVRFtSMPO7V8VFcuzPoF/cJY06vw
         tSZzOczh5Ui2b0bS4cGDILifJpmy2tgFLWP6VLyuZQpKSCCPZyJ+qim8VL+3KMBKAh69
         ccpCOM1KS7uuw3Hcj1Ql4J1NAjLuhscL5J48DcyDiOP2UICw+LVYQ80b+BPASPJyztdP
         AFJCKpB4M1rGpmY6pU7+LNxTR03DUE9AQVUt4rVcuijKD5UuizlCw36lEK4aue6W2qhu
         ujQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yHLMEZ1VuzE6uxMbdPv55wU7eVtiVgZCa+D9ZzJsUAc=;
        b=xDUsC5eMzNFxHuem1GRqfejeMAIc01qaiRqhvC3W6vCtqFG1tBO4KVlOc53QPYTKgc
         z7xUiLxjbg4mM/jhM+Fim+rfqaLhoMHc+HFAtqpjl11rKwUvnBglkKpdFMiXeH0P7dwC
         FS7HxoTbo4pUElIntub+6/759vYhiXm5Xv1g2vUVkFeyqQrlLyiIdXMhH3uJ5OyFKDFe
         Jni3RBPcPU3WAi7ct6B8jgey0iHKH1Y5DtVSIjio0TExDmlwtKUvzhKtrqhGdyaA2eHp
         ngxmIRhLysCgEMqxdCQjAcY7nwGO6XIeNdUweYA5DN4ptIER8goJB+BoFWCoi7uyjEgx
         U9NA==
X-Gm-Message-State: AOAM532/JqP5Nlo6r1fHjNrKcdA3/qvgq1YxVX3RKLbo4KgaH/gc9DEs
        nwFSIg0LfarDBOPxrnbtcsAaHcgAHSo6wzYapEDvlQ==
X-Google-Smtp-Source: ABdhPJwohpYNifaB0bSL+BV70k2Gb6z/DwdPRr1BpabSQW0Lg20czznFwuhburUE3lmTL/kEwSIxntG4h67ZS2/OSeE=
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr2421168ejc.101.1640276002971;
 Thu, 23 Dec 2021 08:13:22 -0800 (PST)
MIME-Version: 1.0
References: <20211216141009.1478562-1-thierry.reding@gmail.com>
In-Reply-To: <20211216141009.1478562-1-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Dec 2021 17:13:12 +0100
Message-ID: <CAMRc=MfR5vD022zhT-vfqSiyY2nv_GRRT92XXgw+2YwM4xCtYA@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: tegra186: Add support for Tegra241
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Akhil R <akhilrajeev@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Dec 16, 2021 at 3:10 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Hi,
>
> this is another extension of the Tegra186 GPIO driver, this time for the
> upcoming Tegra241 (Grace) chip. Note that while this adds the DT binding
> header, it doesn't actually define a new DT compatible string because it
> is unlikely that the Tegra241 will ever boot using DT but will use ACPI
> instead.
>
> The pin definitions are still in the "DT binding" header for consistency
> with previous chips. Just wanted to highlight this to preempt questions
> as to why I haven't Cc'ed Rob or the devicetree mailing list.
>
> Thierry
>
> Akhil R (2):
>   dt-bindings: gpio: Add Tegra241 support
>   gpio: tegra186: Add support for Tegra241
>
>  drivers/gpio/gpio-tegra186.c             | 52 ++++++++++++++++++++++++
>  include/dt-bindings/gpio/tegra241-gpio.h | 42 +++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/tegra241-gpio.h
>
> --
> 2.34.1
>

Sounds good, applied, thanks!

Bart
