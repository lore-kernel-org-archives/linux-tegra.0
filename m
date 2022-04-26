Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C456C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Apr 2022 21:59:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355620AbiDZWCp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 26 Apr 2022 18:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355605AbiDZWCo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 26 Apr 2022 18:02:44 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224AD18A1A7
        for <linux-tegra@vger.kernel.org>; Tue, 26 Apr 2022 14:59:35 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id e12so88512ybc.11
        for <linux-tegra@vger.kernel.org>; Tue, 26 Apr 2022 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3bpxs3BwsRsNVGR8rV+H1S/A34takD9t6PW/tK7Nuns=;
        b=rQrWMCWuHFbF3fA9np1al/NM6sLB/JVBaqI3xHXuG6+nPXC8BDAdkBeT6D19OTXrq0
         NSc/OxVS+gT1SCyw5YAOZDlwIrOtbf+Q78CkXJB7hF2B/2A4eFvhie2pcoQPpLxVW4ib
         mhKgvVfOJ+UgrJcHisKxEQPTZ9v0Lwt3NB6/N4O9I1U+0rQiESSjJaGx5Iu+TKa2E1Fg
         9VCX+hWONIn782AUxluTfo/LPp+PeiLA3NSBA6uCSNzwyvaVLuTV3BMHNjzqpcBAi1nn
         rB0cH1p4qIaWAd7LAyMJhfbKrmYqRx6e4wgzQgHXqFrN5zibWycWzHr0OFUsWplKJ7zh
         4bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3bpxs3BwsRsNVGR8rV+H1S/A34takD9t6PW/tK7Nuns=;
        b=F8nW9eeE37eN9aQsHd7vr7beqTOSgsoEVLfXemg4behONAhDBd6zPKXkjUcB3byXau
         DNGbTAcLfQYvxoaDe8Zri5utPz7V9juEa76lPsqrp5/dcdc8ox/kFXuVOcPRo+3fCkEZ
         M/jnRpnx/v3bO4Tifii/AK4G8nv4blYpPLrq1a1AOTv38qPRafjSauRY3EB0K0A/t3Ru
         OaiXpefrhSVG9MMNCmzhA6MT8igXKFX5ZNeE1DjQ3/lJytJc1/lEKK+GectuACHzuVEV
         3jmQew7T7+P4ToFJqnwXAg+azO04GSdkNSNUGHDYWfHa+NYJgvSCvwcEjuHPsijszbrZ
         2HGQ==
X-Gm-Message-State: AOAM533MkC7zMgv1Rpw3aHE4MXCPLhpftIU4JxPm4nv6V4WTLm17lxA+
        uyXGyKmRhK8r1izILa5Iwju9U2yYZ6Wa2VRO4ACqVQ==
X-Google-Smtp-Source: ABdhPJxmNWf2WAOTBOGYlwqgY2kNnoEeFKfKMFvD28pKOaD0KFUI3oAtcgVaqXsBmJf+wSb/F3TYdyLteg2ZEsK/pP4=
X-Received: by 2002:a25:a12a:0:b0:644:e94e:5844 with SMTP id
 z39-20020a25a12a000000b00644e94e5844mr22727605ybh.492.1651010374328; Tue, 26
 Apr 2022 14:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220419141846.598305-1-maz@kernel.org> <CACRpkda3L_itpqcnPq6xDoJtNHt8NuvE1MZk1bCNR+u2KKUpBA@mail.gmail.com>
 <874k2kccse.wl-maz@kernel.org> <CAHp75VcKNurETpNtrZM7SN2XEtLM6ZYFrS-gKr6r55Lc37gKQQ@mail.gmail.com>
In-Reply-To: <CAHp75VcKNurETpNtrZM7SN2XEtLM6ZYFrS-gKr6r55Lc37gKQQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Apr 2022 23:59:22 +0200
Message-ID: <CACRpkdaO+KTb+jJQ0qY59TP8f7gyY2mTUtNEt5+KUHNQAYU1bA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpiolib: Handle immutable irq_chip structures
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Apr 26, 2022 at 12:25 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sat, Apr 23, 2022 at 12:30 PM Marc Zyngier <maz@kernel.org> wrote:

> > You can pick it up from:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/gpio-immutable
> >
> > but I can also drop it from the irqchip tree.
> >
> > Just let me know.

Pulling that looks good to me.

If Bartosz pulls this to the GPIO tree I will also pull it to pin control,
I just want him to decide, because the impact is biggest on GPIO.

> I would prefer it if it goes as is now and every stakeholder can just
> pull it. As far as my drivers are concerned I also want to convert
> them sooner than later, meaning I want to pull this into my little
> tree as well. Bart, Linus, would it be also preferable for you?

I'd say let's all three pull this branch, Bart?

Yours,
Linus Walleij
