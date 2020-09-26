Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA705C4727C
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 02:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 986912087D
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 02:01:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fis0NCRw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729842AbgIZCBT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Sep 2020 22:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729424AbgIZCBT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Sep 2020 22:01:19 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B534C0613CE;
        Fri, 25 Sep 2020 19:01:18 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id ay8so4378633edb.8;
        Fri, 25 Sep 2020 19:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YdfVio6rmUqMvX7vwhcdUswt2FQkou3Nqy5kTbRbmY0=;
        b=fis0NCRweX16x/ncWjGXr4Z4/PmZQHN6hmIhBk7WKakMtayURDkAU2G3SPQebmaB/0
         5SpkamHkXFYrgicR16bRZ6jNj8K9jjzgS49WcHSYUPHKD94X2FOshCcaP3lnlB9OOwlg
         IPQuj/9So7I8X1sdOd35OG+6mRFxjfmrPwJlAj+27K+5Q4cSGFOf3LM3LyK2nxgi1g5q
         x84Pej82GWK7q/E4QJi60Km1gBCO3MKIrKDCzX/rZbinbbHx02P2suAY7HGrL+o9NEiF
         GkUfO/kL3okiTu2R+Y+bp+rdq/4xpol8rUREgFZuceCZ3oV9gLOaKwO3wneCnUcvcFow
         GOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YdfVio6rmUqMvX7vwhcdUswt2FQkou3Nqy5kTbRbmY0=;
        b=uZ9PDCYRoGhs1s6prFh5Q3h05I69p6tjGRd9L0+LrlRlEYxQJQrxiCQhpuNv4CqcjQ
         tqF158i6N921RWG3k4qr5PPMOJyg8vjE4nmlniJ/YQQHsC7FjlHesW6dXzhPSiMTkZ6+
         TwxWEQOv+MX4OamOy58v2NShV3BcZZvqKZcLfGSj1y8fxHptR3Btf9i50uVimtBjLiYQ
         rGZGfp/wsUl5Ugf+EtmXZR46Jwvbwj0XMZevt3ti2Fg13i0HvJPTcjRCGJ208hZg+Wd+
         7fSWOzx/a7GvsOpP7tcJnHk7uQA7frruUlNbJ+lFK+A+q+hpZPS3BPuYaw3KjJmscKJU
         v8tA==
X-Gm-Message-State: AOAM530twzPfKJV69FAckyoGcOUshKeF8j8MUk4YBcTxvgdDAHlMJHdb
        Cmr3TagT128tLxZnP6/G5+ktGSMPjD9G9SvyOWo=
X-Google-Smtp-Source: ABdhPJxEXygHmq8u9eUYIwXLYXGShAkwHdgEW491xonCzHONISgO9hzlOwStRESAH6vkozCf/y/jqwAa2dIX02DFFuo=
X-Received: by 2002:aa7:da89:: with SMTP id q9mr4380585eds.111.1601085677069;
 Fri, 25 Sep 2020 19:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200923210352.1176386-1-pgwipeout@gmail.com> <20200923210352.1176386-2-pgwipeout@gmail.com>
 <df2d6a8d-8a6c-464b-8f35-a7994ea01534@gmail.com>
In-Reply-To: <df2d6a8d-8a6c-464b-8f35-a7994ea01534@gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Fri, 25 Sep 2020 22:01:05 -0400
Message-ID: <CAMdYzYosBUUudsRnf9RQ1HKYq8cS4uXRm-9Mg1=hZy+v_Q_X6g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: tegra: Add device-tree for Ouya
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 24, 2020 at 8:12 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> ...
> > +/ {
> > +     model = "Ouya Game Console";
> > +     compatible = "ouya,ouya", "nvidia,tegra30";
> > +
> > +     aliases {
> > +             rtc0 = &pmic;
> > +             rtc1 = "/rtc@7000e000";
> > +             serial0 = &uartd; /* Debug Port */
> > +             serial1 = &uartc; /* Bluetooth */
> > +             mmc0 = &sdmmc4; /* eMMC */
> > +             mmc1 = &sdmmc3; /* WiFi */
>
> Thierry may want to sort these aliases in alphabet order.

Thanks, I'll fix this.

>
> > +     };
>
> ...
> > +             pmic: pmic@2d {
> > +                     compatible = "ti,tps65911";
> > +                     reg = <0x2d>;
> > +
> > +                     interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> > +                     #interrupt-cells = <2>;
> > +                     interrupt-controller;
> > +
> > +                     ti,system-power-controller;
>
> Are the ti,sleep-keep-ck32k and other properties not needed for Ouya
> like they are needed for Nexus 7?

Ouya is wall powered, so ultra low power isn't terribly necessary.
Also with LP1 and LP0 not working, it doesn't make much sense to
implement this yet.

>
> ...
> > +     sdmmc3: mmc@78000400 {
> > +             status = "okay";
> > +
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             bus-width = <4>;
> > +             non-removable;
>
> Recently I added assigned-clocks here for Nexus7/A500 DTs in order to
> get true 50MHz for the WiFi SDIO.

Thanks, it seems we are running at 48MHz right now, so I'll look into this.

>
> > +             mmc-pwrseq = <&wifi_pwrseq>;
> > +             vmmc-supply = <&sdmmc_3v3_reg>;
> > +             vqmmc-supply = <&vdd_1v8>;
