Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA63C77B7A
	for <linux-tegra@archiver.kernel.org>; Tue, 16 May 2023 09:53:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbjEPJxP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 May 2023 05:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbjEPJxO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 05:53:14 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A3311C
        for <linux-tegra@vger.kernel.org>; Tue, 16 May 2023 02:53:13 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-541f4ee6f89so4003071eaf.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 May 2023 02:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684230793; x=1686822793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUyWbDWLzBbwVa1NBzeenGWyMmMD2r29seiz5UsbH5s=;
        b=D/yRNt4MQRyZ0HSzVSkvV/+LSWJfO1P9YchgIq0aqYq5lq95Uz05BhRpR+muzlLGRx
         knRT5R4JbyYdOCBluPeerFZ1y7C7ak614gh3jMNQ0jl9k/qb9IJyJdBb9Q03cSo5Mohl
         64TnQg8QWbqLCBqrokrYuCFhMrDpFkwq3NPlrdzHIhH4VwaxiQG7t+hvU3CEG3gk9FZd
         obSleGPG2bW1wJXBWLm9F62eYK1eOvUYjgDVhggH/4uljhLBtZ+XtfIlHEqgnj37fm8A
         WM0a1rGDD98MP+GM9mw47vJ7ZLvS3JnuwqHMdnamwG1hbdFmRTxFKhvDZnRpFVCtajR6
         E5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684230793; x=1686822793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUyWbDWLzBbwVa1NBzeenGWyMmMD2r29seiz5UsbH5s=;
        b=cnfQyxYsgKEawtM5ux5UtIa6EfKVfusWg3DXMOgPX84vtmlGDjknvHpn8RCS+taZEG
         WfhQ5jiDQf/FptPN2Rqt3K9MCS0jOkBHm94h4kSuldSRccLNXaDKl3Ol/yJQ0BkGUkH3
         kFQhhDT6CDlNBG30MpkR5caq1H+jlOA7cif3sQKQo0Hu+VsBVWIAZBY/whS5WSFzd1y9
         Tcw6gK9zCRbiLGreLlTuynx23ehEnz42i3lgmtTTyF0+dzph1WKGx2417sYZrbQ9bXou
         luv+OfEoyD0fs0/UG16MjcKFw/Vs3KSECeUt6jqwWDnZ/28ZiRYwJ63hLLnQTS2/XYiO
         Fl5g==
X-Gm-Message-State: AC+VfDwUIo2j0GGGE7Hpt9xxwKmWiCfAE9YGDLCC3Y7flL+wqq/gNHnS
        EPR7/nCbh7+899HZWhwWsupjitn9yPoTm1LeATg=
X-Google-Smtp-Source: ACHHUZ6qBzkUrqzfZWjjUyTwZDpxczedNsiP925z+88F8yPLQgbrPTp/axsev+vTNGfxAb7ND65H0v0H6XeLLlMFWX8=
X-Received: by 2002:a4a:2a5d:0:b0:54f:6a7a:c6d with SMTP id
 x29-20020a4a2a5d000000b0054f6a7a0c6dmr10042774oox.3.1684230792632; Tue, 16
 May 2023 02:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684154219.git.robin.murphy@arm.com>
In-Reply-To: <cover.1684154219.git.robin.murphy@arm.com>
From:   Nicolas Chauvet <kwizart@gmail.com>
Date:   Tue, 16 May 2023 11:53:01 +0200
Message-ID: <CABr+WTnzNPfOGbAmy-E3pH9U5XR0y2PdVmDd2gtnv67ByEb_0w@mail.gmail.com>
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

Le lun. 15 mai 2023 =C3=A0 14:57, Robin Murphy <robin.murphy@arm.com> a =C3=
=A9crit :
>
> Hi all,
>
> For the sake of discussion, here's my irrational pet project to bring
> the tegra-gart driver right up to date as an example of a
> properly-implemented IOMMU driver for a non-isolated address space. Part
> of that irrationality is that I don't even own any hardware which uses
> this driver, so it's only build-tested :)
>
> Thanks,
> Robin.
>
>
> Robin Murphy (4):
>   iommu/tegra-gart: Add default identity domain support
>   iommu/tegra-gart: Improve domain support
>   iommu/tegra-gart: Generalise domain support
>   iommu: Clean up force_aperture confusion
>
>  drivers/iommu/dma-iommu.c    |  19 ++--
>  drivers/iommu/mtk_iommu_v1.c |   4 +
>  drivers/iommu/sprd-iommu.c   |   1 +
>  drivers/iommu/tegra-gart.c   | 162 +++++++++++++++++++----------------
>  4 files changed, 99 insertions(+), 87 deletions(-)


For what it worth, I've tried to test this serie with "grate patches"
(1) rebased on top on 6.4-rc2, that would make use of the tegra-gart.
That was on PAZ00 (with only 512M of RAM and 96M CMA still allocated).
Unfortunately, this lead to the following errors with display problems
(no character displayed in lxt-terminal and etc)

[  888.691348] tegra-mc 7000f000.memory-controller: gart: Page entry is in-=
use
[  888.698400] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
mapping failed 4294967274 262144
[  888.707365] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
failed size 262144: -12
[  888.716735] tegra-mc 7000f000.memory-controller: gart: Page entry is in-=
use
[  888.723800] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
mapping failed 4294967274 262144
[  888.733156] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
failed size 262144: -12
[  889.055247] tegra-mc 7000f000.memory-controller: gart: Page entry is in-=
use
[  889.062296] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
mapping failed 4294967274 262144
[  889.071266] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
failed size 262144: -12

(1) https://github.com/grate-driver/linux
