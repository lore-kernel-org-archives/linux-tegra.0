Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64EECC4332F
	for <linux-tegra@archiver.kernel.org>; Tue, 31 Oct 2023 07:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343799AbjJaHy7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 31 Oct 2023 03:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343812AbjJaHy4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Oct 2023 03:54:56 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6221E137
        for <linux-tegra@vger.kernel.org>; Tue, 31 Oct 2023 00:54:44 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d865854ef96so4757217276.2
        for <linux-tegra@vger.kernel.org>; Tue, 31 Oct 2023 00:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1698738883; x=1699343683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imGUTfdIv1UEQvIw5qZ3sOkWlbHODvlpW7n7ZTnXfW4=;
        b=oBtG90Sb6gOeIZfWGLPc5o/DwbAgCs92Eg2QzymX1sMlA/ktWqUZ86pKwYGiboXjhG
         Dv4l9FCSV8pNumMwjK54QcXqAvLD92vQ98w98Ih7mVYStJECwYHOw9PG0YWuwCHUHHPB
         TjW6XupL3Sv3c6GrbUgOazsbwlWao6oPhZnx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698738883; x=1699343683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imGUTfdIv1UEQvIw5qZ3sOkWlbHODvlpW7n7ZTnXfW4=;
        b=uflW+yZtUbvyEQ3YF8vlMJZHNPRclo5VaMO0U0fUie8IkefZcoFAcT4W97RBUaSJkC
         RK/B7hNqlmSXqISeqHGIPz2vxu1x5pqzSbKgOW/CKZJbQdUmW3jHzH6ZFBrTZR04hb7q
         g2po25vVyDLay97uBinrQ5uEsa9tRikpXgeuY1DUZb5twmWMk/nzEI9qQTfHG9sjaPkm
         tFR7z/46qiaQT6y2Ck9MQUEG0ucolGoNSbz1eH8BgcYk75yo1MV3Z6cJqOqiXqy0kmVv
         1ou50pT1JPNDjh1L7xVRda33gXfPa1pb0ZWJCerL2w/joJYTd9k6e39i9rGuGcyclkCb
         VoPg==
X-Gm-Message-State: AOJu0Yw9QMeyN5nYoRI0Czy+7e1Ub0fGpMXyZ9HIZZxcNjAsTcn8x6o9
        Y04tuFR4zWzWm+ERlesK3t2FBJ54/UuNViBeJAneLQ==
X-Google-Smtp-Source: AGHT+IGuq0HOWs5OUTkDduu4V89OJcaIxGppI4qyD54zITZougK0zbZNP1p83UdXtqz7X/Iv55M353/8oTA/1gDd+B8=
X-Received: by 2002:a25:aa27:0:b0:da0:3c22:8374 with SMTP id
 s36-20020a25aa27000000b00da03c228374mr12109008ybi.5.1698738883370; Tue, 31
 Oct 2023 00:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231025110140.2034650-1-dario.binacchi@amarulasolutions.com>
 <1acd75d0-67a7-4a17-99c7-707cca305f37@linux.intel.com> <ZT_MKDVkqMECiv4I@orome.fritz.box>
In-Reply-To: <ZT_MKDVkqMECiv4I@orome.fritz.box>
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date:   Tue, 31 Oct 2023 08:54:31 +0100
Message-ID: <CABGWkvrG8OWKpkY3g46XEje196zSXZ5rfekMRRDWMtp-uMrw-g@mail.gmail.com>
Subject: Re: [PATCH] iommu/tegra-smmu: fix error checking for debugfs_create_dir()
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Baolu Lu <baolu.lu@linux.intel.com>, linux-kernel@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Thierry,

On Mon, Oct 30, 2023 at 4:30=E2=80=AFPM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> On Wed, Oct 25, 2023 at 07:25:50PM +0800, Baolu Lu wrote:
> > On 2023/10/25 19:01, Dario Binacchi wrote:
> > > The return value of debugfs_create_dir() should be checked using the
> > > IS_ERR() function.
> > >
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > ---
> > >
> > >   drivers/iommu/tegra-smmu.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> > > index e445f80d0226..cd1d80c4c673 100644
> > > --- a/drivers/iommu/tegra-smmu.c
> > > +++ b/drivers/iommu/tegra-smmu.c
> > > @@ -1056,7 +1056,7 @@ DEFINE_SHOW_ATTRIBUTE(tegra_smmu_clients);
> > >   static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
> > >   {
> > >     smmu->debugfs =3D debugfs_create_dir("smmu", NULL);
> > > -   if (!smmu->debugfs)
> > > +   if (IS_ERR(smmu->debugfs))
> > >             return;
> >
> > This check can be removed, as debugfs_create_file() can handle the case
> > where @parent is an error pointer.
>
> A patch for this has been in linux-next for a few weeks, see:
>
> commit f7da9c081517daba70f9f9342e09d7a6322ba323
> Author: Jinjie Ruan <ruanjinjie@huawei.com>
> Date:   Fri Sep 1 15:30:56 2023 +0800
>
>     iommu/tegra-smmu: Drop unnecessary error check for for debugfs_create=
_dir()
>
>     The debugfs_create_dir() function returns error pointers.
>     It never returns NULL.
>
>     As Baolu suggested, this patch removes the error checking for
>     debugfs_create_dir in tegra-smmu.c. This is because the DebugFS kerne=
l API
>     is developed in a way that the caller can safely ignore the errors th=
at
>     occur during the creation of DebugFS nodes. The debugfs APIs have
>     a IS_ERR() judge in start_creating() which can handle it gracefully. =
So
>     these checks are unnecessary.
>
>     Fixes: d1313e7896e9 ("iommu/tegra-smmu: Add debugfs support")
>     Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>     Suggested-by: Baolu Lu <baolu.lu@linux.intel.com>
>     Acked-by: Thierry Reding <treding@nvidia.com>
>     Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>     Link: https://lore.kernel.org/r/20230901073056.1364755-1-ruanjinjie@h=
uawei.com
>     Signed-off-by: Joerg Roedel <jroedel@suse.de>
>

Thanks for the explanation,
regards
Dario

> Thierry



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
