Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359C8C4346E
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 04:58:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D36E220897
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 04:58:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUW4NrwI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbgI2E6W (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 00:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI2E6W (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 00:58:22 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB03C061755;
        Mon, 28 Sep 2020 21:58:21 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 7so2853906pgm.11;
        Mon, 28 Sep 2020 21:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WcAzkOGZ9dG56NRxUJHzwDEuHInbnX4+CA+UxuupEp0=;
        b=jUW4NrwIs8MohyGXB00UM3IYkVbNLJrSbtsx+ak2jvFMxkiLP5OThwhdzydCBj+4aO
         1A2JKQx6dZzPII++txHZexC0KSNT4RuG0ZnGi0swjX0iOGXQ6AV+qOjH28a6km+MrZnW
         bGDhzvyiURSz2mk57bNFM8/Udd5Uq9q4pF8YdupE1uMC9NZnnXUEepv3KrSxObm0Xc+t
         cKnufRpf2PwL17nfy2STHYbzqZPWJta+GGiFwIIMzIXtJ5cEjOXqpVQu2Pyyul00q44Z
         Tf/zcCox22dqYsFFZF/mk9P8lm40WmPfNeL63PdIUAVbfqb1aC9YISt4c3/xrCci6mjJ
         XuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WcAzkOGZ9dG56NRxUJHzwDEuHInbnX4+CA+UxuupEp0=;
        b=ZuEfGtfQlV/tbNCCeVW8T2/OA0evwzA/Jw6ICyM4oG0WlSVQYDc+FoCUE5NR0levXj
         vUje6CDIdgrzNXKjn3SclGquqFACLTw91JDTLW2QMC94Pj7U6c8g9ze40rWIv93BrCvO
         43JDGS4eGBGtPWP8S/NYKOC5psI6Kr9lmRW5RBmWzmPoS0/w+sDw8HDLU2KWD3KnhdD3
         HkzHAoijiS3OT2wMImfVAXCrLcGd5BZyaWaiABy7DGbi/FsJDZNNX4cFCOVmC/CSujr/
         3LBfcu2wRDGt1v/PAZMMvbD3bCWvOxWJVtp+S1Bi3DdNvvFgb8pTcrBUkq+17Z7oEIlU
         inYQ==
X-Gm-Message-State: AOAM532bLauWC+Gfe/AgHDAlTEeYfhdg8dgJ112/pJxaxQz5afrjsceN
        n3qE79MbM0DtVm4fTtm/CbA=
X-Google-Smtp-Source: ABdhPJw1G14Ap4d06yym2CPFSTcMb1VvQeJfuKHlk49EQq1LAZ3bmf8jgRBcjURIS3ZDNqEAeHBSUQ==
X-Received: by 2002:a63:1b57:: with SMTP id b23mr1806815pgm.81.1601355501207;
        Mon, 28 Sep 2020 21:58:21 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id f207sm3739028pfa.54.2020.09.28.21.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 21:58:20 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] iommu/tegra-smmu: Two followup changes
Date:   Mon, 28 Sep 2020 21:52:45 -0700
Message-Id: <20200929045247.15596-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Two followup patches for tegra-smmu:
PATCH-1 is a clean-up patch for the recently applied SWGROUP change.
PATCH-2 fixes a potential race condition

Changelog
v2->v3:
 * PATCH-2: renamed "err_unlock" to "unlock"
v1->v2:
 * Separated first two changs of V1 so they may get applied first,
   since the other three changes need some extra time to finalize.

Nicolin Chen (2):
  iommu/tegra-smmu: Unwrap tegra_smmu_group_get
  iommu/tegra-smmu: Expend mutex protection range

 drivers/iommu/tegra-smmu.c | 53 ++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

-- 
2.17.1

