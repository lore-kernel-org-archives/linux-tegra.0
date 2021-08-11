Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90143C432BE
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Aug 2021 09:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71E0C60FA0
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Aug 2021 09:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236622AbhHKJLx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Aug 2021 05:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236461AbhHKJLx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Aug 2021 05:11:53 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56BEC061798
        for <linux-tegra@vger.kernel.org>; Wed, 11 Aug 2021 02:11:29 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id x9so3459735ljj.2
        for <linux-tegra@vger.kernel.org>; Wed, 11 Aug 2021 02:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=45L965AHZgo82l4aN2SrSPr1cis24KkD7elj4CXl2IE=;
        b=tHkB54ySsHx551ghZG3oiWj9E5OW/jA0gsGikYmUj5abrUVPS1pVfN3YxmEs2Txlur
         ZUKxCfCNrdIg4aTp9DKXjGgZMeKIi7GQEmtRY7jd6QCzL89NhZceOeCtuySmIX8VXHB0
         +fwB+P1mzXXtfPraNDkgH0mZOQmFtC97CavMsU6Y7KYupLPgkK2B5BYh77cPr/720/ks
         CK6XjfVWlCWsRwnBexZGmArWthojlDpRrGh4UTWPSanKqLH2ldait5j3KFIvWCI5ji6d
         67JYZJ2Xm+uVc0Cv6VHJn5x7tGKGvldtq2Kcfk0d1vuVQbKOsUwkjr5fuAm0fDlrX5yC
         TbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=45L965AHZgo82l4aN2SrSPr1cis24KkD7elj4CXl2IE=;
        b=dio3/7JnqsDjD6g5u6P7VlR4f21F14qXzm+AYwd6yq11MfzPXt/cNXbyZAJ3tMYN73
         H32jvZm0FdtZJLANifKMWzjmLQkGh8ze7IxtZtBA40p43T2TAHi7YjlyiTw3BkmXqBhJ
         QP5C9dkuGebJanG/Amy/HZiT/8kTt+sBerman0AEKT8sJDBa0UPBhP4598pm+ppHEvmN
         WG6+K9UFKUOBS+OGl6T/M+02Dx2tqUZ8A3B8YSdtqj/Rd0d3X26bLZ8psUdxgqXQ7aAb
         Tg8fm1j2jSuTXL7u3psn3KtYmFeoa73K7FRQ5v+1PvA92qOlcKTADucx7e54ZT9oCMwF
         oUWg==
X-Gm-Message-State: AOAM533KIlWaFBXD30cSFH+Hik+7LetWlNlkB+94IhOGPA/Kx4OG7cjd
        6XyceyPLiOzG8gE4r62VKNmgQ4yKGeg9NSt76Wt//w==
X-Google-Smtp-Source: ABdhPJzRqUz/cks6mC/kThItyPh6HXSuFGyiXatmiGVouPLRVCOkyePXj7L3M7v54DYVWz6HfqDUb6kTsZt1fLEjXvo=
X-Received: by 2002:a2e:9e46:: with SMTP id g6mr2650552ljk.326.1628673088252;
 Wed, 11 Aug 2021 02:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210625235532.19575-1-dipenp@nvidia.com> <20210625235532.19575-10-dipenp@nvidia.com>
 <CACRpkdaqKJLUdf3NiFHaTgu6buyhMb_D1yKyHF4M=eTQ94pe-g@mail.gmail.com>
 <b87fa5d8-bef9-9046-9747-d4428ddf58ea@nvidia.com> <20210731061617.GA12414@sol>
In-Reply-To: <20210731061617.GA12414@sol>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 11:11:17 +0200
Message-ID: <CACRpkdab=VhSgWOpBQ2rB4AiQF4zXJ_S20A826ZxufJAvN9cWg@mail.gmail.com>
Subject: Re: [RFC 09/11] tools: gpio: Add new hardware clock type
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Dipen Patel <dipenp@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Jul 31, 2021 at 8:16 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Thu, Jul 29, 2021 at 08:17:22PM -0700, Dipen Patel wrote:
> >
> > On 6/27/21 4:36 AM, Linus Walleij wrote:
> > > On Sat, Jun 26, 2021 at 1:48 AM Dipen Patel <dipenp@nvidia.com> wrote:
> > >
> > >> gpiolib-cdev is extended to support hardware clock type, this
> > >> patch reflects that fact.
> > >>
> > >> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> > > (...)
> > >>                 case 'w':
> > >>                         config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
> > >>                         break;
> > >> +               case 't':
> > >> +                       config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE;
> > >> +                       break;
> > > After the checking of the command line options we need a small sanity
> > > check so we don't try to enable both realtime and hardware clock
> > > at the same time, we will only be able to request one of them.
> >
> > This will any way fail at gpiolib-cdev layer. Do we want to add it here
> >
> > as well?
> >
>
> I can't speak for Linus, but I'm fine with it as is as it allows the tool
> to be used to exercise the sanity check in the kernel.

Fair enough, that sounds useful. Go ahead with this as-is.

Yours,
Linus Walleij
