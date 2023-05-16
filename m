Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01F3C77B7F
	for <linux-tegra@archiver.kernel.org>; Tue, 16 May 2023 15:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232889AbjEPPPe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 May 2023 11:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233290AbjEPPPa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 11:15:30 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB6061AE
        for <linux-tegra@vger.kernel.org>; Tue, 16 May 2023 08:15:27 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-54f812f77a7so5340519eaf.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 May 2023 08:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684250126; x=1686842126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xq/FuI0gOpzvfdbdJmPxEDUFLUJapP40FhB8TwSxte4=;
        b=L+1zPFmW5cqaEZ8kDZNuGIvHzRjiWIY5LDPieIsyuUwsfWODiprrFL9z1ACcunFzn0
         I6HwUjq5w5lWXfbHBiRpfFi/w2GNXEoLaeqhhHO/lJkmchlxJcOTkQf97xxLlKAgppij
         L0/hIFsegcALFm9jpOkLi0HbRonHz2o7lVDpUvILuifHg0YnPWB/F1X1EW7qMrgT6qkt
         OV+oq71g2eVyLCfnA6Or7Pypk0Gk27mRkMTE/L0mSF66zJk7FC8ZErFOxywjff6zJ3xU
         Gk5tTMMG/P9wa0O8RccyLN0B2zaesV++dyqlFvXQS+o7q3gic8qktZFDBtM3oz0+09Wi
         Ymcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684250126; x=1686842126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xq/FuI0gOpzvfdbdJmPxEDUFLUJapP40FhB8TwSxte4=;
        b=Q0uB7L9Zl2At0c9RFoFzaONYyt/UBzZZ+aHU7QzXFvLIb2wynmxxRi0RgmK43anYx/
         V2r7wM8ARcZlV04rsld8nzCVtVtRBlouurs7vmCE9m/NGcPvX9UP58a+y7396Ae+wma8
         YT1Hf6FRoUvSBLMH/TsHU+sl7dT5EoTFmh6ll+q45efboZRzWq94oKdp0LDMRC5mSsMp
         SX8f0AyEIvfD3vgomQ8nixc16vd8B0vEfY14eAjT7sZsW44zlYn00bZzKw/kOOGokjHK
         GVeoAs4DhPLv0TIbUDTg6rHsRtoVYV0zcDDa0OxEbQqSDio/hELxeA/1Ph/+GX7qd+CQ
         o81g==
X-Gm-Message-State: AC+VfDy06Y85O/9BO19a2vtJyQnxaXEJ0d/U6MH29s2Hfird85gEonOm
        5WV4tdAih4g7/gBSN02sNGF4qxQXmhdA7iuWPUy6PrzW+xTj2Q==
X-Google-Smtp-Source: ACHHUZ7hKL4wO1p9Isk5Bui22fhJLNa5nygADjpBUbV+o2pAu/UoDAHH404cjCkf0SKnWfQ6CFLLkp8mJhYNtAT/qQw=
X-Received: by 2002:a05:6820:291:b0:54f:84d1:51ac with SMTP id
 q17-20020a056820029100b0054f84d151acmr10945948ood.6.1684250126328; Tue, 16
 May 2023 08:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684154219.git.robin.murphy@arm.com> <CABr+WTnzNPfOGbAmy-E3pH9U5XR0y2PdVmDd2gtnv67ByEb_0w@mail.gmail.com>
 <11d8adf1-75f5-5728-2139-e32aae6e6c49@arm.com> <CABr+WTm=SehaNVaFym5FM-tpCvh93Ma_xG3xX5PuGt6n9+xh4Q@mail.gmail.com>
 <aadb69ff-732d-cffc-ab44-398269a11d4e@arm.com>
In-Reply-To: <aadb69ff-732d-cffc-ab44-398269a11d4e@arm.com>
From:   Nicolas Chauvet <kwizart@gmail.com>
Date:   Tue, 16 May 2023 17:15:15 +0200
Message-ID: <CABr+WT=qZvvW5QqCW_J0V20-56d_2+xkdPs0FcgiJZiY6K0CCg@mail.gmail.com>
Subject: Re: [PATCH 0/4] iommu: tegra-gart cleanups
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     joro@8bytes.org, iommu@lists.linux.dev, will@kernel.org,
        jgg@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Le mar. 16 mai 2023 =C3=A0 14:31, Robin Murphy <robin.murphy@arm.com> a =C3=
=A9crit :
>
> On 2023-05-16 13:16, Nicolas Chauvet wrote:
> > Le mar. 16 mai 2023 =C3=A0 13:45, Robin Murphy <robin.murphy@arm.com> a=
 =C3=A9crit :
> >>
> >> On 2023-05-16 10:53, Nicolas Chauvet wrote:
> > ...
> >>> For what it worth, I've tried to test this serie with "grate patches"
> >>> (1) rebased on top on 6.4-rc2, that would make use of the tegra-gart.
> >>> That was on PAZ00 (with only 512M of RAM and 96M CMA still allocated)=
.
> >>> Unfortunately, this lead to the following errors with display problem=
s
> >>> (no character displayed in lxt-terminal and etc)
> >>
> >> Thanks for testing - it's quite possible I've made a silly mistake
> >> somewhere, but just to double-check, does the same happen with the
> >> existing driver if you boot with "tegra-gart.gart_debug=3D1" (or at le=
ast
> >> enable the parameter via sysfs before the DRM driver gets going)?
> >
> > Using echo 1 > /sys/module/tegra_gart/parameters/gart_debug shows the
> > same messages and the same artefacts (missing refreshed window
> > content).
> > Using "echo 0 > /sys/module/tegra_gart/parameters/gart_debug" revert
> > back to normal...
>
> OK, cool, so it looks like a pre-existing bug in the caller, but I guess
> it does mean that unconditionally enabling the checks isn't ideal until
> that can be sorted out.

Seems like I had a non-default option with tegra-drm that was
controlling the way tegra-gart is used:
https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/grate/gar=
t.c#L19-L29

With option 4, occurrences of failing allocation are experienced more
often than the default 0 options when only "scattered BOs are mapped".
Also with the default option, no noticeable failure is seen.

Thanks.
