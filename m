Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B779C6379F
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Jan 2023 08:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbjAKI2O (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Jan 2023 03:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbjAKI1s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Jan 2023 03:27:48 -0500
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96FC6583
        for <linux-tegra@vger.kernel.org>; Wed, 11 Jan 2023 00:27:47 -0800 (PST)
Received: by mail-vk1-xa31.google.com with SMTP id j18so5107916vkn.10
        for <linux-tegra@vger.kernel.org>; Wed, 11 Jan 2023 00:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sitzt3qDu3UerD4XtTRxHC+kbzZTJZUZxdebSgKMqe0=;
        b=i8f7jG0hpzMhKbLF1oT6qJrEThMov7KHe7n4FR3k6uC1mUoqzOoXimj1BzRYlozvr1
         WX54ek5XB/dUQjlFwC+cSLRwCdL8A2LZka+RBgVFwguNkdz70lNAAuKeoOOMlmPwsiOG
         6ulzYWO7yqZ+UchPGzPyrsgfXx9LzdJeghLUrwEbT4bC1tLBs3FOtVMPBrPuM2jRTPRS
         gXzDx+vdomJZDof3lXt7JnTtVIgF+WIJCwi2dbze+FI11NtXpqJPPNF+kZUrL251aB7G
         FNJo92LrKruEf+ltzeqV1GLQOCFHiyXlOobMaIIT/yqtes0s/Wjkz7PQpn3km6+MEnMu
         q/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sitzt3qDu3UerD4XtTRxHC+kbzZTJZUZxdebSgKMqe0=;
        b=JbpKk/BDsu9G1UkMaVR5IX0GdpDgF85bLqSAKpBZTNDZlC9QC656QVHhqp61IBFKrq
         2Y7De1z8J3JPElLOYCnI4w1ove1K5PGRDrkw+WpgL810tJg7vIqcjXzWPpY0R2i+5p3j
         m8pxTkzsNw+VBV8Xd3cEHaaSn2KT5nPGRGRn6vOauHLE+uAHZEsboDOYW1qzsZo9nW8v
         Fc+jNKLy8uJo++9bIV4V7CMLmWtLEh1SY0ZY1epk37ifMvypqs4Ymjd8CnLEBdEXm0zF
         Ccvhnv58qEuy+ZJ/Wt1JhD1zxJOkisuEfp8MKAFFu3vS1MT8BwLSHsdwUI2Z8NzpFbwh
         u3vw==
X-Gm-Message-State: AFqh2kqgEiFdY04byve6nGyWwpDRQnAH2gaU/7swa+6vOzW3SjlTuTRd
        2Lm22DEdXMltKJUgavYUKkzAFcAZwP2YpfbeRxR+4A==
X-Google-Smtp-Source: AMrXdXtHcZ3rG3XrP62JWB3S9n3i34dZkVMnLHxnoTdTXjzpge6D/tj/IwktwxqPXplNQ2vVb4IB0ihhxoDjAYLyby4=
X-Received: by 2002:a05:6122:d18:b0:3bc:c8fa:a0b6 with SMTP id
 az24-20020a0561220d1800b003bcc8faa0b6mr9075784vkb.10.1673425666776; Wed, 11
 Jan 2023 00:27:46 -0800 (PST)
MIME-Version: 1.0
References: <Yhe0pCpfeCpyfPWg@orome> <20220816102725.14708-1-pshete@nvidia.com>
 <CACRpkdbMnRNTLcCtqNjKpxWxMbAXLssnuBEuNqAfgDfj3XVfXQ@mail.gmail.com>
 <14dbbfdf-c096-439e-41c9-71e083138560@nvidia.com> <CACRpkdaBY31f6R3TTD-5iRDdKV46tY5GK-Xvd=exwZ4HeCTYAw@mail.gmail.com>
In-Reply-To: <CACRpkdaBY31f6R3TTD-5iRDdKV46tY5GK-Xvd=exwZ4HeCTYAw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 11 Jan 2023 09:27:35 +0100
Message-ID: <CAMRc=MefrQsyQYK3SwPFTQBkX47fkf2mdz3Dy+o+Gc-WNwJSTw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: add Tegra234 PMC compatible in GPIO driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        smangipudi@nvidia.com, Manish Bhardwaj <mbhardwaj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jan 10, 2023 at 9:24 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Jan 9, 2023 at 9:37 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> > On 08/09/2022 14:21, Linus Walleij wrote:
> > > On Tue, Aug 16, 2022 at 12:27 PM Prathamesh Shete <pshete@nvidia.com> wrote:
> > >
> > >> Using this patch we are adding PMC compatible string for
> > >> Tegra234 in GPIO driver so the IRQ hierarchy can be set.
> > >>
> > >> Signed-off-by: Manish Bhardwaj <mbhardwaj@nvidia.com>
> > >> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> > >
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > >
> > > It also has Thierry's ACK from v1.
> > >
> > > Yours,
> > > Linus Walleij
> >
> >
> > I don't see this one in -next. Are you able to pick this up?
> >
> > Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> > Tested-by: Jon Hunter <jonathanh@nvidia.com>
>
> Bartosz is queueing GPIO patches right now, but the mail has the
> wrong address for him.
>
> I put the new mail address in To, so he can pick it up.
>

Come on, my address changed 18 months ago, re-run get_maintainers.pl
from time to time. :)

Now applied, thanks!

Bart
