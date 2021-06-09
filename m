Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E96C48BDF
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 15:13:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F597613BC
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 15:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239053AbhFIPPM convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:15:12 -0400
Received: from mail-il1-f170.google.com ([209.85.166.170]:44027 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239040AbhFIPPK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 11:15:10 -0400
Received: by mail-il1-f170.google.com with SMTP id x18so26754934ila.10
        for <linux-tegra@vger.kernel.org>; Wed, 09 Jun 2021 08:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6tH9AOagkax/O9BjJ9j1G1+5RQygul9R1dISwXADcHw=;
        b=XY/XbcJJmKfmAgv8QcfScg/WJwQRUCdQZ11h40cA+t/HW9yjWMl/P1giM4IEuose3m
         0Yi9bcV7CWaIjKSodMSY1suBLsWSs40u1rgxRXCi+Cba0uxZI5QUdr1DWuSSFBaPkYG6
         xiKPJ/43XEO0H6qhN3ZcVADvZqnejUt34bI9KQE5Y8gOvxYRtUNYHo5rE+gXjUUbfkGg
         zR2o5vqyImnuSb096DNFPaQZOQLHmw6FApfxjLqeGmx0e5DZXS5LUhK0KMZyABvud2sV
         sQjGxeUiO4WmlNre5euh55ERYldNflHcmDfOspQXP8lhv4b2LJ4PPpSsc8W9ig6R4FdX
         LlVg==
X-Gm-Message-State: AOAM533b4GHztqd/smZXHz42+P/28emEHD8377gQARRz2t3ADhIExS4D
        NxY4QTwsTjgibyRirmXcNiVfFxbv8T/HwHVmovA=
X-Google-Smtp-Source: ABdhPJxbB4VcVleBOfm2GHknEWMtgPQER9zM3CwQk5d08EKzfS/w15P5/P4q3Dny0FXMg4bRGYQPTSzMEDLCzeO+G6U=
X-Received: by 2002:a6b:c386:: with SMTP id t128mr23322633iof.65.1623251595657;
 Wed, 09 Jun 2021 08:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
 <816b619b-ff20-009a-ea05-504497c1946b@amd.com> <CAKb7UvjrxXyvr9qpLbkoDQ2eScj4YdayP6OnG8rZnmEn1hyKvw@mail.gmail.com>
 <1c9bdd1b-abea-872c-e23a-8a0e1e777a02@amd.com>
In-Reply-To: <1c9bdd1b-abea-872c-e23a-8a0e1e777a02@amd.com>
From:   Ilia Mirkin <imirkin@alum.mit.edu>
Date:   Wed, 9 Jun 2021 11:13:04 -0400
Message-ID: <CAKb7UvhX9mABdtOnq5Uu4zmKW6HLaJzfFakcXVB008U4hRsgng@mail.gmail.com>
Subject: Re: [Nouveau] Trouble with TTM patches w/nouveau in linux-next
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        nouveau <nouveau@lists.freedesktop.org>, ray.huang@amd.com,
        matthew.auld@intel.com, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

GEM init happens here:

https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/nouveau_gem.c#n221

Note the bo alloc / gem init / bo init dance.

I don't think there is a GEM object for internal allocations at all --
we just allocate bo's directly and that's it. Perhaps you meant
something else? I thought GEM was meant for externally-available
objects.

Cheers,

  -ilia

On Wed, Jun 9, 2021 at 10:58 AM Christian König
<christian.koenig@amd.com> wrote:
>
> Good point, but I think that is unrelated.
>
> My suspicion is rather that nouveau is not initializing the underlying
> GEM object for internal allocations.
>
> So what happens is the same as on VMWGFX that TTM doesn't know anything
> about the size to of the BO resulting in a kmalloc() with a random value
> and eventually -ENOMEM.
>
> Good news is that I can reproduce it, so going to look into that later
> today.
>
> Regards,
> Christian.
>
> Am 09.06.21 um 16:52 schrieb Ilia Mirkin:
> > Christian - potentially relevant is that Tegra doesn't have VRAM at
> > all -- all GTT (or GART or whatever it's called nowadays). No
> > fake/stolen VRAM.
> >
> > Cheers,
> >
> >    -ilia
> >
> > On Wed, Jun 9, 2021 at 10:18 AM Christian König
> > <christian.koenig@amd.com> wrote:
> >> Hi Mikko,
> >>
> >> strange sounds like Nouveau was somehow also using the GEM workaround
> >> for VMWGFX as well.
> >>
> >> But -12 means -ENOMEM which doesn't fits into the picture.
> >>
> >> I will try with a G710, but if that doesn't yields anything I need some
> >> more input from you.
> >>
> >> Thanks for the report,
> >> Christian.
> >>
> >>
> >> Am 09.06.21 um 15:47 schrieb Mikko Perttunen:
> >>> Hi,
> >>>
> >>> I'm observing nouveau not initializing recently on linux-next on my
> >>> Tegra186 Jetson TX2 board. Specifically it looks like BO allocation is
> >>> failing when initializing the sync subsystem:
> >>>
> >>> [   21.858149] nouveau 17000000.gpu: DRM: failed to initialise sync
> >>> subsystem, -28
> >>>
> >>> I have been bisecting and I have found two patches that affect this.
> >>> Firstly, things first break on
> >>>
> >>> d02117f8efaa drm/ttm: remove special handling for non GEM drivers
> >>>
> >>> starting to return error code -12. Then, at
> >>>
> >>> d79025c7f5e3 drm/ttm: always initialize the full ttm_resource v2
> >>>
> >>> the error code changes to the above -28.
> >>>
> >>> If I checkout one commit prior to d79025c7f5e3 and revert
> >>> d02117f8efaa, things work again. There are a bunch of other TTM
> >>> commits between this and HEAD, so reverting these on top of HEAD
> >>> doesn't work. However, I checked that both yesterday's and today's
> >>> nexts are also broken.
> >>>
> >>> Thank you,
> >>> Mikko
> >>>
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau@lists.freedesktop.org
> >> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fnouveau&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Caaf09cbea0b04d8dc01208d92b5637ba%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637588472445308290%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ePoWVtHPXeK5RThkRuQSykKrfWCgPOzG5CLTzfw9%2Fuw%3D&amp;reserved=0
>
