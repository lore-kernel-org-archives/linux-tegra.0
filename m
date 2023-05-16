Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02FFC7EE23
	for <linux-tegra@archiver.kernel.org>; Tue, 16 May 2023 12:16:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232617AbjEPMQ1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 May 2023 08:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbjEPMQ0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 08:16:26 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B748AFA
        for <linux-tegra@vger.kernel.org>; Tue, 16 May 2023 05:16:25 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-38eb2984c82so4457582b6e.0
        for <linux-tegra@vger.kernel.org>; Tue, 16 May 2023 05:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684239385; x=1686831385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJTLLzb95iDF+U7TC6zcnoMcQpJeTgiUu6Gi3Heef+s=;
        b=Wvix5cPG/AAnP0NwB2UCmfUq22GVG2ZHMJi56Od5hjUJ99vSAa+2Q73WGyqynUnkuz
         S4Yf6p+c0NKlRcso+cETWYl/LFztPppn/O3UVa82WAUK8r59dSrW6GbBNMz/jGdUYGQ4
         LKgSFrvgiRJCQvdHnYIvSmsBrjjLRjEihRF6xPHg0Hbpg09uPaqVdgMQOf77OucuojRC
         ostCWsSYcaVQoIfijW43hi84igtO4oSOChnUpt444yKtz1scxFpxlnZu7g1J/Q8pCktM
         +BrMFzRDbwHMrv7qu3If/VSQmLHECoYZ/KFTQX0CmfWKjBJ7YPIujCo7+Ir7pn/CEFDH
         qbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684239385; x=1686831385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJTLLzb95iDF+U7TC6zcnoMcQpJeTgiUu6Gi3Heef+s=;
        b=O1NSwkaYXNcVL7XXoYA7WpIzbGZyROzCWT7D6pIBk861UgLWqkgu8HXL0G+ZKDI2EC
         D90d74+/eheE729qJierK0JHp2IwRCVNoY4RrSStxNJ4bMZCOQXXNq2lL5HAEDpjsmA3
         17T67a9E/CzTtjraaGwhHBKoN1/bY9f/UhfAK0+0/Ui3XonCwDU6CfDD3G/MH/wPkHqq
         kXxYeHTgZowzHH4h80ZvnUbUjNx4suKh0tKw4WWE1kppCurKgavbykXA7exuT8qImtSF
         wgnc3rLOGZVUhc35HjQCxUXJYCHnUrKZBlDRKiw6zwvAPLQyg3ssJeG0dzKPPGA5U6+v
         zVAA==
X-Gm-Message-State: AC+VfDwSlCRWiihnMIBVFHklrvKbS1kROCp/k4jBX3Cfb55bOMV1urxB
        z1g+4ZvdWg0Pui/QyGLmNSPXS8gyffrtR/0LUyY=
X-Google-Smtp-Source: ACHHUZ6hCKLE4fpIzovSfFZkpibP/nHCjM5L7XwkUu2hQtjwFHnaOPkuEvb+NOIcYo1h4bvDOQsd9kJUF/kNmbLBR1I=
X-Received: by 2002:a05:6808:1511:b0:395:48a:e694 with SMTP id
 u17-20020a056808151100b00395048ae694mr8079810oiw.6.1684239384975; Tue, 16 May
 2023 05:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684154219.git.robin.murphy@arm.com> <CABr+WTnzNPfOGbAmy-E3pH9U5XR0y2PdVmDd2gtnv67ByEb_0w@mail.gmail.com>
 <11d8adf1-75f5-5728-2139-e32aae6e6c49@arm.com>
In-Reply-To: <11d8adf1-75f5-5728-2139-e32aae6e6c49@arm.com>
From:   Nicolas Chauvet <kwizart@gmail.com>
Date:   Tue, 16 May 2023 14:16:13 +0200
Message-ID: <CABr+WTm=SehaNVaFym5FM-tpCvh93Ma_xG3xX5PuGt6n9+xh4Q@mail.gmail.com>
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

Le mar. 16 mai 2023 =C3=A0 13:45, Robin Murphy <robin.murphy@arm.com> a =C3=
=A9crit :
>
> On 2023-05-16 10:53, Nicolas Chauvet wrote:
...
> > For what it worth, I've tried to test this serie with "grate patches"
> > (1) rebased on top on 6.4-rc2, that would make use of the tegra-gart.
> > That was on PAZ00 (with only 512M of RAM and 96M CMA still allocated).
> > Unfortunately, this lead to the following errors with display problems
> > (no character displayed in lxt-terminal and etc)
>
> Thanks for testing - it's quite possible I've made a silly mistake
> somewhere, but just to double-check, does the same happen with the
> existing driver if you boot with "tegra-gart.gart_debug=3D1" (or at least
> enable the parameter via sysfs before the DRM driver gets going)?

Using echo 1 > /sys/module/tegra_gart/parameters/gart_debug shows the
same messages and the same artefacts (missing refreshed window
content).
Using "echo 0 > /sys/module/tegra_gart/parameters/gart_debug" revert
back to normal...

[ 7661.026139] tegra-mc 7000f000.memory-controller: gart: Page entry is in-=
use
[ 7661.033189] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
mapping failed 4294967274 262144
[ 7661.042197] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
failed size 262144: -12
[ 7661.589552] tegra-mc 7000f000.memory-controller: gart: Page entry is in-=
use
[ 7661.596690] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
mapping failed 4294967274 262144
[ 7661.605865] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
failed size 262144: -12
[ 7662.078823] tegra-mc 7000f000.memory-controller: gart: Page entry is in-=
use
[ 7662.085987] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
mapping failed 4294967274 262144
[ 7662.095137] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
failed size 262144: -12
[ 7662.123677] tegra-mc 7000f000.memory-controller: gart: Page entry is in-=
use
[ 7662.130758] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
mapping failed 4294967274 262144
[ 7662.140100] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
failed size 262144: -12
