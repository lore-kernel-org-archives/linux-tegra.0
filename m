Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE3EC47094
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 10:00:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C11B613DD
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Jun 2021 10:00:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhFJKCf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Jun 2021 06:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhFJKCe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 06:02:34 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C86C061574
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 03:00:29 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id q5so1581922wrm.1
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EsnCvdcEe3Eaqj5A/OQKBak574eTL4eh+FWunGYgn5w=;
        b=ooT0aC+2ValcdKw94R8aLE6u1X6MO8in5Pq199LNpA35Lq3j/PJ48QWR290ovj5avj
         gaP53isUxKbdXg+XckNI8zU6ZuT2y1dzqoAzFKKeBFCMXmE64bBi1hCtJc6WhUnfpiY5
         uuxsXTnlB5yLKsnGWBxU0FbNFNG9G8z/vfdSyCWwO6uOcW5JEd5pSpCxrzkcIoTfx1Jx
         4/sGU037EM+nufvaH+TQpaSOEuuy8joDzR88lECNff6+1aLEjXiWB+BIyWHM1PbwAcls
         KuEUkFzLNNCyVq5J7Cv+pKYymkJ73gt9M5NZD4lYtXk7WSXFhIeqyjAorciTGYNhZsWS
         5cZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EsnCvdcEe3Eaqj5A/OQKBak574eTL4eh+FWunGYgn5w=;
        b=OQO2qJQP+N37WOkamnqNPd75fntR2aF6zeW61wBx5P8kZW/KqrNLYp4dz7/Fu4bCga
         9bJzoWUjt3wD7yY5rG6lMp7bf9asqWvSVRyGuDPYuy6eRQ1R1m8lwAaGPoHHenWFcyQc
         bkkYzB060uJ/CSve7VusNiZlEVywPQMzhTc7LhuaVfYAfE86sgWoyPbFfnhN6leUuTNh
         TGvpbZxzSRrjuPSyTvvvLbMZ6LTBO63T3hTSdRaABp4U+Mf+K74vRdMufEX4QriHm3t1
         WauOTHZf0s0XlMBW669KDbFhP17yrjDDlrid/Iv70RxPEjbIYw3K/Ol48gAkPFV1b8TZ
         kSSQ==
X-Gm-Message-State: AOAM532JT/GpsDl5gpjqcu0mk25ZNz+zdN0Bqkq3ysEWnyFZofTaWaeC
        V255kDezINPDyhWrRx3mqVPQnR2cBZRrqSznwctWVw==
X-Google-Smtp-Source: ABdhPJxrB9VdrDrJI55oxjFjWbRrbLoJeHq9aQ/Sp1gnWuQF1hXZENK49ouPY18lZSq5mqbnaL7zmLE3JyGrmeUOOiA=
X-Received: by 2002:adf:c392:: with SMTP id p18mr4400433wrf.373.1623319228275;
 Thu, 10 Jun 2021 03:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-2-thierry.reding@gmail.com> <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
 <YF4L3kq9UN6PWh/h@orome.fritz.box> <CAPj87rO_RsEPpuC9-DyVEJ=K6OLeknHhOnjvbQ2EEnPPPrq+dg@mail.gmail.com>
 <CAPj87rOB8p+WSgVDwRbbLgW-di5qpSTY5Q6cmQYwbwD2Y3wKVA@mail.gmail.com> <YMHUHGS94zXLshU5@orome.fritz.box>
In-Reply-To: <YMHUHGS94zXLshU5@orome.fritz.box>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Thu, 10 Jun 2021 11:00:16 +0100
Message-ID: <CAPj87rOyUvKHpoiBSgTmTn=K_O9JZ+XifDx1MuH6sBxkb--w3Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add macros to determine the modifier vendor
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Simon Ser <contact@emersion.fr>, David Airlie <airlied@linux.ie>,
        James Jones <jajones@nvidia.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 10 Jun 2021 at 09:56, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Wed, Jun 09, 2021 at 05:28:50PM +0100, Daniel Stone wrote:
> > On Tue, 27 Apr 2021 at 19:40, Daniel Stone <daniel@fooishbar.org> wrote:
> > > On Fri, 26 Mar 2021 at 16:29, Thierry Reding <thierry.reding@gmail.com> wrote:
> > >> I do have commit access for drm-misc-next, but I was thinking that I
> > >> could take this through the drm/tegra tree along with the subsequent
> > >> patches because of the dependency.
> > >>
> > >> Anyone willing to provide an Acked-by for that?
> > >
> > > Yep, no harm if that makes your life easier, so for both the patch itself and merging through tegra:
> > > Acked-by: Daniel Stone <daniels@collabora.com>
> >
> > Is this still in your queue somewhere?
>
> I reverted to an open-coded version at the time because the -rc6 cut-off
> was coming up quickly and I wasn't getting a response. But I do have a
> set of follow-up patches in a branch somewhere that convert the existing
> users to the new helpers.
>
> Let me dig those out and send them out again.

OK, I didn't realise this had been dropped from your queue. That
sounds reasonable, and we'll just open-code as well in libdrm for the
moment, since we want to have the modifier-name API in without having
to wait another few months ...

Cheers,
Daniel
