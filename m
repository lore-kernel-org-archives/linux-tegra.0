Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3C4C48BCD
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 14:52:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80253611CC
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 14:52:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238255AbhFIOyn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 10:54:43 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:43579 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234853AbhFIOym (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 10:54:42 -0400
Received: by mail-il1-f175.google.com with SMTP id x18so26578887ila.10
        for <linux-tegra@vger.kernel.org>; Wed, 09 Jun 2021 07:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g6kmw8K4NVOjfm80qKIii8vlGgWXSA520RlIgHO8Yb4=;
        b=tmrylcl32sT3M1yMJefeGIs/F6iKDQJfvmI0cOtvVNWF0KsuGNrMIVQ1CmX0MOGIGU
         NAjNWdbA/3vqNg0LAACA5Eu4iGWO095AgnwIvXlqd+6Eeoz9IFmLJvsfmaO0b2CDsLR8
         mM3/czjDIgjHdl97U98/tnSA8XxEky7E1Q9UCiAWcXe20EYasHPAitOE6B+IJJMw219b
         duQp0wMUO7qZx7+qP4hNvgroqvhnRcIhEdugJ/RxWRdF0Uehv7iZQiXOZnPyiG0b1T9X
         /yDeSfVNOGDAEqFOFKmpwUJG2FjSQmFag6RAFM3vaO6vLZR5vTapjNCY+EvQtyI0UtWU
         pwSA==
X-Gm-Message-State: AOAM530UL426IBzrDnvXXJhrl1s+MuA9CgzaqexmqW4pTL9xsw5jpYYt
        WKrc7ZVLQfh43M3Rg58ihe7pYudrQrRiy+Kuffw=
X-Google-Smtp-Source: ABdhPJwOEVIdBD1niBDUdAkWBw+dsLEFdp+UdqONoNjS03w5Wptmn1Ai6NpFrW05sn0t4+Zkq1uUrVf0bg33ef8fqrk=
X-Received: by 2002:a6b:f805:: with SMTP id o5mr22516174ioh.55.1623250354514;
 Wed, 09 Jun 2021 07:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi> <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
In-Reply-To: <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
From:   Ilia Mirkin <imirkin@alum.mit.edu>
Date:   Wed, 9 Jun 2021 10:52:23 -0400
Message-ID: <CAKb7UvjrxXyvr9qpLbkoDQ2eScj4YdayP6OnG8rZnmEn1hyKvw@mail.gmail.com>
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

Christian - potentially relevant is that Tegra doesn't have VRAM at
all -- all GTT (or GART or whatever it's called nowadays). No
fake/stolen VRAM.

Cheers,

  -ilia

On Wed, Jun 9, 2021 at 10:18 AM Christian König
<christian.koenig@amd.com> wrote:
>
> Hi Mikko,
>
> strange sounds like Nouveau was somehow also using the GEM workaround
> for VMWGFX as well.
>
> But -12 means -ENOMEM which doesn't fits into the picture.
>
> I will try with a G710, but if that doesn't yields anything I need some
> more input from you.
>
> Thanks for the report,
> Christian.
>
>
> Am 09.06.21 um 15:47 schrieb Mikko Perttunen:
> > Hi,
> >
> > I'm observing nouveau not initializing recently on linux-next on my
> > Tegra186 Jetson TX2 board. Specifically it looks like BO allocation is
> > failing when initializing the sync subsystem:
> >
> > [   21.858149] nouveau 17000000.gpu: DRM: failed to initialise sync
> > subsystem, -28
> >
> > I have been bisecting and I have found two patches that affect this.
> > Firstly, things first break on
> >
> > d02117f8efaa drm/ttm: remove special handling for non GEM drivers
> >
> > starting to return error code -12. Then, at
> >
> > d79025c7f5e3 drm/ttm: always initialize the full ttm_resource v2
> >
> > the error code changes to the above -28.
> >
> > If I checkout one commit prior to d79025c7f5e3 and revert
> > d02117f8efaa, things work again. There are a bunch of other TTM
> > commits between this and HEAD, so reverting these on top of HEAD
> > doesn't work. However, I checked that both yesterday's and today's
> > nexts are also broken.
> >
> > Thank you,
> > Mikko
> >
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
